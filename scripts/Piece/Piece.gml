// @desc
//
//
//
function Piece(myBoard, _white, _i, _j) constructor {
	
	white = _white;
	board = myBoard;
	
	file = _i; // i pos, the letter
	rank = _j; // j pos, the number
	
	//Get
	mySprite = (white) ? sPiecesWhite : sPiecesBlack;
	type = piece.pawn; //override
	
	drawx = 0; //animates
	drawy = 0;
	nooffsetDrawY = 0; // for shadow position
	
	moved = false; //for pawns and castling
	
	hoverAnimationCooldown = -1;
	
	drawHSpeed = 0; //for place animation
	drawVSpeed = 0; //for place animation
	
	checkBlend = 0;
	isChecker = false;
	//
	//
	//
	static move = function (j, i) {
		if (!moved) {
			moved = (i != file || j != rank);
			board.enpassantsquare = -1;
		}
			
		file = i;
		rank = j;
		
	};
	
	//
	// override
	//
	static get_legal_moves = function(list_to_override, includeDefendingSquares) {
		
		ds_list_clear(list_to_override);
		
	}
}