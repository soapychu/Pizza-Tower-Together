/// @description Follow around the player

var tgtX = (obj_player.x + (obj_player.xscale * -30))
var tgtY = (obj_player.y - 40)
var tgtMVSP = (distance_to_point(tgtX, tgtY) / 200)
var _d = point_direction(x, y, tgtX, tgtY)
hsp = lengthdir_x(((18 * tgtMVSP) + 0.5), _d)
vsp = lengthdir_y(((18 * tgtMVSP) + 0.5), _d)
x = approach(x, tgtX, hsp)
y = approach(y, tgtY, vsp)
if (x != obj_player.x)
    image_xscale = (-(sign((x - obj_player.x))))
    sprite_index = spr_spookey
if (!global.key_inv)
    instance_destroy()
