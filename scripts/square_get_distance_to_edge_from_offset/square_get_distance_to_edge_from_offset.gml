// @desc
//
//
//
function square_get_distance_to_edge_from_offset(square, checkedDirection){

	var lut = Board.id.squaresUntilEdgeLUT;
	var s = square;
	
	
	switch (checkedDirection) {
	
		case 0: return 0;
		
		case 1: return lut[# s, cardinal.west];
		case -1: return lut[# s, cardinal.east];
		case 8: return lut[# s, cardinal.south];
		case -8: return lut[# s, cardinal.north];
		
		case 7: return min(lut[# s, cardinal.west], lut[# s, cardinal.south]);
		case -7: return min(lut[# s, cardinal.east], lut[# s, cardinal.north]);
		case 9: return min(lut[# s, cardinal.east], lut[# s, cardinal.south]);
		case -9: return min(lut[# s, cardinal.west], lut[# s, cardinal.north]);
	
	}

	return 0;

}