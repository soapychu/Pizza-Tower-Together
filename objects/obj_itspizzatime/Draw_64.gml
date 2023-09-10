var spr = spr_itspizzatime;
if obj_player1.character == "SP" or (global.pizzellesugaryoverride && obj_player1.character == "G")
	spr = spr_sugarrush;
draw_sprite(spr, -1, SCREEN_WIDTH / 2, up);
