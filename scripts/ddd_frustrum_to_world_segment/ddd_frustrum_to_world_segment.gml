// Feather disable all

/// Returns a line segment determined by shooting a ray through a frustrum from the near clipping
/// plane to the far clipping plane. You must input normalised x/y values to indicate where the
/// line starts on the near-plane of the frustrum. An x/y value of `-1, -1` is the top-left corner
/// and `+1, +1` is the bottom-right corner. `0, 0` is the center of the frustrum which is often
/// what you want for mouse selection and raycasting in general.
/// 
/// This function returns an array with two elements which are the start and end points for the
/// line segment. Each point is itself an array with four elements which are the x/y/z and w
/// components for each point. The x/y/z coordinates for both points are in world space.
/// 
/// @param x
/// @param y
/// @param viewMatrix
/// @param projMatrix

function ddd_frustrum_to_world_segment(x, y, view_matrix, proj_matrix)
{
    static result_static = [[0, 0, 0, 1], [0, 0, 0, 1]];
    var result_a = result_static[0];
    var result_b = result_static[1];
    
    static matrix_inverse_static = array_create(16, 0);
    var inverse_matrix = matrix_inverse_static;
    
    matrix_multiply(view_matrix, proj_matrix, inverse_matrix);
    matrix_inverse(inverse_matrix, inverse_matrix); //woah
    
    matrix_transform_vertex(inverse_matrix, x, -y, 0, 1, result_a);
    var _w = result_a[3];
    result_a[@ 0] /= _w;
    result_a[@ 1] /= _w;
    result_a[@ 2] /= _w;
    result_a[@ 3]  =  1;
    
    matrix_transform_vertex(inverse_matrix, x, -y, 1, 1, result_b);
    var _w = result_b[3];
    result_b[@ 0] /= _w;
    result_b[@ 1] /= _w;
    result_b[@ 2] /= _w;
    result_b[@ 3]  =  1;
    
    return result_static;
}