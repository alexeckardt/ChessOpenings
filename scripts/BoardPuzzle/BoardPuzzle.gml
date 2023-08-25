// @desc
//
//
//
function BoardPuzzle(whiteToPlay, boardSetupString, continuation) constructor{

	var setupStringLength = string_length(boardSetupString)
	setupPositionFrom = (setupStringLength > 8) ? setupStringLength-3 : 0;
	
	whiteToMove = whiteToPlay;
	boardSetupMoves = boardSetupString;
	solution = continuation;
	
}