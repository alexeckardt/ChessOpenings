// @desc
//
//
//
function cardinal_get_incr_x(dir) {

	if (dir & 1 == 0) return 0;
	if (dir == cardinal.east) return -1;
	return 1;
	
}