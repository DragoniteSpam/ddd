/// Fixes a projection matrix, ready for manually sending to the GPU using GameMaker's native
/// functions. This function will modify the input matrix itself.
/// 
/// You won't normally need to call this function and it is provided for situation where you are
/// handling GPU state yourself.
/// 
/// @param matrix

function ddd_matrix_fix_projection_in_place(matrix)
{
    // feather ignore once GM1023
    if (not DDD_NORMATIVE)
    {
        matrix[@  1] = -matrix[ 1];
        matrix[@  5] = -matrix[ 5];
        matrix[@  9] = -matrix[ 9];
        matrix[@ 13] = -matrix[13];
    }
    
    return matrix;
}