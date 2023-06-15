// @desc
//
// maxrad: 8 normally, 1 if king
//
function board_generate_horizontal_sliding_threats(boardArray, map, sourceSquare, maxrad) {
	
	//Get
	var lut = Board.id.squaresUntilEdgeLUT;
	var w2m = boardArray[board_other_squares.white_to_move];
	
	// Loop Over All Directions
	for (var i = 0; i < 4; i++) {
		
		// I is cardinal direction
		
		//Get Distance
		var distanceToEdge = lut[# sourceSquare, i];
		var xinc = cardinal_get_incr_x(i);
		var yinc = cardinal_get_incr_y(i);
		
		//Loop
		for (var r = 1; r <= min(distanceToEdge, maxrad); r++) {
			
			//Get target & peice on target
			var targetSquare = sourceSquare + (xinc + yinc)*r;
			var p = boardArray[targetSquare];
			
			var empty = p == piece.none;
			
			//Add Move
			board_add_to_threat_map(map, sourceSquare, targetSquare);
			
			// Can't go further, blocked by some piece
			// Can't go further, blocked by some piece
			if (!empty) {
				
				 // don't break, keep xraying king
				if (piece_get_type(p) == piece.type_king && piece_get_color(p) == !w2m) {
					continue;
				}
				
				//Otherwise, exit
				break;	
			}
		}
	}
}