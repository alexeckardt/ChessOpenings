// @desc
//
//
//
function board_generate_horizontal_sliding_moves(boardArray, map, sourceSquare) {
	
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
		for (var r = 1; r < distanceToEdge; r++) {
			
			//Get target & peice on target
			var targetSquare = sourceSquare + xinc + yinc;
			var p = boardArray[targetSquare];
			
			if (p == piece.none) continue;
			
			//Can't Go Further, Blocked by Self
			if (piece_get_color(p) == w2m) {
				break;	
			}
			
			//Add Move
			var m = move_encode(sourceSquare, targetSquare);
			ds_map_add(map, m, true);
			
			// Can't go further, blocked by capture (we already added move)
			if (piece_get_color(p) != w2m) {
				break;	
			}
		}
	}
}