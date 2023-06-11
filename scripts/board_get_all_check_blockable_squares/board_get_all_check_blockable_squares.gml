// @desc
//
//
//
function board_get_all_check_blockable_squares(board, mapToStore) {

	//Clear
	ds_map_clear(mapToStore);

	//white just moved (but we haven't updated var yet), 
	//so we find the black king positoin to get the blockign squares
	var enemyKingSquare = (board.whiteToMove) ? board.blackKingSquare : board.whiteKingSquare;
	var kingI = enemyKingSquare mod 8;
	var kingJ = enemyKingSquare div 8;

	//Loop Over Checkers
	var checkers = ds_list_size(board.piecesCheckingKing);
	
	// If you do a double check, you HAVE to move the king, in every instance.
	if (checkers != 1) {
		return;	
	}
	

	var square = board.piecesCheckingKing[| 0];
		
	//Get
	var pieceI = square mod 8;
	var pieceJ = square div 8;
		
	//Dir
	var dirI = sign(pieceI - kingI);
	var dirJ = sign(pieceJ - kingJ);
		
	var disI = abs(pieceI - kingI);
	var disJ = abs(pieceJ - kingJ);
	var dis = max(disI, disJ); // Either disi and disj will be equal (bishop)
								// or one will be zero (rook)
		
	//Add Until We Match
	var storeBlockingSquareI = pieceI;
	var storeBlockingSquareJ = pieceJ;
		
	//Taking Piece is a check blocking square as well!
	//Taking own king is not.
	for (var r = 0; r < dis; r++) {
				
		var blockI = (pieceI-r*dirI);
		var blockJ = (pieceJ-r*dirJ);
				
		var blockSquare = blockI + blockJ*8;
		mapToStore[? blockSquare] = true;
				
	}
	
	return;
}