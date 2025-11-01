// Feather disable all

/// Converts a point in projection space into a point in world space. You must input normalised x/y
/// values to indicate where the point is in the frustrum. An x/y value of `-1, -1, 0` is the top-
/// left-near corner and `+1, +1, +1` is the bottom-right-far corner. Please be mindful of the
/// range of the z coordinate: its range is from `0` to `1` whereas the range of the x/y
/// coordinates is from `-1, -1` to `+1, +1`.
/// 
/// TThis function returns a four-element array that contains the x/y/z and w vector components.
/// The x/y/z coordinates are in world-space.
/// 
/// @param x
/// @param y
/// @param z
/// @param viewMatrix
/// @param projMatrix

function ddd_frustrum_to_world(x, y, z, view_matrix, proj_matrix)
{
    static result_static = [0, 0, 0, 1];
    var result = result_static;
    
    static matrix_inverse_static = array_create(16, 0);
    var inverse_matrix = matrix_inverse_static;
    
    matrix_multiply(view_matrix, proj_matrix, inverse_matrix);
    matrix_inverse(inverse_matrix, inverse_matrix); //woah
    
    matrix_transform_vertex(inverse_matrix, x, -y, z, 1, result);
    var _w = result[3];
    result[@ 0] /= _w;
    result[@ 1] /= _w;
    result[@ 2] /= _w;
    result[@ 3]  =  1;
    
    return result;
}