// @desc
//
//
//
function piece_check_would_be_pinned(board, pieceI, pieceJ, white, allowedButStillPinnedList) {

	//Clear
	var myKingSquare = (white) ? board.whiteKingSquare : board.blackKingSquare;
	var kingI = myKingSquare mod 8;
	var kingJ = myKingSquare div 8;

	//Dir to King
	var dirI = sign(kingI - pieceI);
	var dirJ = sign(kingJ - pieceJ);
	
	//Distance To King
	var disI = abs(pieceI - kingI);
	var disJ = abs(pieceJ - kingJ);
	var dis = max(disI, disJ);

	//Force Square Diagonal OR Line
	if (disI != disJ && disI != -disJ && disI != 0 && disJ != 0) {
		return false; // Peice cannot be pinned by a B, R or Queen.
	}
	
	//
	//
	//
	
	// Check to see that no piece exists between me and my king
	for (var r = 0; r < dis; r++) {
				
		var blockI = (pieceI+r*dirI);
		var blockJ = (pieceJ+r*dirJ);
		
		var sqrr = blockI + blockJ*8;
		ds_list_add(allowedButStillPinnedList, sqrr);
		
		//
		//
		if (piece_exists_at(board, blockI, blockJ)) {
			ds_list_clear(allowedButStillPinnedList);
			return false; //We are not pinned then.	
		}		
	}
	
	// Flip Direction
	dirI = -dirI;
	dirJ = -dirJ;
	
	//
	// Determine Who would be pinning us
	//
	var couldPinMe = (dirI != 0 && dirJ != 0) ? piece.bishop : piece.rook; // queen is either, so we check later.
	
	
	//
	// Check to see that we are BEING pinned.
	//
	for (var r = 0; r < 8; r++) {
				
		var blockI = (pieceI+r*dirI);
		var blockJ = (pieceJ+r*dirJ);
		
		//Add Square
		var sqrr = blockI + blockJ*8;
		ds_list_add(allowedButStillPinnedList, sqrr);
		
		//
		//
		if (piece_exists_at(board, blockI, blockJ)) {
			var p = board.board[# blockJ, blockI];
			
			var peiceCanPinMe = (p.type == couldPinMe) || p.type == piece.queen;
			var isPinned = (p.white == !white) && (peiceCanPinMe);
			if (isPinned) {
				return true;	
			} else {
				ds_list_clear(allowedButStillPinnedList);
				return false;
			}
		}	
	}
	
	
	//
	//
	ds_list_clear(allowedButStillPinnedList);
	return false;
}