// Feather disable all

/// Returns a struct that contains two member variables `.view_matrix` and `.proj_matrix` that give
/// the correct transform matrices to render shadows for a directional light. Such a light will
/// have parallel rays and is suitable for sunlight etc.
/// 
/// N.B. This is an expensive function relative to other matrix builders so its return values
///      should be cached where possible.
/// 
/// You should provide a `dx` `dy` `dz` vector (which doesn't need to be normalized) which defines
/// the direction of the light. The two matrices that this function requires should be the matrices
/// used to render the player's viewpoint. `zNearOffset` is helpful to capture geometry that should
/// cast a shadow without specifically being inside the light's frustrum.
/// 
/// @param dx
/// @param dy
/// @param dz
/// @param cameraViewMatrix
/// @param cameraProjMatrix
/// @param [zNearOffset=0]
/// @param [resultStruct]

function ddd_matrices_build_directional_light(dx, dy, dz, cam_view_matrix, cam_proj_matrix, near_offset = 0, result_struct = undefined)
{
    static result_struct_static = {
        view_matrix: matrix_build_identity(),
        proj_matrix: matrix_build_identity(),
    };
    
    static light_view_matrix_static = matrix_build_identity();
    var light_view_matrix = light_view_matrix_static;
    
    static frustrum_array_static = array_create_ext(8, function() { return [0, 0, 0, 1]; });
    var frustrum_array = frustrum_array_static;
    
    //Build an inverse lookat matrix
    ddd_matrix_build_lookat(-dx, -dy, -dz,   0,0,0,   (dz == 0)? 1 : 0,0,-sign(dz),   light_view_matrix);
    
    //Find all corners of the frustrum in world space from the perspective of the light
    with(ddd_frustrum_corners(cam_view_matrix, cam_proj_matrix))
    {
        var cached = tl_near; matrix_transform_vertex(light_view_matrix, cached[0], cached[1], cached[2], 1, frustrum_array[0]);
        var cached = tr_near; matrix_transform_vertex(light_view_matrix, cached[0], cached[1], cached[2], 1, frustrum_array[1]);
        var cached = bl_near; matrix_transform_vertex(light_view_matrix, cached[0], cached[1], cached[2], 1, frustrum_array[2]);
        var cached = br_near; matrix_transform_vertex(light_view_matrix, cached[0], cached[1], cached[2], 1, frustrum_array[3]);
        
        var cached = tl_far; matrix_transform_vertex(light_view_matrix, cached[0], cached[1], cached[2], 1, frustrum_array[4]);
        var cached = tr_far; matrix_transform_vertex(light_view_matrix, cached[0], cached[1], cached[2], 1, frustrum_array[5]);
        var cached = bl_far; matrix_transform_vertex(light_view_matrix, cached[0], cached[1], cached[2], 1, frustrum_array[6]);
        var cached = br_far; matrix_transform_vertex(light_view_matrix, cached[0], cached[1], cached[2], 1, frustrum_array[7]);
    }
    
    //Find the axis-aligned bounding box for the frustrum in world space
    var left   =  infinity;
    var top    =  infinity;
    var near   =  infinity;
    var right  = -infinity;
    var bottom = -infinity;
    var far    = -infinity;
    
    var _i = 0;
    repeat(8)
    {
        var position = frustrum_array[_i];
        var pos_x = position[0];
        var pos_y = position[1];
        var pos_z = position[2];
        
        left = min(left, pos_x);
        top  = min(top,  pos_y);
        near = min(near, pos_z);
        
        right  = max(right,  pos_x);
        bottom = max(bottom, pos_y);
        far    = max(far,    pos_z);
        
        ++_i;
    }
    
    with(result_struct ?? result_struct_static)
    {
        view_matrix = light_view_matrix;
        proj_matrix = ddd_matrix_build_projection_ortho_off_center(left, top, right, bottom, near + near_offset, far, self[$ "proj_matrix"]);
        return self;
    }
}