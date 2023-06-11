// @desc
//
//
//
function peice_move_to(pieceStruct, board, toCol, toRow) {

	//Get old pos
	var oldrank = pieceStruct.rank;
	var oldfile = pieceStruct.file;
	
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
	}

	//
	//
	
	// Update Position
	board.board[# toRow, toCol] = pieceStruct;
	pieceStruct.move(toRow, toCol); //corr

}