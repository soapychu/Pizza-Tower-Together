function sh_level(args)
{
	if !WC_debug
		return "You do not have permission to use this command";
	isOpen = false;
	
	var level = args[1], targetRoom = -1;
	switch level
	{
		default: targetRoom = asset_get_index(level + "_1"); break;
		
		case "farm": targetRoom = farm_2; break;
		case "plage": targetRoom = plage_entrance; break;
		case "street": targetRoom = street_intro; break;
		case "exit": targetRoom = tower_finalhallway; break;
		case "oldexit": targetRoom = exit_1; break;
	}
	
	if room_exists(targetRoom)
	{
		with obj_player1
		{
			global.startgate = true;
			global.leveltosave = level;
			global.leveltorestart = targetRoom;
			global.levelattempts = 0;
			backtohubstartx = x;
			backtohubstarty = y;
			backtohubroom = room;
			targetDoor = "A";
		}
		room_goto(targetRoom);
	}
}
function meta_level()
{
	return {
		description: "travel to a level",
		arguments: ["level"],
		suggestions: [
			["entrance", "medieval", "ruin", "dungeon", "badland", "graveyard", "farm", "saloon", "plage", "forest", "space", "minigolf", "street", "sewer", "industrial", "freezer", "kidsparty", "chateau", "war", "exit",
			"oldexit", "beach", "mansion", "strongcold", "dragonlair",
			"entryway", "grinch", "e_cotton"]
		]
	}
}
