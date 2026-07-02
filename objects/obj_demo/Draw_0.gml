draw_clear(c_black);
gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);
gpu_set_cullmode(cull_counterclockwise);

gpu_set_texrepeat(true);
gpu_set_texfilter(false);
shader_set(shd_demo_3d);

texture_set_stage(shader_get_sampler_index(shd_demo_3d, "samp_shadowmap_near"), surface_get_texture_depth(surf_shadowmap_near));
shader_set_uniform_f_array(shader_get_uniform(shd_demo_3d, "u_lightViewMatNear"), light_matrices_near.view_matrix);
ddd_shader_set_uniform_projection_matrix(shader_get_uniform(shd_demo_3d, "u_lightProjMatNear"), light_matrices_near.proj_matrix);

texture_set_stage(shader_get_sampler_index(shd_demo_3d, "samp_shadowmap_far"), surface_get_texture_depth(surf_shadowmap_far));
shader_set_uniform_f_array(shader_get_uniform(shd_demo_3d, "u_lightViewMatFar"), light_matrices_far.view_matrix);
ddd_shader_set_uniform_projection_matrix(shader_get_uniform(shd_demo_3d, "u_lightProjMatFar"), light_matrices_far.proj_matrix);

vertex_submit(the_floor, pr_trianglelist, sprite_get_texture(spr_demo_floor, 0));

array_foreach(things, function(thing) {
	thing.draw();
});

shader_reset();

gpu_set_ztestenable(false);
gpu_set_zwriteenable(false);
gpu_set_cullmode(cull_noculling);