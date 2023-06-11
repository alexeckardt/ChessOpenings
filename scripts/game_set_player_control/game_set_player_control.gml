// @desc
//
//
//
function game_set_player_control(whiteToMove) {

	var g = Game.id;
	switch (g.gameMode) {
		
		case gamemode.free_play:
			g.playerHasControl = true;break;
			
		case gamemode.as_black:
			g.playerHasControl = !whiteToMove;break;
			
		case gamemode.as_white:
			g.playerHasControl = whiteToMove;break;
	}
}