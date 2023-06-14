// @desc
//
//
//
function board_make_move(board, move) {

	//Update Board
	var b = board.board;
	board_make_internal_move(b, move);

	//Push to Stack
	var stack = board.movesStack;
	
	//var moveData = 
	
	ds_stack_push(stack, move);
	board.turnNumber++;

	//Switch W2M
	b[board_other_squares.white_to_move] = !b[board_other_squares.white_to_move];
}