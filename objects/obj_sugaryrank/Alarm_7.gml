/// @description play rank loop
switch(obj_player1.character)
{
	case "SP":
		global.mu_rankloop = fmod_event_create_instance("event:/music/rankloopSP");
		break;
	default:
		global.mu_rankloop = fmod_event_create_instance("event:/music/rankloop");
		break;
}

	fmod_event_instance_play(global.mu_rankloop);