var newX = (obj_player.x * (1 - playerToMouseRatio)) + (mouse_x * playerToMouseRatio);
var newY = (obj_player.y * (1 - playerToMouseRatio)) + (mouse_y * playerToMouseRatio);

camera_set_view_pos(view_camera[0],
                    clamp( camera_get_view_x(view_camera[0]), 0, room_width - camera_get_view_width(view_camera[0]) ),
                    clamp( camera_get_view_y(view_camera[0]), 0, room_height - camera_get_view_height(view_camera[0]) ));
					
//Move the zoom level based on mouse scrolling. Clamp the value so stuff doesn't get too silly.
zoom_level = clamp(zoom_level + (((mouse_wheel_down() - mouse_wheel_up())) * 0.1), 0.1, 5);

//Get current size
var view_w = camera_get_view_width(view_camera[0]);
var view_h = camera_get_view_height(view_camera[0]);

//Set the rate of interpolation
var rate = 0.2;

//Get new sizes by interpolating current and target zoomed size
var new_w = lerp(view_w, zoom_level * default_zoom_width, rate);
var new_h = lerp(view_h, zoom_level * default_zoom_height, rate);

//Apply the new size
camera_set_view_size(view_camera[0], new_w, new_h);

//Get the shift necessary to re-align the view.
var shift_x = camera_get_view_x(view_camera[0]) - (new_w - view_w) * 0.5;
var shift_y = camera_get_view_y(view_camera[0]) - (new_h - view_h) * 0.5;

//Update the view position
camera_set_view_pos(view_camera[0],shift_x, shift_y);

//Get target view position and size. size is halved so the view will focus around its center
var vpos_x = camera_get_view_x(view_camera[0]);
var vpos_y = camera_get_view_y(view_camera[0]);
var vpos_w = camera_get_view_width(view_camera[0]) * 0.5;
var vpos_h = camera_get_view_height(view_camera[0]) * 0.5;

//The interpolation rate
var rate = 0.2;

//Interpolate the view position to the new, relative position.
var new_x = lerp(vpos_x, obj_player.x - vpos_w, rate);
var new_y = lerp(vpos_y, obj_player.y - vpos_h, rate);
//Update the view position
camera_set_view_pos(view_camera[0], new_x, new_y);
/*What does this do? Let's break it down:
-Adjust the zoom level, based on how the mouse is currently scrolling - mouse up zooms in while mouse down zooms out. The zoom level is also clamp to prevent over-zooming
-Get the current size of the view
-Set to interpolation rate - makes it easier to change later
-Figure out what the new sizes should by interpolating the current view size to the original size, multiplied by the zoom level
-Update the view size
*/

