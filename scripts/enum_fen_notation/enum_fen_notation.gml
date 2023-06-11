// @desc
//
//
//
enum fen_notation {
	
	section_divider = ord(" "),
	
	// 1
	
	black_king = ord("k"),
	black_queen = ord("q"),
	black_rook = ord("r"),
	black_bishop = ord("b"),
	black_knight = ord("n"),
	black_pawn = ord("p"),
	
	white_king = ord("K"),
	white_queen = ord("Q"),
	white_rook = ord("R"),
	white_bishop = ord("B"),
	white_knight = ord("N"),
	white_pawn = ord("P"),
	
	end_rank = ord("/"),
	
	// 2
	
	to_move_white = ord("w"),
	to_move_black = ord("b"),
	
	
	// 3
	
	castle_kingside_white = ord("K"),
	castle_kingside_black = ord("k"),
	castle_queenside_white = ord("Q"),
	castle_queenside_black = ord("q"),
	castle_no_rights = ord("-"),
	
	// 4
	enpassant_no_rights = ord("-"),
	
}