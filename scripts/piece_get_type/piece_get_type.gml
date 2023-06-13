// @desc
//
//
//
function piece_get_type(p) {
	if (p == piece.none) return -1;
	return p >> 0b1;
}