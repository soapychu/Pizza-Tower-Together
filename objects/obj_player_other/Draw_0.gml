if !Online exit;
if room == Mainmenu or room == rank_room or room != data.room exit;

// Drawing Name
var color = global.colors[?data.color]
if is_undefined(color)
	color = c_white
if data.admin
	color = c_orange
draw_set_colour(make_colour_hsv(color_get_hue(color), color_get_saturation(color), color_get_value(color) * (color_get_value(image_blend) / 255)));
draw_set_font(global.font_small);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_alpha(image_blend);
    
var yy = clamp(sprite_get_bbox_top(sprite_index) + y - 75, 0, room_height - 16);
var txt = global.Net_Admin ? string("{0} ({1})", data.name, string(data.id)) : data.name
draw_text(x, yy, txt);

draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_colour(c_white);
