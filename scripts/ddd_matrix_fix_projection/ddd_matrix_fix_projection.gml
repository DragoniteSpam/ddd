/// Fixes a projection matrix, ready for manually sending to the GPU using GameMaker's native
/// functions. You may specify a "result matrix" will will be set to the fixed projection matrix.
/// 
/// You won't normally need to call this function and it is provided for situation where you are
/// handling GPU state yourself.
/// 
/// @param matrix
/// @param [resultMatrix]

function ddd_matrix_fix_projection(matrix, result_matrix = undefined)
{
    result_matrix ??= array_create(16);
    
    if (matrix != result_matrix)
    {
        array_copy(result_matrix, 0, matrix, 0, 16);
    }
    
    // feather ignore once GM1023
    if (not DDD_NORMATIVE)
    {
        result_matrix[@  1] = -result_matrix[ 1];
        result_matrix[@  5] = -result_matrix[ 5];
        result_matrix[@  9] = -result_matrix[ 9];
        result_matrix[@ 13] = -result_matrix[13];
    }
    
    return result_matrix;
}