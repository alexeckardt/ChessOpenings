// @desc
//
//
//
function move_string_generate(movesstring) {

	//Parent
	var moveArray = string_split(movesstring, ",");
	//
	
	if (array_length(moveArray) == 0) {
		return undefined;	
	}
	
	
	//
	var m = moveArray[0];
	var move = real(m);
	var head = new MoveString(move);
	var truehead = head;
	
	for (var i = 1; i < array_length(moveArray); i++) {
		
		m = moveArray[i];
		
		if (m != "") {
			var nextMove = real(m);
			var next = new MoveString(nextMove);
		
			head.next = next;
			head = next;
		}
		
	}
	
	//Get
	return truehead;

}