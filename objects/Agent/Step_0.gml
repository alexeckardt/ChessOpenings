/// @description 

// C
var board = game.myBoard;
if (instance_exists(board)) {
	
	
	var myTurn = (!game.playerHasControl && board.whiteToMove == isWhite && !board.gameOver);

	if (myTurn) {
		
		thinkingTimeLeft--;
		if (thinkingTimeLeft < 0) {
			//Get All Possible Moves (Side Effect, myMovesList is populated).
			ds_list_clear(myMovesList);
			//agent_get_all_possible_moves(board, myMovesList, isWhite);
	
			//Decide
			var s = ds_list_size(myMovesList);
			var moveMaking = irandom(s-1); // 
			var move = myMovesList[| moveMaking];
	
			// Move
			//board_make_move(board, move);
	
			//
			//Check fro Game over
			//
			thinkingTimeLeft = random_range(minThinkingTime, maxThinkingTime);
		
		}
		
	}
}