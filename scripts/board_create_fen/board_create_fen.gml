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
			
			if (piece_exists_at(board, i, j)) {
				
				//Add string
				if (emptyStreak != 0) {
					fen += string(emptyStreak)	
				}
				
				var p = board.board[# j, i];
				fen += piece_get_fen_symbol(p.type, p.white);
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
	fen += (board.whiteToMove) ? chr(fen_notation.to_move_white) : chr(fen_notation.to_move_black); 
	fen += " ";


	//
	//
	fen += (board.whiteCastleKingside) ? chr(fen_notation.castle_kingside_white) : ""; 
	fen += (board.whiteCastleQueenside) ? chr(fen_notation.castle_queenside_white) : ""; 
	fen += (board.blackCastleKingside) ? chr(fen_notation.castle_kingside_black) : ""; 
	fen += (board.blackCastleQueenside) ? chr(fen_notation.castle_queenside_black) : ""; 
	
	//
	// Enpassant Square
	fen += " " + square_id_from_number(board.enpassantsquare);
	
	//
	//
	//
	
	clipboard_set_text(fen);
	return fen;
}