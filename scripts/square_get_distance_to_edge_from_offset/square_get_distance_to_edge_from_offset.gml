// @desc
//
//
//
function square_get_distance_to_edge_from_offset(square, checkedDirection){

	var lut = Board.id.squaresUntilEdgeLUT;
	var s = square;
	
	var N = lut[# s, cardinal.north];
	var E = lut[# s, cardinal.east];
	var S = lut[# s, cardinal.south];
	var W = lut[# s, cardinal.west];
	
	switch (checkedDirection) {
	
		case 0: return 0;
		
		case 1: return E
		case -1: return W
		case 8: return S
		case -8: return N
		
		case 7: return min(S, W);
		case -7: return min(N, E);
		case 9: return min(S, E);
		case -9: return min(N, W);
	
	}

	return 0;

}