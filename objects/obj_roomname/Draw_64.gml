if (room == Mainmenu || room == tower_soundtest)
	exit;
draw_set_font(lang_get_font("smallfont"));
draw_set_halign(1);
draw_set_valign(0);
draw_set_color(c_white);
if check_sugary()
draw_sprite(spr_roomnamebgSS, 0, xi, yi);
else
draw_sprite(spr_roomnamebg, 0, xi, yi);
draw_text(xi, yi, msg);
