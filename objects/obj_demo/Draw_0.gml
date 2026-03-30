draw_clear(c_black);
gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);
gpu_set_cullmode(cull_counterclockwise);

gpu_set_texrepeat(true);
gpu_set_texfilter(false);
gpu_set_alphatestenable(true);
gpu_set_alphatestref(10);

vertex_submit(the_floor, pr_trianglelist, sprite_get_texture(spr_demo_floor, 0));

array_foreach(things, function(thing) {
	thing.draw();
});

gpu_set_ztestenable(false);
gpu_set_zwriteenable(false);
gpu_set_cullmode(cull_noculling);