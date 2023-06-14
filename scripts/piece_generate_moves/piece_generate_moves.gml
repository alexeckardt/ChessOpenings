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
			break;
				
		case piece.type_knight:
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
			board_generate_diagonal_sliding_moves(boardArray, mapToFill, source, maxrad);
			board_generate_horizontal_sliding_moves(boardArray, mapToFill, source, maxrad);
			break;
			
	}
	
	//None doesn't do anything
}