pal_swap_init_system(shd_pal_swapper);
global.roommessage = "PIZZA TOWER ISLAND";
global.gameframe_caption_text = "The most devilish Pizza Tower course";
if !instance_exists(obj_wartimer)
{
instance_create(0,0,obj_wartimer)
fmod_event_one_shot("event:/sfx/ui/wartimerup")
with (obj_wartimer)
{
  addseconds += 70
  alarm[0] = -1
  alarm[2] = 1
}
}