global.follow = obj_player;
global.resolutionwidth = 1920;// Change this for your width in px
global.resolutionheight = 1080;// Change this for your height in px
global.xcenter = global.resolutionwidth/2 // allows a gui to focus to be scalable centered if referenced
global.ycenter = global.resolutionheight/2 // same as above
window_set_size(global.resolutionwidth,global.resolutionheight);
display_set_gui_size(global.resolutionwidth,global.resolutionheight);

//Enable the use of views
view_enabled = true;

//Make view 0 visible
view_set_visible(0, true);

//Set the port bounds of view 0 to normally 640x480 (1920x1080)
view_set_wport(0, global.resolutionwidth);
view_set_hport(0, global.resolutionheight);

//Resize and center
window_set_rectangle((display_get_width() - view_wport[0]) * 0.5, (display_get_height() - view_hport[0]) * 0.5, view_wport[0], view_hport[0]);
surface_resize(application_surface,view_wport[0],view_hport[0]);

//Camera creation
//Build a camera at (0,0), with size 640x480, 0 degrees of angle, no target instance, instant-jupming hspeed and vspeed, with a 32 pixel border
camera = camera_create_view(0, 0, 1280, 720, 0, -1, -1, -1, 32, 32);

//Set view0 to use the camera "camera"
view_set_camera(0, camera);

//Basic set up
camera_set_view_pos(view_camera[0], 0, 0);
camera_set_view_size(view_camera[0], global.resolutionwidth, global.resolutionheight);

//Setting up object target information
camera_set_view_target(view_camera[0], global.follow);
camera_set_view_speed(view_camera[0], -1, -1);
camera_set_view_border(view_camera[0], 32, 32);

zoom_level = 0.3;
//Get the starting view size to be used for interpolation later
default_zoom_width = camera_get_view_width(view_camera[0]);
default_zoom_height = camera_get_view_height(view_camera[0]);
playerToMouseRatio = 1
