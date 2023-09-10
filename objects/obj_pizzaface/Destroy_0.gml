var _x = savedx - savedcx;
var _y = savedy - savedcy;
while (_x > SCREEN_WIDTH - 100)
	_x -= 20;
while (_y > SCREEN_HEIGHT - 100)
	_y -= 20;
while (_x < 100)
	_x += 20;
while (_y < 100)
	_y += 20;
if sprite_index == spr_pizzaface_old
{
_x = x
_y = y
}
with (instance_create(_x, _y, obj_shakeanddie))
{
sprite_index = spr_pizzahead_intro1
if obj_player1.character == "SP" or (global.pizzellesugaryoverride && obj_player1.character == "G")
	sprite_index = spr_coneball_new
if obj_player1.character == "PN"
	sprite_index = spr_thecrumdeath
}
fmod_event_one_shot_3d("event:/sfx/misc/explosion", _x, _y);
fmod_event_one_shot_3d("event:/sfx/pep/groundpound", _x, _y);
destroy_sounds([snd]);
