// @desc
//
//
//
function piece_generate_moves(boardArray, mapToFill, source){
	
	//Type
	var p = boardArray[source];
	var type = piece_get_type(p);
			
	var maxrad = 7;	
			
	//Generate Moves
	switch (type) {
				
		default:
			return;
				
		case piece.type_pawn:
			board_generate_pawn_moves(boardArray, mapToFill, source);
			break;
				
		case piece.type_knight:
			board_generate_knight_moves(boardArray, mapToFill, source);
			break;
					
		case piece.type_bishop:
			board_generate_diagonal_sliding_moves(boardArray, mapToFill, source, maxrad);
			break;
					
		case piece.type_rook:
			board_generate_horizontal_sliding_moves(boardArray, mapToFill, source, maxrad);
			break;
					
		case piece.type_queen:
			board_generate_diagonal_sliding_moves(boardArray, mapToFill, source, maxrad);
			board_generate_horizontal_sliding_moves(boardArray, mapToFill, source, maxrad);
			break;
					
		case piece.type_king:
			board_generate_diagonal_sliding_moves(boardArray, mapToFill, source, 1);
			board_generate_horizontal_sliding_moves(boardArray, mapToFill, source, 1);
			
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
			break;
			
	}
	
	//None doesn't do anything
}