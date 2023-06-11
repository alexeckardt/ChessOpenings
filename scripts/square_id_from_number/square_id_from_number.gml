// @desc
//
//
//
function square_id_from_number(squareId) {

	if (squareId == -1) {
		return chr(fen_notation.enpassant_no_rights);	
	}

	var file = squareId mod 8;
	var rank = squareId div 8;

	var a = ord("a");
	var eight = ord("8");
	
	var iord = a + file;
	var jord = eight - rank;

	var strr = chr(iord) + chr(jord);

	return strr;
}