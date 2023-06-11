// @desc
//
//
//
function Queen(board, _white, _i, _j) : Piece(board, _white, _i, _j) constructor {
	
	//Set
	type = piece.queen;
	
	// Override
	static get_legal_moves = function(list_to_override, includeDefendingSquares) {
		ds_list_clear(list_to_override);
		
		var i = file;
		var j = rank;
		var w = white;
		
		piece_add_legal_move_sweeping(board, list_to_override, i, j, -1, -1, w, includeDefendingSquares);
		piece_add_legal_move_sweeping(board, list_to_override, i, j, 1, -1, w, includeDefendingSquares);
		piece_add_legal_move_sweeping(board, list_to_override, i, j, -1, 1, w, includeDefendingSquares);
		piece_add_legal_move_sweeping(board, list_to_override, i, j, 1, 1, w, includeDefendingSquares);
		piece_add_legal_move_sweeping(board, list_to_override, i, j, -1, 0, w, includeDefendingSquares);
		piece_add_legal_move_sweeping(board, list_to_override, i, j, 1, 0, w, includeDefendingSquares);
		piece_add_legal_move_sweeping(board, list_to_override, i, j, 0, -1, w, includeDefendingSquares);
		piece_add_legal_move_sweeping(board, list_to_override, i, j, 0, 1, w, includeDefendingSquares);
		
		//Force Pin?
		var pinnedList = ds_list_create();
		if (piece_check_would_be_pinned(board, i, j, w, pinnedList)) {
			ds_list_intersect(list_to_override, pinnedList);
		}
		ds_list_destroy(pinnedList);
		
	}
	
}