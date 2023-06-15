// @desc
//
//
//
function piece_generate_moves(boardArray, mapToFill, threatMap, restrictedMoves, source) {
	
	//Type
	var p = boardArray[source];
	var type = piece_get_type(p);
			
	var maxrad = 7;	
	var doRestrict = true;
			
	//Generate Moves
	switch (type) {
				
		default:
			return;
				
		case piece.type_pawn:
			board_generate_pawn_moves(boardArray, mapToFill, source,threatMap);
			break;
				
		case piece.type_knight:
			board_generate_knight_moves(boardArray, mapToFill, source,threatMap);
			break;
					
		case piece.type_bishop:
			board_generate_diagonal_sliding_moves(boardArray, mapToFill, source, maxrad, restrictedMoves,threatMap);
			break;
					
		case piece.type_rook:
			board_generate_horizontal_sliding_moves(boardArray, mapToFill, source, maxrad, restrictedMoves,threatMap);
			break;
					
		case piece.type_queen:
			board_generate_diagonal_sliding_moves(boardArray, mapToFill, source, maxrad, restrictedMoves,threatMap);
			board_generate_horizontal_sliding_moves(boardArray, mapToFill, source, maxrad, restrictedMoves,threatMap);
			break;
					
		case piece.type_king:
			board_generate_king_moves(boardArray, mapToFill, threatMap, source);
			doRestrict = false;
			break;
			
	}
}