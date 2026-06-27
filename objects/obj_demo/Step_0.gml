if (gamepad == undefined)
{
	var _i = 0;
	repeat(gamepad_get_device_count())
	{
		if (gamepad_button_check_pressed(_i, gp_start))
		{
			show_debug_message($"Swapped to gamepad {_i}");
			gamepad = _i;
            
            window_mouse_set_locked(false);
            mouse_was_locked = false;
            
			break;
		}
		
		++_i;
	}
}
else if (keyboard_check(vk_anykey))
{
	show_debug_message("Swapped to keyboard & mouse");
	gamepad = undefined;
}

var mspd = 0.5
var xspeed = 0;
var yspeed = 0;
var zspeed = 0;

if (gamepad == undefined)
{
	if (keyboard_check(vk_up) || keyboard_check(ord("W"))) {
		xspeed += dcos(look_direction) * mspd;
		yspeed -= dsin(look_direction) * mspd;
		zspeed -= dsin(look_pitch) * mspd;
	}

	if (keyboard_check(vk_down) || keyboard_check(ord("S"))) {
		xspeed -= dcos(look_direction) * mspd;
		yspeed += dsin(look_direction) * mspd;
		zspeed += dsin(look_pitch) * mspd;
	}

	if (keyboard_check(vk_left) || keyboard_check(ord("A"))) {
		xspeed -= dsin(look_direction) * mspd;
		yspeed -= dcos(look_direction) * mspd;
	}

	if (keyboard_check(vk_right) || keyboard_check(ord("D"))) {
		xspeed += dsin(look_direction) * mspd;
		yspeed += dcos(look_direction) * mspd;
	}

	if (mouse_check_button_pressed(mb_middle)) {
		mouse_was_locked = window_mouse_get_locked();
		window_mouse_set_locked(true);
	} else if (mouse_check_button(mb_middle)) {
		var dx = window_mouse_get_delta_x() / 10;
		var dy = window_mouse_get_delta_y() / 10;
		look_direction = (360 + look_direction - dx) % 360;
		look_pitch = clamp(look_pitch + dy, -89, 89);
	} else {
		window_mouse_set_locked(mouse_was_locked);
	}
}
else
{
	var inputh = gamepad_axis_value(gamepad, gp_axislh);
	xspeed += inputh*dsin(look_direction) * mspd;
	yspeed += inputh*dcos(look_direction) * mspd;
	
	var inputv = gamepad_axis_value(gamepad, gp_axislv);
	xspeed -= inputv*dcos(look_direction) * mspd;
	yspeed += inputv*dsin(look_direction) * mspd;
	zspeed += inputv*dsin(look_pitch) * mspd;
	
	zspeed += (gamepad_button_check(gamepad, gp_shoulderr) - gamepad_button_check(gamepad, gp_shoulderl)) * mspd;
	
	var dx = 2*gamepad_axis_value(gamepad, gp_axisrh);
	var dy = 2*gamepad_axis_value(gamepad, gp_axisrv);
	look_direction = (360 + look_direction - dx) % 360;
	look_pitch = clamp(look_pitch + dy, -89, 89);
}



x += xspeed;
y += yspeed;
z += zspeed;

array_foreach(things, function(thing) {
	thing.update();
});