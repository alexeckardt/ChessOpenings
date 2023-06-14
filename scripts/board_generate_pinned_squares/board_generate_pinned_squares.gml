// @desc
//
// maxrad: 8 normally, 1 if king
//
function board_generate_pinned_squares(boardArray, map, kingSquare) {
	
	//Get
	var lut = Board.id.squaresUntilEdgeLUT;
	var w2m = boardArray[board_other_squares.white_to_move];
	
	//
	// Horizontal
	//
	
	// Loop Over All Horizontal Directions
	for (var i = 0; i < 4; i++) {
		
		// I is cardinal direction
		
		//Get Distance
		var distanceToEdge = lut[# kingSquare, i];
		var xinc = cardinal_get_incr_x(i);
		var yinc = cardinal_get_incr_y(i);
		
		var foundPin = false;
		
		//Loop
		var r;
		for (r = 1; r <= min(distanceToEdge, maxrad); r++) {
			
			//Get target & peice on target
			var targetSquare = kingSquare + (xinc + yinc)*r;
			var p = boardArray[targetSquare];
			
			// Enemy Piece There
			var empty = p == piece.none;
			if (piece_get_color(p) != w2m && !empty) {
				
				var typ = piece_get_type(p);
				if (typ == piece.type_rook || typ == piece.type_queen) {
					foundPin = true;
				}	
				
				break;
			}
		}
		//
		// Add Squares
		//
		if (foundPin) {
			for (var k = 1; k <= r; k++) {
				//Add Square as Pin "Beam"
				var targetSquare = kingSquare + (xinc + yinc)*k;
				ds_map_add(map, targetSquare, true);
			}
		}
	}
	
	// Loop Over All Diagonal Directions
	for (var i = 0; i < 4; i++) {
		
		// I is cardinal direction
		var next = (i + 1) mod 4;
		
		//Get Distance
		var distanceToEdgeA = lut[# kingSquare, i];
		var distanceToEdgeB = lut[# kingSquare, next];
		var distanceToEdge = min(distanceToEdgeA,distanceToEdgeB);
		
		//Get Directions To Move in
		var xinc = cardinal_get_incr_x(i) + cardinal_get_incr_x(next);
		var yinc = cardinal_get_incr_y(i) + cardinal_get_incr_y(next);
		var foundPin = false;
		
		//Loop
		var r;
		for (r = 1; r <= min(distanceToEdge, maxrad); r++) {
			
			//Get target & peice on target
			var targetSquare = kingSquare + (xinc + yinc)*r;
			var p = boardArray[targetSquare];
			
			// Enemy Piece There
			var empty = p == piece.none;
			if (piece_get_color(p) != w2m && !empty) {
				
				var typ = piece_get_type(p);
				if (typ == piece.type_bishop || typ == piece.type_queen) {
					foundPin = true;
				}	
				
				break;
			}
		}
		//
		// Add Squares
		//
		if (foundPin) {
			for (var k = 1; k <= r; k++) {
				//Add Square as Pin "Beam"
				var targetSquare = kingSquare + (xinc + yinc)*k;
				ds_map_add(map, targetSquare, true);
			}
		}
	}
}