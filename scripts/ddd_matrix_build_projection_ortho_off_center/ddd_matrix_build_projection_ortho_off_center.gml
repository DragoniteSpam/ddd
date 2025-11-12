// Feather disable all

/// Returns an array that contains the row-major orthographic projection matrix for the given
/// parameters. This is implemented in a way that is consistent with the native GameMaker function.
/// Please note that this matrix should *not* be used with `camera_set_proj_mat()` as this function
/// automatically corrects the matrix for the platform the game is running on (but other native
/// functions don't).
/// 
/// Follows the DirectX 9 D3D implementation of d3dxmatrixorthooffcenterlh:
/// https://learn.microsoft.com/en-us/windows/win32/direct3d9/d3dxmatrixorthooffcenterlh
/// 
/// @param left
/// @param top
/// @param right
/// @param bottom
/// @param near
/// @param far
/// @param [resultMatrix]

function ddd_matrix_build_projection_ortho_off_center(left, top, right, bottom, near, far, result_matrix = undefined)
{
    //Flip the y-axis on OpenGL targets
    if not ((os_browser == browser_not_a_browser) && ((os_type == os_windows) || (os_type == os_xboxone) || (os_type == os_xboxseriesxs)))
    {
        top    = -top;
        bottom = -bottom;
    }
    
    if (is_array(result_matrix))
    {
        result_matrix[@  0] = 2 / (right - left);
        result_matrix[@  1] = 0;
        result_matrix[@  2] = 0;
        result_matrix[@  3] = 0;
        
        result_matrix[@  4] = 0;
        result_matrix[@  5] = 2 / (top - bottom);
        result_matrix[@  6] = 0;
        result_matrix[@  7] = 0;
        
        result_matrix[@  8] = 0;
        result_matrix[@  9] = 0;
        result_matrix[@ 10] = 1 / (far - near);
        result_matrix[@ 11] = 0;
        
        result_matrix[@ 12] = (right + left) / (left - right);
        result_matrix[@ 13] = (bottom + top) / (bottom - top);
        result_matrix[@ 14] = near / (near - far);
        result_matrix[@ 15] = 1;
        
        return result_matrix;
    }
    else
    {
        return [2 / (right - left), 0, 0, 0,
                0, 2 / (top - bottom), 0, 0,
                0, 0, 1 / (far - near), 0,
                (right + left) / (left - right), (bottom + top) / (bottom - top), near / (near - far), 1];
    }
}