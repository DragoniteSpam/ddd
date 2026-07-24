// Feather disable all

/**
 * Builds a transformation matrix from three vectors that define the position and orientation of the transform.
 * @param {real} from_x  x-coordinate of the translation
 * @param {real} from_y  y-coordinate of the translation
 * @param {real} from_z  z-coordinate of the translation
 * @param {real} forward_x  x component for the forward vector
 * @param {real} forward_y  y component for the forward vector
 * @param {real} forward_z  z component for the forward vector
 * @param {real} up_x  x component for the up vector
 * @param {real} up_y  y component for the up vector
 * @param {real} up_z  z component for the up vector
 * @param {array<real>} [out] A matrix to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new matrix, or the `out` matrix with containing the result
 * @pure
 */

function ddd_matrix_build_from_vectors(from_x, from_y, from_z, forward_x, forward_y, forward_z, up_x, up_y, up_z, out = array_create(16))
{
    //Normalize the forward-vector
    var square_length = forward_x*forward_x + forward_y*forward_y + forward_z*forward_z;
    if (square_length <= 0)
    {
        return ddd_matrix_build_identity_ext(out);
    }
    
    var coeff = 1/sqrt(square_length);
    from_x *= coeff;
    from_y *= coeff;
    from_z *= coeff;
    
    //Orthogonalize the up-vector
    var dot = dot_product_3d(forward_x, forward_y, forward_z, up_x, up_y, up_z);
    up_x -= forward_x*dot;
    up_y -= forward_y*dot;
    up_z -= forward_z*dot;
    
    //Normalize the up-vector too
    var square_length = up_x*up_x + up_y*up_y + up_z*up_z;
    if (square_length <= 0)
    {
        return ddd_matrix_build_identity_ext(out);
    }
    
    var coeff = 1/sqrt(square_length);
    up_x *= coeff;
    up_y *= coeff;
    up_z *= coeff;
    
    //Cross product to get the right-vector
    var right_x = up_y*forward_z - up_z*forward_y;
    var right_y = up_z*forward_x - up_x*forward_z;
    var right_z = up_x*forward_y - up_y*forward_x;
    
    out[@  0] = forward_x; out[@  1] = forward_y; out[@  2] = forward_z; out[@  3] = 0;
    out[@  4] = right_x;   out[@  5] = right_y;   out[@  6] = right_z;   out[@  7] = 0;
    out[@  8] = up_x;      out[@  9] = up_y;      out[@ 10] = up_z;      out[@ 11] = 0;
    out[@ 12] = from_x;    out[@ 13] = from_y;    out[@ 14] = from_z;    out[@ 15] = 1;
    return out;
}