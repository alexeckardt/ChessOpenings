// @desc
//
//
//
function board_square_get_offset_to_other_square(source, dest) {

	if (dest == -1) return 0;

	//
	var difference = dest - source;
	
	//
	// Difference by File (Travel across a file)
	//
	if (abs(difference) < 8) {
		return sign(difference);	
	}
	
	//
	// Difference by Rank (Travel across a file)
	//
	if (abs(difference) mod 8 == 0) {
		return sign(difference)*8;	
	}
	
	//
	// Difference by Rank (Travel across a file)
	//
	if (abs(difference) mod 7 == 0) {
		return sign(difference)*7;	
	}
	
	//
	// Difference by Rank (Travel across a file)
	//
	if (abs(difference) mod 9 == 0) {
		return sign(difference)*9;	
	}

	return 0; // No Direct Path

}