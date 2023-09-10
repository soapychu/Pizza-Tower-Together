if (room == rm_editor)
    mask_index = spr_minipillarwoke
if (player < 2)
{
    if (place_meeting(xstart, ystart, obj_player1) && obj_player1.state != (61 << 0))
        player = 1
    else if (global.panic && (!(place_meeting(xstart, ystart, obj_player1))))
        player = 2
}
if (global.panic == 0 || player <= 1)
{
    x = (-abs(sprite_width))
    y = (-abs(sprite_height))
    if check_sugary()
        sprite_index = spr_minipillarsleepSS
    else
        sprite_index = spr_minipillarsleep
    mask_index = spr_minipillarsleep
}
else
{
    mask_index = spr_minipillarwoke
    if check_sugary()
        sprite_index = spr_minipillarwokeSS
    else
        sprite_index = spr_minipillarwoke
    x = xstart
    y = ystart
}
