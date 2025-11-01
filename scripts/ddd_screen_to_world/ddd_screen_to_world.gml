// Feather disable all

/// Returns a line segment determined by a ray shot through a frustrum. The x/y coordinates are in
/// pixels with `0, 0` being the top-left corner. Despite the name, this function can be used with
/// surfaces etc. so long as the "screen" width/height are are the size of the surface.
/// 
/// TThis function returns a four-element array that contains the x/y/z and w vector components.
/// The x/y/z coordinates are in world-space.
/// 
/// @param x
/// @param y
/// @param z
/// @param viewMatrix
/// @param projMatrix
/// @param screenWidth
/// @param screenHeight

function ddd_screen_to_world(x, y, z, view_matrix, proj_matrix, screen_width, screen_height)
{
    return ddd_frustrum_to_world(2*(x / screen_width) - 1, 2*(y / screen_height) - 1, z, view_matrix, proj_matrix);
}