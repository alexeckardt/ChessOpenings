/// @description 

// Draw Background

var bkgc = merge_colour(c_white, c_red, backgroundRedBlend);
draw_sprite_tiled_ext(backgroundSprite, 0, bkgOff, bkgOff, 1, 1, bkgc, 1);
draw_sprite_tiled_ext(backgroundSprite, 1, bkgOff, bkgOff, 1, 1, bkgc, backgroundMix);
draw_set_font(fontBoard);
