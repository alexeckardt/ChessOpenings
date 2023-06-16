// @desc
//
//
//
function trienode_cleanup(node){

	for (var i = 0; i < ds_list_size(node.childrenIds); i++) {
			
		//Get Child
		var childId = node.childrenIds[| i];
		var child = node.children[? childId];
			
		//Cleanup
		trienode_cleanup(child);
			
		//Delete
		delete child;
	}
		
	//Destroy My Maps, Not Needed
	ds_list_destroy(node.childrenIds);
	ds_map_destroy(node.children);

}