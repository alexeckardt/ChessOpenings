// @desc
//
//
//
function board_LUT_generate_directions_to_edge_grid() {

	var grid = ds_grid_create(64, 4);

	for (var rank = 0; rank < 8; rank++) {
		for (var file = 0; file < 8; file++) {

			var s = file + rank * 8;
			
			grid[# s, cardinal.north] = rank; // Can Move In This Direction
			grid[# s, cardinal.south] = 7-rank; // Can Move In This Direction
			
			grid[# s, cardinal.east] = 7-file; // Can Move In This Direction
			grid[# s, cardinal.west] = file; // Can Move In This Direction
		
		}
	}

	return grid;

}