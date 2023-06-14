// @desc
//
//
//
function board_generate_knight_moves(boardArray, map, sourceSquare) {

	var lut = Board.id.squaresUntilEdgeLUT;
	var distN = lut[# sourceSquare, cardinal.north];
	var distE = lut[# sourceSquare, cardinal.east];
	var distS = lut[# sourceSquare, cardinal.south];
	var distW = lut[# sourceSquare, cardinal.west];
	
	var northOff = cardinal_get_incr_y(cardinal.north);
	var eastOff = cardinal_get_incr_x(cardinal.east);
	var southOff = cardinal_get_incr_y(cardinal.south);
	var westOff = cardinal_get_incr_x(cardinal.west);
	
	var w2m = board[board_other_squares.white_to_move];
	
	//
	// North Long
	//
	if (distN >= 2) {
		if (distE >= 1) {
			var moveTarget = sourceSquare + northOff*2 + eastOff
			knight_move_add(boardArray, map, sourceSquare, moveTarget, w2m)	
		}
		
		if (distW >= 1) {
			var moveTarget = sourceSquare + northOff*2 + westOff
			knight_move_add(boardArray, map, sourceSquare, moveTarget, w2m)	
		}
	}
	//
	// South Long
	//
	if (distS >= 2) {
		if (distE >= 1) {
			var moveTarget = sourceSquare + southOff*2 + eastOff
			knight_move_add(boardArray, map, sourceSquare, moveTarget, w2m)	
		}
		
		if (distW >= 1) {
			var moveTarget = sourceSquare + southOff*2 + westOff
			knight_move_add(boardArray, map, sourceSquare, moveTarget, w2m)	
		}
	}
	//
	// East Long
	//
	if (distE >= 2) {
		if (distN >= 1) {
			var moveTarget = sourceSquare + eastOff*2 + northOff
			knight_move_add(boardArray, map, sourceSquare, moveTarget, w2m)	
		}
		
		if (distS >= 1) {
			var moveTarget = sourceSquare + eastOff*2 + southOff
			knight_move_add(boardArray, map, sourceSquare, moveTarget, w2m)	
		}
	}
	//
	// West Long
	//
	if (distW >= 2) {
		if (distN >= 1) {
			var moveTarget = sourceSquare + westOff*2 + northOff
			knight_move_add(boardArray, map, sourceSquare, moveTarget, w2m)	
		}
		
		if (distS >= 1) {
			var moveTarget = sourceSquare + westOff*2 + southOff
			knight_move_add(boardArray, map, sourceSquare, moveTarget, w2m)
		}
	}
}

function knight_move_add(boardArray, map, sourceSquare, target, w2m) {
	
	//No Self Captures
	var p = boardArray[target];
	if (p != piece.none) {
		if (piece_get_color(p) == w2m) {
			return;
		}
	}
	
	//Encode and add
	var move = move_encode(sourceSquare, target);
	ds_map_add(map, move, true);
}