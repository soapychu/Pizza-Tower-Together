var _type = ds_map_find_value(async_load, "type")
if (_type == "video_start")
    displayVideo = 1
else if (_type == "video_end")
{
    if displayVideo
    {
        event_user(0)
        video_close()
    }
}
