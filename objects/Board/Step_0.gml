/// @description 

//Flip
//wasBoardJustFlipped = false;
if (keyboard_check_pressed(vk_space)) {
	//flippedBoard = !flippedBoard;	
	//wasBoardJustFlipped = true;
	
	for (var i = 1; i < 4; i++) {
		show_debug_message(string(i) + ":" + string(board_recurssion_test(id, i)));
	}
}

if (keyboard_check_pressed(ord("Z"))) {
	board_undo_move(board);
}

//Animate Grid
//event_user(0);

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
				}
			}
			
		}
	
	//Drop
	} else {
		
		//Drop
		if (pickedUpSquare != -1) {
			
			//Make Move
			var move = move_encode(pickedUpSquare, mouseSquareId);
			
			var result = board_attempt_move(id, move);
			pickedUpSquare = -1;
		}
		
	}
}