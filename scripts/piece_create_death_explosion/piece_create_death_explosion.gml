// @desc
//
//
//
function piece_create_death_explosion(board, square){

	var p = board.board[square];
	
	var file = square mod boardWidth;
	var rank = square div boardWidth;
	
	//Loop
	var h = 0;
	var spr = sPiecesBlack; // not real yet
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
			piece_explosion_part_create(board, 
				piece_get_type(p), piece_get_color(p), 
				file, rank, i+offi, j+offj, w, h);
				
		}
	}

}