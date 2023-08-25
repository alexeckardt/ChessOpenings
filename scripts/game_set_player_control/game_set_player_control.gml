// @desc
//
//
//
function game_set_player_control(whiteToMove) {

	var g = Game.id;
	switch (g.gameMode) {
		
		case gamemode.free_play:
			g.playerHasControl = true;break;
			
		case gamemode.free_play_as_black:
		case gamemode.openings_black:
		case gamemode.old_openings_black:
			g.playerHasControl = !whiteToMove;break;
			
		case gamemode.free_play_as_white:
		case gamemode.openings_white:
		case gamemode.old_openings_white:
			g.playerHasControl = whiteToMove;break;
			
		case gamemode.none:
			g.playerHasControl = false;break;
	}
}