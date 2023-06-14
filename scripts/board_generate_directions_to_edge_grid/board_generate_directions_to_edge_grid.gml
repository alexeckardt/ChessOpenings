// @desc
//
//
//
function board_generate_directions_to_edge_grid() {

	var grid = ds_grid_create(64, 4);

	for (var rank = 0; rank < 8; rank++) {
		for (var file = 0; file < 8; file++) {

			var s = file + rank * 8;
			grid[# s, cardinal.north] = rank; // North
			grid[# s, cardinal.south] = 7-rank; // South
			
			grid[# s, cardinal.east] = file; // East
			grid[# s, cardinal.west] = 7-file; // west
		
		}
	}

	return grid;

}