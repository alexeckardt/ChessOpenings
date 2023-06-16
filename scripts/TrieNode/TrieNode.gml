// @desc
//
//
//
function TrieNode(_mistake, _depth) constructor {

	isMistake = _mistake;
	depth = _depth;
	
	// Depth
	children = ds_map_create();
	childrenIds = ds_list_create();

}