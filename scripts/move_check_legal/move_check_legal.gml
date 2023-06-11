// @desc
//
//
//
function move_check_legal(squareid) {

	//
	// Ensure Piece moves as the piece should (no tp)
	//
	if (ds_list_find_index(validSquaresToMoveTo, squareid) == -1)
		return false;


	//
	// King is not in check after move
	
	
	//
	// Move does not put king in check (pinned)


	return true;
}