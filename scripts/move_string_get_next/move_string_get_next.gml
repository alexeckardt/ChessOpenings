// @desc
//
//
//
function move_string_get_next(moveString) {

	if (moveString == undefined)
		return undefined;

	var next = moveString.next;
	delete moveString;
	return next;
	
}