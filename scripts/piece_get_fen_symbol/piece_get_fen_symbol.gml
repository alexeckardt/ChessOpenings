// @desc
//
//
//
function piece_get_fen_symbol(type, white) {

	switch (type) {
		
		case piece.pawn:
			return (white) ? chr(fen_notation.white_pawn) : chr(fen_notation.black_pawn);
			
		case piece.knight:
			return (white) ? chr(fen_notation.white_knight) : chr(fen_notation.black_knight);
			
		case piece.bishop:
			return (white) ? chr(fen_notation.white_bishop) : chr(fen_notation.black_bishop);
			
		case piece.rook:
			return (white) ? chr(fen_notation.white_rook) : chr(fen_notation.black_rook);
			
		case piece.queen:
			return (white) ? chr(fen_notation.white_queen) : chr(fen_notation.black_queen);
			
		case piece.king:
			return (white) ? chr(fen_notation.white_king) : chr(fen_notation.black_king);
		
	}
	
	return "???"

}