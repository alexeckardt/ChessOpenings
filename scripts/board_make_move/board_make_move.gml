// @desc
//
//
//
function board_make_move(board, move) {

	//Update Board
	var b = board.board;
	b[move.dest] = b[move.source]
	b[move.source] = piece.none;

	//Push to Stack
	var stack = board.movesStack;
	ds_stack_push(stack, move);

}