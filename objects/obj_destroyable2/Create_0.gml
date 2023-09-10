particlespr = spr_pizzadebris;
spr_dead = spr_pizzablockdead;
if obj_player1.character == "SP" or (global.pizzellesugaryoverride && obj_player1.character == "G") 
{
	sprite_index = spr_candydestroyable2;
	particlespr = -1;
	spr_dead = spr_candyblockdead;
}
image_index = random_range(0, image_number - 1);
depth = 1;
