/// Sets the global GPU projection matrix. This function should be called in place of
/// `matrix_set(matrix_projection, matrix)`.
/// 
/// @param projectionMatrix

function ddd_matrix_set_projection(matrix)
{
    static static_matrix = matrix_build_identity();
    
    // feather ignore once GM1023
    matrix_set(matrix_projection, DDD_NORMATIVE? matrix : ddd_matrix_fix_projection(matrix, static_matrix));
}