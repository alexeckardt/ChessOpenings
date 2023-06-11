// @desc
//
//
//
function board_get_all_attacked_squares(board, storeInMap, fromWhite, setCheckers = true) {

	// Create Temp List
	var tempList = ds_list_create();
	ds_list_clear(board.piecesCheckingKing);

	// Loop Over all squares ... can optimize
	for (var square = 0; square < 64; square++) {
		
		// Position
		var i = square mod 8;
		var j = square div 8;
		
		// Check if Board .. still can optimize
		if (piece_exists_at(board, i, j)) {
		
			// Get Piece
			var p = board.board[# j, i];
			if (setCheckers)
				p.isChecker = false;
			
			
			if (p.white != fromWhite)
				continue;	

			// Populate List of moves
			// We invert the colours of the peices, because we then see which pieces they
			// defend as well.
			 
			ds_list_clear(tempList);
			p.get_legal_moves(tempList, true);
			
			// Store in Map
			var movec = ds_list_size(tempList);
			for (var c = 0; c < movec; c++) {
				var movesqr = tempList[| c];
				storeInMap[? movesqr] = true;
			}
			
			//
			// Store ME as a checker
			//
			if (setCheckers) {
			var enemyKingSquare = (fromWhite) ? board.blackKingSquare : board.whiteKingSquare;
				if (ds_list_find_index(tempList, enemyKingSquare) != -1) {
					ds_list_add(board.piecesCheckingKing, square);	
					p.isChecker = true;
				}
			}
			
		}
		
	}
	
	//Unneeded Map
	ds_list_destroy(tempList);
	
}