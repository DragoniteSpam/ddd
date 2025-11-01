// Feather disable all

/// Returns a line segment determined by shooting a ray through a frustrum from the near clipping
/// plane to the far clipping plane. The x/y coordinates are measured in pixels with `0, 0` being
/// the top-left corner and `screenWidth, screenHeight` being the bottom-right corner. Despite the
/// name, this function can be used with surfaces etc. so long as the "screen" width/height are the
/// size of the surface.
/// 
/// This function returns an array with two elements which are the start and end points for the
/// line segment. Each point is itself an array with four elements which are the x/y/z and w
/// components for each point. The x/y/z coordinates for both points are in world space.
/// 
/// @param x
/// @param y
/// @param viewMatrix
/// @param projMatrix
/// @param screenWidth
/// @param screenHeight

function ddd_screen_to_world_segment(x, y, view_matrix, proj_matrix, screen_width, screen_height)
{
    return ddd_frustrum_to_world_segment(2*(x / screen_width) - 1, 2*(y / screen_height) - 1, view_matrix, proj_matrix);
}