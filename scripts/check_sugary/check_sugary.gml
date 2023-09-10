function check_sugary()
{
	var r = room_get_name(room);
	if string_starts_with(r, "entryway_") or string_starts_with(r, "e_cotton_") or room == tower_sugary or (global.pizzellesugaryoverride && check_char("SP")) or (global.pizzellesugaryoverride && obj_player1.character == "G")
		return true;
}
