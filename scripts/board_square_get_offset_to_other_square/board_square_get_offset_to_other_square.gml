// @desc
//
//
//
function board_square_get_offset_to_other_square(source, dest) {

	if (dest == -1) return 0;

	var jSource = source div 8
	var iSource = source - jSource*8;
	
	var jDest = dest div 8
	var iDest = dest - jDest*8;

	var iDiff = (iDest - iSource);
	var jDiff = (jDest - jSource);

	var diagonal = abs(iDiff) == abs(jDiff);


	//
	// Difference by Rank (Travel across a file)
	//
	if (iDest == iSource) {
		return sign(jDiff)*8;	
	}
	
	//
	// Difference by Diagonal A
	//
	if (diagonal && sign(iDiff) == -sign(jDiff)) {
		return sign(iDiff)*-7;	
	}
	
	//
	// Difference by Diagonal B
	//
	if (diagonal && sign(iDiff) == sign(jDiff)) {
		return sign(iDiff)*-9;	
	}
	
	//
	// Difference by File (Travel across a file)
	//
	if (jDest = jSource) {
		return sign(iDiff);	
	}

	return 0; // No Direct Path

}