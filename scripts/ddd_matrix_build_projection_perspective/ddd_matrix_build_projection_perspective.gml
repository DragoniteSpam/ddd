// Feather disable all

/// Returns a perspective projection matrix that is compatible cross-platform. Please note that
/// this matrix should *not* be used with `camera_set_proj_mat()` as this function automatically
/// corrects the matrix for the platform the game is running on (but other native functions don't).
/// For further information, please see documentation for
/// `ddd_matrix_build_projection_perspective()`.
/// 
/// N.B. This function is written to be compatible with the native equivalent function. I have
///      found that, unexpectedly, a negative `width` and `height` need to be specified for correct
///      rendering. This is probably a bug with GameMaker but this behavior is maintained here.
/// 
/// @param width
/// @param height
/// @param znear
/// @param zfar
/// @param [resultMatrix]

function ddd_matrix_build_projection_perspective(width, height, znear, zfar, result_matrix = [])
{
    if ((os_browser == browser_not_a_browser) && ((os_type == os_windows) || (os_type == os_xboxone) || (os_type == os_xboxseriesxs)))
    {
        //What a weird function
        matrix_build_projection_perspective(width, height, znear, zfar, result_matrix);
    }
    else
    {
        matrix_build_projection_perspective(width, -height, znear, zfar, result_matrix);
    }
    
    return result_matrix;
}