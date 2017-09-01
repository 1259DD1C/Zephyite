player_input(0);

// end game button.
if(act_esc){ game_end(); } 

var x_input = (move_right - move_left) * acceleration_x;
var y_input = (move_down - move_up) * acceleration_y;
//makes the player diagonal movement not crazy fast.
var diag = x_input != 0 && y_input != 0;
//makes the player state moving if you're moving
if (x_input != 0 || y_input != 0) { pstates = pstates.moving; }

if sign(diag != 0) {
	max_velocity_ =[2,2]
} else {
	max_velocity_ = [3,3]
	}

// Vector variables
var vector2_x = 0;
var vector2_y = 1;
// Horizontal and Vertical Movement
velocity_[vector2_x] = clamp(velocity_[vector2_x]+x_input, -max_velocity_[vector2_x], max_velocity_[vector2_x]);
velocity_[vector2_y] = clamp(velocity_[vector2_y]+y_input, -max_velocity_[vector2_y], max_velocity_[vector2_y]);
// Friction
if (x_input==0) velocity_[vector2_x] = lerp(velocity_[vector2_x], 0, player_friction);
if (y_input==0)	velocity_[vector2_y] = lerp(velocity_[vector2_y], 0, player_friction);
// Gravity // commented out as this is topdown not platformer
//velocity_[vector2_y] += gravity_;
// Move and contact tiles
move_and_contact_tiles(collision_tile_map_id_, 32, velocity_);
//restricts the player to room width and height
obj_player.x = min(x, room_width);
obj_player.y = min(y, room_height);
//just use clamp instead ^ (UPGRADE)


// This handles animation, direction setting etc. 
//Look towards mouse
var playerAngle;
playerAngle = point_direction(x,y,mouse_x,mouse_y);
if  (playerAngle > 45) && (playerAngle < 135)&& pstates != pstates.attacking {
		//sprite_index=spr_PlayerUp;
		dir = "Up";
		//pstates = pstates.moving;
}
if (playerAngle > 135) && (playerAngle < 225) && pstates != pstates.attacking {
		//sprite_index=spr_PlayerLeft;
		dir = "Left";
		//pstates = pstates.moving;
}
if (playerAngle > 225) && (playerAngle < 315) && pstates != pstates.attacking {
		//sprite_index=spr_PlayerDown;
		dir = "Down";
		//pstates = pstates.moving;
}
if (playerAngle < 315) && (playerAngle < 45) && pstates != pstates.attacking{
		//sprite_index=spr_PlayerRight;
		dir = "Right";
		//pstates = pstates.moving;
}


