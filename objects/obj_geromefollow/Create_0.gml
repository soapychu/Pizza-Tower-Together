event_inherited();
image_speed = 0.35;
yoffset = 0;
do_end = false;
hsp = 0;
vsp = 0;
grav = 0.5;
movespeed = 3;
state = states.normal;
tauntID = -4;
playerid = obj_player1
spr_idle = spr_gerome_keyidle
spr_move = spr_gerome_keymove
spr_opendoor = spr_gerome_opendoor
spr_taunt = spr_gerome_taunt
spr_collected = spr_gerome_collected
spr_idlepanic = spr_gerome_keyidle
spr_movepanic = spr_gerome_keymove
if check_sugary()
{
    spr_collected = spr_rudejanitor_idle
    spr_opendoor = spr_rudejanitor_unlock
    spr_idle = spr_rudejanitor_idle
    spr_idlepanic = spr_rudejanitor_panicidle
    spr_movepanic = spr_rudejanitor_panicwalk
    spr_taunt = spr_rudejanitor_taunt
    spr_move = spr_rudejanitor_walk
}
