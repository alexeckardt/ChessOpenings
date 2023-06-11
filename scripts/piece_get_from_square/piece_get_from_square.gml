// @desc
//
//
//
function piece_get_from_square(board_object, square) {

	if (square == -1) {
		return board_object.pickedUpPiece;
	}

	var i = square mod 8;
	var j = square div 8;
	
	return board_object.board[# j, i];
}