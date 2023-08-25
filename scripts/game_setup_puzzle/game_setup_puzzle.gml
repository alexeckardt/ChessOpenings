// @desc
//
//
//
function game_setup_puzzle() {

	var g = Game.id;
	
	if g.gameModePuzzle == false return;
	
	//
	// If We in a puzzle, don't memory leak
	if (currentPuzzleSolution != undefined) {
		delete currentPuzzleSolution;
	}

	//
	// Get
	//
	
	var puzzles = g.puzzleList;
	var pc = g.puzzleCount;
	randomize();
	var puzzleGrab = irandom(pc-1);
	g.currentPuzzle = puzzleGrab; //store
	
	var puzzleData = puzzles[| puzzleGrab];
	
	//
	// LOAD DATA
	if (puzzleData.whiteToMove) {
		game_set_gamemode(gamemode.puzzle_white);
	} else {
		game_set_gamemode(gamemode.puzzle_black);	
	}
	
	
	
	g.currentPuzzleSolution = move_string_generate(puzzleData.solution);
	
	// Reset Board
	board_setup(defaultFEN, puzzleData.boardSetupMoves);

}