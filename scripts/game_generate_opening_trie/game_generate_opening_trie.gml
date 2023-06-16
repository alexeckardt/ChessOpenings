// @desc
//
//
//
function game_generate_opening_trie() {

	//Root
	var rootNode = new TrieNode(false, 0, undefined);

	// Open Loop
	game_opening_trie_add_path("3234,918,3299,334,3364,723,3690,666,2266,938,3178,1242,3947,82,3429,216,4020,148,2397,2,1876,1180,1293,405,3901,1835,3735,2780,3817,1805,", rootNode);

	//
	return rootNode;

}