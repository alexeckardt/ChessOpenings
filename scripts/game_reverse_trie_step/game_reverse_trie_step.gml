// @desc
//
//
//
function game_reverse_trie_step(game) {

	if (!game.followOpeningTrie)
		return;
		
	if (game.lastTrieNode == undefined)
		return;

	var grandParent = trienode_get_parent(game.lastTrieNode);

	game.currentTrieNode = game.lastTrieNode;
	game.lastTrieNode = grandParent;
	

}