// @desc
//
//
//
function cardinal_get_incr_y(dir) {

	if (dir & 1 == 1) return 0;
	if (dir == cardinal.north) return -8;
	return 8;

}