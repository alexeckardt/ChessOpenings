// @desc
//
//
//
function peice_add_legal_move_check_not_friendly_king(board, list, i, j, white, includeDefendingSquares) {
	
	// Dont go Out of bounds
	if !(i >= 0 && i < 8 && j >= 0 && j < 8)
		return false;
	
	// Can't Take My owne Piece
	if (piece_exists_at_coloured(board, i, j, white) && !includeDefendingSquares) {
		return false;
	}
	
	// Make Sure not found in an attacking square map
	var square = i + j*8;
	var map = board.attackedSquares;
	
	if (ds_map_exists(map, square))
		return false;	
	
	//Store
	ds_list_add(list, square);	
	
	//Valid Move
	return true;
}