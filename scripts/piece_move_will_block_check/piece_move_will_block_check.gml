// @desc
//
//
//
function piece_move_will_block_check(board, i, j) {

	var map = board.checkBlockingSquares;
	
	// Implication! No Check, so this must be true.
	if (ds_map_empty(map)) return true;
	
	// Make sure T -> T and T -> F.
	var sID = i + j*8;
	return ds_map_exists(map, sID);

}