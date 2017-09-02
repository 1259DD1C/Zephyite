//create player states for statemachines. ; not implemented to do anything yet
enum pstates { 
	moving,
	attacking,
}

//player creation script called within obj_player.create
acceleration_x = 0.5; // x and y acceleration
acceleration_y = 0.5; // at what rate do you accelerate
velocity_ = [0, 0]; // base velocity the player starts with
max_velocity_ = [3, 3]; // max velocity
player_friction = 0.13; // used within the lerp function.
canattack = true; // need to set before reading it.
dir = "down"; // set player direction ; diffuses set error.
pstates = pstates.moving; // set original state ( we don't need idle ) yet
//gravity_ = 0.2; // unusuable as it's a topdown not a platformer


//what t_layer does the player collide with?
var layer_id = layer_get_id("t_collision");
collision_tile_map_id_ = layer_tilemap_get_id(layer_id);

