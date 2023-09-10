function scr_player_faceplant()
{
	movespeed += 0.25;
	hsp = xscale * movespeed;
	move = key_right + key_left;
	if (check_wall(x + hsp, y) && !place_meeting(x + hsp, y, obj_slope_parent) && !place_meeting(x + hsp, y, obj_destructibles))
	{
		var _bump = ledge_bump((vsp >= 0) ? 32 : 22);
		if (_bump)
		{
			if character == "SP" 
				{
					if key_down
					{
						state = states.machroll;
						vsp = 10;
					}
					else
					{
						with instance_create(x, y, obj_jumpdust)
							image_xscale = other.xscale;
						vsp = -9;
						image_index = 0;
						
						if movespeed >= 12
						{
							sprite_index = spr_mach3jump;
							state = states.mach3;
						}
						else
						{
							sprite_index = spr_secondjump1;
							state = states.mach2;
						}
					}
				}
		else
		{
			sprite_index = spr_hitwall;
			sound_play_3d("event:/sfx/pep/groundpound", x, y);
			sound_play_3d("event:/sfx/pep/bumpwall", x, y);
			with (obj_camera)
			{
				shake_mag = 20;
				shake_mag_acc = 40 / room_speed;
			}
			hsp = 0;
			image_speed = 0.35;
			with (obj_baddie)
			{
				if (shakestun && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0)
				{
					stun = true;
					alarm[0] = 200;
					ministun = false;
					vsp = -5;
					hsp = 0;
				}
			}
			flash = false;
			state = states.bump;
			hsp = -6 * xscale;
			vsp = -6;
			mach2 = 0;
			image_index = 0;
			instance_create(x + 15 * xscale, y + 10, obj_bumpeffect);
		}
	}
	}
	if (floor(image_index) == (image_number - 1) && !key_attack)
	{
		image_speed = 0.35;
		state = states.normal;
		grav = 0.5;
	}

	if (floor(image_index) == (image_number - 1) && key_attack)
	{
		image_speed = 0.35;
		state = states.mach3;
		grav = 0.5;
	}
	if (input_buffer_jump > 0 && can_jump && !key_down/* && global.attackstyle != 2*/)
	{
		fmod_event_instance_play(rollgetupsnd);
		input_buffer_jump = 0;
		particle_set_scale(particle.jumpdust, xscale, 1);
		create_particle(x, y, particle.jumpdust, 0);
		jumpstop = false;
		image_index = 0;
		vsp = -11;
		state = states.mach2;
		
		if (character == "P" && ispeppino || character == "BN")
			sprite_index = spr_longjump;
		else
			sprite_index = spr_mach2jump;
	}
	if (key_down)
	{
		state = states.machroll;
		vsp = 10;
	}
	if (!instance_exists(obj_dashcloud2) && grounded && movespeed > 5)
	{
		with (instance_create(x, y, obj_dashcloud2))
			image_xscale = other.xscale;
	}
	image_speed = 0.5;
}
