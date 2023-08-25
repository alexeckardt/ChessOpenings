// @desc
//
//
//
function game_set_gamemode(mode) {
	
	var g = Game.id;
	
	//Delete Agents
	if (g.agentWhite != noone) 
		instance_destroy(g.agentWhite);
	if (g.agentBlack != noone) 
		instance_destroy(g.agentBlack);
	
	
	//Set
	g.gameMode = mode;
	g.gameModeOpening = false;
			
	//Create Agents
	switch (mode) {
		default:
		break;
		
		case gamemode.free_play_as_black:
			var a = instance_create_depth(20, 20, 0, Agent);
			a.isWhite = true;
			a.game = g;
			
			g.agentBlack = a;
			g.followOpeningTrie = false;
		break;
		
		case gamemode.free_play_as_white:
			var a = instance_create_depth(20, 20, 0, Agent);
			a.isWhite = false;
			a.game = g;
			
			g.agentWhite = a;
			g.followOpeningTrie = false;
		break;
		
		case gamemode.none:
			var a = instance_create_depth(20, 20, 0, Agent);
			a.isWhite = false;
			a.game = g;
			g.agentWhite = a;
			
			a = instance_create_depth(20, 20, 0, Agent);
			a.isWhite = true;
			a.game = g;
			g.agentBlack = a;
			
			g.followOpeningTrie = false;
		break;
		
		case gamemode.old_openings_black:
			var a = instance_create_depth(20, 20, 0, oOpeningsAgent);
			a.isWhite = true;
			a.game = g;
			
			g.agentBlack = a;
			g.followOpeningTrie = true;
			g.gameModeOpening = true;
		break;
		
		case gamemode.old_openings_white:
			var a = instance_create_depth(20, 20, 0, oOpeningsAgent);
			a.isWhite = false;
			a.game = g;
			
			g.agentWhite = a;
			g.followOpeningTrie = true;
			g.gameModeOpening = true;
		break;
		
	}
}