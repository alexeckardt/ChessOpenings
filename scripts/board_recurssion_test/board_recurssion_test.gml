// @desc
//
//
//
function board_recurssion_test(board, dept, _whiteToMove = true) {

	if (dept == 0) {
		return 1;	
	}
	
	// Get List
	var allMoves = ds_list_create();
	var sum = 0;
	
	//All Possible Moves
	agent_get_all_possible_moves(board, allMoves, _whiteToMove);
	
	//Get Move
	for (var i = 0; i < ds_list_size(allMoves); i++) {
		
		var move = allMoves[| i];
		board_make_move(board, move, true);
		sum += board_recurssion_test(board, dept - 1, !_whiteToMove);
		board_undo_move(board, move);
		
	}
	
	// Destroy List
	ds_list_destroy(allMoves);	
	
	return sum;
}