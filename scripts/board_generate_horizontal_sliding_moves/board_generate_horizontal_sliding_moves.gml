// @desc
//
// maxrad: 8 normally, 1 if king
//
function board_generate_horizontal_sliding_moves(boardArray, map, sourceSquare, maxrad, restrictedMoves, threatMap) {
	
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
			
			//Can't Go Further, Blocked by Self
			if (piece_get_color(p) == w2m && !empty) {
				break;	
			}
			
			//Add Move
			if (board_square_would_block_check(restrictedMoves, targetSquare)) { // In Check Restrictions
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