// @desc
//
//
//
function board_make_move(board, move) {

	//Update Board
	var b = board.board;
	var pMoved = b[move_get_source(move)];
	
	//Make Move
	board_make_internal_move(b, move);

	//
	//Enpassant
	//
	var source = move_get_source(move);
	var target = move_get_target(move);
	
	//Reset the Enpassant Square
	var enpassantSquare = b[board_other_squares.enpassant_square]; //store
	b[board_other_squares.enpassant_square] = -1;
	
	if (piece_get_type(pMoved) == piece.type_pawn) {
		
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
		
		
	}

	// Come up With move data
	//var moveData = 


	//Push to Stack
	var stack = board.movesStack;
	ds_stack_push(stack, move);
	board.turnNumber++;

	//Switch W2M
	b[board_other_squares.white_to_move] = !b[board_other_squares.white_to_move];
}