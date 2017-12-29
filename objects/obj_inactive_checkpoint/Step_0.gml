player_input(0);
if(act_interact){
	instance_create_layer(obj_active_checkpoint.x,obj_active_checkpoint.y, "Instances", obj_placeholder);
	instance_destroy(obj_active_checkpoint);
	instance_create_layer(obj_placeholder.x,obj_placeholder.y, "Instances", obj_active_checkpoint);
	instance_destroy(obj_placeholder);
}