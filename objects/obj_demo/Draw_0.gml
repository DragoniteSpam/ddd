draw_clear(c_black);
gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);
gpu_set_cullmode(cull_counterclockwise);

gpu_set_texrepeat(true);
gpu_set_texfilter(false);
shader_set(shd_demo_3d);

gpu_set_texrepeat_ext(shader_get_sampler_index(shd_demo_3d, "samp_shadowmap"), true);
texture_set_stage(shader_get_sampler_index(shd_demo_3d, "samp_shadowmap"), surface_get_texture(surf_shadowmap));
shader_set_uniform_f_array(shader_get_uniform(shd_demo_3d, "u_lightViewMat"), light_matrices.view_matrix);
shader_set_uniform_f_array(shader_get_uniform(shd_demo_3d, "u_lightProjMat"), light_matrices.proj_matrix);

vertex_submit(the_floor, pr_trianglelist, sprite_get_texture(spr_demo_floor, 0));

array_foreach(things, function(thing) {
	thing.draw();
});

shader_reset();

gpu_set_ztestenable(false);
gpu_set_zwriteenable(false);
gpu_set_cullmode(cull_noculling);