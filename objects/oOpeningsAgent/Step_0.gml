/// @description 
/// @description 

// C
var board = game.myBoard;
if (instance_exists(board)) {
	
	var w2p = board_white_to_play(board);
	var myTurn = (!game.playerHasControl && w2p == isWhite && !board.gameOver && !board.exiting);

	if (myTurn) {
		
		thinkingTimeLeft--;
		if (thinkingTimeLeft < 0) {
			//Get All Possible Moves (Side Effect, myMovesList is populated).
			
			var trie = game.currentTrieNode;
			var moveToMake = trienode_choose_random_child(trie);
			
			// Get Move
			if (moveToMake != undefined) {
				// Move
				board_make_move(board, moveToMake, true);
			}
			
			thinkingTimeLeft = random_range(minThinkingTime, maxThinkingTime);
		}
		
	}
}