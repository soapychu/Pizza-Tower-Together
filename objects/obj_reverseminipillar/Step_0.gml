if (player < 2)
{
    if (place_meeting(xstart, ystart, obj_player1) && obj_player1.state != (61 << 0))
        player = 1
    else if ((!global.panic) && (!(place_meeting(xstart, ystart, obj_player1))))
        player = 2
}
if (global.panic == 0 && player != 1)
{
    x = xstart
    y = ystart
    if check_sugary()
        sprite_index = spr_minipillarwokeSS
    else
        sprite_index = spr_minipillarwoke
    mask_index = spr_minipillarwoke
}
else
{
    x = (-abs(sprite_width))
    y = (-abs(sprite_height))
    if check_sugary()
        sprite_index = spr_minipillarsleepSS
    else
        sprite_index = spr_minipillarsleep
}
