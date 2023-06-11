// @desc
//
//
//
function board_check_for_gameover(b) {

	//Create
	var movesList = ds_list_create();
	
	//Check
	agent_get_all_possible_moves(b, movesList, b.whiteToMove);
	var possiblemoves = ds_list_size(movesList);
	
	var insufficentMaterial = board_is_material_insufficient(b);
	
	//NO MOVES TO MAKE ... Winner?
	if (possiblemoves == 0 || insufficentMaterial) {
		
		//Game over, player can't make moves
		b.gameOver = true;
		b.stalemate = !b.kingInCheck || insufficentMaterial;
		
		b.whiteIsWinner = !b.whiteToMove; // if black can't make moves, white wins (assuming in check)
		
		//
		// Background Colour
		var g = Game.id;
		g.winnerCol = (b.whiteIsWinner) ? g.winnerColWhite : g.winnerColBlack;
		g.winnerCol = (b.stalemate) ? g.winnerColStale : g.winnerCol;
	}
	
	
	//End
	ds_list_destroy(movesList);

}