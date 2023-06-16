// @desc
//
//
//
function trienode_get_or_add_child(node, keyattempt) {

	// Get
	if (ds_map_exists(node.children, keyattempt))
		return node.children[? keyattempt];
			
	// Create and Get
	return trienode_add_child(node, keyattempt);

}