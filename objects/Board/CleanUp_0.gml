/// @description 

ds_stack_destroy(movesStack);
ds_stack_destroy(captureStack);
ds_list_destroy(particles);

ds_grid_destroy(squaresUntilEdgeLUT);
ds_grid_destroy(boardSquareDiagonals);

ds_map_destroy(pickedUpPieceLegalMoves);