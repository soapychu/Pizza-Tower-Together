var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
draw_sprite_ext(sprite1122, 0, cx, cy, SCREEN_WIDTH / 64, SCREEN_HEIGHT / 64, 0, c_white, 1);
draw_sprite(spr_mainmenu_bg, 0, obj_screensizer.normal_size_fix_x, 0);
with (obj_menutv2)
	draw_self();
shader_set(global.Pal_Shader);
var _x = SCREEN_WIDTH * 0.50625;
var _y = y;
var pal = obj_player1.paletteselect;
pal = 1;
var tex = -4;
if (currentselect != -1)
{
	pal = global.game_palette[currentselect];
	tex = global.game_palettetexture[currentselect];
}
if (tex != -4)
	pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, tex);
pal_swap_set(spr_peppalette, pal, false);
draw_sprite_ext(sprite_index, image_index, _x, _y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (tex != -4)
    pattern_reset();
shader_reset();
draw_set_font(lang_get_font("bigfont"));
draw_set_halign(1);
draw_set_valign(1);
draw_set_color(c_white);
draw_set_alpha(extrauialpha);
var qx = 0;
var qy = 0;
//draw_sprite(spr_quitgame, 0, qx, qy);
//scr_draw_text_arr(qx + 50, qy + 100, grab_key);
draw_set_font(lang_get_font("bigfont"));
draw_set_halign(1);
draw_set_valign(1);
draw_set_color(c_white);
draw_sprite(spr_controlseggplant, (obj_inputAssigner.player_input_device[0] < 0 ? 0 : 1), 834, 84);
var status_x = 120;
var status_y = 448;
var percentstate_x = 138;
var percentstate_y = 308;
var deletefile_x = 846;
var deletefile_y = 472;
draw_sprite_ext(spr_towerstatusmenu, 0, status_x + 4, status_y + 2, 1, 1, 0, c_black, extrauialpha / 2);
draw_sprite(spr_towerstatusmenu, 0, status_x, status_y);
draw_set_font(global.combofont);
draw_text(status_x + 8, status_y + 10, floor(percvisual));
draw_sprite(spr_percentstatemenu, perstatus_icon, percentstate_x, percentstate_y);
if (john)
	draw_sprite(spr_menu_approvedjohn, 0, percentstate_x - 80, percentstate_y);
if (snotty)
	draw_sprite(spr_menu_approvedsnotty, 0, percentstate_x + 72, percentstate_y);
if (judgement != "none")
{
	var _i = 0;
	switch (judgement)
	{
		case "confused":
			_i = 0;
			break;
		case "quick":
			_i = 1;
			break;
		case "officer":
			_i = 2;
			break;
		case "yousuck":
			_i = 3;
			break;
		case "nojudgement":
			_i = 4;
			break;
		case "notbad":
			_i = 5;
			break;
		case "wow":
			_i = 6;
			break;
		case "holyshit":
			_i = 7;
			break;
	}
	draw_sprite(spr_menu_finaljudgement, _i, percentstate_x, percentstate_y - 82);
}
draw_sprite(spr_deletefile, 0, deletefile_x, deletefile_y);
var dal = 1;
if (currentselect != -1 && global.game_started[currentselect] == 0)
	dal = 0.5;
scr_draw_text_arr(deletefile_x - 67, deletefile_y, taunt_key, c_white, dal);
draw_set_alpha(1);
