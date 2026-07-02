/// Sets a shader uniform to a projection matrix, after applying any necessary fixes.
/// 
/// @param uniformID
/// @param projectionMatrix

function ddd_shader_set_uniform_projection_matrix(uniform_id, projection_matrix)
{
    static static_matrix = array_create(16);
    shader_set_uniform_f_array(uniform_id, DDD_NORMATIVE? projection_matrix : ddd_matrix_fix_projection(projection_matrix, static_matrix));
}