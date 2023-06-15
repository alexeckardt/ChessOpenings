// @desc
//
//
//
function board_undo_move(board) {

	var stack = board.movesStack;
	var b = board.board;
	var whiteMoved = !b[board_other_squares.white_to_move];
	if (ds_stack_empty(stack)) return;

	// Get Move Data
	var lastMoveData = ds_stack_pop(stack);
	var moveMade = lastMoveData.moveMade;

	// Get
	var source = move_get_source(moveMade);
	var target = move_get_target(moveMade);
	var undoMove = move_encode(target, source);
	
	//Update Board
	board_make_internal_move(b, undoMove);
	var pThatMoved = piece_get_type(b[source]);

	//
	// Revive The Captured Piece
	b[target] = lastMoveData.capture;
	if (lastMoveData.enpassantSquare == target) { //was the target the enpassant square?
		
		//If enpassant was captured by a pawn, then revive the piece.
		if (pThatMoved == piece.type_pawn) {
			
			//Revive the Black Piece
			if (target div 8 == 2) {
				b[target + 8] = piece.black_pawn;
			} else {
				b[target - 8] = piece.white_pawn;
			}
			
		}

	}
	
	// Reset Enpassant Square
	b[board_other_squares.enpassant_square] = lastMoveData.enpassantSquare;
	
	// Reset Castle Rights
	if (lastMoveData.castleBlackKingSideLost) b[board_other_squares.black_castle_kingside] = true;
	if (lastMoveData.castleBlackQueenSideLost) b[board_other_squares.black_castle_queenside] = true;
	if (lastMoveData.castleWhiteKingSideLost) b[board_other_squares.white_castle_kingside] = true;
	if (lastMoveData.castleWhiteQueenSideLost) b[board_other_squares.white_castle_queenside] = true;

	// Re-move my Rook
	if (pThatMoved == piece.type_king) {
		
		// Moved 2 Horizontally? = Castle
		if (abs(target - source) == 2) {
			
			var directionMoved = (target - source) div 2;	
			b[source + directionMoved] = piece.none; //Kill Rook
			
			//Respawn Rook
			var pos = (directionMoved == 1)*7; // 0 if we moved towards west  
			var rank = source div 8;
			
			b[rank*8 + pos] = (whiteMoved) ? piece.white_rook : piece.black_rook;
		}
		
	}

	// Undo Promotions
	if (lastMoveData.promotion) {
		b[source] = (whiteMoved) ? piece.white_pawn : piece.black_pawn;	
	}

	//Switch W2M
	b[board_other_squares.white_to_move] = whiteMoved;
	game_set_player_control(b[board_other_squares.white_to_move]);
	
	//Update Threats
	board_populate_threat_map(b, board.threatMap, board.restrictedMoves);
}