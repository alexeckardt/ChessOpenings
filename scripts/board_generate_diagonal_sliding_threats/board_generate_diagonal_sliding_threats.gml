// @desc
//
//
//
function board_generate_diagonal_sliding_threats(boardArray, map, sourceSquare, maxrad) {
	
	//Get
	var lut = Board.id.squaresUntilEdgeLUT;
	var w2m = boardArray[board_other_squares.white_to_move];
	
	// Loop Over All Directions
	for (var i = 0; i < 4; i++) {
		
		// I is cardinal direction
		var next = (i + 1) mod 4;
		
		//Get Distance
		var distanceToEdgeA = lut[# sourceSquare, i];
		var distanceToEdgeB = lut[# sourceSquare, next];
		var distanceToEdge = min(distanceToEdgeA,distanceToEdgeB);
		
		//Get Directions To Move in
		var xinc = cardinal_get_incr_x(i) + cardinal_get_incr_x(next);
		var yinc = cardinal_get_incr_y(i) + cardinal_get_incr_y(next);
		
		//Loop
		for (var r = 1; r <= min(distanceToEdge, maxrad); r++) {
			
			//Get target & peice on target
			var targetSquare = sourceSquare + (xinc + yinc)*r;
			var p = boardArray[targetSquare];
			
			var empty = p == piece.none;
			
			
			//Add Move
			board_add_to_threat_map(map, sourceSquare, targetSquare);
			
			// Can't go further, blocked by some piece
			if (!empty) {
				
				 // don't break, keep xraying king
				if (piece_get_type(p) == piece.type_king) {
					continue;
				}
				
				//Otherwise, exit
				break;	
			}
		}
	}
}