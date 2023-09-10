image_speed = 0.35;
active = false;
spr_portalappear = spr_pizzaportal_appear
spr_portalentrance = spr_pizzaportalentrancestart
spr_portaldisappear = spr_pizzaportal_disappear
if check_sugary()
{
spr_portalappear = spr_lappingportalSS_appear
spr_portalentrance = spr_lappingportalSS_exit
spr_portaldisappear = spr_lappingportalSS_disappear
}
sprite_index = spr_portalappear