// @desc
//
//
//
function agent_make_move(agentMoveStruct, board) {

	//Get Piece
	var p = piece_get_from_square(board, agentMoveStruct.from);
	
	//
	peice_move_to_square(p, board, agentMoveStruct.to);
}