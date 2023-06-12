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
			board_make_move(board, move);
	
			//
			//Check fro Game over
			//
			thinkingTimeLeft = random_range(minThinkingTime, maxThinkingTime);
		
		}
		
	}
}