// @desc
//
//
//
function agent_get_all_possible_moves(board, returnList, fromWhite) {

	var tempList = ds_list_create();

	// Loop Over all squares ... can optimize
	for (var square = 0; square < 64; square++) {
		
		// Position
		var i = square mod 8;
		var j = square div 8;
		
		// Check if Board .. still can optimize
		if (piece_exists_at(board, i, j)) {
		
			// Get Piece
			var p = board.board[# j, i];
			if (p.white != fromWhite)
				continue;	

			// Populate List of moves
			 
			ds_list_clear(tempList);
			p.get_legal_moves(tempList, false);
			
			// Store in Return List
			var movec = ds_list_size(tempList);
			for (var c = 0; c < movec; c++) {
				ds_list_add(returnList, new AgentMove(square, tempList[| c]));
			}
		}
	}
	
	//Destroy
	ds_list_destroy(tempList);
}