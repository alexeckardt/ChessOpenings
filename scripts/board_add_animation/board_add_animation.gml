// @desc
//
//
//
function board_add_animation(board, square, squareCameFrom) {

	var map = board.animations;

	//Create
	var animationData = new AnimationData(squareCameFrom, square);

	//Add
	ds_map_add(map, square, animationData);
}