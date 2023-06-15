// @desc
//
//
//
function board_setup(fen) {

	//Each fen sequence seperated by space

	//Force Board
	if (!instance_exists(Board)) {
		instance_create_depth(0, 0, 10, Board);	
	}

	//Get Board
	var b = Board.id;
	
	//Reading String
	var stringpos = 1; //1 indexed
	var char = "test";

	//
	//
	// RESET BOARD
	// Empty Board Firstly
	//
	//
	
	//Empty
	for (var i = 0; i < array_length(b.board); i++) {
		b.board[i] = piece.none;	
	}
	b.board[board_other_squares.white_to_move] = false;
	b.board[board_other_squares.enpassant_square] = -1;
	b.board[board_other_squares.black_castle_kingside] = false;
	b.board[board_other_squares.black_castle_queenside] = false;
	b.board[board_other_squares.white_castle_kingside] = false;
	b.board[board_other_squares.white_castle_queenside] = false;
	b.board[board_other_squares.king_position] = -1;
	
	b.generatedPiecesReference = false;
	b.gameOver = false;
	
	//
	//
	//fen sequence 1: placement
	//
	//
	
	//Positions
	var squarePlacingIn = 0;
	
	while (true) {

		//Get chr
		char = string_char_at(fen, stringpos);
		stringpos++;
		
		//Switch Based on current char
		switch (ord(char)) {
			
			// Is a Number, Move over in files.
			default: 
				var spaces = ord(char) - 49; //48 is the char below 1. thus, if we get 1, we have 49 - 49 = 0
										// where ord("1") is 49. We make it 0, as we add one after the switch statement.
				
				squarePlacingIn += spaces;break;
			
			// Go to next rank
			case fen_notation.end_rank:
				if (squarePlacingIn mod 8 != 0) //Force Next Rank, but not if empty rank
					squarePlacingIn += 8 - (squarePlacingIn mod 8); 
				else
					squarePlacingIn--; //will reincrement
			break;
			
			//Force Exit Entirely
			case fen_notation.section_divider: // the space
				squarePlacingIn = 64;
				break;
			
			//
			// Place pieces
			//
			
			case fen_notation.black_rook:
				b.board[squarePlacingIn] = piece.black_rook;break;
			
			case fen_notation.black_knight:
				b.board[squarePlacingIn] = piece.black_knight;break;
			
			case fen_notation.black_bishop:
				b.board[squarePlacingIn] = piece.black_bishop;break;
			
			case fen_notation.black_queen:
				b.board[squarePlacingIn] = piece.black_queen;break;
			
			case fen_notation.black_king:
				b.board[squarePlacingIn] = piece.black_king;break;
			
			case fen_notation.black_pawn:
				b.board[squarePlacingIn] = piece.black_pawn;break;
			
			
			case fen_notation.white_pawn:
				b.board[squarePlacingIn] = piece.white_pawn;break;
			
			case fen_notation.white_rook:
				b.board[squarePlacingIn] = piece.white_rook;break;
			
			case fen_notation.white_knight:
				b.board[squarePlacingIn] = piece.white_knight;break;
			
			case fen_notation.white_bishop:
				b.board[squarePlacingIn] = piece.white_bishop;break;
			
			case fen_notation.white_queen:
				b.board[squarePlacingIn] = piece.white_queen;break;
			
			case fen_notation.white_king:
				b.board[squarePlacingIn] = piece.white_king;break;
		}
		
		//Add
		squarePlacingIn++;
		
		//Exit
		if (squarePlacingIn >= 64) {
			stringpos++; // Skip Space
			break;	
		}
		
	//End of section 1
	}
	
	//
	// 2: Who's turn?
	//
	// SHOULD be either 'w' or 'b'.
	//
	char = string_char_at(fen, stringpos);
	stringpos += 2; //Skip the space after this.
	
	switch (ord(char)) {
		case fen_notation.to_move_white: 
			b.board[board_other_squares.white_to_move] = true;
		break;
		case fen_notation.to_move_black:
			b.board[board_other_squares.white_to_move] = false;
		break;
		
		default:
			return false; //exit, bad fen string
	}
	
	//
	// 3: Castling Rights
	//
	var done = false;
	
	//Loop
	while (!done) {
		
		//Get chr
		char = string_char_at(fen, stringpos);
		stringpos++;
		
		//Switch Based on current char
		switch (ord(char)) {
			
			//Do nothing, wait for space.
			case fen_notation.castle_no_rights:
				break;
				
			//End Section
			case fen_notation.section_divider:
				done = true;
				break;
				
			case fen_notation.castle_kingside_black:
				b.board[board_other_squares.black_castle_kingside] = true;break;
				
			case fen_notation.castle_queenside_black:
				b.board[board_other_squares.black_castle_queenside] = true;break;
				
			case fen_notation.castle_kingside_white: 
				b.board[board_other_squares.white_castle_kingside] = true;break;
			
			case fen_notation.castle_queenside_white: 
				b.board[board_other_squares.white_castle_queenside] = true;break;
		}
	}
	
	//
	// 4: En Passant Target Square
	//

	//Read
	char = string_char_at(fen, stringpos);
	
	// Enpassant is allowed
	b.enpassantSquare = -1;
	if (ord(char) != fen_notation.enpassant_no_rights) {
	
		var sid = char;
		sid += string_char_at(fen, ++stringpos);
		
		b.board[board_other_squares.enpassant_square] = square_number_from_id(sid);
	}
	stringpos++; //skip the space
	
	//
	// 5, 6 move counts. To do.
	//
	

	//
	// Determine if King is in check
	//
	board_populate_threat_map(b.board, b.threatMap, b.restrictedMoves);
	
	return b;
}