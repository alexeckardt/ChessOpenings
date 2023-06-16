// @desc
//
//
//
function trienode_choose_random_child(node) {

	if (node == undefined) {
		return;	
	}

	var ids = node.childrenIds;
	var l = ds_list_size(ids);
	
	//Get Index
	var choosingChildInd = random_range(0, l-1); //inclusive

	//Get Key
	var childKey = ids[| choosingChildInd];
	
	return childKey;

}