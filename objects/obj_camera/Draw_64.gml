for (var i = 0; i < global.playermaxhealth; i +=1;)
{
	draw_sprite(spr_heart,1,(x-16+(i*20)),y-32);
}

for (var i = 0; i <  global.playerHealth ; i +=1;)
{
    draw_sprite(spr_heart,2,(x-16+(i*20)),y-32);
}
