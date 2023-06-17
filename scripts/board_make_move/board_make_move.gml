// @desc
//
//
//
function board_make_move(board, move, doAnimation = true, updateEndGameState = true) {

	// Get
	var b = board.board;
	var source = move_get_source(move);
	var target = move_get_target(move);
	
	//Get
	var pMoved = b[source];
	var pTarget = b[target];
	
	//Update Board
	board_make_internal_move(b, move);

	// Get Move Data
	var enpassantSquare = b[board_other_squares.enpassant_square]; //store
	var moveData = new MoveData(move, pTarget, enpassantSquare, false);

	// Animation
	if (pTarget != piece.none) {
		if (doAnimation) {
			
			piece_create_death_explosion(board, target, pTarget);
			
		}
	}


	//
	//Enpassant
	//
	
	//Reset the Enpassant Square
	
	b[board_other_squares.enpassant_square] = -1;
	
	var type = piece_get_type(pMoved); 
	
	//Ensure Pawn
	if (type == piece.type_pawn) {
		
		//
		// Enpassant
		//
		
		var sourcerank = source div 8;
		var rank = target div 8;
		
		//Enpassant Setting
		if (abs(rank - sourcerank) == 2) {
		
			//Get Middle
			var file = source mod 8;
			
			//Set for next turn
			enpassantSquare = file + 4*sourcerank + 4*rank;
			b[board_other_squares.enpassant_square] = enpassantSquare; // simplified version of f+8*(s+(t-s)/2);
			
		}
		
		//
		// Enpassant Capture
		if (target == enpassantSquare) {
			//Enpassant Happened, Kill Peice
			var pawnSquare = (rank == 2) ? target+8 : target-8;
			b[pawnSquare] = piece.none;
		}
		
		//
		// Promotion
		//
		if (rank == 0 || rank == 8) {
			b[target] = (rank == 0) ? piece.white_queen : piece.black_queen;
			moveData.promotion = true;
		}
	}

	//
	// Castling
	//
	var w2m = b[board_other_squares.white_to_move];
	if (type == piece.type_king) {
		
		var rank = source div 8;
		
		var sourcefile = source mod 8;
		var targetfile = target mod 8;
		
		//Castling was Permitted
		if (abs(sourcefile - targetfile) == 2) {
			
			var placeRookFile = sourcefile + (targetfile-sourcefile)/2;
			var sourceRookFile = (targetfile div 4) * 7; //4 is the kings original file, so queenside is 3 div 4 = 0 and other is 6 div 4 = 1
			
			//Move the rook too
			b[sourceRookFile + rank*8] = piece.none;
			b[placeRookFile + rank*8] = (w2m) ? piece.white_rook : piece.black_rook;
			
		}
		
		//Turn off Castling on board
		if (w2m) {
			b[board_other_squares.white_castle_kingside] = false;
			b[board_other_squares.white_castle_queenside] = false;
			moveData.castleWhiteKingSideLost = true;
			moveData.castleWhiteQueenSideLost = true;
		} else {
			b[board_other_squares.black_castle_kingside] = false;
			b[board_other_squares.black_castle_queenside] = false;
			moveData.castleBlackKingSideLost = true;
			moveData.castleBlackQueenSideLost = true;
		}
	}
	
	// Disable Castling
	if (source == 0 || target == 0) {
		b[board_other_squares.black_castle_queenside] = false;
		moveData.castleBlackQueenSideLost = true;}
	if (source == 7 || target == 7) {
		b[board_other_squares.black_castle_kingside] = false;
		moveData.castleBlackKingSideLost = true;}
	if (source == 56 || target == 56) {
		b[board_other_squares.white_castle_queenside] = false;
		moveData.castleWhiteQueenSideLost = true;}
	if (source == 63 || target == 63) {
		b[board_other_squares.white_castle_kingside] = false;
		moveData.castleWhiteKingSideLost = true;}


	//Push to Stack
	var stack = board.movesStack;
	ds_stack_push(stack, moveData);
	board.turnNumber++;

	//Switch W2M
	b[board_other_squares.white_to_move] = !b[board_other_squares.white_to_move];
	game_set_player_control(b[board_other_squares.white_to_move]);
	
	//Update Threats
	board_populate_threat_map(b, board.threatMap, board.restrictedMoves);
	
	//
	if (doAnimation && board.pickedUpSquare != source) {
		//Add the Animation
		board_add_animation(board, target, source);
	}
	
	if (updateEndGameState) {

		//Make Moves
		var moves = board_generate_moves_as_dic(board);
	
		//Empty! Game Over
		if (ds_map_empty(moves)) {
			board.gameOver = true;
			
			//Determine Who Wins
			var kingSquare = b[board_other_squares.king_position];
			
			// Win State
			var sm =!ds_map_exists(board.restrictedMoves, kingSquare);
			var whiteWins = !b[board_other_squares.white_to_move];
			board.stalemate = sm;
			board.whiteIsWinner = whiteWins;
			
			// Game Set Background Color
			var g = Game.id;
			
			var c = (whiteWins) ? g.winnerColWhite : g.winnerColBlack;
			c = (sm) ? g.winnerColStale : c;
			
			g.winnerCol = c;
		}
	
	}
	
	// Continue opening trie if applicable
	game_advance_trie_step(Game.id, move);
				
}