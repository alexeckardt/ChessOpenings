/// @description 

//Create Board
window_set_fullscreen(true);
window_set_cursor(cr_none);

//Setup Board with FEN
defaultFEN = "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1";
test = "r4rk1/1pp1qppp/p1np1n2/2b1p1B1/2B1P1b1/P1NP1N2/1PP1QPPP/R4RK1 w - - 0 10";

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