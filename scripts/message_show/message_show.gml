function message_show(_msg, _t = 100)
{
	with obj_roomname
	{
		visible = true;
		showtext = true;
		msg = _msg;
		yi = -50;
		alarm[0] = _t;
		sound_play_centered(sfx_hurt);
	}
}
