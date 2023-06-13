// @desc
//
//
//
enum piece {
		
	none = -1,
	
	// Structure: XXXY
	// X is the peice (binary)
	// Y (ones bit) is the color
	// y=1 is white
	
	//When bitshifted
	//
	// pawn = 0
	// knight = 1
	// bishop
	// rook
	// queen
	// king = 6
	//
	
	black_pawn = 0, // 0000
	black_knight = 2, // 0010
	black_bishop = 4, // 0100
	black_rook = 6, // 0110
	black_queen = 8, // 1000
	black_king = 10, // 1010
	
	white_pawn = 1, // 0001
	white_knight = 3, // 0011
	white_bishop = 5, // 0101
	white_rook = 7, // 0111
	white_queen = 9, //1001
	white_king = 11, //1011
}