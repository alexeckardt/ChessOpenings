/// @description 

//Create Board
window_set_fullscreen(true);
window_set_cursor(cr_none);

//Setup Board with FEN
defaultFEN = "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1";
test = "rnbq1k1r/pp1Pbppp/2p5/8/2B5/8/PPP1NnPP/RKBQK2R w KQ - 1 8";

myBoard = board_setup(test);

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

game_set_gamemode(gamemode.free_play);
game_set_player_control(board_white_to_play(myBoard));