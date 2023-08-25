/// @description 

//Create Board
window_set_fullscreen(true);
window_set_cursor(cr_none);

//Setup Board with FEN
defaultFEN = "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1";
test = "r3k2r/ppp1bppp/2nq3n/3ppb2/2PPPB2/2N2Q1N/PP3PPP/R3K2R b KQkq -";
m1both = "nnpp4/nnpk4/nnp1p1Q1/nnP1P3/nnp1p3/n1P1P1q1/2PK4/2PP4 w - -";

startingMoves = "";
myBoard = board_setup(defaultFEN, startingMoves);

gameMode = gamemode.free_play;
agentWhite = noone;
agentBlack = noone;

//
playerHasControl = true;

//
//Background
bkgOff = 0;
bkgSpeed = 0.1;
backgroundSprite = sBackgroundLines;
backgroundMix = 1;

backgroundRedBlend = 0;
backgroundGameOverAlpha = 0;
maxGameOverAlpha = 0.7;
winnerCol = c_black;

winnerColBlack = #060812;
winnerColWhite = #bfab94;
winnerColStale = c_black;

winnerColComplete = #4bb952;
winnerColFail = #731919;

openingTrieRootNode = game_generate_opening_trie();
currentTrieNode = openingTrieRootNode;
lastTrieNode = undefined;
followOpeningTrie = false;

finishStreak = false;

//
// Puzzle
//
gameModePuzzle = false;
puzzleList = game_create_puzzle_lines();
puzzleCount = ds_list_size(puzzleList);
currentPuzzle = undefined;
currentPuzzleSolution = undefined;


gameModeOpening = false;
game_set_gamemode(gamemode.puzzle_white);
game_set_player_control(board_white_to_play(myBoard));

//
//
//

finishStreak = false;
wonStreak = false;
finishStreakTime = room_speed;
finishStreakTimeLeft = finishStreakTime;
