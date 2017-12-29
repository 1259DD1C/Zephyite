if(!instance_exists(monster_type)){
        repeat(irandom_range(1,3)){
               instance_create_layer(x+irandom_range(-32,32),y+irandom_range(-32,32),"Instances",monster_type);
        }
}