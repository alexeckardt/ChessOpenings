// @desc
//
//
//
function square_number_from_id(square_id_string) {

	var a = ord("a");
	var one = ord("1");
	var eight = ord("8");


	var file = string_char_at(square_id_string, 1);
	var rank = string_char_at(square_id_string, 2);
	
	var i = ord(file) - a;
	var j = eight - (ord(rank));

	var sid = i + j*8;
	return sid;
}