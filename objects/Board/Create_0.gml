/// @description 


//
boardWidth = 8;
squareWidth = 18;

lightSquareTop = #f0d9b5;
darkSquareTop = #a9805d;

//For Bottom
lightSquareEdge = #6e4720;
darkSquareEdge = #4a2f14;

flippedBoard = false;
wasBoardJustFlipped = false;

var off = (boardWidth div 2) * -squareWidth;
boardX = room_width div 2 + off;
boardY = room_height div 2 + off;

pieceOnBoardOffsetX = 9;
pieceOnBoardOffsetY = 7;
pieceSnapSpeed = 0.2;

emptyPiece = noone;
pickedUpPiece = emptyPiece;
selectedPeiceYOffset = -10;
hoverAnimationCooldownOnDrop = 60;

boardShakeAmount = 0;
boardShakeX = 0;
boardShakeY = 0;

//
//
mouseSquareIndexX = 0;
mouseSquareIndexY = 0;

// Particles
particles = ds_list_create();


//
//
board = ds_grid_create(boardWidth, boardWidth);
ds_grid_clear(board, emptyPiece);

depthGrid = ds_grid_create(2, 64);

validSquaresToMoveTo = ds_list_create();

gameOverTime = 0;
explodingCooldown = 0;

// the attacksquares dictonary
attackedSquares = ds_map_create();
piecesCheckingKing = ds_list_create(); //Store
checkBlockingSquares = ds_map_create();

piecesReference = ds_list_create();

// Game State
whiteToMove = true;
blackCastleKingside = true;
blackCastleQueenside = true;
whiteCastleKingside = true;
whiteCastleQueenside = true;
enpassantsquare = -1;

whiteKingSquare = -1;
blackKingSquare = -1;

kingInCheck = false;

gameOver = false;
stalemate = false;
whiteIsWinner = false;


//Debug
drawDebug = true;