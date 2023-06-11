/// @description 

var w = display_get_gui_width();
var h = display_get_gui_height();
var mx = mouse_x / room_width * w;
var my = mouse_y / room_height * h;

draw_sprite(sCursor, 0, mx, my);