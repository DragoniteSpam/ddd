var xto = x + dcos(look_direction) * dcos(look_pitch);
var yto = y - dsin(look_direction) * dcos(look_pitch);
var zto = z - dsin(look_pitch);
view_mat = matrix_build_lookat(x, y, z, xto, yto, zto, 0, 0, 1);
proj_mat = matrix_build_projection_perspective_fov(60, window_get_width() / window_get_height(), 1, 500);

var proj_mat_light_near = matrix_build_projection_perspective_fov(60, window_get_width() / window_get_height(), 1, 150);
var proj_mat_light_far = matrix_build_projection_perspective_fov(60, window_get_width() / window_get_height(), 150, 500);

if (!surface_exists(surf_shadowmap_near)) {
	surf_shadowmap_near = surface_create(2048, 2048);
}

if (!surface_exists(surf_shadowmap_far)) {
	surf_shadowmap_far = surface_create(1024, 1024);
}

surface_set_target(surf_shadowmap_near);

	draw_clear(c_white);
	gpu_set_ztestenable(true);
	gpu_set_zwriteenable(true);
	
	ddd_matrices_build_directional_light(-1, -1, -1, view_mat, proj_mat_light_near, -250, light_matrices_near);
	matrix_set(matrix_view, light_matrices_near.view_matrix);
	ddd_matrix_set_projection(light_matrices_near.proj_matrix);
	
    shader_set(shd_demo_shadowmap);
	array_foreach(things, function(thing) {
		thing.draw();
	});
    shader_reset();
	
	gpu_set_ztestenable(false);
	gpu_set_zwriteenable(false);

surface_reset_target();

surface_set_target(surf_shadowmap_far);

	draw_clear(c_white);
	gpu_set_ztestenable(true);
	gpu_set_zwriteenable(true);
	
	ddd_matrices_build_directional_light(-1, -1, -1, view_mat, proj_mat_light_far, -250, light_matrices_far);
	matrix_set(matrix_view, light_matrices_far.view_matrix);
	ddd_matrix_set_projection(light_matrices_far.proj_matrix);
    
    shader_set(shd_demo_shadowmap);
	array_foreach(things, function(thing) {
		thing.draw();
	});
    shader_reset();
	
	gpu_set_ztestenable(false);
	gpu_set_zwriteenable(false);

surface_reset_target();


matrix_set(matrix_view, view_mat);
ddd_matrix_set_projection(proj_mat);