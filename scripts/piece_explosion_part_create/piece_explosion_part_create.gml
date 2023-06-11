// @desc
//
//
//
function piece_explosion_part_create(board, type, isWhite, pX, pY, sprX, sprY, sprW, sprH) {

	var struct = new PieceFragment(type, isWhite, pX, pY, sprX, sprY, sprW, sprH);
	ds_list_add(board.particles, struct);


}