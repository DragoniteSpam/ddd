// Feather disable all

/// Returns a four-element array that contains a transform vector where the x/y/z components have
/// been divided by the w component.
/// 
/// @param matrix
/// @param x
/// @param y
/// @param z
/// @param w
/// @param [result_array]

function ddd_matrix_transform_vertex_div_w(matrix, x, y, z, w, result_array = [])
{
    matrix_transform_vertex(matrix, x, y, z, w, result_array);
    
    var vector_w = result_array[3];
    if (vector_w == 0)
    {
        //Avoid NaN and infinity
        result_array[@ 0] *= 999_999_999;
        result_array[@ 1] *= 999_999_999;
        result_array[@ 2] *= 999_999_999;
        result_array[@ 3]  = 0;
    }
    else
    {
        result_array[@ 0] /= vector_w;
        result_array[@ 1] /= vector_w;
        result_array[@ 2] /= vector_w;
        result_array[@ 3]  = 1;
    }
    
    return result_array;
}