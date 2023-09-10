/// @description Point Count-up
alarm[1] = -1
alarm[0] = -1
pshake = false
if (countpoint != global.collect)
{
	countpoint = approach(countpoint, global.collect, inicollect)
	pshake = true
	//if !audio_is_playing(sound_tally)
	//scr_sound(sound_points)
	alarm[2] = 3
}
else
{
	alarm[2] = -1
	alarm[3] = 25
	//if global.janitorRudefollow = true
	//alarm[6] = 25
}
