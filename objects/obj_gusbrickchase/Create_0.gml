if check_char("G")
{
	instance_destroy(id, false);
	exit;
}

hsp = 0;
vsp = 0;
hsp_carry = 0;
vsp_carry = 0;
grav = 0.5;
platformid = -4;
steppy = false;
depth = -4;
snd = fmod_event_create_instance("event:/sfx/hub/gusrun");
sniffsnd = fmod_event_create_instance("event:/sfx/rat/ratsniff");
fmod_event_instance_set_3d_attributes(sniffsnd, x, y);
