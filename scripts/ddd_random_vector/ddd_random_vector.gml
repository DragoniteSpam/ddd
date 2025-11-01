// Feather disable all

/// Generates a random 3D vector and returns it as a four-element array for compatibility. The w
/// component of the returned vector is always `1`. Please note that this function uses GameMaker's
/// native random functions so its use may alter the outcome of procedural generation etc.
/// 
/// @param [result_array]

function ddd_random_vector(result_array = [])
{
    var theta   = random_range(0, 360);
    var phi     = random_range(0, 360);
    var u       = dcos(phi);
    var u_trans = sqrt(1 - u*u);
    
    result_array[@ 0] = u_trans*dcos(theta);
    result_array[@ 1] = u_trans*dsin(theta);
    result_array[@ 2] = u;
    result_array[@ 3] = 1;
    
    return result_array;
}