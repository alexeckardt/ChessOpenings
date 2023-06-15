/// @description 

ds_stack_destroy(movesStack);
ds_list_destroy(particles);

ds_grid_destroy(squaresUntilEdgeLUT);
ds_grid_destroy(boardSquareDiagonals);

ds_map_destroy(pickedUpPieceLegalMoves);
ds_map_destroy(threatMap);
ds_map_destroy(restrictedMoves);
ds_map_destroy(animations);

ds_list_destroy(piecesReference);