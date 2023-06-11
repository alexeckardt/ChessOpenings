// @desc
//
//
//
function Pawn(board, _white, _i, _j) : Piece(board, _white, _i, _j) constructor {
	
	//Set
	type = piece.pawn;
	
	// Override
	static get_legal_moves = function(list_to_override, includeDefendingSquares) {
		ds_list_clear(list_to_override);
		
		var dir = (white) ? -1 : 1;
		var i = file;
		var j = rank;
		var w = white;

		//Forward
		if (!includeDefendingSquares) {
			if (!piece_exists_at(board, i, j+dir)) && (piece_move_will_block_check(board, i, j+dir))
				peice_add_legal_move_check(list_to_override, i, j+dir);
		
			//First Move Double Take
			if (!moved) && (!piece_exists_at(board, i, j+dir*2)) && (piece_move_will_block_check(board, i, j+dir*2))
				peice_add_legal_move_check(list_to_override, i, j+dir*2);
		}
		
		//Take Left
		if 
		(
		piece_exists_at_coloured(board, i-1, j+dir, !w) || //Taking
		(includeDefendingSquares) //Checking for Defence
		) 
		&& (piece_move_will_block_check(board, i-1, j+dir))
			peice_add_legal_move_check(list_to_override, i-1, j+dir);
			
		//Take Right
		if 
		(
		piece_exists_at_coloured(board, i+1, j+dir, !w) || //Taking
		(includeDefendingSquares) //Checking for Defence
		) 
		&& (piece_move_will_block_check(board, i+1, j+dir))
			peice_add_legal_move_check(list_to_override, i+1, j+dir);
			
		//Take Enpassant
		if (i+1 + (j+dir)*8 == board.enpassantsquare) 
			peice_add_legal_move_check_not_friendly(board, list_to_override, i+1, j+dir, w, includeDefendingSquares); //incase
		if (i-1 + (j+dir)*8 == board.enpassantsquare)
			peice_add_legal_move_check_not_friendly(board, list_to_override, i-1, j+dir, w, includeDefendingSquares); //incase
		
		//Force Pin?
		var pinnedList = ds_list_create();
		if (piece_check_would_be_pinned(board, i, j, w, pinnedList)) {
			ds_list_intersect(list_to_override, pinnedList);
		}
		ds_list_destroy(pinnedList);
	}
	
	//
	// override
	static move = function(j, i) {
		
		if (!moved) {
			moved = (i != file || j != rank);
			board.enpassantsquare = -1;
		}
		
		if (abs(rank - j) == 2) {
			var theSkippedSquare = j - (j-rank) div 2;
			board.enpassantsquare = i + theSkippedSquare*8; 
		} else  {
			board.enpassantsquare = -1;	
		}
		
		file = i;
		rank = j;
	}
	
}