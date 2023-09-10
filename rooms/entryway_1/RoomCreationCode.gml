global.roommessage = "WELCOME TO SUGARY SPIRE"
if (global.panic)
{
	var lay = layer_get_id("Backgrounds_stillH1")
	layer_background_sprite(layer_background_get_id(lay), bg_entrywayescapeclouds)
	var lay2 = layer_get_id("Backgrounds_stillH2")
	layer_background_sprite(layer_background_get_id(lay2), bgwafer_escape2)
	var lay3 = layer_get_id("Backgrounds_stillH3")
	layer_background_sprite(layer_background_get_id(lay3), bgwafer_escape1)
	var lay4 = layer_get_id("Backgrounds_scroll")
	layer_background_sprite(layer_background_get_id(lay4), bgwafer_escape4)
	var lay5 = layer_get_id("Backgrounds_sky2")
	layer_background_sprite(layer_background_get_id(lay5), bgwafer_escape5)
}
