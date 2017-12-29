//create player states for statemachines. ; not implemented to do anything yet
enum pstates { 
	moving,
	attacking,
	idle, 
}
pstates = pstates.moving; // set original state ( we don't need idle ) yet
global.playerMana = 100;
global.playerHealth = 100;
maxmana = global.playerMana;
maxhealth = global.playerHealth;
canattack = true; // need to set before reading it.

//gravity_ = 0.2; Put here incase we want some downward effect.
player_friction = 0.13; // used within the lerp function, smooths player movement
acceleration_x = 0.5; // x and y acceleration , smooths player movement
acceleration_y = 0.5; // at what rate do you accelerate, smooths player movement
mousedir = "down"; // set player direction ; diffuses set error.

// Vector variables
velocity_ = [0, 0]; // base velocity the player starts with
max_velocity_ = [0 , 0]; // setting up velocity
max_velocity_original = 2; // max player speed.
max_velocity_diag = (max_velocity_original/(sqrt(2)));

//what t_layer does the player collide with?
var layer_id = layer_get_id("t_collision");
collision_tile_map_id_ = layer_tilemap_get_id(layer_id);

