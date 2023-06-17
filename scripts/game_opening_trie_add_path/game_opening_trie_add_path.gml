// @desc
//
//
//
function game_opening_trie_add_path(gamePath, rootNode) {

	//Split String
	var currentMove = "";
	var reading = 1;
	var stringLength = string_length(gamePath);
	var currentNode = rootNode;
	
	var currentLineIsMistake = false;

	while (reading <= stringLength) {
		
		//Get
		var charReading = string_char_at(gamePath, reading);
		
		//End Of Move, Collapse
		if (charReading == ",") {
			
			// Get Real Value of Before
			var t_str = string_digits(currentMove);
			var moveId = real(t_str);
			
			var newNode = trienode_get_or_add_child(currentNode, moveId);
			currentNode = newNode; //Continue down this path
			
			currentMove = ""; //Reset
			
		} else {
			
			//Mark as Mistake
			if (charReading == "M") {
				currentLineIsMistake = true;
				//We can add to the number because we cull it later
			}
			
			//Add
			currentMove += charReading;
		}
		
		//Increment
		reading++;
	}

	//
	// Set
	if (currentLineIsMistake) {
		currentNode.isMistake = true;	
	}


}