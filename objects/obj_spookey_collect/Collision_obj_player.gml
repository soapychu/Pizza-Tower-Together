if (room == rm_editor)
	exit;
if (global.key_inv)
	exit;
with (other)
{
	if (state != states.bombpep && state != states.gotoplayer && state != states.ghost && state != states.knightpep && state != states.cheeseball && state != states.boxxedpep && state != states.cheesepep && state != states.knightpepattack && state != states.knightpepslopes && state != states.hurt && state != states.knightpepbump)
	{
		instance_create(x, y, obj_spookey)
		with (instance_create(x, y, obj_explosioneffect))
	    {
	        sprite_index = spr_taunteffect
	        depth = -2
	    }
		tv_do_expression(spr_tv_keyget)
		global.key_inv = true;
		fmod_event_one_shot("event:/sfx/misc/collecttoppin");
		instance_destroy(other, false)
		
	}
}
