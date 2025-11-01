// Feather disable all

/// Returns the position on the frustrum where the position in world space would appear. The output
/// position may be be out of the bounds of the screen. The input coordinates should be in world
/// space. You must provide a view and projection matrix but you do not have to provide a world
/// matrix (use `undefined` to not use a world matrix).
/// 
/// This function returns a four-element array that contains the x/y/z and w vector components. The
/// x/y coordinates are normalized where the center of frustum has an x/y coordinate of `0, 0`.
/// `-1, -1` is  the top-left corner and `+1, +1` is the bottom-right corner. The z coordinate is
/// also normalized such that a value of `0` is at the z-near clipping plane and a value of `1` is
/// that the z-fa clipping plane (a value outside of the range `0` to `1` is therefore outside the
/// frustrum and typically not visible during rendering).
/// 
/// @param x
/// @param y
/// @param [worldMatrix]
/// @param viewMatrix
/// @param projMatrix

function ddd_world_to_frustrum(x, y, z, world_matrix = undefined, view_matrix, proj_matrix)
{
    static result_static = [0, 0, 0, 1];
    var result = result_static;
    
    if (world_matrix != undefined)
    {
        matrix_transform_vertex(world_matrix, x, y, z, 1, result);
        matrix_transform_vertex(view_matrix, result[0], result[1], result[2], result[3], result);
    }
    else
    {
        matrix_transform_vertex(view_matrix, x, y, z, 1, result);
    }
    
    matrix_transform_vertex(proj_matrix, result[0], result[1], result[2], result[3], result);
    
    var _w = result[3];
    result[@ 0] /= _w;
    result[@ 1] /= _w;
    result[@ 2] /= _w;
    result[@ 3]  =  1;
    return result;
}