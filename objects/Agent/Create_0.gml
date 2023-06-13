/// @description 
image_speed = 0;

isWhite = true;

thinkingTime = room_speed;
maxThinkingTime = room_speed;
minThinkingTime = room_speed/4;
thinkingTimeLeft = 0;

game = noone; //set on game creation
myMovesList = ds_list_create();