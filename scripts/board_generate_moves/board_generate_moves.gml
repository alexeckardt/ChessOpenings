// @desc
//
//
//
function board_generate_moves_as_list(boardArray) {

	var list = ds_list_create();

	//
	//
	//
	var w2move = boardArray[board_other_squares.white_to_move];
	for (var i = 0; i < 64; i++) {
		
		//Get
		var p = boardArray[i];
		
		//Check
		if (piece_get_color(p) == w2move) {
			
			var type = piece_get_type(p);
			
			//Generate Moves
			switch (type) {
				
				case piece.type_pawn:
					break;
				
				case piece.type_knight:
					break;
					
				case piece.type_bishop:
					board_generate_sliding_moves(boardArray, list, p, i, false);
					break;
					
				case piece.type_rook:
					board_generate_sliding_moves(boardArray, list, p, i, true);
					break;
					
				case piece.type_queen:
					board_generate_sliding_moves(boardArray, list, p, i, false);
					board_generate_sliding_moves(boardArray, list, p, i, true);
					break;
					
				case piece.type_king:
					break;
			
			}
			
		}
	}

	// Make Sure to Delete the List!!
	return list;

}