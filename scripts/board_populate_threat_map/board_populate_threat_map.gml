// @desc
//
//
//
function board_populate_threat_map(boardArray, threatMap, restrictedMovesMap) {

	ds_map_clear(threatMap);
	ds_map_clear(restrictedMovesMap);
	var w2move = !boardArray[board_other_squares.white_to_move];
	
	//
	// Peice Threats
	//

	for (var i = 0; i < 64; i++) {
		
		//Get
		var p = boardArray[i];
		
		//Check
		if (piece_get_color(p) == w2move) {
			
			// Fill Map by Piece
			piece_generate_threats(boardArray, threatMap, i);
			
		}
	}

	// Populates.
	
	//
	// Restrict Moves
	//
	
	// Find King
	var kingSquare = -1;
	for (var i = 0; i < 64; i++) {
		var p = boardArray[i];
		if (piece_get_type(p) == piece.type_king) {
			if (piece_get_color(p) == !w2move) {
				kingSquare = i;
				break;	
			}
		}
	}
	
	// Illegal Board Position
	if (kingSquare == -1)	
		return;
		
	//Store King Position
	boardArray[board_other_squares.king_position] = kingSquare;	
	
	// Determine Moves
	if (ds_map_exists(threatMap, kingSquare)) {
		
		//
		// KING IS IN CHECK!!
		//
		
		//
		// Determine by who.
		var squareCheckedBy = threatMap[? kingSquare];
		
		//
		// Get direction from them to king. ASSUMPTION: There is a path, because both these squares look at eachother.
		var checkedDirection = board_square_get_offset_to_other_square(squareCheckedBy, kingSquare);
		var hitKingSquare = false;
		if (checkedDirection != 0) {
		
			// Loop, Get all squares on this path
		
			for (var r = 0; r < 8; r++) {
				
				var sid = squareCheckedBy + r*checkedDirection;
				
				var sidRank = sid div 8;
				var sidFile = sid - sidRank*8;
				
				//Exit Next
				if (sidFile == 0 || sidFile == 7 || sidRank == 0 || sidRank == 7) {
					r = 100;	
				}
				
				ds_map_add(restrictedMovesMap, sid, hitKingSquare);
				
				if (sid == kingSquare) {
					hitKingSquare = true;	
				}
				
			}
			
		} else {
			ds_map_add(restrictedMovesMap, kingSquare, true); //Hack -- if the king is in check by a knight it is unblockable	
			ds_map_add(restrictedMovesMap, squareCheckedBy, true);
		}
	}
	
}