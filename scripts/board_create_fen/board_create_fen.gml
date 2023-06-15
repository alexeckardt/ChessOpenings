// @desc
//
//
//
function board_create_fen(board) {

	var fen = ""

	//From Square
	for (var j = 0; j < 8; j++) {
		
		var emptyStreak = 0;
		
		//Loop over row
		for (var i = 0; i < 8; i++) {
			
			var sqrr = i + j*8;
			
			if (board.board[sqrr]) {
				
				//Add string
				if (emptyStreak != 0) {
					fen += string(emptyStreak);
				}
				
				var p = board.board[sqrr];
				fen += piece_get_fen_symbol(piece_get_type(p), piece_get_color(p));
				emptyStreak = 0;
				
				
			} else {
				emptyStreak++;	
			}
			
		}
		
		//Add End
		if (emptyStreak != 0) {
			fen += string(emptyStreak)
		}
		if (j != 7) {
			fen += chr(fen_notation.end_rank);
		}
	}
	
	//
	// 2: Who Plays
	fen += " ";
	fen += (board.board[board_other_squares.white_to_move]) ? chr(fen_notation.to_move_white) : chr(fen_notation.to_move_black); 
	fen += " ";


	//
	//
	fen += (board.board[board_other_squares.white_castle_kingside]) ? chr(fen_notation.castle_kingside_white) : ""; 
	fen += (board.board[board_other_squares.white_castle_queenside]) ? chr(fen_notation.castle_queenside_white) : ""; 
	fen += (board.board[board_other_squares.black_castle_kingside]) ? chr(fen_notation.castle_kingside_black) : ""; 
	fen += (board.board[board_other_squares.black_castle_queenside]) ? chr(fen_notation.castle_queenside_black) : ""; 
	
	//
	// Enpassant Square
	fen += " " + square_id_from_number(board.board[board_other_squares.enpassant_square]);
	
	//
	//
	//
	
	clipboard_set_text(fen);
	return fen;
}