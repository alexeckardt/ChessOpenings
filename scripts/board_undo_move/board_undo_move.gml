// @desc
//
//
//
function board_undo_move(board) {

	var stack = board.movesStack;
	if (ds_stack_empty(stack)) return;

	// Get Move
	var lastMoveData = ds_stack_pop(stack);
	var moveMade = lastMoveData.moveMade;

	// Get
	var b = board.board;
	var source = move_get_source(moveMade);
	var target = move_get_target(moveMade);
	var undoMove = move_encode(target, source);
	
	//Update Board
	board_make_internal_move(b, undoMove);

	// Resummon The Taken Piece
	b[target] = lastMoveData.capture;

	//Switch W2M
	b[board_other_squares.white_to_move] = !b[board_other_squares.white_to_move];
	
	//Update Threats
	board_populate_threat_map(b, board.threatMap);
}