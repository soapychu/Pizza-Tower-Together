global.roommessage = "NAILED IT"
if (global.panic)
{
	var lay = layer_get_id("Backgrounds_stillH1")
	layer_background_sprite(layer_background_get_id(lay), bg_escapebuildingsentryway2)
	var lay2 = layer_get_id("Backgrounds_stillH2")
	layer_background_sprite(layer_background_get_id(lay2), bg_escapebuildingsentryway)
	var lay3 = layer_get_id("Backgrounds_sky")
	layer_background_sprite(layer_background_get_id(lay3), bgwafer_escape3)
	var lay4 = layer_get_id("Backgrounds_scroll")
	layer_background_sprite(layer_background_get_id(lay4), bg_entrywayescapemoon)
	var lay5 = layer_get_id("Backgrounds_sky2")
	layer_background_sprite(layer_background_get_id(lay5), bg_entrywaynightsky)
}
