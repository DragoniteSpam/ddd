// Feather disable all

/// Returns the position on the screen where the position in world space would appear. The output
/// position may be be out of the bounds of the screen. The input coordinates should be in world
/// space. You must provide a view and projection matrix but you do not have to provide a world
/// matrix (use `undefined` to not use a world matrix). Despite the name, this function can be used
/// with surfaces etc. so long as the "screen" width/height are the size of the surface.
/// 
/// This function returns a four-element array that contains the x/y/z and w vector components. The
/// x/y coordinates measured in pixels and are aligned to the top-left of the screen with `0, 0`
/// being the top-left corner and `screenWidth,screenHeight` being the bottom-right corner. The z
/// coordinate is normalized such that a value of `0` is at the z-near clipping plane and a value
/// of `1` is that the z-fa clipping plane (a value outside of the range `0` to `1` is therefore
/// outside the frustrum and typically not visible during rendering).
/// 
/// @param x
/// @param y
/// @param [worldMatrix]
/// @param viewMatrix
/// @param projMatrix
/// @param screenWidth
/// @param screenHeight

function ddd_world_to_screen(x, y, z, world_matrix = undefined, view_matrix, proj_matrix, screen_width, screen_height)
{
    var result = ddd_world_to_frustrum(x, y, z, world_matrix, view_matrix, proj_matrix);
    result[@ 0] =  screen_width*(0.5 + 0.5*result[0]);
    result[@ 1] = screen_height*(0.5 + 0.5*result[1]);
    return result;
}