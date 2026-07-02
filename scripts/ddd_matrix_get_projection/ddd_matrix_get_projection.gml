/// Gets the global GPU projection matrix. This function should be called in place of
/// `matrix_get(matrix_projection)`. You may specify an optional "result matrix" that will be
/// overwritten by the current projection matrix. If no result matrix is specified then this
/// function will return a new matrix.
/// 
/// @param [resultMatrix]

function ddd_matrix_get_projection(result_matrix = undefined)
{
    if (result_matrix == undefined)
    {
        // feather ignore once GM1023
        if (DDD_NORMATIVE)
        {
            return matrix_get(matrix_projection);
        }
        else
        {
            result_matrix = matrix_get(matrix_projection, result_matrix);
            return ddd_matrix_fix_projection(result_matrix, result_matrix);
        }
    }
    else
    {
        // feather ignore once GM1023
        if (DDD_NORMATIVE)
        {
            matrix_get(matrix_projection, result_matrix);
            return result_matrix;
        }
        else
        {
            return ddd_matrix_fix_projection(matrix_get(matrix_projection, result_matrix), result_matrix);
        }
    }
}