// @desc
//
//
//
function AnimationData(squareComingFrom, squareOfPeice) constructor {

	drawX = squareComingFrom div 8;
	drawY = squareComingFrom - drawX*8;
	
	drawXTo = squareOfPeice div 8;
	drawYTo = squareOfPeice - drawXTo*8;
	
}