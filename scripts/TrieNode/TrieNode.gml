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

	static cleanup = function() {
	
		for (var i = 0; i < ds_list_size(childrenIds); i++) {
			
			//Get Child
			var childId = childrenIds[| i];
			var child = children[? childId];
			
			//Cleanup
			child.cleanup();
			
			//Delete
			delete child;
		}
		
		//Destroy My Maps, Not Needed
		ds_list_destroy(childrenIds);
		ds_map_destroy(children);
	
	}
	
	//
	//
	static add_child = function(key) {
		
		//Make New
		var newChild = new TrieNode(false, depth+1);
	
		//Add New
		ds_list_add(childrenIds, key);
		ds_map_add(children, key, newChild);
	
		return newChild;
	}
	
	static get_or_add_child = function(key) {
	
		// Get
		if (ds_map_exists(children, key))
			return children[? key];
			
		// Create and Get
		return add_child(key);
		
	}

}