if(place_meeting(x,y,obj_player)){
	var _dist = point_distance(x,y,obj_player.x,obj_player.y);
	target_xskew = sign(x-obj_player.x)*lerp(32,0,min(1,_dist/32));
	//yskew = sign(y-obj_player.y)*lerp(0,32,_dist/32);
}else{
	target_xskew = lerp(target_xskew,0,0.1);
}

xskew = lerp(xskew,target_xskew,0.2);
