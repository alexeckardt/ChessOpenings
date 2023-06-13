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
	ds_stack_push(stack, move);
	board.turnNumber++;

}