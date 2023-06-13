/// @description 

ds_grid_destroy(board);
ds_grid_destroy(depthGrid);
ds_map_destroy(attackedSquares);
ds_list_destroy(validSquaresToMoveTo);
ds_list_destroy(piecesCheckingKing);
ds_list_destroy(particles);
ds_map_destroy(checkBlockingSquares);

ds_stack_destroy(movesStack);