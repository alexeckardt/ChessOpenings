// @desc
//
//
//
function peice_add_legal_move_check_not_friendly(board, list, i, j, white, includeDefendingSquares) {
	
	//Dont go Out of bounds
	if !(i >= 0 && i < 8 && j >= 0 && j < 8)
		return false;
	
	//Skip Condition Check if we check for squares I'm defeinding
	if (piece_exists_at_coloured(board, i, j, white) && !includeDefendingSquares) {
		return false;
	}
	
	if (!piece_move_will_block_check(board, i, j))
		return false;
	
	//Good
	var square = i + j*8;
	ds_list_add(list, square);	
	return true;
}