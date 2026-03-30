// Feather disable all

/**
 * Creates a new vector4, as an array of three numbers.
 * You can index the components of a vector4 directly, or use the macros DDD_X, DDD_Y, and DDD_Z if you're averse to numbers in your code.
 * @param {real} x
 * @param {real} y
 * @param {real} z
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec4(x, y, z, w, out = array_create(4)) {
    out[@ 0] = x;
    out[@ 1] = y;
    out[@ 2] = z;
    out[@ 3] = w;
    return out;
}

#region Boring stuff
/**
 * Returns a string representing the vector4, in the nice (x, y, z) that makes math people happy
 * @param {array<real>} vec4 The vector to stringify
 * @returns {string}
 * @pure
 */
function ddd_vec4_to_string(vec4) {
    return string("({0}, {1}, {2}, {3})", vec4[0], vec4[1], vec4[2], vec4[3]);
}

/**
 * Returns a clone of a vector4
 * @param {array<real>} vec4 The vector4 to clone
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec4_clone(vec4, out = array_create(4)) {
    out[@ 0] = vec4[0];
    out[@ 1] = vec4[1];
    out[@ 2] = vec4[2];
    out[@ 3] = vec4[3];
    return out;
}

/**
 * Compares two vector2s component-wise, returns whether or not they are equal
 * @param {array<real>} a The first vec4
 * @param {array<real>} b The second vec4
 * @returns {array<real>} True if the two vectors are equal, false otherwise
 * @pure
 */
function ddd_vec4_equals(a, b) {
    return (a[0] == b[0]) && (a[1] == b[1]) && (a[2] == b[2]) && (a[3] == b[3]);
}
#endregion

#region Presets
/**
 * Returns a vector4 with each component set to zero.
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec4_zero(out = array_create(4)) {
    out[@ 0] = 0;
    out[@ 1] = 0;
    out[@ 2] = 0;
    out[@ 3] = 0;
    return out;
}

/**
 * Returns a vector4 with each component set to +1.
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec4_one(out = array_create(4)) {
    out[@ 0] = 1;
    out[@ 1] = 1;
    out[@ 2] = 1;
    out[@ 3] = 1;
    return out;
}

/**
 * Returns a vector4 with each component set to infinity.
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec4_infinity(out = array_create(4)) {
    out[@ 0] = infinity;
    out[@ 1] = infinity;
    out[@ 2] = infinity;
    out[@ 3] = infinity;
    return out;
}

/**
 * Function Description
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec4_minus_infinity(out = array_create(4)) {
    out[@ 0] = -infinity;
    out[@ 1] = -infinity;
    out[@ 2] = -infinity;
    out[@ 3] = -infinity;
    return out;
}
#endregion

/**
 * Performs addition between a vec4 and another value, component-wise. The other value may be another vec4, or a scalar.
 * Use the specific vec4 addition functions if you know what the type is for a mild performance boost.
 * @param {array<real>} vec4 The vector
 * @param {any} operand The operand, either a vector or a scalar
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @pure
 */
#region Basic arithmetic
function ddd_vec4_add(vec4, operand, out = array_create(4)) {
    if (is_numeric(operand)) {
        return ddd_vec4_add_scalar(vec4, operand, out);
    }
    return ddd_vec4_add_vec4(vec4, operand, out);
}

/**
 * Performs addition between a vec4 and a scalar value, component-wise.
 * @param {array<real>} a The first vec4
 * @param {array<real>} b The second vec4
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec4_add_vec4(a, b, out = array_create(4)) {
    out[@ 0] = a[0] + b[0];
    out[@ 1] = a[1] + b[1];
    out[@ 2] = a[2] + b[2];
    out[@ 3] = a[3] + b[3];
    return out;
}

/**
 * Performs addition between a vec4 and a scalar value.
 * @param {array<real>} vec4 The vector
 * @param {any*} scalar The scalar
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec4_add_scalar(vec4, scalar, out = array_create(4)) {
    out[@ 0] = vec4[0] + scalar;
    out[@ 1] = vec4[1] + scalar;
    out[@ 2] = vec4[2] + scalar;
    out[@ 3] = vec4[3] + scalar;
    return out;
}

/**
 * Performs subtraction between a vec4 and another value, component-wise. The other value may be another vec4, or a scalar.
 * Use the specific vec4 subtraction functions if you know what the type is for a mild performance boost.
 * @param {array<real>} vec4 The vector
 * @param {any} operand The operand, either a vector or a scalar
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @pure
 */
function ddd_vec4_sub(vec4, operand, out = array_create(4)) {
    if (is_numeric(operand)) {
        return ddd_vec4_sub_scalar(vec4, operand, out);
    }
    return ddd_vec4_sub_vec4(vec4, operand, out);
}

/**
 * Performs subtraction between a vec4 and a scalar value, component-wise.
 * @param {array<real>} a The first vec4
 * @param {array<real>} b The second vec4
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec4_sub_vec4(a, b, out = array_create(4)) {
    out[@ 0] = a[0] - b[0];
    out[@ 1] = a[1] - b[1];
    out[@ 2] = a[2] - b[2];
    out[@ 3] = a[3] - b[3];
    return out;
}

/**
 * Performs subtraction between a vec4 and a scalar value.
 * @param {array<real>} vec4 The vector
 * @param {any*} scalar The scalar
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec4_sub_scalar(vec4, scalar, out = array_create(4)) {
    out[@ 0] = vec4[0] - scalar;
    out[@ 1] = vec4[1] - scalar;
    out[@ 2] = vec4[2] - scalar;
    out[@ 3] = vec4[3] - scalar;
    return out;
}

/**
 * Performs multiplication between a vec4 and another value, component-wise. The other value may be another vec4, or a scalar.
 * Use the specific vec4 multiplication functions if you know what the type is for a mild performance boost.
 * @param {array<real>} vec4 The vector
 * @param {any} operand The operand, either a vector or a scalar
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @pure
 */
function ddd_vec4_mul(vec4, operand, out = array_create(4)) {
    if (is_numeric(operand)) {
        return ddd_vec4_mul_scalar(vec4, operand, out);
    }
    return ddd_vec4_mul_vec4(vec4, operand, out);
}

/**
 * Performs multiplication between a vec4 and a scalar value, component-wise.
 * @param {array<real>} a The first vec4
 * @param {array<real>} b The second vec4
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec4_mul_vec4(a, b, out = array_create(4)) {
    out[@ 0] = a[0] * b[0];
    out[@ 1] = a[1] * b[1];
    out[@ 2] = a[2] * b[2];
    out[@ 3] = a[3] * b[3];
    return out;
}

/**
 * Performs multiplication between a vec4 and a scalar value.
 * @param {array<real>} vec4 The vector
 * @param {any*} scalar The scalar
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec4_mul_scalar(vec4, scalar, out = array_create(4)) {
    out[@ 0] = vec4[0] * scalar;
    out[@ 1] = vec4[1] * scalar;
    out[@ 2] = vec4[2] * scalar;
    out[@ 3] = vec4[3] * scalar;
    return out;
}

/**
 * Performs division between a vec4 and another value, component-wise. The other value may be another vec4, or a scalar.
 * Use the specific vec4 division functions if you know what the type is for a mild performance boost.
 * @param {array<real>} vec4 The vector
 * @param {any} operand The operand, either a vector or a scalar
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @pure
 */
function ddd_vec4_div(vec4, operand, out = array_create(4)) {
    if (is_numeric(operand)) {
        return ddd_vec4_div_scalar(vec4, operand, out);
    }
    return ddd_vec4_div_vec4(vec4, operand, out);
}

/**
 * Performs division between a vec4 and a scalar value, component-wise.
 * @param {array<real>} a The first vec4
 * @param {array<real>} b The second vec4
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec4_div_vec4(a, b, out = array_create(4)) {
    out[@ 0] = a[0] / b[0];
    out[@ 1] = a[1] / b[1];
    out[@ 2] = a[2] / b[2];
    out[@ 3] = a[3] / b[3];
    return out;
}

/**
 * Performs division between a vec4 and a scalar value.
 * @param {array<real>} vec4 The vector
 * @param {any*} scalar The scalar
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec4_div_scalar(vec4, scalar, out = array_create(4)) {
    out[@ 0] = vec4[0] / scalar;
    out[@ 1] = vec4[1] / scalar;
    out[@ 2] = vec4[2] / scalar;
    out[@ 3] = vec4[3] / scalar;
    return out;
}
#endregion

#region Bounds
/**
 * Returns a vector4 with each component clamped between the same component on the upper and lower bound vectors.
 * @param {array<real>} vec4 Description
 * @param {array<real>} a The lower bound vec4
 * @param {array<real>} b The upper bound vec4
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec4_clamp(vec4, a, b, out = array_create(4)) {
    out[@ 0] = clamp(vec4[0], a[0], b[0]);
    out[@ 1] = clamp(vec4[1], a[1], b[1]);
    out[@ 2] = clamp(vec4[2], a[2], b[2]);
    out[@ 3] = clamp(vec4[3], a[3], b[3]);
    return out;
}

/**
 * Returns a vector4 with the magnitude set to the specified value. This can be used as a general version of `ddd_vec4_normalize`.
 * This will return nonsense if the input vector is the zero vector.
 * You can modify the original vector instead of creating a new one by passing its reference as the output.
 * @param {array<real>} vec4 The vector
 * @param {real} mag The magnitude to set the vector to
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec4_clamp_magnitude(vec4, mag, out = array_create(4)) {
    var d = sqrt(sqr(vec4[0]) + sqr(vec4[1]) + sqr(vec4[2]) + sqr(vec4[3])) / mag;
    out[@ 0] = vec4[0] / d;
    out[@ 1] = vec4[1] / d;
    out[@ 2] = vec4[2] / d;
    out[@ 3] = vec4[3] / d;
    return out;
}

/**
 * Returns a vector4 with each component containing the smaller of the same component on the input vectors.
 * @param {array<real>} a The first vec4 to compare
 * @param {array<real>} b The second vec4 to compare
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec4_min(vec4, value, out = array_create(4)) {
    out[@ 0] = min(vec4[0], value[0]);
    out[@ 1] = min(vec4[1], value[1]);
    out[@ 2] = min(vec4[2], value[2]);
    out[@ 3] = min(vec4[3], value[3]);
    return out;
}

/**
 * Returns a vector4 with each component containing the larger of the same component on the input vectors.
 * @param {array<real>} a The first vec4 to compare
 * @param {array<real>} b The second vec4 to compare
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec4_max(vec4, value, out = array_create(4)) {
    out[@ 0] = max(vec4[0], value[0]);
    out[@ 1] = max(vec4[1], value[1]);
    out[@ 2] = max(vec4[2], value[2]);
    out[@ 3] = max(vec4[3], value[3]);
    return out;
}
#endregion

#region Number bits
/**
 * Returns a vector containing the absolute value of each component of the original vector.
 * @param {array<real>} vec4 The vector
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec4_abs(vec4, mag, out = array_create(4)) {
    out[@ 0] = abs(vec4[0]);
    out[@ 1] = abs(vec4[1]);
    out[@ 2] = abs(vec4[2]);
    out[@ 3] = abs(vec4[3]);
    return out;
}

/**
 * Returns a vector containing the fractional part of each component the original vector.
 * @param {array<real>} vec4 The vector
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec4_frac(vec4, out = array_create(4)) {
    out[@ 0] = frac(vec4[0]);
    out[@ 1] = frac(vec4[1]);
    out[@ 2] = frac(vec4[2]);
    out[@ 3] = frac(vec4[3]);
    return out;
}

/**
 * Rounds each of the components of a vector up to the next smallest integer.
 * This will not modify the original vector, unless you pass its reference as the output parameter.
 * @param {array<real>} vec4 The vector
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec4_floor(vec4, out = array_create(4)) {
    out[@ 0] = floor(vec4[0]);
    out[@ 1] = floor(vec4[1]);
    out[@ 2] = floor(vec4[2]);
    out[@ 3] = floor(vec4[3]);
    return out;
}

/**
 * Rounds each of the components of a vector up to the next largest integer.
 * This will not modify the original vector, unless you pass its reference as the output parameter.
 * @param {array<real>} vec4 The vector
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec4_ceil(vec4, out = array_create(4)) {
    out[@ 0] = ceil(vec4[0]);
    out[@ 1] = ceil(vec4[1]);
    out[@ 2] = ceil(vec4[2]);
    out[@ 3] = ceil(vec4[3]);
    return out;
}

/**
 * Rounds each of the components of a vector to an integer, using bankers' rounding:
 * https://stackoverflow.com/questions/45223778/is-bankers-rounding-really-more-numerically-stable
 * This will not modify the original vector, unless you pass its reference as the output parameter.
 * @param {array<real>} vec4 The vector
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec4_round(vec4, out = array_create(4)) {
    out[@ 0] = round(vec4[0]);
    out[@ 1] = round(vec4[1]);
    out[@ 2] = round(vec4[2]);
    out[@ 3] = round(vec4[3]);
    return out;
}
#endregion

#region All of the other stuff
/**
 * Calculates the magnitude of a vector, or how far from the origin it is.
 * @param {array<real>} vec4 The vector
 * @returns {real}
 * @pure
 */
function ddd_vec4_mag(vec4) {
    return sqrt(sqr(vec4[0]) + sqr(vec4[1]) + sqr(vec4[2]) + sqr(vec4[3]));
}

/**
 * Calculates the dot product of two vectors. This is often used as a measure of how similar two vectors are:
 * https://en.wikipedia.org/wiki/Dot_product
 * @param {array<real>} a The first vec4
 * @param {array<real>} b The second vec4
 * @returns {real}
 * @pure
 */
function ddd_vec4_dot(a, b) {
    return dot_product_3d(a[0], a[1], a[2], b[0], b[1], b[2]) + a[3] * b[3];
}

/**
 * Normaliz(s)es a vector, setting its magnitude equal to 1 but preserving the relative proportions of its components:
 * https://en.wikipedia.org/wiki/Unit_vector
 * This will return nonsense if the input vector is the zero vector.
 * You can modify the original vector instead of creating a new one by passing its reference as the output.
 * @param {array<real>} vec4 The vec4 to normaliz(s)e
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec4_normalize(vec4, out = array_create(4)) {
    var mag = sqrt(sqr(vec4[0]) + sqr(vec4[1]) + sqr(vec4[2]) + sqr(vec4[3]));
    out[@ 0] = vec4[0] / mag;
    out[@ 1] = vec4[1] / mag;
    out[@ 2] = vec4[2] / mag;
    out[@ 3] = vec4[3] / mag;
    return out;
}

/**
 * Projects one vector onto another; this can be used to figure out how much of vector `a` heads in the direction of vector `b`.
 * https://en.wikipedia.org/wiki/Vector_projection
 * @param {array<real>} a The vec4 to do the projecting
 * @param {array<real>} b The vec4 to be projected onto
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec4_project(vec4, dir, out = array_create(4)) {
    var f = (dot_product_3d(vec4[0], vec4[1], vec4[2], dir[0], dir[1], dir[2]) + vec4[3] * dir[3]) / (dot_product_3d(dir[0], dir[1], dir[2], dir[0], dir[1], dir[2]) + sqr(dir[3]));
    out[@ 0] = dir[0] * f;
    out[@ 1] = dir[1] * f;
    out[@ 2] = dir[2] * f;
    out[@ 3] = dir[3] * f;
    return out;
}

/**
 * Linearly interpolates one vector to another, moving between the two by a specified percentage.
 * `amount` may be a vector or a scalar:
 * https://en.wikipedia.org/wiki/Linear_interpolation
 * @param {array<real>} a The first vec4
 * @param {array<real>} b The second vec4
 * @param {any} amount The normalized percentage to interpolate from a to b; values outside the range of [0, 1] will extrapolate instead
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec4_lerp(a, b, amount, out = array_create(4)) {
    if (is_array(amount)) {
        out[@ 0] = lerp(a[0], b[0], amount[0]);
        out[@ 1] = lerp(a[1], b[1], amount[1]);
        out[@ 2] = lerp(a[2], b[2], amount[2]);
        out[@ 3] = lerp(a[3], b[3], amount[3]);
    } else {
        out[@ 0] = lerp(a[0], b[0], amount);
        out[@ 1] = lerp(a[1], b[1], amount);
        out[@ 2] = lerp(a[2], b[2], amount);
        out[@ 3] = lerp(a[3], b[3], amount);
    }
    return out;
}

/**
 * Calculates the angle between two vectors.
 * @param {array<real>} a The first vec4
 * @param {array<real>} b The second vec4
 * @returns {real}
 * @pure
 */
function ddd_vec4_angle(a, b) {
    return darccos(
        (dot_product_3d(a[0], a[1], a[2], b[0], b[1], b[2]) + a[3] * b[3]) /
        (sqrt(sqr(a[0]) + sqr(a[1]) + sqr(a[2]) + sqr(a[3])) * sqrt(sqr(b[0]) + sqr(b[1]) + sqr(b[2]) + sqr(b[3])))
    );
}

/**
 * Calculates the cross product of two vectors, generating a vector perpendicular to the plane of the first two.
 * The cross product:
 *    - is anti-commutative, where reversing the operands will negate the result
 *    - will produce the zero vector for vectors that are parallel
 *    - may or may not produce a vector with a magnitude of 1, and you might want to normalize the result afterwards
 * @param {array<real>} a The first vec4
 * @param {array<real>} b The second vec4
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec4_approach(a, b, amount, out = array_create(4)) {
    var total_dist = sqrt(b[0] * a[0] + b[1] * a[1] + b[2] * a[2] + b[3] * a[3]);
    var dist = max(total_dist - amount, 0);
    var f = dist / total_dist;
    
    out[@ 0] = lerp(b[0], a[0], f);
    out[@ 1] = lerp(b[1], a[1], f);
    out[@ 2] = lerp(b[2], a[2], f);
    out[@ 3] = lerp(b[3], a[3], f);
    
    return out;
}

/**
 * Move one vector towards another by an exact amount, while never overshooting.
 * @param {array<real>} a The vec4 to move from
 * @param {array<real>} b The vec4 to move to
 * @param {real} amount The distance to move `a` towards `b`
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec4_slerp(a, b, amount, out = array_create(4)) {
    var dot = dot_product_3d_normalized(a[0], a[1], a[2], b[0], b[1], b[2]) + a[3] * b[3];
    var theta = arccos(dot) * amount;
    var relative_sub = ddd_vec4_sub(b, a);
    var relative_product = ddd_vec4_mul(relative_sub, dot);
    ddd_vec4_normalize(relative_product, relative_product);
    var relative_cos_product = ddd_vec4_mul(a, cos(theta));
    var relative_sin_product = ddd_vec4_mul(relative_product, sin(theta));
    return ddd_vec4_add(relative_cos_product, relative_sin_product, out);
}
#endregion