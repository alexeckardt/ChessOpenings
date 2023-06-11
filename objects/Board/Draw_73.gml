/// @description 

// Board Square
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
	
	//Bottom, Draw Board Edge
	if (j == 7) {
		col = (lightSquare) ? lightSquareEdge : darkSquareEdge;
		draw_sprite_ext(sBoardSquare, 1, xx, yy, 1, 1, 0, col, 1);	
	}
	
	//
	// Is a valid move? / highlight squares
	//
	if (pickedUpPiece != emptyPiece) {
		var pickedPieceOrigin = (i == pickedUpPiece.file && j == pickedUpPiece.rank)
		if (ds_list_find_index(validSquaresToMoveTo, sqrr) != -1 || pickedPieceOrigin) {
			
			// Highlight Square
			var highlightSquare = (mouseSquareIndexX == i && mouseSquareIndexY == j)
			if (highlightSquare) {
				gpu_set_blendmode(bm_add);
				gpu_set_fog(1, c_white, 0, 0);
				draw_sprite_ext(sBoardSquare, 0, xx, yy, 1, 1, 0, col, 0.2);
				gpu_set_fog(0, 0, 0, 0);
				gpu_set_blendmode(bm_normal);
			}
			
			var index = piece_exists_at(id, i, j) || pickedPieceOrigin;
			draw_sprite_ext(sBoardValidMove, index, xx, yy, 1, 1, 0, shadowCol, 1);	
		
		}
	}
}

//
// Draw Peices
//

var s = ds_grid_height(depthGrid);
for (var pieceDraworder = 0; pieceDraworder < s; pieceDraworder++) {
	
	//Get Info
	var pieceAtSquare = depthGrid[# 0, pieceDraworder];
	if (pieceAtSquare == emptyPiece) continue;
	
	var p = piece_get_from_square(id, pieceAtSquare);
	
	if (p != -4 && pieceAtSquare != -1) {
		
		var i = pieceAtSquare mod 8;
		var j = pieceAtSquare div 8;
		var lightSquare = (i%2 == (j+flippedBoard)%2);
		var shadowCol = (lightSquare) ? darkSquareTop : lightSquareEdge;
		
		//
		draw_sprite_ext(sPieceShadow, 0, p.drawx + boardShakeX, p.nooffsetDrawY+boardShakeY, 1, 1, 0, shadowCol, 1);
	}
	
	//Draw
	var pCol = merge_colour(c_white, c_red, p.checkBlend*0.4);
	draw_sprite_ext(p.mySprite, p.type, p.drawx + boardShakeX, p.drawy + boardShakeY, 1, 1, 0, pCol, 1);
}

if (drawDebug) {
	draw_set_font(fontDebug);
	draw_text(10, 10, mouseSquareIndexX);
	draw_text(20, 10, mouseSquareIndexY);
}