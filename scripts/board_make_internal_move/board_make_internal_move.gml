// @desc
//
//
//
function board_make_internal_move(b, move) {

	var source = move_get_source(move);
	var dest = move_get_target(move);

	//Update Board
	b[dest] = b[source]
	b[source] = piece.none;
	
	show_debug_message(move);

}