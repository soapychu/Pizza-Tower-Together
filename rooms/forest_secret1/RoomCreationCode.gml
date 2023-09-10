pal_swap_init_system(shd_pal_swapper);
global.roommessage = "TARGET PRATICE";

if !check_char("G")
{
var lay = layer_get_id("Tiles_1")
var lay2 = layer_get_id("Tiles_2")
var lay3 = layer_get_id("Instances_2")
layer_destroy(lay)
layer_destroy(lay2)
layer_destroy_instances(lay3)
}
else
{
var lay = layer_get_id("Tiles_3")
var lay2 = layer_get_id("Tiles_4")
var lay3 = layer_get_id("Instances_3")
layer_destroy(lay)
layer_destroy(lay2)
layer_destroy_instances(lay3)
}