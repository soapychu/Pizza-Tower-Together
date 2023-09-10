secret = false;
secretend = false;
pillar_on_camera = false;
prevpillar_on_camera = false;
music_map = ds_map_create();
music = -4;
savedpillarpause = false;
savedpanicpause = false;
savedmusicpause = false;
savedsecretpause = false;
savedpanicpos = 0;
savedmusicpos = 0;
exitmusic = false;
pillarmusicID = fmod_event_create_instance("event:/music/pillarmusic");
panicmusicID = fmod_event_create_instance("event:/music/pizzatime");
kidspartychaseID = fmod_event_create_instance("event:/music/w5/kidspartychase");
panicstart = false;

add_music(Endingroom, "event:/music/ending", -4, false);
add_music(Creditsroom, "event:/music/credits", -4, false);
add_music(Johnresurrectionroom, "event:/music/ending", -4, false);
add_music(Mainmenu, "event:/music/title", -4, false, function(room, parameter)
{
	fmod_event_instance_set_parameter(parameter, "state", 0, true);
});

add_music(tower_tutorial1, "event:/music/tutorial", "event:/music/pillarmusic", 0)
add_music(tower_entrancehall, "event:/music/hub", "event:/music/pillarmusic", 0, hub_state)
add_music(tower_johngutterhall, "event:/music/hub", "event:/music/pillarmusic", 0, hub_state)
add_music(tower_1, "event:/music/hub", "event:/music/pillarmusic", 0, hub_state)
add_music(tower_2, "event:/music/hub", "event:/music/pillarmusic", 0, hub_state)
add_music(tower_3, "event:/music/hub", "event:/music/pillarmusic", 0, hub_state)
add_music(tower_4, "event:/music/hub", "event:/music/pillarmusic", 0, hub_state)
add_music(tower_5, "event:/music/hub", "event:/music/pillarmusic", 0, hub_state)
add_music(tower_sugary, "event:/music/hub", "event:/music/pillarmusic", 0, hub_state)
add_music(basement_1, "event:/music/hub", "event:/music/pillarmusic", 0, hub_state)
add_music(tower_freerun, "event:/music/hub", "event:/music/pillarmusic", 0, hub_state)
add_music(tower_finalhallway, "event:/music/finalescape", -4, 0)
add_music(tower_finalhallwaytitlecard, "event:/music/pillarmusic", -4, 0)
add_music(tower_pizzafacehall, "event:/music/w5/finalhallway", -4, 0)
add_music(tower_outside, "event:/sfx/misc/windloop", -4, 0)
add_music(tower_1up, "event:/music/pillarmusic", -4, 0)
add_music(tower_2up, "event:/music/pillarmusic", -4, 0)
add_music(tower_3up, "event:/music/pillarmusic", -4, 0)
add_music(tower_4up, "event:/music/pillarmusic", -4, 0)
add_music(boss_vigilante, "event:/music/boss/vigilante", -4, 0)
add_music(boss_fakepep, "event:/music/boss/fakepep", -4, 0)
add_music(boss_fakepephallway, "event:/music/boss/fakepepambient", -4, 0)
add_music(boss_fakepepkey, "event:/music/pillarmusic", -4, 0)
add_music(boss_noise, "event:/music/boss/noise", -4, 0)
add_music(boss_pepperman, "event:/music/boss/pepperman", -4, 0)
add_music(boss_painter, "event:/music/boss/painter", -4, 0)
add_music(boss_pizzaface, "event:/music/boss/pizzaface", -4, false, function(room, parameter)
{
	if room == boss_pizzaface
		fmod_event_instance_set_parameter(parameter, "state", 0, true);
	else if room == boss_pizzafacehub
		fmod_event_instance_set_parameter(parameter, "state", 5, false);
});

var entrance_func = function(room, event, event_secret)
{
	var s = 0;
	switch obj_player1.character
	{
		case "P": if !obj_player1.ispeppino s = 1; break;
		case "N": s = 1; break;
		case "V": s = 2; break;
		case "SP": s = 3; break;
		case "PN": s = 4; break;
		case "BN": s = 5; break;
		case "G": if global.pizzellesugaryoverride s = 3; break;
	}
	
	fmod_event_instance_set_parameter(event, "state", s, true);
}
add_music(entrance_1, "event:/music/w1/entrance", "event:/music/w1/entrancesecret", 0, entrance_func);

add_music(medieval_1, "event:/music/w1/medieval", "event:/music/w1/medievalsecret", 0, function(room, event, event_secret) //anon_gml_Object_obj_music_Create_0_3410_gml_Object_obj_music_Create_0
{
	var s = -1;
	switch room
	{
		case medieval_1:
		case medieval_2:
			s = 0
			break
		case medieval_3:
		case medieval_5:
			s = 1
			break
		case medieval_6:
			s = 2
			break
	}

	if (s != -1)
		fmod_event_instance_set_parameter(event, "state", s, 1)
});

add_music(ruin_1, "event:/music/w1/ruin", "event:/music/w1/ruinsecret", 0, function(room, event) //anon_gml_Object_obj_music_Create_0_3822_gml_Object_obj_music_Create_0
{
	var s = -1;
	switch room
	{
		case ruin_1:
		case ruin_5:
			s = 0
			break
		case ruin_6:
			s = 1
			break
	}

	if (s != -1)
		fmod_event_instance_set_parameter(event, "state", s, 1)
});

add_music(dungeon_1, "event:/music/w1/dungeon", "event:/music/w1/dungeonsecret", 0)
add_music(badland_1, "event:/music/w2/desert", "event:/music/w2/desertsecret", 0, function(room, event) //anon_gml_Object_obj_music_Create_0_4446_gml_Object_obj_music_Create_0
{
	var s = -1;
	switch room
	{
		case badland_1:
		case badland_8b:
		case badland_10:
			s = 0
			break
		case badland_9:
		case badland_mart4:
			s = 1
			break
	}

	if (s != -1)
		fmod_event_instance_set_parameter(event, "state", s, 1)
});

add_music(farm_2, "event:/music/w2/farm", "event:/music/w2/farmsecret", 0, function(room, event) //anon_gml_Object_obj_music_Create_0_4823_gml_Object_obj_music_Create_0
{
	var s = -1;
	switch room
	{
		case farm_2:
		case farm_6:
			s = 0
			break
		case farm_9:
			s = 1
			break
	}

	if (s != -1)
		fmod_event_instance_set_parameter(event, "state", s, 1)
});

add_music(graveyard_1, "event:/music/w2/graveyard", "event:/music/w2/graveyardsecret", 0)
add_music(saloon_1, "event:/music/w2/saloon", "event:/music/w2/saloonsecret", 0)
add_music(plage_entrance, "event:/music/w3/beach", "event:/music/w3/beachsecret", 0)
add_music(forest_1, "event:/music/w3/forest", "event:/music/w3/forestsecret", 0, function(room, event) //anon_gml_Object_obj_music_Create_0_5441_gml_Object_obj_music_Create_0
{
	var s = -1;
	switch room
	{
		case forest_1:
		case forest_3:
			s = 0
			break
		case forest_G1b:
			s = 1
			break
		case forest_G1:
			if obj_player1.isgustavo
				s = 2
			break
	}

	if (s != -1)
		fmod_event_instance_set_parameter(event, "state", s, 1)
});

add_music(minigolf_1, "event:/music/w3/golf", "event:/music/w3/golfsecret", 0)
add_music(space_1, "event:/music/w3/space", "event:/music/w3/spacesecret", 0)
add_music(freezer_1, "event:/music/w4/freezer", "event:/music/w4/freezersecret", 0, function(room, event, event_secret) //anon_gml_Object_obj_music_Create_0_6038_gml_Object_obj_music_Create_0
{
	var s = -1;
	switch room
	{
		case freezer_1:
		case freezer_9:
			s = 0
			break
		case freezer_12:
			s = 1
			break
	}

	if (s != -1)
		fmod_event_instance_set_parameter(event, "state", s, 1)
});

add_music(industrial_1, "event:/music/w4/industrial", "event:/music/w4/industrialsecret", 0, function(room, event, event_secret)
{
	var s = -1;
	switch room
	{
		case industrial_1:
		case industrial_2:
			s = 0
			break
		case industrial_3:
			s = 1
			break
	}

	if (s != -1)
		fmod_event_instance_set_parameter(event, "state", s, 1)
});

add_music(sewer_1, "event:/music/w4/sewer", "event:/music/w4/sewersecret", 0)
add_music(street_1, "event:/music/w4/street", "event:/music/w4/streetsecret", 0, function(room, event)
{
	if (room == street_1 || room == street_house3)
		fmod_event_instance_set_parameter(event, "state", 0, 1)
	else if (room == street_bacon)
		fmod_event_instance_set_parameter(event, "state", 2, 1)
	if (room == street_jail)
		fmod_set_parameter("musicmuffle", 1, 0)
	else
		fmod_set_parameter("musicmuffle", 0, 0)
});

add_music(chateau_1, "event:/music/w5/chateau", REMIX ? "event:/music/w5/chateausecret" : "event:/music/w1/medievalsecret", 0)
add_music(kidsparty_1, "event:/music/w5/kidsparty", "event:/music/w5/kidspartysecret", 0)
add_music(war_1, "event:/music/w5/war", "event:/music/w5/warsecret", 0)

// PTT
add_music(characterselect, "event:/music/ptt/serverlist", -4, 0)
add_music(tower_soapyroom, "event:/music/w3/golfsecret", -4, 0)
add_music(grinch_1, "event:/music/ptt/christmasrace", "event:/music/w1/dungeonsecret", 0)
add_music(strongcold_10, "event:/music/ptt/strongcold", "event:/music/ptt/strongcoldsecret", 0, function(room, event, event_secret)
{
	var s = 1;
	switch room
	{
		case strongcold_10:
		case strongcold_9:
		case strongcold_lap:
			s = 0;
			break;
		
		case strongcold_1:
			s = 2;
			break;
		
		case strongcold_secret1:
		case strongcold_secret4:
		case strongcold_secret5:
			s = -1;
			break;
	}
	if s != -1
		fmod_event_instance_set_parameter(event, "state", s, true);
});

add_music(dragonlair_1, "event:/music/ptt/dragonlair", "event:/music/w1/medievalsecret", 0);
add_music(beach_1, "event:/music/w3/beach", "event:/music/w3/beachsecret", 0);

add_music(entryway_1, "event:/music/w1/entrance", "event:/music/w1/entrancesecret", 0, entrance_func);

// Encore
add_music(e_medieval_1, "event:/music/w1/medieval", "event:/music/w1/medievalsecret", 0, function(room, event, event_secret) //anon_gml_Object_obj_music_Create_0_3410_gml_Object_obj_music_Create_0
{
	var s = -1;
	switch room
	{
		case e_medieval_1:
		case medieval_2:
			s = 0
			break
		case medieval_3:
		case medieval_5:
			s = 0
			break
		case medieval_6:
			s = 2
			break
	}

	if (s != -1)
		sound_instance_set_parameter(event, "state", s, 1)
});

add_music(e_cotton_1, "event:/ptt/encore/sugary/steamyE", "event:/music/w1/medievalsecret");
add_music(golf2_1, "event:/music/ptt/golf2", "event:/music/w3/golfsecret", 0,  function(room, event, event_secret)
{
	var s = 0;
	switch room
	{
		case golf2_1:
			break;
		case golf2_5:
			s = 1;
			break;
	}
	if s != -1
		fmod_event_instance_set_parameter(event, "state", s, true);
});