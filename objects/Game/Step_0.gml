/// @description 

var b = myBoard;

//Toggle Fullscreen
if (keyboard_check_pressed(vk_f11)) {
	var f = window_get_fullscreen();
	window_set_fullscreen(!f);
}

if (keyboard_check_pressed(ord("R"))) {
	
	instance_destroy(myBoard);
	myBoard = board_setup(defaultFEN);	
	b = myBoard;
	
	myBoard.boardGoalY = myBoard.boardRestingY;
	currentTrieNode = openingTrieRootNode;
	lastTrieNode = undefined;
}

if (keyboard_check_pressed(ord("C"))) {
	defaultFEN = board_create_fen(b);
}

//Background
bkgOff = (bkgOff + bkgSpeed) % sprite_get_width(backgroundSprite);

if (instance_exists(b)) {
	var w2m = board_white_to_play(b);
	backgroundMix = lerp(backgroundMix, w2m, 0.1);
	backgroundRedBlend = lerp(backgroundRedBlend, b.kingInCheck*0.4*!b.gameOver, 0.1);
	
	//Don't Fade out here
	if (gameModeOpening || gameModePuzzle)
		backgroundGameOverAlpha = lerp(backgroundGameOverAlpha, b.gameOver*maxGameOverAlpha, 0.1);
}

// 
if (finishStreak) {
	
	if (instance_exists(myBoard)) {
		if (!myBoard.exiting) {
		
			//Background
			b.gameOver = true;
			winnerCol = (wonStreak) ? winnerColComplete : winnerColFail;
	
			//Timer
			finishStreakTimeLeft--;
			if (finishStreakTimeLeft < 0) {
		
				if (gameModePuzzle == false || wonStreak) {
					finishStreakTimeLeft = finishStreakTime;
					myBoard.exiting = true;
				}
			}
		} 
	} else {
		
		//Reset Board
		myBoard = board_setup(defaultFEN);	
		b = myBoard;
	
		myBoard.boardGoalY = myBoard.boardRestingY;
		currentTrieNode = openingTrieRootNode;
		lastTrieNode = undefined;
			
		finishStreak = false;
		wonStreak = false;
		
		// Reset
		if (gameModePuzzle) {
			game_setup_puzzle();	
		}

	}
}

if (gameModePuzzle && currentPuzzle == undefined) {
	game_setup_puzzle();
}