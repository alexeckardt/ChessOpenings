// @desc
//
//
//
function board_generate_moves_as_dic(board) {

	var boardArray = board.board;
	var threatMap = board.threatMap;

	var map = ds_map_create();
	var restrictedMoves = board.restrictedMoves;
	var w2move = boardArray[board_other_squares.white_to_move];
	
	//
	// Determine Checks / Pins (Same Hopefully)
	//
	
	//
	// Peice Move
	//

	for (var i = 0; i < 64; i++) {
		
		//Get
		var p = boardArray[i];
		
		//Check
		if (piece_get_color(p) == w2move) {
			
			// Fill Map by Piece
			piece_generate_moves(boardArray, map, board.threatMap, restrictedMoves, i);
			
		}
	}

	// Make Sure to Delete the Map
	return map;
}