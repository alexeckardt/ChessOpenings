// @desc
//
//
//
function board_attempt_move(board, move) {

	//Get Legal Moves
	var legalMoves = board_generate_moves_as_dic(board);

	//Check Legal
	var legal = ds_map_exists(legalMoves, move);
	
	// Make move if Legal
	if (legal) {
		board_make_move(board, move, true);
	}	
	

	
	
	// Cleanup
	ds_map_destroy(legalMoves);

	// Passback
	return legal;

}