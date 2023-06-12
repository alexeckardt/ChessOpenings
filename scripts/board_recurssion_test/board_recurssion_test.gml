// @desc
//
//
//
function board_recurssion_test(board, dept, _whiteToMove = true) {

	if (dept == 0) {
		return 1;	
	}
	
	// Get List
	var temp = ds_list_create();
	
	//All Possible Moves
	var allMoves = agent_get_all_possible_moves(board, temp, !_whiteToMove);
	
	//Get Move
	for (var i = 0; i < ds_list_size(allMoves); i++) {
		
		var move = allMoves[| i];
		board_make_move(move);
		
	}
	
	
	// Destroy List
	ds_list_destroy(temp);

}