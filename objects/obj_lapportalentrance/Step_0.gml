if (active)
{
	with (obj_player)
	{
		state = states.actor;
		hsp = 0;
		vsp = 0;
		visible = false;
	}
}
if (floor(image_index) == (image_number - 1))
{
	switch (sprite_index)
	{
		case spr_portalappear:
			fmod_event_one_shot_3d("event:/sfx/misc/secretexit", x, y);
			sprite_index = spr_portalentrance;
			break;
		case spr_portalentrance:
			sprite_index = spr_portaldisappear;
			with (obj_player)
			{
				state = states.normal;
				if isgustavo
					state = states.ratmount;
				visible = true;
			}
			if (global.canlap3 && global.laps == 2)
			if (instance_exists(obj_wartimer) or global.leveltosave == "exit")
			{
				instance_create(x, y, obj_pizzaface)
				fmod_event_one_shot("event:/sfx/pizzaface/laugh");
				if global.leveltosave == "exit"
				with (obj_music)
				{
					exitmusic = false
					fmod_event_instance_stop(music.event, true)
					fmod_event_instance_play(panicmusicID)
					fmod_event_instance_set_paused(panicmusicID, false);
					fmod_event_instance_set_parameter(panicmusicID, "state", 20, true);
				}
			}
			else
			global.fill = 0
			global.lap3 = true
			
			active = false;
			break;
		case spr_portaldisappear:
			instance_create_unique(0, 0, obj_lap2visual);
			instance_destroy();
			break;
	}
}
