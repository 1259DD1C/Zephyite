//get input
dvc=argument0; // if dvc != 0 use gamepad. 

//implement later on: 
//var gp_num = gamepad_get_device_count();
//for (var i = 0; i < gp_num; i++;){
//   if gamepad_is_connected(i) dvc[i] = true else dvc[i] = false;
//} // Get amount of gamepads connected. and assign dvc no.

//update all gamepad variables to match pc controls later on.
// gamepad
if (gamepad_is_connected(dvc)){
	gamepad_set_axis_deadzone(dvc,0.3);
	xx=gamepad_axis_value(dvc,gp_axislh);
	yy=gamepad_axis_value(dvc,gp_axislv);
	act_use = gamepad_button_check_pressed(dvc,gp_face3);
	act_run = gamepad_button_check_pressed(dvc,gp_face1);
	act_interact = gamepad_button_check_pressed(dvc,gp_face2);
	act_attack = gamepad_button_check_pressed(dvc,gp_face4);
}

// controls
move_up = keyboard_check(ord("W"));
move_down = keyboard_check(ord("S"));
move_left = keyboard_check(ord("A"));
move_right = keyboard_check(ord("D"));
act_use = keyboard_check(ord("X"));
act_interact = keyboard_check_pressed(ord("E"));
act_r = keyboard_check_pressed(ord("R"));
act_attack = mouse_check_button_pressed(mb_left);
act_console = keyboard_check(ord("`"));
act_tab = keyboard_check(ord("TAB"));
act_esc = keyboard_check_pressed(vk_escape);
act_shift = keyboard_check_pressed(vk_lshift);

