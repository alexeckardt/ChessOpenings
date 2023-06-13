// @desc
//
//
//
function piece_get_color(p) {
	return p & 1; // get the AND result of the p id and the number 1.
	
		//If XXX0 & 1 is 0, thus, this piece is black.
		//If XXX1 & 1 is 1, piece is white.
}