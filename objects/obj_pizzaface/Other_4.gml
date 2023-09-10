image_alpha = 0;
savedx = x;
savedy = y;
savedcx = camera_get_view_x(view_camera[0]);
savedcy = camera_get_view_y(view_camera[0]);
if instance_exists(obj_player1)
{
	x = obj_player1.x;
	y = obj_player1.y;
}
if (instance_exists(obj_treasure))
	treasure = true;
else
	treasure = false;
if (room == rank_room)
	instance_destroy();
if room == graveyard_7 or room == tower_4 or room == tower_escape2 or room == tower_escape5 or room == tower_escape8 or room == tower_2 or room == tower_1 or room == tower_3
{
maxspeed = 1
if sprite_index == spr_pizzaface
sprite_index = spr_pizzahead_haywire 
}
else
{
maxspeed = 8
if sprite_index == spr_pizzahead_haywire
sprite_index = spr_pizzaface
}