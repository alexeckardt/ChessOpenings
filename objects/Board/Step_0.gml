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