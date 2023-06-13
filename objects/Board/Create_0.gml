/// @description 


//
// Board Representation
//
board = array_create(70, piece.none); //64 squares, whiteToPlay, enpassantsquare, castlingRights(x4)

whiteToPlaySquare = 64;
enpassantSquarePos = 65;
whiteCastleKingPos = 66;
whiteCastleQueenPos = 67;
blackCastleKingPos = 68;
blackCastleQueenPos = 69;

//
// Game State
//
movesStack = ds_stack_create();
turnNumber = 0;
whiteToMove = true;
whiteKingSquare = -1;
blackKingSquare = -1;

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

boardWidth = 8;
squareWidth = 18;

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

boardY = boardRestingY;//room_height*2;
boardGoalYSpeed = 0;

pieceOnBoardOffsetX = 9;
pieceOnBoardOffsetY = 7;
pieceSnapSpeed = 0.2;

emptyPiece = noone;
pickedUpPiece = emptyPiece;
selectedPeiceYOffset = -10;

boardShakeAmount = 0;
boardShakeX = 0;
boardShakeY = 0;

// Particles
particles = ds_list_create();

flippedBoard = false;
wasBoardJustFlipped = false;

//Drawing Depth
depthGrid = ds_grid_create(2, 64);

//
// Selection
mouseSquareIndexX = 0;
mouseSquareIndexY = 0;

