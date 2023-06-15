// @desc
//
//
//
function MoveData(move, _capture, enpassantsquare, _promotion) constructor {

	moveMade = move;
	capture = _capture;
	enpassantSquare = enpassantsquare;
	promotion = _promotion;
	
	castleWhiteKingSideLost = false;
	castleWhiteQueenSideLost = false;
	castleBlackKingSideLost = false;
	castleBlackQueenSideLost = false;

}