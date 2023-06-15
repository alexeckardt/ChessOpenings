// @desc
//
//
//
function board_square_would_block_check(restrictedMoves, targetSquare) {

	// No Checks
	if (ds_map_empty(restrictedMoves)) return true;

	// Therefor there IS a square
	if (ds_map_exists(restrictedMoves, targetSquare)) {
		
		// Return
		return !restrictedMoves[? targetSquare]; // if we xray the king, the value is false. thus souw
		
	}
	
	// Wouldn't Block
	return false;

}