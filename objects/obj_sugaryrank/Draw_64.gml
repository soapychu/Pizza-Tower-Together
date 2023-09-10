#region //BG Sprite
	pal_swap_set(rankpal, paltime, 0);
	draw_sprite_tiled_ext(bgspr, bgdex, bgx, bgy, 1, 1, c_white, totalalpha);	
	shader_reset();
#endregion
#region //clipboard
	draw_sprite_ext(rankclipboard, 0, 716, 271 + clipy, 1, 1, 0, c_white, 1);	
#endregion
#region //Highest Combo
var i = 0
var _string = round(string(global.highest_combo)), _string_length = string_length(_string);
draw_set_font(global.combofontrank)
draw_set_alpha(totalalpha)
draw_set_halign(fa_center);
for (var i = 0; i < _string_length; i++) 
		{
			var _xx = 850 + (-(string_width(_string) / 2) + ((30 * i)))
			var _yyoffset = (i % 2 == 0 ? -4 : 0)
			draw_text(_xx, 105 + clipy, string_char_at(_string,i + 1));
			shader_reset();
		}
#endregion
#region secrets
	//draw_sprite_ext(spr_rankcloud, 1, 591, 289, 1, 1, 0, c_white, totalalpha)
	if (check_char("SP") || check_char("SN"))
	{	
		draw_sprite_ext(card1spr, carddex1, 649 + (cshake1 ? irandom_range(-2, 2) : 0), 325 + (cshake1 ? irandom_range(-2, 2) : 0) + clipy, 1, 1, 0, c_white, 1)
		draw_sprite_ext(card2spr, carddex2, 723 + (cshake2 ? irandom_range(-2, 2) : 0), 325 + (cshake2 ? irandom_range(-2, 2) : 0) + clipy, 1, 1, 0, c_white, 1)
		draw_sprite_ext(card3spr, carddex3, 798 + (cshake3 ? irandom_range(-2, 2) : 0), 325 + (cshake3 ? irandom_range(-2, 2) : 0) + clipy, 1, 1, 0, c_white, 1)
	}
	else
	{
		draw_sprite_ext(card1spr, carddex1, 679 + (cshake1 ? irandom_range(-2, 2) : 0), 325 + (cshake1 ? irandom_range(-2, 2) : 0) + clipy, 1, 1, 0, c_white, 1)
		draw_sprite_ext(card2spr, carddex2, 753 + (cshake2 ? irandom_range(-2, 2) : 0), 325 + (cshake2 ? irandom_range(-2, 2) : 0) + clipy, 1, 1, 0, c_white, 1)
		draw_sprite_ext(card3spr, carddex3, 828 + (cshake3 ? irandom_range(-2, 2) : 0), 325 + (cshake3 ? irandom_range(-2, 2) : 0) + clipy, 1, 1, 0, c_white, 1)
	}
#endregion
#region treasure found
	//draw_sprite_ext(spr_rankcloud, 1, 591, 289, 1, 1, 0, c_white, totalalpha)
	if jandraw = 1
	draw_sprite_ext(janspr, 0, 558, 88 + clipy, janscale, janscale, 0, c_white, 1)
#endregion
#region toppins
	if (check_char("SP") || check_char("SN"))
	{
		draw_sprite_ext(mallowspr, mallowdex, 514 + (shake1 ? irandom_range(-2, 2) : 0), 190 + (shake1 ? irandom_range(-2, 2) : 0) + clipy, 1, 1, 0, c_white, 1);
		draw_sprite_ext(chocospr, chocodex, 594 + (shake2 ? irandom_range(-2, 2) : 0), 186 + (shake2 ? irandom_range(-2, 2) : 0) + clipy, 1, 1, 0, c_white, 1);
		draw_sprite_ext(crackspr, crackdex, 677 + (shake3 ? irandom_range(-2, 2) : 0), 187 + (shake3 ? irandom_range(-2, 2) : 0) + clipy, 1, 1, 0, c_white, 1);
		draw_sprite_ext(wormspr, wormdex, 754 + (shake4 ? irandom_range(-2, 2) : 0), 195 + (shake4 ? irandom_range(-2, 2) : 0) + clipy, 1, 1, 0, c_white, 1);
		draw_sprite_ext(candyspr, candydex, 828 + (shake5 ? irandom_range(-2, 2) : 0), 199 + (shake5 ? irandom_range(-2, 2) : 0) + clipy, 1, 1, 0, c_white, 1);
	}
	else
	{
		draw_sprite_ext(mallowspr, mallowdex, 514 + (shake1 ? irandom_range(-2, 2) : 0), 175 + (shake1 ? irandom_range(-2, 2) : 0) + clipy, 1, 1, 0, c_white, 1);
		draw_sprite_ext(chocospr, chocodex, 594 + (shake2 ? irandom_range(-2, 2) : 0), 186 + (shake2 ? irandom_range(-2, 2) : 0) + clipy, 1, 1, 0, c_white, 1);
		draw_sprite_ext(crackspr, crackdex, 677 + (shake3 ? irandom_range(-2, 2) : 0), 187 + (shake3 ? irandom_range(-2, 2) : 0) + clipy, 1, 1, 0, c_white, 1);
		draw_sprite_ext(wormspr, wormdex, 754 + (shake4 ? irandom_range(-2, 2) : 0), 195 + (shake4 ? irandom_range(-2, 2) : 0) + clipy, 1, 1, 0, c_white, 1);
		draw_sprite_ext(candyspr, candydex, 828 + (shake5 ? irandom_range(-2, 2) : 0), 199 + (shake5 ? irandom_range(-2, 2) : 0) + clipy, 1, 1, 0, c_white, 1);
	}



	/*if drawmallow == true {}
	if drawchoco == true {}
	if drawcrack == true {}
	if drawworm == true {}
	if drawcandy == true {}*/
#endregion
#region points
	draw_sprite_ext(spr_rankcake, cakedex, 499 + (pshake ? irandom_range(-2, 2) : 0), 430 + (pshake ? irandom_range(-2, 2) : 0) + clipy, 1, 1, 0, c_white, 1)
	var i = 0
	var _string = round(string(countpoint)), _string_length = string_length(_string); //D3G: Holy shit I'm an idiot I've been using string width lmao no wonder it keeps crashing
		if collected != _string
		{
			for (var i = 0; i < _string_length; i++)  //D3G: Idk what is happening anymore
			{
				colors[i] = choose(0,1,2,3,4,5,6)
			}
			collected = _string
		}
	var pal = colors[i];
	draw_set_font(global.candlefont)
	draw_set_alpha(1)
	draw_set_halign(fa_center);
	for (var i = 0; i < _string_length; i++) 
		{
			var _xx = ((pshake ? irandom_range(-2, 2) : 0) + 750) + (-(string_width(_string)/ 2) + ((string_width(_string)/_string_length) * i)), _yy = (pshake ? irandom_range(-2, 2) : 0) + 385, pal = colors[i];
			var _yyoffset = (i % 2 == 0 ? -4 : 0)
			//pal_swap_set(spr_palcandle,pal,false);
			draw_text(_xx, _yy + _yyoffset + clipy, string_char_at(_string,i + 1));
			shader_reset();
		}
#endregion
#region //rank
	//draw_sprite_ext(spr_rank, 0, 725, 108, 1, 1, 0, c_white, 1)
	draw_sprite_ext(rankletter, rankdex, 725, 108 + clipy, rscale, rscale, 0, c_white, 1)
	if stampani = 1 draw_sprite_ext(spr_rankstamp, stampdex, 480, 270 + clipy, 1, 1, 0, c_white, 1)
#endregion
#region //Player
	shader_set(global.Pal_Shader);
	pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, global.palettetexture);
	pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, false);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 1);
	shader_reset();
#endregion
