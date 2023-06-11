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
	
	//NO MOVES TO MAKE ... Winner?
	if (possiblemoves == 0) {
		
		//Game over, player can't make moves
		b.gameOver = true;
		b.stalemate = !b.kingInCheck;
		
		b.whiteIsWinner = !b.whiteToMove; // if black can't make moves, white wins (assuming in check)
		
	}
	
	
	//End
	ds_list_destroy(movesList);

}