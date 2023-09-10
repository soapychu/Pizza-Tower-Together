if room != boss_pizzaface
alarm[0] = 200 + irandom(200);
else
alarm[0] = 500 + irandom(200);
instance_create(irandom_range(100, room_width - 100), 0, obj_pizzaface_thunder);
