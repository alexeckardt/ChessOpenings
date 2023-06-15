// @desc
//
//
//
function piece_generate_threats(boardArray, mapToFill, source){
	
	//Type
	var p = boardArray[source];
	var type = piece_get_type(p);
			
	var maxrad = 7;	
			
	//Generate Moves
	switch (type) {
				
		default:
			return;
				
		case piece.type_pawn:
			board_generate_pawn_threats(boardArray, mapToFill, source);
			break;
				
		case piece.type_knight:
			board_generate_knight_threats(boardArray, mapToFill, source);
			break;
					
		case piece.type_bishop:
			board_generate_diagonal_sliding_threats(boardArray, mapToFill, source, maxrad);
			break;
					
		case piece.type_rook:
			board_generate_horizontal_sliding_threats(boardArray, mapToFill, source, maxrad);
			break;
					
		case piece.type_queen:
			board_generate_diagonal_sliding_threats(boardArray, mapToFill, source, maxrad);
			board_generate_horizontal_sliding_threats(boardArray, mapToFill, source, maxrad);
			break;
					
		case piece.type_king:
			board_generate_diagonal_sliding_threats(boardArray, mapToFill, source, 1);
			board_generate_horizontal_sliding_threats(boardArray, mapToFill, source, 1);
			
			//Castling is not a threat
			break;
			
	}
	
	//None doesn't do anything
}