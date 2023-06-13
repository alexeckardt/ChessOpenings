// @desc
//
//
//
function board_generate_directions_to_edge_grid() {

	var grid = ds_grid_create(64, 4);

	for (var rank = 0; rank < 8; rank++) {
		for (var file = 0; file < 8; file++) {

			var s = file + rank * 8;
			grid[# s, cardinal.north] = 7 - rank; // North
			grid[# s, cardinal.south] = rank; // South
			
			grid[# s, cardinal.east] = 7 - file; // East
			grid[# s, cardinal.west] = rank; // west
		
		}
	}

	return grid;

}