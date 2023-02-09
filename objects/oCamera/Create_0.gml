
application_surface_enable(true);
//application_surface_draw_enable(false);
view_surf = -1;

screenShake = false;

state = "BASE";

Multiplier = 10;
Speed = 5;

Follow = oPlayerTopDown;

Intensity = 1;
FFDuration = 100;

//base_width = 1920/6;
//base_height = 1080/6;

view_width = 3460/Multiplier;
view_height = 1800/Multiplier;


window_scale = 5;

window_set_size(view_width*window_scale,view_height*window_scale);

surface_resize(application_surface,view_width*window_scale, view_height*window_scale);

alarm[1] = 1;


