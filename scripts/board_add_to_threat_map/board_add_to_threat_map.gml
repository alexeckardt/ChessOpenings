// @desc
//
//
//
function board_add_to_threat_map(threatMap, source, target)  {

	if (!ds_map_exists(threatMap, target)) {
		ds_map_add(threatMap, target, source);
	} else {
		threatMap[? target] = 64*threatMap[? target] + source; //at LEAST double attacked (for double checks)
	}

}