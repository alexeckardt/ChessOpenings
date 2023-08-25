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
	if (drawBoardThreats || keyboard_check(vk_alt)) {
		

		if (ds_map_exists(threatMap, sqrr)) {
			
			var source = threatMap[? sqrr];
			var sat = 255;
			var seed = ((source * 124) % 360) / 360;
			if (source > 64) sat = 0; //white if double protected
			
			var sourceCol = make_color_hsv(seed*255, sat, 255);
			
			col = merge_color(col, sourceCol, 0.6);
		}
		if (ds_map_exists(restrictedMoves, sqrr)) {
			col = merge_color(col, c_black, 0.75);
		}
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
// Draw Peices
//
var h = ds_grid_height(depthGrid);
for (var ob = 0; ob < h; ob++) {

	var sqrr = depthGrid[# 0, ob];
	
	if (sqrr < 0) {
	
		// Negative Id means it is a particle
		var partId = -(sqrr + 1);
		var partData = particles[| partId];
		
		if (partData == undefined) continue;
		
		partData.draw(	boardX + boardShakeX + pieceOnBoardOffsetX,
						boardY + boardShakeY + pieceOnBoardOffsetY, 
						squareWidth);
		continue;
	
	} 
	
	// Draw Peice (not particle)
	var p = board[sqrr];

	// Unknown
	if (p == piece.none) continue;
	
	// Decide Row and Col
	var square = (flippedBoard) ? 63 - sqrr : sqrr;
	var row = square div boardWidth;
	var col = square - row*8;
	
	// Replace When Drawing Animation
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


if (drawDebug) {
	draw_set_font(fontDebug);
	
	for (var i = 64; i < 71; i++) {	
		draw_text(10, 10 + 16*(i-64), board[i]);	
	}
	
	draw_text(30, 80, (mouse_y - boardY) / squareWidth);
	
	//
	// Draw of Source Threats
	//
	
	
	draw_set_font(fontBoard);
	for (var sqrr = 0; sqrr < 64; sqrr++) {
		
		var square = (flippedBoard) ? 63 - sqrr : sqrr;
	
		// i and j
		var i = square mod boardWidth;
		var j = square div boardWidth;

		// Position
		var xx = boardX + i*squareWidth + boardShakeX;
		var yy = boardY + j*squareWidth + boardShakeY;
		
		
		if (drawBoardThreats || keyboard_check(vk_alt)) {
			if (ds_map_exists(threatMap, sqrr)) {
				var source = threatMap[? sqrr];
				
				if (source < 64) {
					draw_text_color(xx+4, yy+2, source, c_red, c_red, c_red, c_red, 1);
				}
			}
		}	
	}
	
}

