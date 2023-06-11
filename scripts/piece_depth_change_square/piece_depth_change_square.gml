// @desc
//
// Update. Used in other moves (castle, for isntance).
//
function piece_depth_change_square(board, fromj, fromi, toj, toi) {

	var from = fromi + fromj*8;
	var to = toi + toj*8;


	var grid = board.depthGrid;
	for (var i = 0; i < ds_grid_height(grid); i++) {
		if (grid[# 0, i] == from) {
			grid[# 0, i] = to;
			return;
		}
	}


}