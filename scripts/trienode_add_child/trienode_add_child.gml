// @desc
//
//
//
function trienode_add_child(node, newkey) {

	//Make New
	var newChild = new TrieNode(false, node.depth+1, node);
	
	//Add New
	ds_list_add(node.childrenIds, newkey);
	ds_map_add(node.children, newkey, newChild);
	
	return newChild;

}