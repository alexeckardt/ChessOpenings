/// @description 
image_speed = 0;

isWhite = true;

thinkingTime = room_speed;
maxThinkingTime = room_speed/2;
minThinkingTime = room_speed/10;
thinkingTimeLeft = 0;

game = noone; //set on game creation
movesList = ds_list_create();