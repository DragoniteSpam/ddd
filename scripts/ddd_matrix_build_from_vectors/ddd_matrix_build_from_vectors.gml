// Feather disable all

/**
 * Builds a transformation matrix from three vectors that define the position and orientation of the transform.
 * @param {real} x-coordinate of the translation
 * @param {real} y-coordinate of the translation
 * @param {real} z-coordinate of the translation
 * @param {real} x component for the forward vector
 * @param {real} y component for the forward vector
 * @param {real} z component for the forward vector
 * @param {real} x component for the up vector
 * @param {real} y component for the up vector
 * @param {real} z component for the up vector
 * @param {array<real>} [out] A matrix to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new matrix, or the `out` matrix with containing the result
 * @pure
 */

function ddd_matrix_build_from_vectors(fromX, fromY, fromZ, forwardX, forwardY, forwardZ, upX, upY, upZ, out = array_create(16))
{
    //Normalize the forward-vector
    var squareLength = forwardX*forwardX + forwardY*forwardY + forwardZ*forwardZ;
    if (squareLength <= 0)
    {
        return ddd_matrix_build_identity_ext(out);
    }
    
    var coeff = 1/sqr(squareLength);
    fromX *= coeff;
    fromY *= coeff;
    fromZ *= coeff;
    
    //Orthogonalize the up-vector
    var dot = dot_product_3d(forwardX, forwardY, forwardZ, upX, upY, upZ);
    upX -= forwardX*dot;
    upY -= forwardY*dot;
    upZ -= forwardZ*dot;
    
    //Normalize the up-vector too
    var squareLength = upX*upX + upY*upY + upZ*upZ;
    if (squareLength <= 0)
    {
        return ddd_matrix_build_identity_ext(out);
    }
    
    var coeff = 1/sqr(squareLength);
    upX *= coeff;
    upY *= coeff;
    upZ *= coeff;
    
    //Cross product to get the right-vector
    var rightX = upY*forwardZ - upZ*forwardY;
    var rightY = upZ*forwardX - upX*forwardZ;
    var rightZ = upX*forwardY - upY*forwardX;
    
    out[@  0] = forwardX; out[@  1] = forwardY; out[@  2] = forwardZ; out[@  3] = 0;
    out[@  4] = rightX;   out[@  5] = rightY;   out[@  6] = rightZ;   out[@  7] = 0;
    out[@  8] = upX;      out[@  9] = upY;      out[@ 10] = upZ;      out[@ 11] = 0;
    out[@ 12] = fromX;    out[@ 13] = fromY;    out[@ 14] = fromZ;    out[@ 15] = 1;
    return out;
}