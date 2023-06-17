/// @description 

//Flip
//wasBoardJustFlipped = false;
if (keyboard_check_pressed(vk_space)) {
	flippedBoard = !flippedBoard;	
	wasBoardJustFlipped = true;
	
	/*for (var i = 1; i < 7; i++) {
		
		var time = get_timer();
		var foundPositions = board_recurssion_test(id, i);
		var time2 = get_timer();
		
		var delta = time2 - time;
		
		show_debug_message(string(foundPositions) + " : " + string(delta));
	}*/
}

if (keyboard_check_pressed(ord("Z"))) {
	board_undo_move(id);
}

//Animate Grid
event_user(0);

var playerHasControl = Game.playerHasControl && !gameOver;

//
// Get Mouse Position
mouseSquareIndexX = (mouse_x - boardX) div squareWidth;
mouseSquareIndexY = (mouse_y - boardY) div squareWidth;
var mouseSquareId = mouseSquareIndexX + mouseSquareIndexY*8;
mouseSquareId = (flippedBoard) ? 63 - mouseSquareId : mouseSquareId;


// Pickup Square (If Mouse Good)
if (mouseSquareIndexX >= 0 && mouseSquareIndexX < 8 
&& mouseSquareIndexY >= 0 && mouseSquareIndexY < 8) {
	
	//Pickup
	if (mouse_check_button(mb_left)) {
	
		//Pickup
		if (pickedUpSquare == -1) {
			
			//Check Exists Piece
			var p = board[mouseSquareId];
			if (piece_get_type(p) != piece.none) {
				if (piece_get_color(p) == board_white_to_play(id)) {
					
					//Pickup
					pickedUpSquare = mouseSquareId;
					
					//Get
					ds_map_clear(pickedUpPieceLegalMoves);
					piece_generate_moves(board, pickedUpPieceLegalMoves, threatMap, restrictedMoves, pickedUpSquare);
					
					//We have moves, now we want to only get the target squares
					arr = ds_map_keys_to_array(pickedUpPieceLegalMoves);
					ds_map_clear(pickedUpPieceLegalMoves);
					for (var i = 0; i < array_length(arr); i++) {
						
						//Get Dest
						var mdest = move_get_target(arr[i]);
						ds_map_add(pickedUpPieceLegalMoves, mdest, true);
					}
					
				}
			}
			
		}
	
	//Drop
	} else {
		
		//Drop
		if (pickedUpSquare != -1) {
			
			//Create Move
			var move = move_encode(pickedUpSquare, mouseSquareId);
			
			//Make
			var result = board_attempt_move(id, move);
			pickedUpSquare = -1;
			
			//Flush Drawing
			ds_map_clear(pickedUpPieceLegalMoves);
			
			//
			// Game Mode
			var g = Game.id;
			var playingOpeningGM = g.gameModeOpening;
			if (playingOpeningGM) {
				
				// See if Move Caused Fail or Win
				if (g.currentTrieNode == undefined) || (g.currentTrieNode.final == true) {
					
					g.finishStreak = true;
					g.wonStreak = (g.currentTrieNode != undefined);
					
				}
				
			}
			
		}
		
	}
}



//
// Depth Grid
//
if (ds_exists(depthGrid, ds_type_grid)) {
	
	if (!ds_exists(particles, ds_type_list)) {
		exit;	
	}
	
	ds_grid_resize(depthGrid, 2, ds_list_size(particles) + 64);
	ds_grid_clear(depthGrid, -2);
	var writing = -1;

	var s = ds_list_size(particles);
	for (var parts = 0; parts < s; parts++) {
	
		var deled = false;
	
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
				deled = true;
			}
		}
	
	
		if (!deled) {
			//Store in Depth Grid
			depthGrid[# 0, ++writing] = -1 - parts;
		
			var dept = (partData.y+partData.z) / squareWidth;
			if (flippedBoard) dept = 7-dept;
		
			depthGrid[# 1, writing] = dept;
		}
	
	}

	//
	// Add Peices to Depth Grid
	//

	for (var sqrr = 0; sqrr < 64; sqrr++) {
	
		if (board[sqrr] != piece.none) {
		
			var row = sqrr div 8;
			if (flippedBoard) row = 7-row;
		
			// Replace When Drawing
			if (ds_map_exists(animations, sqrr)) {
				row = animations[? sqrr].drawX;	// Get Sub
			}
		
			//Store
			depthGrid[# 0, ++writing] = sqrr;
			depthGrid[# 1, writing] = (row) - (pieceDepthOffset); // y depth, add some offset

			// Pickuped
			if (pickedUpSquare == sqrr) {
				var raiseFactor = 10;
				depthGrid[# 1, writing] = (mouse_y - boardY + raiseFactor) / squareWidth;//for some
			}
		
		}
	}


	//
	//Sort grid. We then draw through the grid.
	//
	ds_grid_sort(depthGrid, 1, true);
}