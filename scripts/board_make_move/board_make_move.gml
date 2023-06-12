// @desc
//
//
//
function board_make_move(board, agentMove, simulated = false) {
	
	//Get Piece
	var p = piece_get_from_square(board, agentMove.from);
	if (pickedUpPiece != board.emptyPiece)
		p = pickedUpPiece;

	
	//store for undos
	var pTaking = piece_get_from_square(board, agentMove.to);
	if (pTaking != -4) {
		agentMove.pieceTakeType = pTaking.type;
		agentMove.pieceTakeColor= pTaking.white;
		agentMove.pMoveCounter = pTaking.moveCounter;
	}
	//Board Data
	agentMove.enpassantSquare = board.enpassantSquare;
	
	
	//Do it
	peice_move_to_square(p, board, agentMove.to, simulated);
	p.moveCounter++;
	
	ds_stack_push(board.movesStack, agentMove);
	board.turnNumber = ds_stack_size(board.movesStack);
	
	board_check_for_gameover(board);
}