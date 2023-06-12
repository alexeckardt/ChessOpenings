// @desc
//
//
//
function piece_add_legal_move_king_castle(board, list, i, j, kingside, white) {
	
	var castleSide = (kingside) ? 7 : 0;
	var rookCastleable = false;
	if (piece_exists_at_coloured(board, castleSide, j, white)) {
		var rookExits = (board.board[# j, castleSide].type == piece.rook); 	
		if (rookExits) {
			rookCastleable = board.board[# j, castleSide].moveCounter == 0;
		}
	}
	
	var castleable = moveCounter == 0 && rookCastleable;
	var startingSquare = (white) ? 60 : 4;
	castleable = castleable and (i +j*8 == startingSquare); //ensure on the right square
	
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