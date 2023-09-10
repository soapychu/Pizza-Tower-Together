with (obj_player)
{
	if (place_meeting(x + 1, y, other) || place_meeting(x - 1, y, other) || place_meeting(x, y + 1, other) || place_meeting(x, y - 1, other))
	{
		with (other)
		{
			with (instance_create(0, 0, obj_backtohub_fadeout))
			fadealpha = 0.9;
			scr_playerreset();
			global.levelreset = true;
			obj_player1.targetDoor = "HUB";
			if (instance_exists(obj_player2))
				obj_player2.targetDoor = "HUB";
			global.leveltorestart = -4;
			global.leveltosave = -4;
		}
	}
}
