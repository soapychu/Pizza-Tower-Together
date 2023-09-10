/// @description Dynamite Stun
with (other)
{
	if (sprite_index = spr_pizzaface_attackland)
	{
		state = states.stun
		stunned = 1000;
		thrown = false;
		hsp = -image_xscale * 8;
		vsp = -4;
	}
}
