// @desc
//
//
//
function peice_add_legal_move_check(list, i, j) {
	
	//Dont go Out of bounds
	if !(i >= 0 && i < 8 && j >= 0 && j < 8)
		return false;
		
	var square = i + j*8;
	
	if (square >= 0 && square < 64) {
	
		ds_list_add(list, square);	
	}
}