// @desc
//
//
//
function board_generate_king_moves(boardArray, mapToFill, threatMap, source, restrictedMoves) {
	
	var lut = Board.id.squaresUntilEdgeLUT;
	var canGoN = lut[# source, cardinal.north] > 0;
	var canGoE = lut[# source, cardinal.east] > 0;
	var canGoS = lut[# source, cardinal.south] > 0;
	var canGoW = lut[# source, cardinal.west] > 0;
			
	var northOff = cardinal_get_incr_y(cardinal.north);
	var eastOff = cardinal_get_incr_x(cardinal.east);
	var southOff = cardinal_get_incr_y(cardinal.south);
	var westOff = cardinal_get_incr_x(cardinal.west);
	
	var w2m = boardArray[board_other_squares.white_to_move];
	
	//Add North
	if (canGoN) 
	{
		king_move_add(boardArray,mapToFill, source, source+northOff, threatMap, w2m);
		
		if (canGoE) {
			king_move_add(boardArray,mapToFill, source, source+northOff+eastOff, threatMap, w2m);
		}
		if (canGoW) {
			king_move_add(boardArray,mapToFill, source, source+northOff+westOff, threatMap, w2m);
		}
	}
	//Add South
	if (canGoS) 
	{
		king_move_add(boardArray,mapToFill, source, source+southOff, threatMap, w2m);
		
		if (canGoE) {
			king_move_add(boardArray,mapToFill, source, source+southOff+eastOff, threatMap, w2m);
		}
		if (canGoW) {
			king_move_add(boardArray,mapToFill, source, source+southOff+westOff, threatMap, w2m);
		}
	}
	
	if (canGoE) 
		king_move_add(boardArray,mapToFill, source, source+eastOff, threatMap, w2m);
	if (canGoW) 
		king_move_add(boardArray,mapToFill, source, source+westOff, threatMap, w2m);
		

	//Castle
	if (!ds_map_exists(threatMap, source)) {
		
		var canKingside = (w2m) ? boardArray[board_other_squares.white_castle_kingside] 
								: boardArray[board_other_squares.black_castle_kingside];
		var canQueenside = (w2m) ? boardArray[board_other_squares.white_castle_queenside] 
								: boardArray[board_other_squares.black_castle_queenside];
	
		if (canKingside) {
			if (!ds_map_exists(threatMap, source+1)){ // can't castle thru threat
				if (boardArray[source+1] == piece.none) {
					king_move_add(boardArray,mapToFill, source, source+2, threatMap, w2m);
				}
			}
		}
		if (canQueenside) {
			if (!ds_map_exists(threatMap, source-1)){ // can't castle thru threat
				if (boardArray[source-1] == piece.none) {
					if (boardArray[source-3] == piece.none) { //Queenside make sure the knight is gone
						king_move_add(boardArray,mapToFill, source, source-2, threatMap, w2m);
					}
				}
			}
		}
	}
}
//
//
//
function king_move_add(boardArray, mapToFill, source, dest, threats, w2m) {

	var target = boardArray[dest];
	var empty = target == piece.none;
	
	if (empty || (!empty && piece_get_color(target) != w2m)) { //ensure can't take own piece
		if (!ds_map_exists(threats, dest) && !king_in_restricted_square(dest, restrictedMoves)) { //can't put self in check
			ds_map_add(mapToFill, move_encode(source, dest), true);
		}
	}
}

function king_in_restricted_square(dest, restrictedMoves) {
	
	//Can't be in it
	if !ds_map_exists(restrictedMoves, dest) return false;

	return restrictedMoves[? dest] == dest; //I CAN capture peice i'm checked by.
}