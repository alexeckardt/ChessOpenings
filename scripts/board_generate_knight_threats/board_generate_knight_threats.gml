// @desc
//
//
//
function board_generate_knight_threats(boardArray, map, sourceSquare) {

	var lut = Board.id.squaresUntilEdgeLUT;
	var distN = lut[# sourceSquare, cardinal.north];
	var distE = lut[# sourceSquare, cardinal.east];
	var distS = lut[# sourceSquare, cardinal.south];
	var distW = lut[# sourceSquare, cardinal.west];
	
	var northOff = cardinal_get_incr_y(cardinal.north);
	var eastOff = cardinal_get_incr_x(cardinal.east);
	var southOff = cardinal_get_incr_y(cardinal.south);
	var westOff = cardinal_get_incr_x(cardinal.west);
	
	var w2m = boardArray[board_other_squares.white_to_move];
	
	//
	// North Long
	//
	if (distN >= 2) {
		if (distE >= 1) {
			var moveTarget = sourceSquare + northOff*2 + eastOff
			board_add_to_threat_map(map, sourceSquare, moveTarget);
		}
		
		if (distW >= 1) {
			var moveTarget = sourceSquare + northOff*2 + westOff
			board_add_to_threat_map(map, sourceSquare, moveTarget);
		}
	}
	//
	// South Long
	//
	if (distS >= 2) {
		if (distE >= 1) {
			var moveTarget = sourceSquare + southOff*2 + eastOff
			board_add_to_threat_map(map, sourceSquare, moveTarget);
		}
		
		if (distW >= 1) {
			var moveTarget = sourceSquare + southOff*2 + westOff
			board_add_to_threat_map(map, sourceSquare, moveTarget);
		}
	}
	//
	// East Long
	//
	if (distE >= 2) {
		if (distN >= 1) {
			var moveTarget = sourceSquare + eastOff*2 + northOff
			board_add_to_threat_map(map, sourceSquare, moveTarget);
		}
		
		if (distS >= 1) {
			var moveTarget = sourceSquare + eastOff*2 + southOff
			board_add_to_threat_map(map, sourceSquare, moveTarget);
		}
	}
	//
	// West Long
	//
	if (distW >= 2) {
		if (distN >= 1) {
			var moveTarget = sourceSquare + westOff*2 + northOff
			board_add_to_threat_map(map, sourceSquare, moveTarget);
		}
		
		if (distS >= 1) {
			var moveTarget = sourceSquare + westOff*2 + southOff
			board_add_to_threat_map(map, sourceSquare, moveTarget);
		}
	}
}
