player_input(0);

// end game button.
if(act_esc){ game_end(); } 

var x_input = (move_right - move_left) * acceleration_x;
var y_input = (move_down - move_up) * acceleration_y;
var diag = x_input != 0 && y_input != 0;
//if sign(diag != 0) {global.max_velocity_ =[256,256]}else{global.max_velocity_ = [320,320]}

// Vector variables
var vector2_x = 0;
var vector2_y = 1;
// Horizontal and Vertical Movement
velocity_[vector2_x] = clamp(velocity_[vector2_x]+x_input, -max_velocity_[vector2_x], max_velocity_[vector2_x]);
velocity_[vector2_y] = clamp(velocity_[vector2_y]+y_input, -max_velocity_[vector2_y], max_velocity_[vector2_y]);
// Friction
if (x_input==0) velocity_[vector2_x] = lerp(velocity_[vector2_x], 0, player_friction);
if (y_input==0)    velocity_[vector2_y] = lerp(velocity_[vector2_y], 0, player_friction);
// Gravity // commented out as this is topdown not platformer
//velocity_[vector2_y] += gravity_;
// Move and contact tiles
move_and_contact_tiles(collision_tile_map_id_, 32, velocity_);
//restricts the player to room width and height
obj_player.x = min(x, room_width);
obj_player.y = min(y, room_height);
//obj_player.x = max(x, room_width);
//obj_player.y = max(y, room_height);