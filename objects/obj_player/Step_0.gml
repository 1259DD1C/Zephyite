player_input(0);
//facingdir = point_direction(x, y, x_input, y_input); To get actual MOVE direction, rather than 
if(act_esc){ game_end(); } 
if(act_r){ game_restart(); } 
var x_input = (move_right - move_left) * acceleration_x;
var y_input = (move_down - move_up) * acceleration_y;
//makes the player state moving if you're moving
if (x_input != 0 || y_input != 0) { 
	pstates = pstates.moving; 
} else {
	pstates = pstates.idle;
}

//diagonal movement fix.
if (x_input && y_input != 0){
	max_velocity_[0] = max_velocity_diag;
	max_velocity_[1] = max_velocity_diag;
} else {
	max_velocity_[0] = max_velocity_original
	max_velocity_[1] = max_velocity_diag;
}

if(act_shift){
	

}

var vector2_x = 0;
var vector2_y = 1;
// Horizontal and Vertical Movement
velocity_[vector2_x] = clamp(velocity_[vector2_x]+x_input, -max_velocity_[vector2_x], max_velocity_[vector2_x]);
velocity_[vector2_y] = clamp(velocity_[vector2_y]+y_input, -max_velocity_[vector2_y], max_velocity_[vector2_y]);
if (x_input==0) velocity_[vector2_x] = lerp(velocity_[vector2_x], 0, player_friction);
if (y_input==0)	velocity_[vector2_y] = lerp(velocity_[vector2_y], 0, player_friction);
// Gravity // commented out as this is topdown not platformer
//velocity_[vector2_y] += gravity_;
// Move and contact tiles
move_and_contact_tiles(collision_tile_map_id_, 16, velocity_);
//restricts the player to room width and height
obj_player.x = min(x, room_width);
obj_player.y = min(y, room_height);//Fix this (upgreade)
//just use clamp instead ^ (UPGRADE)

//Player death
if(global.playerHealth<=0){
	x = obj_active_checkpoint.x;
	y = obj_active_checkpoint.y;
	global.playerHealth += 100;
}

// This handles animation, direction setting etc. 
//Look towards mouse

var playerAngle = point_direction(x,y,mouse_x,mouse_y);
if  (playerAngle > 45) && (playerAngle < 135)&& pstates != pstates.attacking {
		sprite_index= spr_player_up;
		mousedir = "Up";
		//pstates = pstates.moving;
}
if (playerAngle > 135) && (playerAngle < 225) && pstates != pstates.attacking {
		sprite_index = spr_player_right;
		image_xscale = -1;
		mousedir = "Left";
		//pstates = pstates.moving;
}
if (playerAngle > 225) && (playerAngle < 315) && pstates != pstates.attacking {
		sprite_index= spr_player_down;
		mousedir = "Down";
		//pstates = pstates.moving;
}
if (playerAngle < 315) && (playerAngle < 45) && pstates != pstates.attacking{
		sprite_index = spr_player_right;
		image_xscale = 1;
		mousedir = "Right";
		//pstates = pstates.moving;
}

//Attack
var dist =  32;  //however far the slash needs to appear from the Player
// Create slash if mousebutton pressed.
if (canattack) {
	if (act_spacebar){
	canattack = false;
	alarm[0] = room_speed/2;
	var xx = x + lengthdir_x(dist, playerAngle);
	var yy = y + lengthdir_y(dist, playerAngle);
	var s = instance_create_layer(xx, yy, "Instances", obj_collisionbox_sword);
	s.image_angle = playerAngle;
	}
}
//if(act_attack){
//	var s = instance_create_layer(xx, yy, "Instances", obj_collisionbox_sword);
//	s.image_angle = playerAngle;
//}