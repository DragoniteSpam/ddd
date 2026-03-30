// Feather disable all

/**
 * Creates a new vector3, as an array of three numbers.
 * You can index the components of a vector3 directly, or use the macros DDD_X, DDD_Y, and DDD_Z if you're averse to numbers in your code.
 * @param {real} x
 * @param {real} y
 * @param {real} z
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 */
function ddd_vec3(x, y, z, out = array_create(3)) {
    out[@ 0] = x;
    out[@ 1] = y;
    out[@ 2] = z;
    return out;
}

#region Boring stuff
/**
 * Returns a string representing the vector3, in the nice (x, y, z) that makes math people happy
 * @param {array<real>} vec3 The vector to stringify
 * @returns {string}
 */
function ddd_vec3_to_string(vec3) {
    return string("({0}, {1}, {2})", vec3[0], vec3[1], vec3[2]);
}

/**
 * Returns a clone of a vector3
 * @param {array<real>} vec3 The vector3 to clone
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 */
function ddd_vec3_clone(vec3, out = array_create(3)) {
    out[@ 0] = vec3[0];
    out[@ 1] = vec3[1];
    out[@ 2] = vec3[2];
    return out;
}

/**
 * Compares two vector2s component-wise, returns whether or not they are equal
 * @param {array<real>} a The first vec3
 * @param {array<real>} b The second vec3
 * @returns {array<real>} True if the two vectors are equal, false otherwise
 */
function ddd_vec3_equals(a, b) {
    return (a[0] == b[0]) && (a[1] == b[1]) && (a[2] == b[2]);
}
#endregion

#region Presets
/**
 * Returns a vector3 with each component set to zero.
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 */
function ddd_vec3_zero(out = array_create(3)) {
    out[@ 0] = 0;
    out[@ 1] = 0;
    out[@ 2] = 0;
    return out;
}

/**
 * Returns a vector3 with each component set to +1.
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 */
function ddd_vec3_one(out = array_create(3)) {
    out[@ 0] = 1;
    out[@ 1] = 1;
    out[@ 2] = 1;
    return out;
}

/**
 * Returns a vector3 with each component set to infinity.
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 */
function ddd_vec3_infinity(out = array_create(3)) {
    out[@ 0] = infinity;
    out[@ 1] = infinity;
    out[@ 2] = infinity;
    return out;
}

/**
 * Function Description
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 */
function ddd_vec3_minus_infinity(out = array_create(3)) {
    out[@ 0] = -infinity;
    out[@ 1] = -infinity;
    out[@ 2] = -infinity;
    return out;
}
#endregion

#region Basic arithmetic
/**
 * Performs addition between a vec3 and another value, component-wise. The other value may be another vec3, or a scalar.
 * Use the specific vec3 addition functions if you know what the type is for a mild performance boost.
 * @param {array<real>} vec3 The vector
 * @param {any} operand The operand, either a vector or a scalar
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 */
function ddd_vec3_add(vec3, operand, out = array_create(3)) {
    if (is_numeric(operand)) {
        return ddd_vec3_add_scalar(vec3, operand, out);
    }
    return ddd_vec3_add_vec3(vec3, operand, out);
}

/**
 * Performs addition between a vec3 and a scalar value, component-wise.
 * @param {array<real>} a The first vec3
 * @param {array<real>} b The second vec3
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 */
function ddd_vec3_add_vec3(a, b, out = array_create(3)) {
    out[@ 0] = a[0] + b[0];
    out[@ 1] = a[1] + b[1];
    out[@ 2] = a[2] + b[2];
    return out;
}

/**
 * Performs addition between a vec3 and a scalar value.
 * @param {array<real>} vec3 The vector
 * @param {any*} scalar The scalar
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 */
function ddd_vec3_add_scalar(vec3, scalar, out = array_create(3)) {
    out[@ 0] = vec3[0] + scalar;
    out[@ 1] = vec3[1] + scalar;
    out[@ 2] = vec3[2] + scalar;
    return out;
}

/**
 * Performs subtraction between a vec3 and another value, component-wise. The other value may be another vec3, or a scalar.
 * Use the specific vec3 subtraction functions if you know what the type is for a mild performance boost.
 * @param {array<real>} vec3 The vector
 * @param {any} operand The operand, either a vector or a scalar
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 */
function ddd_vec3_sub(vec3, operand, out = array_create(3)) {
    if (is_numeric(operand)) {
        return ddd_vec3_sub_scalar(vec3, operand, out);
    }
    return ddd_vec3_sub_vec3(vec3, operand, out);
}

/**
 * Performs subtraction between a vec3 and a scalar value, component-wise.
 * @param {array<real>} a The first vec3
 * @param {array<real>} b The second vec3
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 */
function ddd_vec3_sub_vec3(a, b, out = array_create(3)) {
    out[@ 0] = a[0] - b[0];
    out[@ 1] = a[1] - b[1];
    out[@ 2] = a[2] - b[2];
    return out;
}

/**
 * Performs subtraction between a vec3 and a scalar value.
 * @param {array<real>} vec3 The vector
 * @param {any*} scalar The scalar
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 */
function ddd_vec3_sub_scalar(vec3, scalar, out = array_create(3)) {
    out[@ 0] = vec3[0] - scalar;
    out[@ 1] = vec3[1] - scalar;
    out[@ 2] = vec3[2] - scalar;
    return out;
}

/**
 * Performs multiplication between a vec3 and another value, component-wise. The other value may be another vec3, or a scalar.
 * Use the specific vec3 multiplication functions if you know what the type is for a mild performance boost.
 * @param {array<real>} vec3 The vector
 * @param {any} operand The operand, either a vector or a scalar
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 */
function ddd_vec3_mul(vec3, operand, out = array_create(3)) {
    if (is_numeric(operand)) {
        return ddd_vec3_mul_scalar(vec3, operand, out);
    }
    return ddd_vec3_mul_vec3(vec3, operand, out);
}

/**
 * Performs multiplication between a vec3 and a scalar value, component-wise.
 * @param {array<real>} a The first vec3
 * @param {array<real>} b The second vec3
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 */
function ddd_vec3_mul_vec3(a, b, out = array_create(3)) {
    out[@ 0] = a[0] * b[0];
    out[@ 1] = a[1] * b[1];
    out[@ 2] = a[2] * b[2];
    return out;
}

/**
 * Performs multiplication between a vec3 and a scalar value.
 * @param {array<real>} vec3 The vector
 * @param {any*} scalar The scalar
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 */
function ddd_vec3_mul_scalar(vec3, scalar, out = array_create(3)) {
    out[@ 0] = vec3[0] * scalar;
    out[@ 1] = vec3[1] * scalar;
    out[@ 2] = vec3[2] * scalar;
    return out;
}

/**
 * Performs division between a vec3 and another value, component-wise. The other value may be another vec3, or a scalar.
 * Use the specific vec3 division functions if you know what the type is for a mild performance boost.
 * @param {array<real>} vec3 The vector
 * @param {any} operand The operand, either a vector or a scalar
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 */
function ddd_vec3_div(vec3, operand, out = array_create(3)) {
    if (is_numeric(operand)) {
        return ddd_vec3_div_scalar(vec3, operand, out);
    }
    return ddd_vec3_div_vec3(vec3, operand, out);
}

/**
 * Performs division between a vec3 and a scalar value, component-wise.
 * @param {array<real>} a The first vec3
 * @param {array<real>} b The second vec3
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 */
function ddd_vec3_div_vec3(a, b, out = array_create(3)) {
    out[@ 0] = a[0] / b[0];
    out[@ 1] = a[1] / b[1];
    out[@ 2] = a[2] / b[2];
    return out;
}

/**
 * Performs division between a vec3 and a scalar value.
 * @param {array<real>} vec3 The vector
 * @param {any*} scalar The scalar
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 */
function ddd_vec3_div_scalar(vec3, scalar, out = array_create(3)) {
    out[@ 0] = vec3[0] / scalar;
    out[@ 1] = vec3[1] / scalar;
    out[@ 2] = vec3[2] / scalar;
    return out;
}
#endregion

#region Bounds
/**
 * Returns a vector3 with each component clamped between the same component on the upper and lower bound vectors.
 * @param {array<real>} vec3 Description
 * @param {array<real>} a The lower bound vec3
 * @param {array<real>} b The upper bound vec3
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 */
function ddd_vec3_clamp(vec3, a, b, out = array_create(3)) {
    out[@ 0] = clamp(vec3[0], a[0], b[0]);
    out[@ 1] = clamp(vec3[1], a[1], b[1]);
    out[@ 2] = clamp(vec3[2], a[2], b[2]);
    return out;
}

/**
 * Returns a vector3 with the magnitude set to the specified value. This can be used as a general version of `ddd_vec3_normalize`.
 * This will return nonsense if the input vector is the zero vector.
 * You can modify the original vector instead of creating a new one by passing its reference as the output.
 * @param {array<real>} vec3 The vector
 * @param {real} mag The magnitude to set the vector to
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 */
function ddd_vec3_clamp_magnitude(vec3, mag, out = array_create(3)) {
    var d = point_distance_3d(0, 0, 0, vec3[0], vec3[1], vec3[2]) / mag;
    out[@ 0] = vec3[0] / d;
    out[@ 1] = vec3[1] / d;
    out[@ 2] = vec3[2] / d;
    return out;
}

/**
 * Returns a vector3 with each component containing the smaller of the same component on the input vectors.
 * @param {array<real>} a The first vec3 to compare
 * @param {array<real>} b The second vec3 to compare
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 */
function ddd_vec3_min(a, b, out = array_create(3)) {
    out[@ 0] = min(a[0], b[0]);
    out[@ 1] = min(a[1], b[1]);
    out[@ 2] = min(a[2], b[2]);
    return out;
}

/**
 * Returns a vector3 with each component containing the larger of the same component on the input vectors.
 * @param {array<real>} a The first vec3 to compare
 * @param {array<real>} b The second vec3 to compare
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 */
function ddd_vec3_max(a, b, out = array_create(3)) {
    out[@ 0] = max(a[0], b[0]);
    out[@ 1] = max(a[1], b[1]);
    out[@ 2] = max(a[2], b[2]);
    return out;
}
#endregion

#region Number bits
/**
 * Returns a vector containing the absolute value of each component of the original vector.
 * @param {array<real>} vec3 The vector
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 */
function ddd_vec3_abs(vec3, out = array_create(3)) {
    out[@ 0] = abs(vec3[0]);
    out[@ 1] = abs(vec3[1]);
    out[@ 2] = abs(vec3[2]);
    return out;
}

/**
 * Returns a vector containing the fractional part of each component the original vector.
 * @param {array<real>} vec3 The vector
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 */
function ddd_vec3_frac(vec3, out = array_create(3)) {
    out[@ 0] = frac(vec3[0]);
    out[@ 1] = frac(vec3[1]);
    out[@ 2] = frac(vec3[2]);
    return out;
}

/**
 * Rounds each of the components of a vector up to the next smallest integer.
 * This will not modify the original vector, unless you pass its reference as the output parameter.
 * @param {array<real>} vec3 The vector
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 */
function ddd_vec3_floor(vec3, out = array_create(3)) {
    out[@ 0] = floor(vec3[0]);
    out[@ 1] = floor(vec3[1]);
    out[@ 2] = floor(vec3[2]);
    return out;
}

/**
 * Rounds each of the components of a vector up to the next largest integer.
 * This will not modify the original vector, unless you pass its reference as the output parameter.
 * @param {array<real>} vec3 The vector
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 */
function ddd_vec3_ceil(vec3, out = array_create(3)) {
    out[@ 0] = ceil(vec3[0]);
    out[@ 1] = ceil(vec3[1]);
    out[@ 2] = ceil(vec3[2]);
    return out;
}

/**
 * Rounds each of the components of a vector to an integer, using bankers' rounding:
 * https://stackoverflow.com/questions/45223778/is-bankers-rounding-really-more-numerically-stable
 * This will not modify the original vector, unless you pass its reference as the output parameter.
 * @param {array<real>} vec3 The vector
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 */
function ddd_vec3_round(vec3, out = array_create(3)) {
    out[@ 0] = round(vec3[0]);
    out[@ 1] = round(vec3[1]);
    out[@ 2] = round(vec3[2]);
    return out;
}
#endregion

#region All of the other stuff
/**
 * Calculates the magnitude of a vector, or how far from the origin it is.
 * @param {array<real>} vec3 The vector
 * @returns {real}
 */
function ddd_vec3_mag(vec3) {
    return point_distance_3d(0, 0, 0, vec3[0], vec3[1], vec3[2]);
}

/**
 * Calculates the dot product of two vectors. This is often used as a measure of how similar two vectors are:
 * https://en.wikipedia.org/wiki/Dot_product
 * @param {array<real>} a The first vec3
 * @param {array<real>} b The second vec3
 * @returns {real}
 */
function ddd_vec3_dot(a, b) {
    return dot_product_3d(a[0], a[1], a[2], b[0], b[1], b[2]);
}

/**
 * Normaliz(s)es a vector, setting its magnitude equal to 1 but preserving the relative proportions of its components:
 * https://en.wikipedia.org/wiki/Unit_vector
 * This will return nonsense if the input vector is the zero vector.
 * You can modify the original vector instead of creating a new one by passing its reference as the output.
 * @param {array<real>} vec3 The vec3 to normaliz(s)e
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 */
function ddd_vec3_normalize(vec3, out = array_create(3)) {
    var mag = point_distance_3d(0, 0, 0, vec3[0], vec3[1], vec3[2]);
    out[@ 0] = vec3[0] / mag;
    out[@ 1] = vec3[1] / mag;
    out[@ 2] = vec3[2] / mag;
    return out;
}

/**
 * Projects one vector onto another; this can be used to figure out how much of vector `a` heads in the direction of vector `b`.
 * https://en.wikipedia.org/wiki/Vector_projection
 * @param {array<real>} a The vec3 to do the projecting
 * @param {array<real>} b The vec3 to be projected onto
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 */
function ddd_vec3_project(a, b, out = array_create(3)) {
    var f = dot_product_3d(a[0], a[1], a[2], b[0], b[1], b[2]) / dot_product_3d(b[0], b[1], b[2], b[0], b[1], b[2]);
    out[@ 0] = b[0] * f;
    out[@ 1] = b[1] * f;
    out[@ 2] = b[2] * f;
    return out;
}

/**
 * Linearly interpolates one vector to another, moving between the two by a specified percentage.
 * `amount` may be a vector or a scalar:
 * https://en.wikipedia.org/wiki/Linear_interpolation
 * @param {array<real>} a The first vec3
 * @param {array<real>} b The second vec3
 * @param {any} amount The normalized percentage to interpolate from a to b; values outside the range of [0, 1] will extrapolate instead
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 */
function ddd_vec3_lerp(a, b, amount, out = array_create(3)) {
    if (is_array(amount)) {
        out[@ 0] = lerp(a[0], b[0], amount[0]);
        out[@ 1] = lerp(a[1], b[1], amount[1]);
        out[@ 2] = lerp(a[2], b[2], amount[2]);
    } else {
        out[@ 0] = lerp(a[0], b[0], amount);
        out[@ 1] = lerp(a[1], b[1], amount);
        out[@ 2] = lerp(a[2], b[2], amount);
    }
    return out;
}

/**
 * Calculates the angle between two vectors.
 * @param {array<real>} a The first vec3
 * @param {array<real>} b The second vec3
 * @returns {real}
 */
function ddd_vec3_angle(a, b) {
    return darccos(
        dot_product_3d(a[0], a[1], a[2], b[0], b[1], b[2]) /
        (point_distance_3d(0, 0, 0, a[0], a[1], a[2]) * point_distance_3d(0, 0, 0, b[0], b[1], b[2]))
    );
}

/**
 * Calculates the cross product of two vectors, generating a vector perpendicular to the plane of the first two.
 * The cross product:
 *    - is anti-commutative, where reversing the operands will negate the result
 *    - will produce the zero vector for vectors that are parallel
 *    - may or may not produce a vector with a magnitude of 1, and you might want to normalize the result afterwards
 * @param {array<real>} a The first vec3
 * @param {array<real>} b The second vec3
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 */
function ddd_vec3_cross(a, b, out = array_create(3)) {
    out[0] = a[1] * b[2] - b[1] * a[2];
    out[1] = a[2] * b[0] - b[2] * a[0];
    out[2] = a[0] * b[1] - b[0] * a[1];
    return out;
};

/**
 * Move one vector towards another by an exact amount, while never overshooting.
 * @param {array<real>} a The vec3 to move from
 * @param {array<real>} b The vec3 to move to
 * @param {real} amount The distance to move `a` towards `b`
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 */
function ddd_vec3_approach(a, b, amount, out = array_create(3)) {
    var total_dist = point_distance_3d(b[0], b[1], b[2], a[0], a[1], a[2]);
    var dist = max(total_dist - amount, 0);
    var f = dist / total_dist;
    
    out[@ 0] = lerp(b[0], a[0], f);
    out[@ 1] = lerp(b[1], a[1], f);
    out[@ 2] = lerp(b[2], a[2], f);
    
    return out;
}

/**
 * Interpolates between two vectors using spherical interpolation. This can be used for things such as smoothly rotating an object, or a view matrix.
 * Yes, it's really called that: https://en.wikipedia.org/wiki/Slerp
 * @param {array<real>} a The vec3 to slerp from
 * @param {array<real>} b The vec3 to slerp to
 * @param {real} amount The normalized percentage to slerp from a to b; values outside the range of [0, 1] will extrapolate instead
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 */
function ddd_vec3_slerp(a, b, amount, out = array_create(3)) {
    var dot = dot_product_3d_normalized(a[0], a[1], a[2], b[0], b[1], b[2]);
    var theta = arccos(dot) * amount;
    var relative_sub = ddd_vec3_sub(b, a);
    var relative_product = ddd_vec3_mul(relative_sub, dot);
    ddd_vec3_normalize(relative_product, relative_product);
    var relative_cos_product = ddd_vec3_mul(a, cos(theta));
    var relative_sin_product = ddd_vec3_mul(relative_product, sin(theta));
    return ddd_vec3_add(relative_cos_product, relative_sin_product, out);
}

/**
 * Rotates a vector around an axis. Useful for simple vector rotation, but for more complicated operations you might instead want quaternions.
 * https://en.wikipedia.org/wiki/Rodrigues'_rotation_formula
 * @param {array} vec3 The vector to rotate around an axis
 * @param {array} axis The axis to rotate the vector around
 * @param {real} angle The angle to rotate the vector around the axis by
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 */
function ddd_vec3_rotate(vec3, axis, angle, out = array_create(3)) {
    var cosine = dcos(angle);
    var sine = dsin(angle);
    
    var v0 = vec3[0];
    var v1 = vec3[1];
    var v2 = vec3[2];
    var a0 = axis[0];
    var a1 = axis[1];
    var a2 = axis[2];
    
    var dot = dot_product_3d(v0, v1, v2, a0, a1, a2) * (1 - cosine);
    out[@ 0] = (v0 * cosine) + (a1 * v2 - v1 * a2) * sine + (a0 * dot);
    out[@ 1] = (v1 * cosine) + (a2 * v0 - v2 * a0) * sine + (a1 * dot);
    out[@ 2] = (v2 * cosine) + (a0 * v1 - v0 * a1) * sine + (a2 * dot);
    
    return out;
}
#endregion