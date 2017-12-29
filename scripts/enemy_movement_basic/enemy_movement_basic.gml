/// @description Insert description here
// You can write your code in this editor

normal_idle = argument0;
death_anim = argument1;
side_anim = argument2;
up_anim = argument3;

//death

if (state == "death"){
	sprite_index = death_anim;
	image_speed=0.2;
	draw_sprite(spr_bones,0,x,y);
	if (image_index > image_number - 1) instance_destroy();// Need to fix since it relies on 1> frames of anim.

}else{
	//sprite_index = asset_get_index("spr_MonsterSkele"+string(dir));
	sprite_index = normal_idle;
// Run that sexy death animation
if(hp<1) state = "death";

//alarm setup

if (state == "idle")||(state == "walk"){
	if (alarm[0] == -1){
		dir = choose(0,90,180,270);
		state = choose("idle","walk");
		alarm[0] = irandom_range(60,120);
		
	}
}

monsterHpDrawXValue = max((2 * hp),0); 


//ai walk and check collisions

var lay_id = layer_get_id("t_collision");
var map_id = layer_tilemap_get_id(lay_id);

// check colision right

var Rmx = tilemap_get_cell_x_at_pixel(map_id, x+dist_to_col,y+8);
var Rmy = tilemap_get_cell_y_at_pixel(map_id, x+dist_to_col,y+8);
var Rdata = tilemap_get(map_id, Rmx, Rmy);

var checkColRight = tile_get_index(Rdata) + (place_meeting(x+dist_to_col,y,obj_fam_collisions));

// check colision up

var Umx = tilemap_get_cell_x_at_pixel(map_id, x,y-dist_to_col);
var Umy = tilemap_get_cell_y_at_pixel(map_id, x,y-dist_to_col);
var Udata = tilemap_get(map_id, Umx, Umy);

var checkColUp = tile_get_index(Udata) + (place_meeting(x,y-dist_to_col,obj_fam_collisions));

// check colision left

var Lmx = tilemap_get_cell_x_at_pixel(map_id, x-dist_to_col,y+8);
var Lmy = tilemap_get_cell_y_at_pixel(map_id, x-dist_to_col,y+8);
var Ldata = tilemap_get(map_id, Lmx, Lmy);

var checkColLeft = tile_get_index(Ldata) + (place_meeting(x-dist_to_col,y,obj_fam_collisions));

// check colision down

var Dmx = tilemap_get_cell_x_at_pixel(map_id, x,y+dist_to_col);
var Dmy = tilemap_get_cell_y_at_pixel(map_id, x,y+dist_to_col);
var Ddata = tilemap_get(map_id, Dmx, Dmy);

var checkColDown = tile_get_index(Ddata) + (place_meeting(x,y+dist_to_col,obj_fam_collisions));

// walk/chase


	
if (checkColDown==0){
	if (dir == 0){
		if (state == "walk"){
			xspd = walkspeed;
			x = x+xspd;
		}
	}
	if (state == "chase"){
		xspd = chasespeed;
		if (x<obj_player.x){
				x = x+xspd;
		}
}
			
			
}else{
		
	xspd = 0;
			
	if (state == "walk"){
		state = "idle";
		checkcol = "right";
	}
} 

	

	
		if (checkColUp==0){
		if (dir == 90){
			if (state == "walk"){
			yspd = walkspeed;
			y = y-yspd;
			image_index = side_anim;
			image_xscale = 1;
			}
			}
			if (state == "chase"){
			yspd = walkspeed;
			 if (y>obj_player.y){
				y = y-yspd;
			 }
			}
			
			
		}else{
		
			yspd = 0;
			
			if (state == "walk"){
			state = "idle";
			checkcol = "right";
			image_index = side_anim;
			image_xscale = 1;
			}
		} 

	

	
		if (checkColLeft==0){
		if (dir == 180){
			if (state == "walk"){
			xspd = walkspeed;
			x = x-xspd;
			image_index = side_anim;
			image_xscale = -1;
			}
			}
			if (state == "chase"){
			xspd = chasespeed;
			 if (x>obj_player.x){
				x = x-xspd;
			 }
			}
			
			
		}else{
		
			xspd = 0;
			
			if (state == "walk"){
			state = "idle";
			checkcol = "right";
			}
		} 

	

	
		if (checkColDown==0){
		if (dir == 270){
			if (state == "walk"){
			yspd = walkspeed;
			y = y+yspd;
			}
			}
			if (state == "chase"){
			yspd = chasespeed;
			 if (y<obj_player.y){
				y = y+yspd;
			 }
			}
			
			
		}else{
		
			yspd = 0;
			
			if (state == "walk"){
			state = "idle";
			checkcol = "right";
			}
		} 



// check pos to player and change to chase state

pos_to_player =(((point_direction(x,y,obj_player.x,obj_player.y)+45) div 90)*90);

if (distance_to_object(obj_player) < 256){
	if (pos_to_player = dir){
		state = "chase";
	}
}

if (state == "chase"){

//reset idle-walk alarm

	alarm[0] = -1;

//start chase alarm

	if (alarm[1] == -1){
		alarm[1] = 120;
	}
	if (alarm[1] == 0){
		state = "lost";
	}
	
// set dir to look at player

	if (pos_to_player = 360){
		dir = 0;
	}else{
		dir = pos_to_player;
	}
}

// lost state

if (state == "lost"){
	xspd = xspd-0.01;
	yspd = yspd-0.01;
	if (dir == 0){
		x = x+xspd;
	}
	if (dir == 90){
		y = y-yspd;
	}
	if (dir == 180){
		x = x-xspd;
	}
	if (dir == 270){
		y = y+yspd;
	}
	image_speed=(xspd+yspd)/2;
	
	if (xspd+yspd < 0){
		state = "idle";
	}
}

//animations

if (state == "idle"){
	image_speed=0;
	image_index=0;
}

if (state == "walk"){
	image_speed=0.5;
}

if (state == "chase"){
	image_speed=1;
}

}


