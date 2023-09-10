function ds_map_find_key(map, val) {
	var keys = ds_map_keys_to_array(global.colors)
	for (var i = 0; i < array_length(keys); i++) {
		if map[?keys[i]] == val
			return keys[i]
	}
}