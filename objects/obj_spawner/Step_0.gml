
if(instance_exists(monster_type)=false){
		instance_create_layer(x+irandom_range(-32,32),y+irandom_range(-32,32),"Instances",monster_type);
}
