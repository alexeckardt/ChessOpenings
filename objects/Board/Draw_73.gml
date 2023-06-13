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
}

//
// Draw Peices
//


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
	draw_text(10, 10, turnNumber);
}