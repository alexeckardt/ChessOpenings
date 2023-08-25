/// @description 

//Create Board
window_set_fullscreen(true);
window_set_cursor(cr_none);

//Setup Board with FEN
defaultFEN = "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1";
test = "r3k2r/ppp1bppp/2nq3n/3ppb2/2PPPB2/2N2Q1N/PP3PPP/R3K2R b KQkq -";
m1both = "nnpp4/nnpk4/nnp1p1Q1/nnP1P3/nnp1p3/n1P1P1q1/2PK4/2PP4 w - -";

startingMoves = "3364,796,4013,82,3938,346,3169,1697,3242,2138,3299,1827,3902,723,2723,1681,2267,1176,2217,1577,3113,405,2332,1244,2908,219,3803,1371,3964,262,1803,139,3756,1132,3436,4,2852,1745,3690,722,2332,276,3608,528,4021,1099,2715,1179,1563,721,1752,853,2657,1372,3438,324,2982,1122,1562,2195,1674,268,666,397,3901,1301,3925,853,2463,918,";


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

gameModeOpening = false;
game_set_gamemode(gamemode.openings_white);
game_set_player_control(board_white_to_play(myBoard));

//
//
//

finishStreak = false;
wonStreak = false;
finishStreakTime = room_speed;
finishStreakTimeLeft = finishStreakTime;
