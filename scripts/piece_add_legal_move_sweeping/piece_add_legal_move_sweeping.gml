// @desc
//
//
//
function piece_add_legal_move_sweeping(board, list, sourcei, sourcej, idir, jdir, white, includeDefendingSquares) {

	var markAsKingCantMoveThere = false;

	// Loop
	for (var r = 1; r < 8; r++) {
		
		//Position
		var ii = sourcei+idir*r
		var jj = sourcej+jdir*r;
		
		//Exit Line
		if (ii < 0 || ii >= 8 || jj < 0 || jj >= 8) {
			break;	
		}
		
		//Skip Condition Check if we check for squares I'm defeinding
		var square = ii + jj*8;
		if (piece_exists_at_coloured(board, ii, jj, white)) {
			//We include defenders?
			if (includeDefendingSquares) {
				ds_list_add(list, square);	
			}
			break;
		}
	
		//Add to List
		if (piece_move_will_block_check(board, ii, jj) && white == board.whiteToMove)
			ds_list_add(list, square);
	
		// Exit "Streak", Unless it's the king and we're doing attacking squares
		if (piece_exists_at_coloured(board, ii, jj, !white)) {
			
			//
			// XRAY through Enemy King (we are defending those squares as well, if you think abt it.
			//
			if (includeDefendingSquares) {
				
				//Get Enemy
				var enKingSquare = (white) ? board.blackKingSquare : board.whiteKingSquare;
				
				//Exit if The enemy piece is NOT the king
				if (square != enKingSquare) {
					break;
				}
				
				// Thus if the piece IS the king, we continue and mark those squares as defended.
			
			} else {
				
				//Exit Line
				break;	
				
			}
		}
	}

}