/**
 * Creates a new plane, as an array of four numbers.
 * @param {real} x component of the plane normal
 * @param {real} y component of the plane normal
 * @param {real} z component of the plane normal
 * @param {real} Distance from the origin
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
 
function ddd_plane_new_from_distance(x, y, z, distance, out = array_create(4))
{
    out[@ 0] = x;
    out[@ 1] = y;
    out[@ 2] = z;
    out[@ 3] = -distance;
    return out;
}

/**
 * Creates a new plane, as an array of four numbers, using a point on the plane.
 * @param {real} x component of the plane normal
 * @param {real} y component of the plane normal
 * @param {real} z component of the plane normal
 * @param {real} pointX  x coordinate of a point on the plane
 * @param {real} pointY  y coordinate of a point on the plane
 * @param {real} pointZ  z coordinate of a point on the plane
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
 
function ddd_plane_new_from_position(x, y, z, point_x, point_y, point_z, out = array_create(4))
{
    out[@ 0] = x;
    out[@ 1] = y;
    out[@ 2] = z;
    out[@ 3] = -dot_product_3d(x, y, z, point_x, point_y, point_z);
    return out;
}

/**
 * Creates a new plane, as an array of four numbers, using a normal vector and a point on the plane (as a vector).
 * @param {real} normal  The plane normal
 * @param {real} point   A point on the plane
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
 
function ddd_plane_new_from_vectors(normal, point, out = array_create(4))
{
    array_copy(out, 0, normal, 0, 3);
    out[@ 3] = -ddd_vec3_dot(normal, point);
    return out;
}