/// @description time gain
if (global.laps > 1) or (global.leveltosave == "exit" && global.lap)
{
	var multiplier = 1
	if global.leveltosave == "exit" 
	multiplier = 1.5
	if !instance_exists(obj_wartimer)
	{
		switch obj_player1.character
		{
			case "SP":
				global.fill += 30 * multiplier;
				break;
			case "G":
				global.fill += 36 * multiplier;
				break;
			default:
				global.fill += 32 * multiplier;
				break;
		}
	}
	else
	{
		fmod_event_one_shot("event:/sfx/ui/wartimerup")
		with (obj_wartimer)
		{
			switch obj_player1.character
			{
				case "SP":
					addseconds += 4;
					break;
				case "G":
					addseconds += 6;
					break;
				default:
					addseconds += 5;
					break;
			}
			alarm[0] = -1
			alarm[2] = 1
		}
	}
}
