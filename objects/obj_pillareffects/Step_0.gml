if (fadealpha > 1)
{
    escapebgs()
    with (obj_escapecollect)
    {
        image_alpha = 1
        instance_create(x, y, obj_genericpoofeffect)
    }
    with (obj_escapecollectbig)
    {
        image_alpha = 1
        instance_create(x, y, obj_genericpoofeffect)
    }
    fadein = 1
}
if (fadein == 0)
    fadealpha += 0.375
else if (fadein == 1)
    fadealpha -= 0.375
if (fadealpha == 0)
    instance_destroy()
