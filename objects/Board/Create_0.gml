/// @description 

exiting = false; //If i'm done, set by Game.

//
// Board Representation
//
board = array_create(71, piece.none); //64 squares, whiteToPlay, enpassantsquare, castlingRights(x4)
squaresUntilEdgeLUT = board_LUT_generate_directions_to_edge_grid();
boardSquareDiagonals = ds_grid_create(64, 2);
board_LUT_generate_diagonals(boardSquareDiagonals);

threatMap = ds_map_create();
restrictedMoves = ds_map_create();

animations = ds_map_create();

//
// Game State
//
movesStack = ds_stack_create();
turnNumber = 0;
whiteToMove = true;

kingInCheck = false;

//
// Game Over
//
gameOver = false;
stalemate = false;
whiteIsWinner = false;

gameOverTime = 0;
explodingCooldown = 0;
gameOverTimeNoParticles = 0;

//
// Drawing
//
drawDebug = true;
drawBoardThreats = false;

boardWidth = 8;
squareWidth = 18;

settingUp = true;

lightSquareTop = #f0d9b5;
darkSquareTop = #a9805d;

//For Bottom
lightSquareEdge = #6e4720;
darkSquareEdge = #4a2f14;

var off = (boardWidth div 2) * -squareWidth;
boardRestingX = room_width div 2 + off;
boardRestingY = room_height div 2 + off;

boardX = boardRestingX;
boardGoalY = boardRestingY;

boardY = room_height*2;
boardGoalYSpeed = 0;

pieceOnBoardOffsetX = 9;
pieceOnBoardOffsetY = 7;
pieceSnapSpeed = 0.35;

pickedUpSquare = -1;

boardShakeAmount = 0;
boardShakeX = 0;
boardShakeY = 0;

whitePiecesSprite = sPiecesWhite;
blackPiecesSprite = sPiecesBlack;

pickedUpPieceLegalMoves = ds_map_create();

// Particles
particles = ds_list_create();
piecesReference = ds_list_create();
generatedPiecesReference = false;

whitePieceCount = 0;
blackPieceCount = 0;

flippedBoard = false;
wasBoardJustFlipped = false;

//Drawing Depth
depthGrid = ds_grid_create(2, 64);
pieceDepthOffset = -0.5 / squareWidth;

lastMove = -1;

//
// Selection
mouseSquareIndexX = 0;
mouseSquareIndexY = 0;

startupMoves = undefined;
startupMoveSepTime = 1;
startupMoveTimeLeft = startupMoveSepTime;
