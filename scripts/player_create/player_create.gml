//player creation script called within obj_player.create
acceleration_x = 2; // x and y acceleration
acceleration_y = 2; // at what rate do you accelerate
velocity_ = [0, 0];
max_velocity_ = [8, 8]; // max velocity
player_friction = 0.3; // used within the lerp function.
//gravity_ = 0.2;

//what t_layer does the player collide with?
var layer_id = layer_get_id("t_collision");
collision_tile_map_id_ = layer_tilemap_get_id(layer_id);

enum pstates { 
	moving,
	attacking,
}