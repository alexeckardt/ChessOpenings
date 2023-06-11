/// @description 

//Create Board
window_set_fullscreen(true);
window_set_cursor(cr_none);

//Setup Board with FEN
defaultFEN = "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1";
test = "rnbqkbnr/pp2ppp1/2p4p/7Q/P3P3/BP2p3/2PP1PPP/RN2KBNR b KQkq -";

myBoard = board_setup(test);