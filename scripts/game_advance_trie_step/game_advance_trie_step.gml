// @desc
//
//
//
function game_advance_trie_step(game, moveMade) {

	if (!game.followOpeningTrie)
		return;

	game.lastTrieNode = game.currentTrieNode;
	game.currentTrieNode = trienode_get_child(game.currentTrieNode, moveMade);
	
}