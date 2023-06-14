// @desc
//
//
//
function board_generate_moves_as_dic(boardArray) {

	var map = ds_map_create();
	var pinnedSquares = ds_map_create();
	var w2move = boardArray[board_other_squares.white_to_move];
	
	/*
	//
	// Determine Checks / Pins (Same Hopefully)
	//
	
	// Find King
	var kingSquare = -1;
	for (var i = 0; i < 64; i++) {
		var p = boardArray[i];
		if (piece_get_type(p) == piece.type_king) {
			if (piece_get_colour(p) == w2move) {
				kingSquare = 1;
				break;	
			}
		}
	}
	
	// Illegal Board Position
	if (kingSquare == - 1)	
		return;
	
	// Determine Moves
	board_generate_pinned_squares(boardArray, pinnedSquares, kingSquare);
	*/
	
	//
	// Peice Move
	//

	for (var i = 0; i < 64; i++) {
		
		//Get
		var p = boardArray[i];
		
		//Check
		if (piece_get_color(p) == w2move) {
			
			// Fill Map by Piece
			piece_generate_moves(boardArray, map, i);
			
		}
	}

	//Destroy Pinned Map
	ds_map_destroy(pinnedSquares);

	// Make Sure to Delete the Map
	return map;
}