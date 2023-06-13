// @desc
//
//
//
function board_make_internal_move(b, move) {

	//Update Board
	b[move.dest] = b[move.source]
	b[move.source] = piece.none;

}