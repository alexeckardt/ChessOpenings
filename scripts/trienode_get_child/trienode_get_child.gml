// @desc
//
//
//
function trienode_get_child(node, key) {

	if (node == undefined)
		return undefined;

	// Get
	if (ds_map_exists(node.children, key))
		return node.children[? key];
		
	return undefined;

}