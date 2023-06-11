// @desc
//
//
//
function peice_move_to_square(pieceStruct, board, square) {
	
	var i = square mod 8;
	var j = square div 8;
	
	return peice_move_to(pieceStruct, board, i, j);
}