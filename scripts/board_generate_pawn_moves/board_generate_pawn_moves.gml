// @desc
//
//
//
function board_generate_pawn_moves(boardArray, map, sourceSquare, threatMap, restrictedMoves) {

	// We don't need the LUT here!

	var w2m = boardArray[board_other_squares.white_to_move];
	var startingRank = (w2m) ? 6 : 1;
	var marchDir = (w2m) ? cardinal.north : cardinal.south;
	
	var marchOffset = cardinal_get_incr_y(marchDir);
	
	//
	// Advances
	
	// Add regular advance square
	if (boardArray[sourceSquare + marchOffset] == piece.none)
		ds_map_add(map, move_encode(sourceSquare,sourceSquare+marchOffset), true);
	
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
			ds_map_add(map, move_encode(sourceSquare,sourceSquare+marchOffset*2), true);
	}
	
	//
	// Captures

	var targetEast = sourceSquare + marchOffset + cardinal_get_incr_x(cardinal.east);
	var targetWest = sourceSquare + marchOffset + cardinal_get_incr_x(cardinal.west);
	var ptarget;
	
	//EAST
	ptarget = boardArray[targetEast];
	//Check Peice is capturable, then add square
	if (ptarget != piece.none && piece_get_color(ptarget) == !w2m)
		ds_map_add(map, move_encode(sourceSquare,targetEast), true);
		
	//WEST
	ptarget = boardArray[targetWest];
	//Check Peice is capturable, then add square
	if (ptarget != piece.none && piece_get_color(ptarget) == !w2m)
		ds_map_add(map, move_encode(sourceSquare,targetWest), true);

	//
	// Enpassant Square -- A Peice WILL Be There because of the double march 
	//     -- nothing was there to block

	//Get & Check
	var enpassantSquare = boardArray[board_other_squares.enpassant_square];
	if (targetEast == enpassantSquare || targetWest == enpassantSquare)
		// Add Enpassant Square
		ds_map_add(map, move_encode(sourceSquare,enpassantSquare), true);
	

}