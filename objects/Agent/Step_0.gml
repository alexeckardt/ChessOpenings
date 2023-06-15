/// @description 

// C
var board = game.myBoard;
if (instance_exists(board)) {
	
	
	var myTurn = (!game.playerHasControl && board_white_to_play(board) == isWhite && !board.gameOver);

	if (myTurn) {
		
		thinkingTimeLeft--;
		if (thinkingTimeLeft < 0) {
			//Get All Possible Moves (Side Effect, myMovesList is populated).
			
			var moves = board_generate_moves_as_dic(board);
	
			//Decide
			var s = ds_map_size(moves);
			var moveMaking = irandom(s-1); // 
			var move = ds_map_find_first(moves);
			
			repeat(moveMaking) {
				move = ds_map_find_next(moves, move); //Continue;	
			}
			
			// Move
			board_make_move(board, move);
	
			//
			//Check fro Game over
			//
			thinkingTimeLeft = random_range(minThinkingTime, maxThinkingTime);
		
		}
		
	}
}