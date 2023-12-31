// @desc
//
//
//
function board_generate_diagonal_sliding_moves(boardArray, map, sourceSquare, maxrad, restrictedMoves, threatMap) {
	
	//Get
	var lut = Board.id.squaresUntilEdgeLUT;
	var w2m = boardArray[board_other_squares.white_to_move];
	
	var restrict = !ds_map_empty(restrictedMoves);
	
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
			
			//Can't Go Further, Blocked by Self
			if (piece_get_color(p) == w2m && !empty) {
				break;	
			}
			
			//Add Move
			if (!restrict || ds_map_exists(restrictedMoves, targetSquare)) { // In Check Restrictions
				if (!board_piece_is_pinned(boardArray, threatMap, sourceSquare, targetSquare)) {
					var m = move_encode(sourceSquare, targetSquare);
					ds_map_add(map, m, true);
				}
			}
			
			// Can't go further, blocked by capture (we already added move)
			if (piece_get_color(p) != w2m && !empty) {
				break;	
			}
		}
	}
}