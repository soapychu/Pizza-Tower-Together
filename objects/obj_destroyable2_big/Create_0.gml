hp = 2;
depth = 1;
content = obj_null;

particlespr = spr_bigpizzablockdead;
if check_char("SP") or (global.pizzellesugaryoverride && obj_player1.character == "G")
{
	sprite_index = spr_candybigbreakable;
	particlespr = spr_bigcandyblockdead;
}
