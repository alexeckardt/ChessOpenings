/// @description 

//Toggle Fullscreen
if (keyboard_check_pressed(vk_f11)) {
	var f = window_get_fullscreen();
	window_set_fullscreen(!f);
}

if (keyboard_check_pressed(ord("R"))) {
	board_setup(defaultFEN);	
}

if (keyboard_check_pressed(ord("C"))) {
	defaultFEN = board_create_fen(myBoard);
}

//Background
bkgOff = (bkgOff + bkgSpeed) % sprite_get_width(backgroundSprite);
backgroundMix = lerp(backgroundMix, myBoard.whiteToMove, 0.1);
backgroundRedBlend = lerp(backgroundRedBlend, myBoard.kingInCheck*0.4, 0.1);