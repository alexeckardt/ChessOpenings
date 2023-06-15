// @desc
//
//
//
function board_generate_king_moves(boardArray, mapToFill, threatMap, source) {
	
	var lut = Board.id.squaresUntilEdgeLUT;
	var canGoN = lut[# source, cardinal.north] > 0;
	var canGoE = lut[# source, cardinal.east] > 0;
	var canGoS = lut[# source, cardinal.south] > 0;
	var canGoW = lut[# source, cardinal.west] > 0;
	
	var northOff = cardinal_get_incr_y(cardinal.north);
	var eastOff = cardinal_get_incr_x(cardinal.east);
	var southOff = cardinal_get_incr_y(cardinal.south);
	var westOff = cardinal_get_incr_x(cardinal.west);
	
	//Add North
	if (canGoN) 
	{
		king_move_add(mapToFill, source, source+northOff, threatMap);
		
		if (canGoE) {
			king_move_add(mapToFill, source, source+northOff+eastOff, threatMap);
		}
		if (canGoW) {
			king_move_add(mapToFill, source, source+northOff+westOff, threatMap);
		}
	}
	//Add South
	if (canGoS) 
	{
		king_move_add(mapToFill, source, source+southOff, threatMap);
		
		if (canGoE) {
			king_move_add(mapToFill, source, source+southOff+eastOff, threatMap);
		}
		if (canGoW) {
			king_move_add(mapToFill, source, source+southOff+westOff, threatMap);
		}
	}
	
	if (canGoE) 
		king_move_add(mapToFill, source, source+eastOff, threatMap);
	if (canGoW) 
		king_move_add(mapToFill, source, source+westOff, threatMap);
		

	//Castle
	if (boardArray[board_other_squares.white_to_move]) {
			
		if (boardArray[board_other_squares.white_castle_kingside]) {
			ds_map_add(mapToFill, move_encode(source, source+2), true);
		}
		if (boardArray[board_other_squares.white_castle_queenside]) {
			ds_map_add(mapToFill, move_encode(source, source-2), true);
		}
			
	} else {

		if (boardArray[board_other_squares.black_castle_kingside]) {
			ds_map_add(mapToFill, move_encode(source, source+2), true);
		}
		if (boardArray[board_other_squares.black_castle_queenside]) {
			ds_map_add(mapToFill, move_encode(source, source-2), true);
		}

	}
}

function king_move_add(mapToFill, source, dest, threats) {

	if (!ds_map_exists(threats, dest)) {
		ds_map_add(mapToFill, move_encode(source, dest), true);
	}

}