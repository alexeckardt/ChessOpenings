// @desc
//
//
//
function board_LUT_generate_diagonals(diagonalGrid) {

	for (var j = 0; j < 8; j++) {
		for (var i = 0; i < 8; i++) {
		
			var square = i + j*8;
			
			var positiveDiagonal = i - j;
			var negativeDiagonal = j - i;
			diagonalGrid[# square, 0] = positiveDiagonal;
			diagonalGrid[# square, 1] = negativeDiagonal;
			
		}
	}

}