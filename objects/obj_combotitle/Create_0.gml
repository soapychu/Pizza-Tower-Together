title_index = 0;
title = 0;
vsp = 0;
alarm[1] = 120;
depth = -300;
alarm[0] = 3;
image_speed = 0;
sugary = false;
depth = -100;
x = 832;
y = 290;
ystart = y;
very = false;
afterimages = array_create(0);
fmod_event_one_shot("event:/sfx/ui/comboup");

if (check_char("BN"))
	sprite_index = spr_comboend_titleBN;
sugary = check_char("SP");

if (sugary) {
	sprite_index = spr_comboend_titleSP;
	ystart -= 50;
	
	title_index_step = 0;
	title_index = 0;

	real_title_num = floor(global.combo / 4);
	title_num = min(real_title_num, 24);
	very = false;//real_title_num > 24;
}
else {
	real_title_num = floor(global.combo / 5);
	title_num = real_title_num % 16 * 2;
	very = real_title_num > 16;
	title_index_step = 0;
	title_index = 0;

}

alarm[1] = 120;
//alarm[0] = 3;

fmod_event_one_shot(sfx_comboup);
