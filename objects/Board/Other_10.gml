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


//
// Get Mouse Position
mouseSquareIndexX = (mouse_x - boardX) div squareWidth;
mouseSquareIndexY = (mouse_y - boardY) div squareWidth;

if (flippedBoard) {
	mouseSquareIndexY = (boardY + boardWidth*squareWidth - mouse_y) div squareWidth;	
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


//Sort gird. We then draw through the grid.
ds_grid_sort(depthGrid, 1, true);

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