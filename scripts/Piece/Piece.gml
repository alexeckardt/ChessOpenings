// @desc
//
//
//
function Piece(myBoard, _white, _i, _j) constructor {
	
	white = _white;
	board = myBoard;
	
	file = _i; // i pos, the letter
	rank = _j; // j pos, the number
	startingfile = _i;
	startingrank = _j;
	
	//Get
	mySprite = (white) ? sPiecesWhite : sPiecesBlack;
	type = piece.pawn; //override
	
	drawx = 0; //animates
	drawy = 0;
	nooffsetDrawY = 0; // for shadow position
	
	moveCounter = 0;
	
	hoverAnimationCooldown = -1;
	
	drawHSpeed = 0; //for place animation
	drawVSpeed = 0; //for place animation
	
	checkBlend = 0;
	isChecker = false;
	//
	//
	//
	static move = function (j, i) {
		//override
		globalMove(j, i);
	};
	
	static globalMove = function(j, i) {


		// Move Counter update in make / undo

		//Push
		file = i;
		rank = j;
		board.enpassantSquare = -1; //Set in pawn's move
		
	}
	
	//
	// override
	//
	static get_legal_moves = function(list_to_override, includeDefendingSquares) {
		
		ds_list_clear(list_to_override);
		
	}
	
	static explode = function(board) {
			
		//Loop
		var h = 0;
		var spr = sPiecesBlack
		for (var j = 0; j < sprite_get_height(spr); j += h) {
			
			//Decide Height
			h = irandom_range(2, 4);
			var w = 0;
			
			//Loop over Width
			for (var i = 0; i < sprite_get_width(spr); i += w) {
				
				//Create the Particle
				var offi = choose(-1, 0, 0, 1);
				var offj = choose(-1, 0, 0, 1);
				var w = irandom_range(2, 4);
				
				//Create
				piece_explosion_part_create(board, type, white, drawx, drawy, i+offi, j+offj, w, h);
				
			}
		}
			
	}
}