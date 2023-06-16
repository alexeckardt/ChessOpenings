/// @description 

//Create Board
window_set_fullscreen(true);
window_set_cursor(cr_none);

//Setup Board with FEN
defaultFEN = "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1";
test = "k1BB4/2K5/1QP5/8/8/8/8/7q w - - 0 10";
m1both = "nnpp4/nnpk4/nnp1p1Q1/nnP1P3/nnp1p3/n1P1P1q1/2PK4/2PP4 w - -";

myBoard = board_setup(defaultFEN);

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


openingTrieRootNode = game_generate_opening_trie();
currentTrieNode = openingTrieRootNode;
lastTrieNode = undefined;
followOpeningTrie = false;


game_set_gamemode(gamemode.openings_white);
game_set_player_control(board_white_to_play(myBoard));

