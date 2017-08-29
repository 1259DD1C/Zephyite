//player creation script called within obj_player.create
acceleration_x = 2; // x and y acceleration
acceleration_y = 2; // at what rate do you accelerate
acceleration_ = 0.6;
velocity_ = [0, 0];
//gravity_ = 0.2;
max_velocity_ = [8, 8]; // max velocity
//what t_layer does the player collide with?
var layer_id = layer_get_id("t_collision");
collision_tile_map_id_ = layer_tilemap_get_id(layer_id);