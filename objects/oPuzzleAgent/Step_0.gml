/// @description 
/// @description 

// C
var board = game.myBoard;
if (instance_exists(board)) {
	
	var w2p = board_white_to_play(board);
	var myTurn = (!game.playerHasControl && w2p == isWhite && !game.finishStreak && !board.exiting && !board.settingUp);

	if (myTurn) {
		
		thinkingTimeLeft--;
		if (thinkingTimeLeft < 0) {
			//Get All Possible Moves (Side Effect, myMovesList is populated).
			
			//top of solutuion
			var moveToMake = game.currentPuzzleSolution.move;
			// Keep Track
			game.currentPuzzleSolution = move_string_get_next(game.currentPuzzleSolution);
			
			// Get Move
			if (moveToMake != undefined) {
				// Move
				board_make_move(board, moveToMake, true);
			}
			
			thinkingTimeLeft = random_range(minThinkingTime, maxThinkingTime);
		}
		
	}
}