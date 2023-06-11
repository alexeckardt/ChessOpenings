// @desc
//
//
//
function King(board, _white, _i, _j) : Piece(board, _white, _i, _j) constructor {
	
	//Set
	type = piece.king;
	
	// Override
	static get_legal_moves = function(list_to_override, includeDefendingSquares) {
		ds_list_clear(list_to_override);
		
		var i = file;
		var j = rank;
		var w = white;
		
		peice_add_legal_move_check_not_friendly_king(board, list_to_override, i-1, j-1, w, includeDefendingSquares);
		peice_add_legal_move_check_not_friendly_king(board, list_to_override, i-1, j, w, includeDefendingSquares);
		peice_add_legal_move_check_not_friendly_king(board, list_to_override, i-1, j+1, w, includeDefendingSquares);
		
		peice_add_legal_move_check_not_friendly_king(board, list_to_override, i, j-1, w, includeDefendingSquares);
		//moving 0,0 is not a valid move lol
		peice_add_legal_move_check_not_friendly_king(board, list_to_override, i, j+1, w, includeDefendingSquares);
		
		peice_add_legal_move_check_not_friendly_king(board, list_to_override, i+1, j-1, w, includeDefendingSquares);
		peice_add_legal_move_check_not_friendly_king(board, list_to_override, i+1, j, w, includeDefendingSquares);
		peice_add_legal_move_check_not_friendly_king(board, list_to_override, i+1, j+1, w, includeDefendingSquares);
		
		//
		// Castle
		piece_add_legal_move_king_castle(board, list_to_override, i, j, true);
		piece_add_legal_move_king_castle(board, list_to_override, i, j, false);
	}
	
	//
	// override
	static move = function(j, i) {
		
		if (!moved) {
			moved = (i != file || j != rank);
			board.enpassantsquare = -1;
			
			if (white) {
				board.whiteCastleKingside = false;
				board.whiteCastleQueenside = false;
			
			} else {
				board.blackCastleKingside = false;
				board.blackCastleQueenside = false;
				
			}
			
			//
			//
			var b = board.board;
			
			// Move the Rook On Castle
			if (file-i == 2) { //queenside castle happened, rook exists
				
				//Get
				var p = b[# rank, 0];
				
				//Update Board
				p.move(rank, 3);
				b[# rank, 0] = board.emptyPiece;
				b[# rank, 3] = p;
				
				piece_depth_change_square(board, rank, 0, rank, 3);
			}
			
			if (file - i == -2) { //kingside castle happened, rook exists
				
				//Get
				var p = b[# rank, 7];
				
				//Update Board
				p.move(rank, 5);
				b[# rank, 7] = board.emptyPiece;
				b[# rank, 5] = p;
				piece_depth_change_square(board, rank, 7, rank, 5);
			}
			
		}
		
		file = i;
		rank = j;
		
		// Store for fast Check lookup
		if (white) {
			board.whiteKingSquare = i+j*8;	
		} else {
			board.blackKingSquare = i+j*8;
		}
	}
	
}