// @desc
//
//
//
function TrieNode(_mistake, _depth, _parent) constructor {

	isMistake = _mistake;
	depth = _depth;
	parent = _parent;
	
	// Depth
	children = ds_map_create();
	childrenIds = ds_list_create();
	
	final = false; //store if final in line, to pass!
	finalAsWhite = true;
	
}