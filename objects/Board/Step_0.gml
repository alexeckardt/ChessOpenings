/// @description 

//Flip
//wasBoardJustFlipped = false;
if (keyboard_check_pressed(vk_space)) {
	//flippedBoard = !flippedBoard;	
	//wasBoardJustFlipped = true;
	
	for (var i = 1; i < 7; i++) {
		
		var time = get_timer();
		var foundPositions = board_recurssion_test(id, i);
		var time2 = get_timer();
		
		var delta = time2 - time;
		
		show_debug_message(string(foundPositions) + " : " + string(delta));
	}
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
		}
		
	}
}