// @desc
//
//
//
function board_piece_is_pinned(boardArray, threatMap, sourceSquare, targetSquare) {

	//
	var onThreat = ds_map_exists(threatMap, sourceSquare);
	if (!onThreat) return false;
	
	//Get
	var kingSquare = boardArray[board_other_squares.king_position];
	var directionToKing = board_square_get_offset_to_other_square(sourceSquare, kingSquare);
	
	// Check if In a line with a king
	if (directionToKing == 0) return false;
	

	//Get The Attacking Squares of Me and see if any are also in line with king
	var squareThreatening = threatMap[? sourceSquare];
	while (squareThreatening != -1) {
	
		//Get Square
		var theThreatSquare = squareThreatening mod 64;
		if (squareThreatening < 64) {
			squareThreatening = -1;//last check
		} else {
			//Get next square
			squareThreatening = squareThreatening div 64;	
		}
				
		//
		// Get Direction
		var attackerDirection = board_square_get_offset_to_other_square(theThreatSquare, sourceSquare);
		if (attackerDirection == directionToKing) {
			
			// Okay, Peice is Pinned. Is the move stay within the pin?
			
			//Ensure No Piece Behind Me
			var sqrr = sourceSquare;
			while( sqrr != kingSquare) {
				sqrr += attackerDirection;
				if (boardArray[sqrr] != piece.none) {
					return false; // Not Pinned
				}
			}
			
			
			var moveDir = board_square_get_offset_to_other_square(sourceSquare, targetSquare);
			if (abs(moveDir) == abs(attackerDirection)) {
				return false; // then the MOVE is not pinned.
			}
			
			return true;	
		}
	}
	
	//None of the attackers would Xray the king
	return false;
	
}