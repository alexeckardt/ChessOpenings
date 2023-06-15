// @desc
//
//
//
function board_generate_knight_moves(boardArray, map, sourceSquare, threatMap, restrictedMoves) {

	var lut = Board.id.squaresUntilEdgeLUT;
	var distN = lut[# sourceSquare, cardinal.north];
	var distE = lut[# sourceSquare, cardinal.east];
	var distS = lut[# sourceSquare, cardinal.south];
	var distW = lut[# sourceSquare, cardinal.west];
	
	var northOff = cardinal_get_incr_y(cardinal.north);
	var eastOff = cardinal_get_incr_x(cardinal.east);
	var southOff = cardinal_get_incr_y(cardinal.south);
	var westOff = cardinal_get_incr_x(cardinal.west);
	
	var w2m = boardArray[board_other_squares.white_to_move];
	
	//
	// North Long
	//
	if (distN >= 2) {
		if (distE >= 1) {
			var moveTarget = sourceSquare + northOff*2 + eastOff
			knight_move_add(boardArray, map, sourceSquare, moveTarget, w2m, restrictedMoves, threatMap)	
		}
		
		if (distW >= 1) {
			var moveTarget = sourceSquare + northOff*2 + westOff
			knight_move_add(boardArray, map, sourceSquare, moveTarget, w2m, restrictedMoves, threatMap)	
		}
	}
	//
	// South Long
	//
	if (distS >= 2) {
		if (distE >= 1) {
			var moveTarget = sourceSquare + southOff*2 + eastOff
			knight_move_add(boardArray, map, sourceSquare, moveTarget, w2m, restrictedMoves, threatMap)	
		}
		
		if (distW >= 1) {
			var moveTarget = sourceSquare + southOff*2 + westOff
			knight_move_add(boardArray, map, sourceSquare, moveTarget, w2m, restrictedMoves, threatMap)	
		}
	}
	//
	// East Long
	//
	if (distE >= 2) {
		if (distN >= 1) {
			var moveTarget = sourceSquare + eastOff*2 + northOff
			knight_move_add(boardArray, map, sourceSquare, moveTarget, w2m, restrictedMoves, threatMap)	
		}
		
		if (distS >= 1) {
			var moveTarget = sourceSquare + eastOff*2 + southOff
			knight_move_add(boardArray, map, sourceSquare, moveTarget, w2m, restrictedMoves, threatMap)	
		}
	}
	//
	// West Long
	//
	if (distW >= 2) {
		if (distN >= 1) {
			var moveTarget = sourceSquare + westOff*2 + northOff
			knight_move_add(boardArray, map, sourceSquare, moveTarget, w2m, restrictedMoves, threatMap)	
		}
		
		if (distS >= 1) {
			var moveTarget = sourceSquare + westOff*2 + southOff
			knight_move_add(boardArray, map, sourceSquare, moveTarget, w2m, restrictedMoves, threatMap)
		}
	}
}

function knight_move_add(boardArray, map, sourceSquare, target, w2m, restrictedMoves, threatMap) {
	
	//No Self Captures
	var p = boardArray[target];
	if (p != piece.none) {
		if (piece_get_color(p) == w2m) {
			return;
		}
	}
	
	//Add Move
	var restrict = !ds_map_empty(restrictedMoves);
	
	if (!restrict || ds_map_exists(restrictedMoves, target)) { // In Check Restrictions
		if (!board_piece_is_pinned(boardArray, threatMap, sourceSquare, target)) {
			var m = move_encode(sourceSquare, target);
			ds_map_add(map, m, true);
		}
	}
	
	
}