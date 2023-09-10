event_inherited()
image_speed = 0.35
if check_sugary()
{
    sprite_index = spr_rudejanitor_idle
    if global.panic
        sprite_index = spr_rudejanitor_panicidle
}
else
    sprite_index = choose(spr_gerome_idle1, spr_gerome_idle2, spr_gerome_idle3)
image_xscale = 1
grabbed = 0
hsp = 0
vsp = 0
grav = 0.5
flash = 1
unpickable = 0
hp = 0
grounded = 1
state = 0
playerid = 533
mask_index = spr_player_mask
depth = -5
platformid = -4
hsp_carry = 0
vsp_carry = 0
thrown = 0
