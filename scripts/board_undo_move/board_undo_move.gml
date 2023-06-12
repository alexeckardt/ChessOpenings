// @desc
//
//
//
function board_undo_move(board) {

	//Get Move
	var lastMove = ds_stack_pop(board.movesStack);
	board.turnNumber = ds_stack_size(board.movesStack);
	show_debug_message(board.turnNumber);
	
	//Error
	if (lastMove == undefined) {
		board.boardShakeAmount = 2;
		return;
	}

	//Undo the Move
	var p = piece_get_from_square(board, lastMove.to);
	peice_move_to_square(p, board, lastMove.from);
	p.moveCounter--;

	//Rebuild a piece if it exists
	if (lastMove.pieceTakeType != piece.none) {
		
		var newp = piece_create(board, lastMove.pieceTakeColor, lastMove.pieceTakeType, lastMove.to); 
		newp.moveCounter = lastMove.pMoveCounter;
	
	}
	
	//Reupdate State
	board.enpassantSquare = lastMove.enpassantSquare;

}