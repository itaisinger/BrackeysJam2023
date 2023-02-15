// Get current camera position
var camX = camera_get_view_x(camera);
var camY = camera_get_view_y(camera);
var camW = camera_get_view_width(camera);
var camH = camera_get_view_height(camera);

// Panning
if (0 and mouse_check_button(mb_middle)) {
	var move_x = device_mouse_x_to_gui(0) - mouse_x_previous;
	var move_y = device_mouse_y_to_gui(0) - mouse_y_previous;
	
	camX -= move_x * zoom;
	camY -= move_y * zoom;
}


// Zooming
zoom = smooth_approach(zoom,zoom_dest,0.03);

var camWprev = camW, camHprev = camH;
camW = RES_W * zoom;
camH = RES_H * zoom;

//fix after zoom
camX += (camWprev - camW)/2;
camY += (camHprev - camH)/2;

//stay inside room
camX = global.map_player.x - camW/2;
camY = global.map_player.y - camH/2;
camX = clamp(camX, 0, room_width-camW);
camY = clamp(camY, 0, room_height-camH);


// Apply camera position
camera_set_view_size(camera, camW, camH);
camera_set_view_pos(camera, camX, camY);


//Store previous
mouse_x_previous = device_mouse_x_to_gui(0);
mouse_y_previous = device_mouse_y_to_gui(0);