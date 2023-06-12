// @desc
//
//
//
function board_undo_move(board) {

	//Get Move
	var lastMove = ds_stack_pop(board.movesStack);

	//Undo the Move
	var p = piece_get_from_square(board, lastMove.to);
	peice_move_to_square(p, board, lastMove.from);

	//Rebuild a piece if it exists
	if (lastMove.pieceTakeType != piece.none) {


		var i = lastMove.to mod 8;
		var j = lastMove.to div 8;
		piece_create(board, lastMove.pieceTakeColor, lastMove.pieceTakeType, j, 7-i); //i have an inverter
	
		//Readd Reference
		ds_list_add(board.piecesReference, lastMove.to); //(Re)-add reference to new square
	
	}

}