if (!global.option_hud || (instance_exists(obj_chat) && !obj_chat.showhud))
	exit;
var xx = x;
var yy = y;
draw_set_color(c_white);
if (check_char("BN"))
	draw_sprite(spr_comboendBN, 0, xx, yy);
else
	draw_sprite(spr_comboend, 0, xx, yy);

var title = floor(combo / 5);
if (title > (sprite_get_number(spr_comboend_title1) / 2))
{
	title -= (sprite_get_number(spr_comboend_title1) / 2);
	very = true;
}
if (combo >= 80)
	very = true;
if (check_char("SP") or (global.pizzellesugaryoverride && obj_player1.character == "G"))
{
	draw_sprite(spr_comboend_titleSP, min(floor(combo / 5), 24), xx, yy + 30);
}
else if (check_char("BN"))
	draw_sprite(spr_comboend_titleBN, min(floor(combo / 5), 24), xx, yy + 30);
else
	draw_sprite(spr_comboend_title1, (title * 2) + title_index, xx, yy + 30);
draw_set_font(lang_get_font("smallfont"));
draw_set_halign(1);
draw_set_valign(0);
draw_text(xx, yy + 70, comboscoremax);
if (very && !check_char("SP") && (obj_player1.character == "G" && !global.pizzellesugaryoverride))
	draw_sprite(spr_combovery, 0, xx - 65, (yy - 6) + 30);
