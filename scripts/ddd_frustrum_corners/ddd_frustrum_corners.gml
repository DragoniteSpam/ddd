// Feather disable all

/// Returns a struct that contains the coordinates of each corner of a frustrum in world space.
/// The frustrum is built from the view matrix and projection matrix provided to the function.
/// 
/// @param view_matrix
/// @param proj_matrix

function ddd_frustrum_corners(view_matrix, proj_matrix)
{
    static result = {
        tl_near: [0, 0, 0, 1],
        tr_near: [0, 0, 0, 1],
        bl_near: [0, 0, 0, 1],
        br_near: [0, 0, 0, 1],
        
        tl_far: [0, 0, 0, 1],
        tr_far: [0, 0, 0, 1],
        bl_far: [0, 0, 0, 1],
        br_far: [0, 0, 0, 1],
    };
    
    static inverse_matrix_static = array_create(16, 0);
    var inverse_matrix = inverse_matrix_static;
    
    matrix_multiply(view_matrix, proj_matrix, inverse_matrix)
    matrix_inverse(inverse_matrix, inverse_matrix);
    
    with(result)
    {
        tl_near = ddd_matrix_transform_vertex_div_w(inverse_matrix, -1, -1, 0, 1, tl_near);
        tr_near = ddd_matrix_transform_vertex_div_w(inverse_matrix,  1, -1, 0, 1, tr_near);
        bl_near = ddd_matrix_transform_vertex_div_w(inverse_matrix, -1,  1, 0, 1, bl_near);
        br_near = ddd_matrix_transform_vertex_div_w(inverse_matrix,  1,  1, 0, 1, br_near);
        
        tl_far = ddd_matrix_transform_vertex_div_w(inverse_matrix, -1, -1, 1, 1, tl_far);
        tr_far = ddd_matrix_transform_vertex_div_w(inverse_matrix,  1, -1, 1, 1, tr_far);
        bl_far = ddd_matrix_transform_vertex_div_w(inverse_matrix, -1,  1, 1, 1, bl_far);
        br_far = ddd_matrix_transform_vertex_div_w(inverse_matrix,  1,  1, 1, 1, br_far);
        
        return self;
    }
}