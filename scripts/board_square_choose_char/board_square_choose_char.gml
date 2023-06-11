// @desc
//
//
//
function board_square_choose_char(i, j) {

	if (!flippedBoard) {
		if (j == 7) 
			return chr(97 + i); // Letters
		if (i == 0) 
			return chr(56 - j); // Numbers, going "up" as J goes up
			
		return ""
	}
	
	if (j == 7)
		return chr(104 - i); // Letters
	if (i == 0)
		return chr(56 - j); // Numbers, going "up" as J goes up
			
	return ""
}