/// @description 


//Flip
wasBoardJustFlipped = false;
if (keyboard_check_pressed(vk_space)) {
	flippedBoard = !flippedBoard;	
	wasBoardJustFlipped = true;
}

//
//
boardShakeAmount = lerp(boardShakeAmount, 0, 0.05);
if (boardShakeAmount > 0.01) {
	boardShakeX = lerp(boardShakeX, random_range(-boardShakeAmount, boardShakeAmount), 0.3);
	boardShakeY = lerp(boardShakeY, random_range(-boardShakeAmount, boardShakeAmount), 0.3);
} else {
	boardShakeX = lerp(boardShakeX, 0, 0.2);
	boardShakeY = lerp(boardShakeY, 0, 0.2);
}

//
// Move Board
boardY = lerp(boardY, boardGoalY, 0.2);



//
// Get Mouse Position
mouseSquareIndexX = (mouse_x - boardX) div squareWidth;
mouseSquareIndexY = (mouse_y - boardY) div squareWidth;

if (flippedBoard) {
	mouseSquareIndexY = (boardY + boardWidth*squareWidth - mouse_y) div squareWidth;	
}

var playerHasControl = Game.playerHasControl && !gameOver;

//Grid
ds_grid_clear(depthGrid, emptyPiece);

//Animate Pieces
var pCount = -1;
for (var square = 0; square < boardWidth*boardWidth; square++) {
	
	var i = square mod boardWidth;
	var j = square div boardWidth;
	
	var relativej = (flippedBoard) ? 7-j : j;
	
	// Position
	var xx = i*squareWidth + pieceOnBoardOffsetX;
	var yy = relativej*squareWidth + pieceOnBoardOffsetY;
	var baseyy = yy;
	
	// Get Piece
	var p = board[# j, i];
	
	//Ensure is a piece
	if (p != emptyPiece) {
		
		//Animation
		p.hoverAnimationCooldown--;
		var glowRed = p.isChecker || (p.type == piece.king && p.white == whiteToMove && kingInCheck);
		p.checkBlend = lerp(p.checkBlend, glowRed && !gameOver, 0.2);
		
		//Pickup
		var pickedup = false;
		if (playerHasControl && mouseSquareIndexX == i and mouseSquareIndexY == j && pickedUpPiece == emptyPiece) {
			
			if (p.hoverAnimationCooldown < 0 && p.white == whiteToMove) {
				yy += selectedPeiceYOffset;	
			}
		
			//Pickup correct colo
			if (mouse_check_button(mb_left) && p.white == whiteToMove) {
			
				//Grab Piece
				pickedUpPiece = p;
			
				//Clear Position
				board[# j, i] = emptyPiece;
			
				//Get Positions (side effects)
				ds_list_clear(validSquaresToMoveTo);
				p.get_legal_moves(validSquaresToMoveTo, false);
				
				// If King, Don't Allow Captures of defended pieces
				if (p.type == piece.king) {
					
					var map = attackedSquares;
					//Difference
					ds_list_difference_map(validSquaresToMoveTo, map);
					
				}
				
				//Mark
				pickedup = true;
			}
		}
		
		//Move
		if (!pickedup) {
		
			var spd = (wasBoardJustFlipped) ? 1.0 : pieceSnapSpeed;
		
			p.drawx = lerp(p.drawx + p.drawHSpeed, xx, spd);
			p.drawy = lerp(p.drawy + p.drawVSpeed, yy, spd);
			p.nooffsetDrawY = baseyy;
		
			p.drawHSpeed = lerp(p.drawHSpeed, 0, pieceSnapSpeed);
			p.drawVSpeed = lerp(p.drawVSpeed, 0, pieceSnapSpeed);
		
			//
			//Depth Sorting
			//Set Y Value
			depthGrid[# 0, ++pCount] = square;
			depthGrid[# 1, pCount] = p.drawy;
		}
	}
}


//Add Picked Up Peice
if (pickedUpPiece != emptyPiece) {
	
	// Move Peice
	pickedUpPiece.drawx = mouse_x-boardX;
	pickedUpPiece.drawy = mouse_y-boardY;
	
	//Depth
	depthGrid[# 0, ++pCount] = -1; //picked up "square" id
	depthGrid[# 1, pCount] = pickedUpPiece.drawy - selectedPeiceYOffset;

	//Drop Peice
	if (!mouse_check_button(mb_left)) {
	
		//Get Square Id
		var squareid = mouseSquareIndexY*boardWidth + mouseSquareIndexX; //switches
		
		//Check if Valid Move
		if (move_check_legal(squareid)) {
	
			//Move
			peice_move_to(pickedUpPiece, id, mouseSquareIndexX, mouseSquareIndexY);

		} else {
			
			//Return
			board[# pickedUpPiece.rank, pickedUpPiece.file] = pickedUpPiece;
			
			//Drop at Old Square
			depthGrid[# 0, pCount] = pickedUpPiece.file + 8*pickedUpPiece.rank; //picked up "square" id
		}
		
		//Place Shadow Correctly
		var relativej = (flippedBoard) ? 7-mouseSquareIndexY : mouseSquareIndexY;
		pickedUpPiece.nooffsetDrawY = relativej*squareWidth + pieceOnBoardOffsetY;
		
		
		//End
		pickedUpPiece.hoverAnimationCooldown = hoverAnimationCooldownOnDrop;
		pickedUpPiece = emptyPiece;
		
		//
		
		board_check_for_gameover(id);
		
	}

}

if (gameOver) {
	gameOverTime++;
	
	if (gameOverTime > room_speed*0.5) {
		
		//Start Blowing Up Peices
		if (--explodingCooldown <= 0) {
		
			explodingCooldown = room_speed / 2;
		
			//Grab a reference.
			// We no longer need references, so let's throw them all out, so no recycle
			
			var p = -1;
			while (p == -1 && ds_list_size(piecesReference) > 0) {
				
				var pos = irandom(ds_list_size(piecesReference)-1);
				var pp = piecesReference[| pos];
				var testPeice = piece_get_from_square(id, pp);
	
				//pop
				ds_list_delete(piecesReference, pos);
				
				//Choose to destroy
				if (testPeice.white == !whiteIsWinner || stalemate) {
					p = testPeice;	
				}
			}
			
			//Check we got one
			if (p != -1) {
				p.explode(id);
				board[# p.rank, p.file] = emptyPiece
				delete p;
			}
		}
		
		gameOverTimeNoParticles += (ds_list_size(particles) == 0);
		if (gameOverTimeNoParticles > room_speed) {
			
			boardGoalY += boardGoalYSpeed;
			boardGoalYSpeed -= 0.5; //accelerate
		}
		
		if (gameOverTimeNoParticles > room_speed*2) {
			instance_destroy();
			exit;
		}
	}
	
	
}


var s = ds_list_size(particles);
for (var parts = 0; parts < s; parts++) {
	
	//Get Info
	var partData = particles[| parts];
	if (!partData.stopUpdate) {
		partData.update();
	} else {
		partData.lifeLeft--;
		
		//End
		if (partData.lifeLeft < 0) {
			ds_list_delete(particles, parts)
			s--;
			parts--;
			
			delete partData;
		}
	}
	
}

//Sort gird. We then draw through the grid.
ds_grid_sort(depthGrid, 1, true);
