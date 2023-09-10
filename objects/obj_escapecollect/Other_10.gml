/// @description time gain
if (global.laps > 1) or (global.leveltosave == "exit" && global.lap)
{
	var multiplier = 1
	if global.leveltosave == "exit" 
	multiplier = 1.5
	if room == tower_escape11
	multiplier = .5
	if !instance_exists(obj_wartimer)
	{
		switch obj_player1.character
		{
			case "SP":
				global.fill += 6 * multiplier;
				break;
			case "G":
				global.fill += 9 * multiplier;
				break;
			default:
				global.fill += 7 * multiplier;
				break;
		}
	}
	else with (obj_wartimer)
	{
		switch obj_player1.character
		{
			case "SP":
				seconds += 0.4;
				break;
			case "G":
				seconds += 0.6;
				break;
			default:
				seconds += 0.5;
				break;
		}
		while seconds >= 60
		{
			minutes++;
			seconds -= 60;
		}
	}
}
