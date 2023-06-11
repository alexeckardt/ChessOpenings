// @desc
//
//
//
function board_is_material_insufficient(board) {

	//
	var list = board.piecesReference;
	var c = ds_list_size(list);
	
	var map = ds_map_create();
	
	//Prepopulate
	map[? fen_notation.black_bishop] = 0;
	map[? fen_notation.black_king] = 0;
	map[? fen_notation.black_knight] = 0;
	map[? fen_notation.black_pawn] = 0;
	map[? fen_notation.black_queen] = 0;
	map[? fen_notation.black_rook] = 0;
	
	map[? fen_notation.white_bishop] = 0;
	map[? fen_notation.white_king] = 0;
	map[? fen_notation.white_knight] = 0;
	map[? fen_notation.white_pawn] = 0;
	map[? fen_notation.white_queen] = 0;
	map[? fen_notation.white_rook] = 0;
	
	
	for (var i = 0; i < c; i++) {
		
		var square = list[| i];
		var piecee = piece_get_from_square(board, square);
		var key = ord(piece_get_fen_symbol(piecee.type, piecee.white));
		
		//Increment
		map[? key] += 1;
	}

	// If higher peices exist, then no chance of insufficient
	if (map[? fen_notation.black_queen] != 0
	|| map[? fen_notation.black_rook] != 0
	|| map[? fen_notation.white_queen] != 0
	|| map[? fen_notation.white_rook] != 0)
		return false;

	//
	var blackOnlyKing = map[? fen_notation.black_pawn] == 0
						&& map[? fen_notation.black_bishop] == 0
						&& map[? fen_notation.black_knight] == 0
	var whiteOnlyKing = map[? fen_notation.white_pawn] == 0
						&& map[? fen_notation.white_bishop] == 0
						&& map[? fen_notation.white_knight] == 0

	//Exit
	if (blackOnlyKing && whiteOnlyKing) 
		return true;

	//
	//
	if (blackOnlyKing && map[? fen_notation.white_pawn] == 0) {
		
		var b = map[? fen_notation.white_bishop];
		var k = map[? fen_notation.white_knight];
		return b < 2 && k < 2 && (b == 1 || k == 1);
		
	}

	if (whiteOnlyKing && map[? fen_notation.black_pawn] == 0) {
		
		var b = map[? fen_notation.black_bishop];
		var k = map[? fen_notation.black_knight];
		return b < 2 && k < 2 && (b == 1 || k == 1);
		
	}

	// There is a pawn somewhere...
	return false;


}