// Feather disable all

/**
 * Clips the near plane of a projection matrix. This is useful for rendering reflective surfaces (mirros) and portals.
 * @param {array<real>} projectionMatrix
 * @param {array<real>} clipPLane
 * @param {array<real>} [out] A matrix to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new matrix, or the `out` matrix with containing the result
 * @pure
 */

function ddd_matrix_apply_clip_plane(proj_matrix, clip_plane, out = array_create(16))
{
    array_copy(out, 0, proj_matrix, 0, 16);
    
    var clip_x = clip_plane[0];
    var clip_y = clip_plane[1];
    var clip_z = clip_plane[2];
    var clip_w = clip_plane[3];
    
    var corner_x = (sign(clip_x) + proj_matrix[8]) / proj_matrix[0];
    var corner_y = (sign(clip_y) + proj_matrix[9]) / proj_matrix[5];
    var corner_z = -1;
    var corner_w = (1 + proj_matrix[10]) / proj_matrix[14];
    
    var coeff = 2 / (clip_x*corner_x + clip_y*corner_y + clip_z*corner_z + clip_w*corner_w);
    out[@  2] = clip_x*coeff;
    out[@  6] = clip_y*coeff;
    out[@ 10] = clip_z*coeff;
    out[@ 14] = clip_w*coeff;
    
    return out;
}