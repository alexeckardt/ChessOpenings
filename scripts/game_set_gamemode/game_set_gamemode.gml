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
	
	//Create Agents
	switch (mode) {
		default:
		break;
		
		case gamemode.as_black:
			var a = instance_create_depth(20, 20, 0, Agent);
			a.asWhite = true;
			
			g.agentBlack = a;
		break;
		
		case gamemode.as_white:
			var a = instance_create_depth(20, 20, 0, Agent);
			a.asWhite = false;
			
			g.agentWhite = a;
		break
	}
}