/// @description 

// Board Square
draw_set_font(fontBoard);
for (var sqrr = 0; sqrr < boardWidth*boardWidth; sqrr++) {
	
	var square = (flippedBoard) ? 63 - sqrr : sqrr;
	
	// i and j
	var i = square mod boardWidth;
	var j = square div boardWidth;
	
	//Decide Colour
	var lightSquare = (i%2 == (j+flippedBoard)%2);
	var col = (lightSquare) ? lightSquareTop : darkSquareTop;
	var cOp = (!lightSquare) ? lightSquareTop : darkSquareTop;
	var shadowCol = (lightSquare) ? darkSquareTop : lightSquareEdge;
	
	// Position
	var xx = boardX + i*squareWidth + boardShakeX;
	var yy = boardY + j*squareWidth + boardShakeY;
	
	//Draw If Threat Square
	if (ds_map_exists(threatMap, sqrr)) {
		col = merge_color(col, c_red, 0.25);
	}
	if (ds_map_exists(restrictedMoves, sqrr)) {
		col = merge_color(col, c_green, 0.5);
	}
	
	// Draw Board
	draw_sprite_ext(sBoardSquare, 0, xx, yy, 1, 1, 0, col, 1);
	
	// Draw Little Charachter Ontop
	if (!drawDebug) {
		var char = board_square_choose_char(i, j);
		draw_text_color(xx, yy-2, char, cOp, cOp, cOp, cOp, 0.5);
	} else {
		// Or draw the square number
		draw_text_color(xx, yy-2, sqrr, cOp, cOp, cOp, cOp, 0.5);
	}

	//Draw If Legal Move
	if (ds_map_exists(pickedUpPieceLegalMoves, sqrr)) {
		var frame = (board[sqrr] != piece.none);
		draw_sprite_ext(sBoardValidMove, frame, xx, yy, 1, 1, 0, shadowCol, true);
	}
	
	//Bottom, Draw Board Edge
	if (j == 7) {
		col = (lightSquare) ? lightSquareEdge : darkSquareEdge;
		draw_sprite_ext(sBoardSquare, 1, xx, yy, 1, 1, 0, col, 1);	
	}
}

//
// Draw Peices (Temp)
//
for (var sqrr = 0; sqrr < boardWidth*boardWidth; sqrr++) {
	
	var p = board[sqrr];
	
	//Exit If No Peice
	if (p == piece.none)
		continue;

	// Decide
	var row = sqrr div boardWidth;
	var col = sqrr - row*8;
	
	// Replace When Drawing
	if (ds_map_exists(animations, sqrr)) {
		col = animations[? sqrr].drawY;	
		row = animations[? sqrr].drawX;	
	}
	
	// Position
	var xx = boardX + (col)*squareWidth + boardShakeX + pieceOnBoardOffsetX;
	var yy = boardY + (row)*squareWidth + boardShakeY + pieceOnBoardOffsetY;

	// Pickup
	if (pickedUpSquare == sqrr) {
		xx = mouse_x;
		yy = mouse_y;			
	}

	//
	var frame = piece_get_type(p);
	var spr = (piece_get_color(p)) ? whitePiecesSprite : blackPiecesSprite;
	
	//Draw
	draw_sprite(spr, frame, xx, yy);

}

//
//
// Draw the particles
//
//
var s = ds_list_size(particles);
for (var parts = 0; parts < s; parts++) {
	
	//Get Info
	var partData = particles[| parts];
	partData.draw(boardX, boardY);
	
}


if (drawDebug) {
	draw_set_font(fontDebug);
	
	for (var i = 64; i < 71; i++) {	
		draw_text(10, 10 + 16*(i-64), board[i]);	
	}
}