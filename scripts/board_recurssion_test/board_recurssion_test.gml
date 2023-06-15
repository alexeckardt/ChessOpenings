// @desc
//
//
//
function board_recurssion_test(board, dept) {

	if (dept == 0) 
		return 1;
		
	//
	// Get Map
	var legalMovesDic = board_generate_moves_as_dic(board);
	var sum = 0;
	
	// Empty? Checkmate / Stalemate
	if (ds_map_empty(legalMovesDic)) {
		return 0;	
	}
	
	//Get Last
	var move = ds_map_find_first(legalMovesDic);
	
	// Go until no more moves to make
	while (!is_undefined(move)) {
		
		//Make
		board_make_move(id, move);
		
		//Return
		sum += board_recurssion_test(board, dept -1)
		
		//Undo
		board_undo_move(board);
		
		// Get Next Move
		move = ds_map_find_next(legalMovesDic, move);
		
	}
	
	// Cleanup
	ds_map_destroy(legalMovesDic);
	
	return sum;
}