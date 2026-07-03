draw_surface_stretched(surf_shadowmap_near, 0, 0, 256, 256);
draw_surface_stretched(surf_shadowmap_far, 256, 0, 256, 256);

// draw a red circle at the world origin
var point = ddd_world_to_screen(0, 0, 0, undefined, view_mat, proj_mat, display_get_gui_width(), display_get_gui_height());
if ((point[2] >= 0) && (point[2] <= 1))
{
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text_colour(point[0], point[1] - 32, "World origin", c_red, c_red, c_red, c_red, 1);
    draw_circle_colour(point[0], point[1], 10, c_red, c_red, false);
}