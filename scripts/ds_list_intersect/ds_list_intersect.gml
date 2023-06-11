// @desc
//
// Very slow, but whatever. Side Affects. O(n^2) lol
//
function ds_list_intersect(source, intersection) {

	//
	var c = ds_list_size(source);
	for (var i = 0; i < c; i++) {
		
		// Check Not in intersection
		if (!ds_list_find_index(intersection, source[| i])) { //O(n)
		
			// Remove from source
			ds_list_delete(source, i);
			
			//Continue
			i--;
			c--;;
		}
	}

}