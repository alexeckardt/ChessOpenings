// @desc
//
//
//
function PieceFragment(_t, isWhite, sourcex, sourcey, _x, _y, _w, _h) constructor {

	type = _t;
	spr = (isWhite) ? sPiecesWhite : sPiecesBlack;
	sprx = _x;
	spry = _y;
	sprw = _w;
	sprh = _h;
	
	x = sourcex - sprite_get_xoffset(spr) + _x;
	y = sourcey;
	
	z = _y;

	grav = 0.15;
	xSpeed = random(0.5)*choose(-1, 1);
	ySpeed = random(0.5)*choose(-1, 1);
	zSpeed = random_range(5, 2);
	
	bounce = random_range(0.3, 0.5);

	stopUpdate = false;
	lifeLeft = random_range(0.7, 1.3)*room_speed;

	//
	static update = function() {
		
		x += xSpeed;
		y += ySpeed;
		
		if (z + zSpeed > 0) {
			zSpeed = -zSpeed * bounce; // Bounce, lose energy
			z = 0;
			
			xSpeed *= bounce;
			ySpeed *= bounce;
			
			if (abs(zSpeed) < 0.1) {
				stopUpdate = true;
			}
		}
		
		z += zSpeed;
		zSpeed += grav;
		
	}
	
	static draw = function() {
	
		draw_sprite_part(spr, type, sprx, spry, sprw, sprh, floor(x), floor(y+z));
	
	}
}