/// @description 

// C
var board = game.myBoard;
if (instance_exists(board)) {
	
	
	var myTurn = (!game.playerHasControl && board.whiteToMove == isWhite && !board.gameOver);

	if (myTurn) {
		
		thinkingTimeLeft--;
		if (thinkingTimeLeft < 0) {
			//Get All Possible Moves (Side Effect, movesList is populated).
			ds_list_clear(movesList);
			agent_get_all_possible_moves(board, movesList, isWhite);
	
			//Decide
			var s = ds_list_size(movesList);
			var moveMaking = irandom(s-1); // 
			var move = movesList[| moveMaking];
	
			// Move
			agent_make_move(move, board);
	
			//
			//Check fro Game over
			//
			board_check_for_gameover(board);
		
			thinkingTimeLeft = random_range(minThinkingTime, maxThinkingTime);
		
		}
		
	}
}