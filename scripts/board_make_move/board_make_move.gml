// @desc
//
//
//
function board_make_move(board, agentMove) {
	
	//Get Piece
	var p = piece_get_from_square(board, agentMove.from);
	if (pickedUpPiece != -1)
		p = pickedUpPiece;
	
	//store for undos
	var pTaking = piece_get_from_square(board, agentMove.to);
	if (pTaking != -4) {
		agentMove.pieceTakeType= pTaking.type;
		agentMove.pieceTakeColor= pTaking.white;
	}
	
	//Do it
	peice_move_to_square(p, board, agentMove.to);
	
	ds_stack_push(board.movesStack, agentMove);
	
	board_check_for_gameover(board);
}