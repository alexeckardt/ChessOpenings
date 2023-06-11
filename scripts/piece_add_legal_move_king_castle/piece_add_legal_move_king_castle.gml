// @desc
//
//
//
function piece_add_legal_move_king_castle(board, list, i, j, kingside, white) {
	
	var castleKingSide = (white) ? board.whiteCastleKingside : board.blackCastleKingside;
	var castleQueenSide = (white) ? board.whiteCastleQueenside : board.blackCastleQueenside;
	var castleable = (kingside) ? castleKingSide : castleQueenSide;
	castleable = castleable and (i == 4 && j == 7*!white); //ensure on the right square
	
	//Exit
	if (!castleable || board.kingInCheck) return false;
	
	var dir = (kingside) ? 1 : -1;
	var dis = (kingside) ? 2 : 3;
	
	//
	//Ensure there is a gap
	for (var ioff = 1; ioff <= dis; ioff++) {
		
		if (piece_exists_at(board, i + dir*ioff, j))
			return false;
			
	}
	
	//
	// Add 
	var square = i+dir*2 + j*8;
	ds_list_add(list, square);
}