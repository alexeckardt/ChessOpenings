// @desc
//
//
//
function peice_move_to(pieceStruct, board, toCol, toRow) {

	//Get old pos
	var oldrank = pieceStruct.rank;
	var oldfile = pieceStruct.file;
	var oldsquare = oldfile + oldrank*8;
	
	var toSquare = toCol + toRow*8;
	
	//Draw little bounce
	var dirMoved = point_direction(oldfile, oldrank, toCol, toRow);
	var disMoved = min(3, point_distance(oldfile, oldrank, toCol, toRow) / 1.5);
			
	pieceStruct.drawHSpeed = lengthdir_x(disMoved, dirMoved);
	pieceStruct.drawVSpeed = lengthdir_y(disMoved, dirMoved) - 2;

	// DESTROY If some other peice exists there

	if (piece_exists_at(board, toCol, toRow)) {
		board.boardShakeX = random_range(2, 3)*choose(-1, 0, 1);
		board.boardShakeY = random_range(2, 3)*choose(-1, 0, 1);
		
		board.boardShakeAmount = 1;
		var theDestroyedPiece = board.board[# toRow, toCol];
		
		theDestroyedPiece.explode(board);
		
		//Remove the reference from this piece
		ds_list_delete(board.piecesReference, ds_list_find_index(board.piecesReference, toSquare));
	}

	//
	//
	
	//
	
	// Square References
	ds_list_delete(board.piecesReference, ds_list_find_index(board.piecesReference, oldsquare));
	ds_list_add(board.piecesReference, toSquare); //(Re)-add reference to new square

	
	// Update Position
	board.board[# toRow, toCol] = pieceStruct;
	board.board[# oldrank, oldfile] = board.emptyPiece; //for agent moving, pick up it already DNE
	pieceStruct.move(toRow, toCol); //corr

	//
	// Did move put king in check?
	//
	var map = board.attackedSquares;
	ds_map_clear(map);
			
	board_get_all_attacked_squares(board, map, board.whiteToMove);
	var kingSquareToCheck = (board.whiteToMove) ? board.blackKingSquare : board.whiteKingSquare;
	board.kingInCheck = ds_map_exists(map, kingSquareToCheck);
			
	//
	// Figure Out All Squares I Need to block
	//
			
	// Go To Checkers
	board_get_all_check_blockable_squares(board, board.checkBlockingSquares);
			
	//Update Draw Square
	piece_depth_change_square(board, oldrank, oldfile, toRow, toCol);
	piece_depth_change_square_from_pickedup(board, toRow, toCol);
	
	//
	ds_list_clear(board.validSquaresToMoveTo);
		
	
	//
	// Finish Move
	//
			
	//
	board.whiteToMove = !board.whiteToMove;
	game_set_player_control(board.whiteToMove);

}