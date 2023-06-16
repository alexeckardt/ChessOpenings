// @desc
//
//
//
function game_generate_opening_trie() {

	//Root
	var rootNode = new TrieNode(false, 0);

	// Open Loop
	game_opening_trie_add_path("3364,796,", rootNode);

	//
	return rootNode;

}