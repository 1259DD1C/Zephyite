for (var i = 0; i < enemy_max_hp; i +=1;)
{
	draw_sprite(spr_heart,1,(x-16+(i*17)),y-32);
}

for (var i = 0; i <  hp ; i +=1;)
{
    draw_sprite(spr_heart,2,(x-16+(i*17)),y-32);
}

draw_self();