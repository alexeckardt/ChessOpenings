/// @description 

var b = myBoard;

//Toggle Fullscreen
if (keyboard_check_pressed(vk_f11)) {
	var f = window_get_fullscreen();
	window_set_fullscreen(!f);
}

if (keyboard_check_pressed(ord("R"))) {
	myBoard = board_setup(defaultFEN);	
	b = myBoard;
}

if (keyboard_check_pressed(ord("C"))) {
	defaultFEN = board_create_fen(b);
}

//Background
bkgOff = (bkgOff + bkgSpeed) % sprite_get_width(backgroundSprite);

if (instance_exists(b)) {
	var w2m = board_white_to_play(b);
	backgroundMix = lerp(backgroundMix, w2m, 0.1);
	
	backgroundRedBlend = lerp(backgroundRedBlend, b.kingInCheck*0.4*!b.gameOver, 0.1);
	backgroundGameOverAlpha = lerp(backgroundGameOverAlpha, b.gameOver, 0.1);
}