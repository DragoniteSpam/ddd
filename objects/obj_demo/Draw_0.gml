draw_clear(c_black);
gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);
gpu_set_cullmode(cull_counterclockwise);

gpu_set_texrepeat(true);
gpu_set_texfilter(false);
shader_set(shd_demo_3d);

vertex_submit(the_floor, pr_trianglelist, sprite_get_texture(spr_demo_floor, 0));

array_foreach(things, function(thing) {
	thing.draw();
});

shader_reset();

gpu_set_ztestenable(false);
gpu_set_zwriteenable(false);
gpu_set_cullmode(cull_noculling);