// Feather disable all

/// Returns a look-at view matrix that is compatible cross-platform. Please note that  this matrix
/// should *not* be used with `camera_set_view_mat()` as this function automatically corrects the
/// matrix for the platform the game is running on (but other native functions don't). For an
/// For further information, please see documentation for `matrix_build_lookat()`.
/// 
/// @param xfrom
/// @param yfrom
/// @param zfrom
/// @param xto
/// @param yto
/// @param zto
/// @param xup
/// @param yup
/// @param zup
/// @param [resultMatrix]

function ddd_matrix_build_lookat(xfrom, yfrom, zfrom, xto, yto, zto, xup, yup, zup, result_matrix = [])
{
    if ((os_browser == browser_not_a_browser) && ((os_type == os_windows) || (os_type == os_xboxone) || (os_type == os_xboxseriesxs)))
    {
        matrix_build_lookat(xfrom, yfrom, zfrom, xto, yto, zto, xup, yup, zup, result_matrix);
    }
    else
    {
        matrix_build_lookat(xfrom, yfrom, zfrom, xto, yto, zto, -xup, -yup, -zup, result_matrix);
    }
    
    return result_matrix;
}