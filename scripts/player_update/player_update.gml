//player.update is called within obj_player.step event 

//get input for movement. 
var _dx = keyboard_check(ord("D")) - keyboard_check(ord("A"));

vx+=_dx * accel;
vx = clamp(vx,-2,2);
x+=vx;
vx*=0.9;


vy+=0.9;

//Jumping
if(y==start_y && keyboard_check(vk_space)){
	vy=-12;	
}

y+=vy;
if(y>start_y){
	y=start_y;
	vy=0;
}


