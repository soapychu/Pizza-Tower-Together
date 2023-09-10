/// @description Drawing Sprite
if room == Mainmenu or room == rank_room or room != data.room exit;

try {
	var tex = noone;
	if data.paletteTexture != "noone" && data.paletteTexture != "" {
		tex = asset_get_index(data.paletteTexture);
		pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, tex)
	}
	pal_swap_set(asset_get_index(data.paletteSprite), data.palette, false);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, angle, image_blend, image_alpha)
} catch (e) {
	trace(e)
	draw_sprite_ext(spr_player_hurt, -1, x, y, image_xscale, image_yscale, angle, image_blend, image_alpha)
}
pattern_reset();
