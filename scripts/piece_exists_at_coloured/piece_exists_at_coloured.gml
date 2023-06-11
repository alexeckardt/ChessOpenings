// @desc
//
//
//
function piece_exists_at_coloured(board, i, j, isWhite) {

	//Dont go Out of bounds
	if !(i >= 0 && i < 8 && j >= 0 && j < 8)
		return false;
		
	//Check if Peice exists
	var p = board.board[# j, i];
	if (p == board.emptyPiece) {
		return false;	
	}

	//Piece is colour requested?
	if (p.white != isWhite) {
		return false;	
	}

	//Fail.
	return true;
}