function escapebgs()
{
    if (global.panic)
    {
	if (room == entryway_11)
     {
			var lay = layer_get_id("Backgrounds_sky2")
			layer_background_sprite(layer_background_get_id(lay), entryway_endroomescape5)
			var lay2 = layer_get_id("Backgrounds_stillH2")
			layer_background_sprite(layer_background_get_id(lay2), entryway_endroomescape4)
			var lay3 = layer_get_id("Backgrounds_stillH3")
			layer_background_sprite(layer_background_get_id(lay3), entryway_endroomescape3)
			var lay4 = layer_get_id("Backgrounds_scroll")
			layer_background_sprite(layer_background_get_id(lay4), entryway_endroomescape2)
			var lay5 = layer_get_id("Backgrounds_sky")
			layer_background_sprite(layer_background_get_id(lay5), entryway_endroomescape1)
		}
    }
}

