timer = round(timer_max);
if check_char("SP")
{
	var _state = min(floor(combo / 10), 8)
	fmod_event_instance_play(pizzycombovoice);
	fmod_event_one_shot("event:/ptt/sfx/comboend")
	fmod_event_instance_set_parameter(pizzycombovoice, "state", _state, true);
}