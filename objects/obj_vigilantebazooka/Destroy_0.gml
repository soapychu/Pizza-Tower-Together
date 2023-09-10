if friendly 
{
instance_create(x, y, obj_dynamiteexplosion)
obj_bazookatrail = obj_vigilantebazookatrailfriendly
}
else
instance_create(x, y, obj_canonexplosion);
with (instance_create(x + (image_xscale * 40), y - (image_xscale * 20), obj_bazookatrail))
	image_xscale = other.image_xscale;
with (instance_create(x - (image_xscale * 40), y - (image_xscale * 20), obj_bazookatrail))
	image_xscale = -other.image_xscale;
