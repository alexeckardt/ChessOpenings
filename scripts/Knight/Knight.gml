// @desc
//
//
//
function Knight(board, _white, _i, _j) : Piece(board, _white, _i, _j) constructor {
	
	//Set
	type = piece.knight;
	
	// Override
	static get_legal_moves = function(list_to_override, includeDefendingSquares) { //invert white is for checking for defending
		ds_list_clear(list_to_override);
		
		var i = file;
		var j = rank;
		var w = white;
			
		peice_add_legal_move_check_not_friendly(board, list_to_override, i-2, j-1, w, includeDefendingSquares);
		peice_add_legal_move_check_not_friendly(board, list_to_override, i-2, j+1, w, includeDefendingSquares);
		
		peice_add_legal_move_check_not_friendly(board, list_to_override, i-1, j-2, w, includeDefendingSquares);
		peice_add_legal_move_check_not_friendly(board, list_to_override, i-1, j+2, w, includeDefendingSquares);
		
		peice_add_legal_move_check_not_friendly(board, list_to_override, i+1, j-2, w, includeDefendingSquares);
		peice_add_legal_move_check_not_friendly(board, list_to_override, i+1, j+2, w, includeDefendingSquares);
		
		peice_add_legal_move_check_not_friendly(board, list_to_override, i+2, j-1, w, includeDefendingSquares);
		peice_add_legal_move_check_not_friendly(board, list_to_override, i+2, j+1, w, includeDefendingSquares);
		
		//Force Pin?
		var pinnedList = ds_list_create();
		if (piece_check_would_be_pinned(board, i, j, w, pinnedList)) {
			ds_list_intersect(list_to_override, pinnedList);
		}
		ds_list_destroy(pinnedList);
	}
	
}