// @desc
//
// Very slow, but whatever. Side Affects. O(n^2) lol
//
function ds_list_difference_map(source, intersectionmap) {

	//
	var c = ds_list_size(source);
	for (var i = 0; i < c; i++) {
		
		// Check in the other. If it exists, delete from list.
		if (ds_map_exists(intersectionmap, source[| i])) { //O(n)
		
			// Remove from source
			ds_list_delete(source, i);
			
			//Continue
			i--;
			c--;;
		}
	}

}