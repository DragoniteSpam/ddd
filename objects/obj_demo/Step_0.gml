var mspd = 0.5
var xspeed = 0;
var yspeed = 0;
var zspeed = 0;

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

x += xspeed;
y += yspeed;
z += zspeed;