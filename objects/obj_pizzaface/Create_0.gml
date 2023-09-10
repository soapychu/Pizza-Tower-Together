maxspeed = 8;
image_speed = 0.35;
depth = -5;
savedcx = camera_get_view_x(view_camera[0]);
savedcy = camera_get_view_y(view_camera[0]);
savedx = x;
savedy = y;
x = obj_player1.x;
y = obj_player1.y;
alarm[1] = 10;
image_alpha = 0;
treasure = false;
snd = fmod_event_create_instance("event:/sfx/pizzaface/moving");

tracker = noone;
var char = obj_player1.character;
if char == "P" && !obj_player1.ispeppino
		char = "N";
		
	
	switch char
			{
				default:
					sprite_index = spr_pizzaface
					break;
				
				case "SP":
						sprite_index = spr_coneball_new
					break;
				case "G":
				if global.pizzellesugaryoverride && obj_player1.character == "G" 
				sprite_index = spr_coneball_new
				else
				sprite_index = spr_pizzaface 
				break;
				case "PN":
						sprite_index = spr_thecrum
					break;
			}

var r = room_get_name(room)
if string_starts_with(r, "dragonlair_")
sprite_index = spr_pizzaface_old