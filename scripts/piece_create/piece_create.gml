// @desc
//
//
//
function piece_create(board, white, type, squareid) {

	//
	// TODO: Switch
	var p;
	
	// To make the grid look like the board
	var file = squareid mod 8;
	var rank = squareid div 8;
	
	switch (type) {
		default:
		case piece.pawn:
			p = new Pawn(board, white, file, rank);break;
			
		case piece.knight:
			p = new Knight(board, white, file, rank);break;
			
		case piece.bishop:
			p = new Bishop(board, white, file, rank);break;
			
		case piece.rook:
			p = new Rook(board, white, file, rank);
			p.kingside = (file == 7);
			break;
			
		case piece.queen:
			p = new Queen(board, white, file, rank);break;
			
		case piece.king:
			p = new King(board, white, file, rank);break;
	}
	
	// Place
	board.board[# rank, file] = p;
	
	//Add Reference
	ds_list_add(board.piecesReference, squareid);
	
	p.drawx = file*board.squareWidth;
	p.drawy = rank*board.squareWidth;
	
	return p;
}