var _data = video_draw()
var _status = _data[0]
if (_status == 0)
{
    var _surface = _data[1]
    draw_surface_stretched(_surface, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]))
}
