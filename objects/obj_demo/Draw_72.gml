var xto = x + dcos(look_direction) * dcos(look_pitch);
var yto = y - dsin(look_direction) * dcos(look_pitch);
var zto = z - dsin(look_pitch);
var view_mat = ddd_matrix_build_lookat(x, y, z, xto, yto, zto, 0, 0, 1);
var proj_mat = ddd_matrix_build_projection_perspective_fov(60, window_get_width() / window_get_height(), 1, 500);

if (!surface_exists(surf_shadowmap)) {
	surf_shadowmap = surface_create(2048, 2048, surface_r32float);
}

surface_set_target(surf_shadowmap);

	draw_clear(c_black);
	gpu_set_ztestenable(true);
	gpu_set_zwriteenable(true);
	
	light_matrices = ddd_matrices_build_directional_light(-1, -1, -1, view_mat, proj_mat, 0);
	
	matrix_set(matrix_view, light_matrices.view_matrix);
	matrix_set(matrix_projection, light_matrices.proj_matrix);

	array_foreach(things, function(thing) {
		thing.draw();
	});
	
	gpu_set_ztestenable(false);
	gpu_set_zwriteenable(false);

surface_reset_target();

matrix_set(matrix_view, view_mat);
matrix_set(matrix_projection, proj_mat);