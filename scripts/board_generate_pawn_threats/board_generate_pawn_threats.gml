// @desc
//
// Duplicated to lower the comparision costs
//
function board_generate_pawn_threats(boardArray, map, sourceSquare) {

	// We don't need the LUT here!

	var w2m = boardArray[board_other_squares.white_to_move];
	var marchDir = (w2m) ? cardinal.north : cardinal.south;
	var marchOffset = cardinal_get_incr_y(marchDir);
	
	//
	// Captures

	var targetEast = sourceSquare + marchOffset + cardinal_get_incr_x(cardinal.east);
	var targetWest = sourceSquare + marchOffset + cardinal_get_incr_x(cardinal.west);

	
	board_add_to_threat_map(map, sourceSquare, targetEast);
	board_add_to_threat_map(map, sourceSquare, targetWest);
}