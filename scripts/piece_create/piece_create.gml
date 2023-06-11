// @desc
//
//
//
function piece_create(board, white, type, rank, file) {

	//
	// TODO: Switch
	var p;
	
	// To make the grid look like the board
	var row = 7 - rank;
	var col = file;
	
	switch (type) {
		default:
		case piece.pawn:
			p = new Pawn(board, white, file, row);break;
			
		case piece.knight:
			p = new Knight(board, white, file, row);break;
			
		case piece.bishop:
			p = new Bishop(board, white, file, row);break;
			
		case piece.rook:
			p = new Rook(board, white, file, row);
			p.kingside = (col == 7);
			break;
			
		case piece.queen:
			p = new Queen(board, white, file, row);break;
			
		case piece.king:
			p = new King(board, white, file, row);break;
	}
	
	// Place
	board.board[# row, col] = p;
	return p;
}