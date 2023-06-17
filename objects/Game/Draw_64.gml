/// @description 

var w = display_get_gui_width();
var h = display_get_gui_height();
var mx = mouse_x / room_width * w;
var my = mouse_y / room_height * h;

draw_sprite(sCursor, 0, mx, my);

draw_text(20, 20, backgroundGameOverAlpha);

/*
var stackTop = ds_stack_top(myBoard.movesStack);
if (stackTop != undefined) 
	draw_text(150, 10, stackTop.moveMade);*/