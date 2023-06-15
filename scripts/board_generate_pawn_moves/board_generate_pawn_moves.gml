// @desc
//
//
//
function board_generate_pawn_moves(boardArray, map, sourceSquare, threatMap, restrictedMoves) {

	var w2m = boardArray[board_other_squares.white_to_move];
	var startingRank = (w2m) ? 6 : 1;
	var marchDir = (w2m) ? cardinal.north : cardinal.south;
	var marchOffset = cardinal_get_incr_y(marchDir);
	
	var file = sourceSquare mod 8;
	
	//
	// Advances
	
	// Add regular advance square
	if (boardArray[sourceSquare + marchOffset] == piece.none)
		pawn_add_move(boardArray, map, restrictedMoves, threatMap, sourceSquare, sourceSquare+marchOffset);
	
	// Add STARTING Double Advance
	if (sourceSquare div 8 == startingRank) {
		
		//
		// We wrap this because a pawn should not look 2 squares ahead UNLESS
		// First rank, because then we could look out of the board.
		//
		
		// If a pawn reaches it's promote destination, then it no longer can check 1 ahead (out of board)
		// as it prmotes and goes to the more "complex" search algs
		// 
		
		//
		// Add Double Advance if both are empty
		//
		if (boardArray[sourceSquare + marchOffset] == piece.none)
		&& (boardArray[sourceSquare + marchOffset*2] == piece.none)
			pawn_add_move(boardArray, map, restrictedMoves, threatMap, sourceSquare, sourceSquare+marchOffset*2);
	}
	
	//
	// Captures

	var targetEast = sourceSquare + marchOffset + cardinal_get_incr_x(cardinal.east);
	var targetWest = sourceSquare + marchOffset + cardinal_get_incr_x(cardinal.west);
	var ptarget;
	
	// Check If captures allowed
	
	
	//EAST
	if (file != 0) {
		ptarget = boardArray[targetEast];
		//Check Peice is capturable, then add square
		if (ptarget != piece.none && piece_get_color(ptarget) == !w2m)
		pawn_add_move(boardArray, map, restrictedMoves, threatMap, sourceSquare, targetEast);
	}
		
	//WEST
	if (file != 7) {
		ptarget = boardArray[targetWest];
		//Check Peice is capturable, then add square
		if (ptarget != piece.none && piece_get_color(ptarget) == !w2m)
			pawn_add_move(boardArray, map, restrictedMoves, threatMap, sourceSquare, targetWest);
	}

	//
	// Enpassant Square -- A Peice WILL Be There because of the double march 
	//     -- nothing was there to block

	//Get & Check
	var enpassantSquare = boardArray[board_other_squares.enpassant_square];
	if (targetEast == enpassantSquare || targetWest == enpassantSquare)
		// Add Enpassant Square
		pawn_add_move(boardArray, map, restrictedMoves, threatMap, sourceSquare, enpassantSquare);
}

function pawn_add_move(boardArray, map, restrictedMoves, threatMap, sourceSquare, target) {
	var restrict = !ds_map_empty(restrictedMoves);
		
	if (!restrict || ds_map_exists(restrictedMoves, target)) { // In Check Restrictions
		if (!board_piece_is_pinned(boardArray, threatMap, sourceSquare, target)) {
			ds_map_add(map, move_encode(sourceSquare, target), true);
		}
	}
			
}