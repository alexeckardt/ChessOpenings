/// @description Animations

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

// Animate Pieces
if (!ds_map_empty(animations)) {
	
	var squareToAnim = ds_map_find_first(animations);
	
	while (squareToAnim != undefined) {
		
		var struct = animations[? squareToAnim];
		
		struct.drawX = lerp(struct.drawX, struct.drawXTo, pieceSnapSpeed);
		struct.drawY = lerp(struct.drawY, struct.drawYTo, pieceSnapSpeed);

		//Don't Have to Remove, because it will get overriden eventually.
		
		//Next
		squareToAnim = ds_map_find_next(animations, squareToAnim);
		
	}
}

//
//
// Particles

if (gameOver) {
	gameOverTime++;
	
	if (!generatedPiecesReference) {
		generatedPiecesReference = true;
		
		whitePieceCount = 0;
		blackPieceCount = 0;
		
		for (var s = 0; s < 64; s++) {
		
			if (board[s] != piece.none) {
				ds_list_add(piecesReference, s);	
				
				if (piece_get_color(board[s])) {
					whitePieceCount++;	
				} else {
					blackPieceCount++;
				}
			}
		
		}
	}
	
	if (gameOverTime > room_speed*0.5) {
		
		//Start Blowing Up Peices
		if (--explodingCooldown <= 0) {
		
			var pCount = (whiteIsWinner) ? blackPieceCount : whitePieceCount;
			pCount = (stalemate) ? ds_list_size(piecesReference) : pCount;
		
			explodingCooldown = room_speed * 2 / pCount;
		
			//Grab a reference.
			// We no longer need references, so let's throw them all out, so no recycle
			
			var p = -1;
			var pSquare = -1;
			while (p == -1 && ds_list_size(piecesReference) > 0) {
				
				var pos = irandom(ds_list_size(piecesReference)-1);
				pSquare = piecesReference[| pos];
	
				var pp = board[pSquare];
	
				//pop
				ds_list_delete(piecesReference, pos);
				
				//Choose to destroy
				if (piece_get_color(pp) == !whiteIsWinner || stalemate) {
					p = pp;	
				}
			}
			
			//Check we got one
			if (p != -1) {
				piece_create_death_explosion(id, pSquare);
				board[pSquare] = piece.none;
			}
		}
		
		gameOverTimeNoParticles += (ds_list_size(particles) == 0);
		if (gameOverTimeNoParticles > room_speed) {
			
			exiting = true;
		}
	}
}

if (exiting) {
	boardGoalY += boardGoalYSpeed;
	boardGoalYSpeed -= 0.5; //accelerate	
	
	if (boardY < -room_height*2) {
		instance_destroy();
		exit;
	}
}