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
	
	for (var sqrr = 0; sqrr < 64; sqrr++) {
		if (piece_exists_at(b, sqrr mod 8, sqrr div 8)) {
			delete b.board[# sqrr mod 8, sqrr div 8];
		}
	}	
	ds_grid_clear(b.depthGrid, b.emptyPiece);
	ds_grid_clear(b.board,b.emptyPiece);
	ds_map_clear(b.attackedSquares);
	ds_list_clear(b.validSquaresToMoveTo);
	ds_list_clear(b.piecesCheckingKing);
	ds_map_clear(b.checkBlockingSquares);
	ds_list_clear(b.particles);
	ds_list_clear(b.piecesReference);
	
	
	
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
				piece_create(b, false, piece.rook, squarePlacingIn);break;
			
			case fen_notation.black_knight:
				piece_create(b, false, piece.knight, squarePlacingIn);break;
			
			case fen_notation.black_bishop:
				piece_create(b, false, piece.bishop, squarePlacingIn);break;
			
			case fen_notation.black_queen:
				piece_create(b, false, piece.queen, squarePlacingIn);break;
			
			case fen_notation.black_king:
				piece_create(b, false, piece.king, squarePlacingIn);
				b.blackKingSquare = squarePlacingIn;
				break;
			
			case fen_notation.black_pawn:
				piece_create(b, false, piece.pawn, squarePlacingIn);break;
			
			
			case fen_notation.white_pawn:
				piece_create(b, true, piece.pawn, squarePlacingIn);break;
			
			case fen_notation.white_rook:
				piece_create(b, true, piece.rook, squarePlacingIn);break;
			
			case fen_notation.white_knight:
				piece_create(b, true, piece.knight, squarePlacingIn);break;
			
			case fen_notation.white_bishop:
				piece_create(b, true, piece.bishop, squarePlacingIn);break;
			
			case fen_notation.white_queen:
				piece_create(b, true, piece.queen, squarePlacingIn);break;
			
			case fen_notation.white_king:
				piece_create(b, true, piece.king, squarePlacingIn);
				b.whiteKingSquare = squarePlacingIn;
				break;
		}
		
		//Add
		squarePlacingIn++;
		
		//Exit
		if (squarePlacingIn >= 64) {
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
			b.whiteToMove = true;
		break;
		case fen_notation.to_move_black:
			b.whiteToMove = false;
		break;
		
		default:
			return false; //exit, bad fen string
	}
	
	//
	// 3: Castling Rights
	//
	var done = false;
	
	//Force
	b.blackCastleKingside = false;
	b.blackCastleQueenside = false;
	b.whiteCastleKingside = false;
	b.whiteCastleQueenside = false;
	
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
				b.blackCastleKingside = true;break;
				
			case fen_notation.castle_queenside_black:
				b.blackCastleQueenside = true;break;
				
			case fen_notation.castle_kingside_white: 
				b.whiteCastleKingside = true;break;
			
			case fen_notation.castle_queenside_white: 
				b.whiteCastleQueenside = true;break;
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
		
		b.enpassantSquare = square_number_from_id(sid);
	}
	stringpos++; //skip the space
	
	//
	// 5, 6 move counts. To do.
	//


	//
	// Determine if King is in check
	//
	var map = b.attackedSquares;
	ds_map_clear(map);
			
	board_get_all_attacked_squares(b, map, !b.whiteToMove);
	var kingSquareToCheck = (!b.whiteToMove) ? b.blackKingSquare : b.whiteKingSquare;
	b.kingInCheck = ds_map_exists(map, kingSquareToCheck);

	return b;
}