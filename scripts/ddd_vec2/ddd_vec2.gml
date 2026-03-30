// Feather disable all

/**
 * Creates a new vector2, as an array of three numbers.
 * You can index the components of a vector2 directly, or use the macros DDD_X and DDD_Y if you're averse to numbers in your code.
 * @param {real} x
 * @param {real} y
 * @param {real} z
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec2(x, y, out = array_create(2)) {
    out[@ 0] = x;
    out[@ 1] = y;
    return out;
}

#region Boring stuff
/**
 * Returns a string representing the vector2, in the nice (x, y, z) that makes math people happy
 * @param {array<real>} vec2 The vector to stringify
 * @returns {string}
 * @pure
 */
function ddd_vec2_to_string(vec2) {
    return string("({0}, {1})", vec2[0], vec2[1]);
}

/**
 * Returns a clone of a vector2
 * @param {array<real>} vec2 The vector2 to clone
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec2_clone(vec2, out = array_create(2)) {
    out[@ 0] = vec2[0];
    out[@ 1] = vec2[1];
    return out;
}

/**
 * Compares two vector2s component-wise, returns whether or not they are equal
 * @param {array<real>} a The first vec2
 * @param {array<real>} b The second vec2
 * @returns {array<real>} True if the two vectors are equal, false otherwise
 * @pure
 */
function ddd_vec2_equals(a, b) {
    return (a[0] == b[0]) && (a[1] == b[1]);
}
#endregion

#region Presets
/**
 * Returns a vector2 with each component set to zero.
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec2_zero(out = array_create(2)) {
    out[@ 0] = 0;
    out[@ 1] = 0;
    return out;
}

/**
 * Returns a vector2 with each component set to +1.
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec2_one(out = array_create(2)) {
    out[@ 0] = 1;
    out[@ 1] = 1;
    return out;
}

/**
 * Returns a vector2 with each component set to infinity.
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec2_infinity(out = array_create(2)) {
    out[@ 0] = infinity;
    out[@ 1] = infinity;
    return out;
}

/**
 * Function Description
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec2_minus_infinity(out = array_create(2)) {
    out[@ 0] = -infinity;
    out[@ 1] = -infinity;
    return out;
}
#endregion

#region Basic arithmetic
/**
 * Performs addition between a vec2 and another value, component-wise. The other value may be another vec2, or a scalar.
 * Use the specific vec2 addition functions if you know what the type is for a mild performance boost.
 * @param {array<real>} vec2 The vector
 * @param {any} operand The operand, either a vector or a scalar
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @pure
 */
function ddd_vec2_add(vec2, operand, out = array_create(2)) {
    if (is_numeric(operand)) {
        return ddd_vec2_add_scalar(vec2, operand, out);
    }
    return ddd_vec2_add_vec2(vec2, operand, out);
}

/**
 * Performs addition between a vec2 and a scalar value, component-wise.
 * @param {array<real>} a The first vec2
 * @param {array<real>} b The second vec2
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec2_add_vec2(a, b, out = array_create(2)) {
    out[@ 0] = a[0] + b[0];
    out[@ 1] = a[1] + b[1];
    return out;
}

/**
 * Performs addition between a vec2 and a scalar value.
 * @param {array<real>} vec2 The vector
 * @param {any*} scalar The scalar
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec2_add_scalar(vec2, scalar, out = array_create(2)) {
    out[@ 0] = vec2[0] + scalar;
    out[@ 1] = vec2[1] + scalar;
    return out;
}

/**
 * Performs subtraction between a vec2 and another value, component-wise. The other value may be another vec2, or a scalar.
 * Use the specific vec2 subtraction functions if you know what the type is for a mild performance boost.
 * @param {array<real>} vec2 The vector
 * @param {any} operand The operand, either a vector or a scalar
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @pure
 */
function ddd_vec2_sub(vec2, operand, out = array_create(2)) {
    if (is_numeric(operand)) {
        return ddd_vec2_sub_scalar(vec2, operand, out);
    }
    return ddd_vec2_sub_vec2(vec2, operand, out);
}

/**
 * Performs subtraction between a vec2 and a scalar value, component-wise.
 * @param {array<real>} a The first vec2
 * @param {array<real>} b The second vec2
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec2_sub_vec2(a, b, out = array_create(2)) {
    out[@ 0] = a[0] - b[0];
    out[@ 1] = a[1] - b[1];
    return out;
}

/**
 * Performs subtraction between a vec2 and a scalar value.
 * @param {array<real>} vec2 The vector
 * @param {any*} scalar The scalar
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec2_sub_scalar(vec2, scalar, out = array_create(2)) {
    out[@ 0] = vec2[0] - scalar;
    out[@ 1] = vec2[1] - scalar;
    return out;
}

/**
 * Performs multiplication between a vec2 and another value, component-wise. The other value may be another vec2, or a scalar.
 * Use the specific vec2 multiplication functions if you know what the type is for a mild performance boost.
 * @param {array<real>} vec2 The vector
 * @param {any} operand The operand, either a vector or a scalar
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @pure
 */
function ddd_vec2_mul(vec2, operand, out = array_create(2)) {
    if (is_numeric(operand)) {
        return ddd_vec2_mul_scalar(vec2, operand, out);
    }
    return ddd_vec2_mul_vec2(vec2, operand, out);
}

/**
 * Performs multiplication between a vec2 and a scalar value, component-wise.
 * @param {array<real>} a The first vec2
 * @param {array<real>} b The second vec2
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec2_mul_vec2(a, b, out = array_create(2)) {
    out[@ 0] = a[0] * b[0];
    out[@ 1] = a[1] * b[1];
    return out;
}

/**
 * Performs multiplication between a vec2 and a scalar value.
 * @param {array<real>} vec2 The vector
 * @param {any*} scalar The scalar
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec2_mul_scalar(vec2, scalar, out = array_create(2)) {
    out[@ 0] = vec2[0] * scalar;
    out[@ 1] = vec2[1] * scalar;
    return out;
}

/**
 * Performs division between a vec2 and another value, component-wise. The other value may be another vec2, or a scalar.
 * Use the specific vec2 division functions if you know what the type is for a mild performance boost.
 * @param {array<real>} vec2 The vector
 * @param {any} operand The operand, either a vector or a scalar
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @pure
 */
function ddd_vec2_div(vec2, operand, out = array_create(2)) {
    if (is_numeric(operand)) {
        return ddd_vec2_div_scalar(vec2, operand, out);
    }
    return ddd_vec2_div_vec2(vec2, operand, out);
}

/**
 * Performs division between a vec2 and a scalar value, component-wise.
 * @param {array<real>} a The first vec2
 * @param {array<real>} b The second vec2
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec2_div_vec2(a, b, out = array_create(2)) {
    out[@ 0] = a[0] / b[0];
    out[@ 1] = a[1] / b[1];
    return out;
}

/**
 * Performs division between a vec2 and a scalar value.
 * @param {array<real>} vec2 The vector
 * @param {any*} scalar The scalar
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec2_div_scalar(vec2, scalar, out = array_create(2)) {
    out[@ 0] = vec2[0] / scalar;
    out[@ 1] = vec2[1] / scalar;
    return out;
}
#endregion

#region Bounds
/**
 * 
 * Returns a vector2 with each component clamped between the same component on the upper and lower bound vectors.
 * @param {array<real>} vec2 Description
 * @param {array<real>} a The lower bound vec2
 * @param {array<real>} b The upper bound vec2
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec2_clamp(vec2, a, b, out = array_create(2)) {
    out[@ 0] = clamp(vec2[0], a[0], b[0]);
    out[@ 1] = clamp(vec2[1], a[1], b[1]);
    return out;
}

/**
 * Returns a vector2 with the magnitude set to the specified value. This can be used as a general version of `ddd_vec2_normalize`.
 * This will return nonsense if the input vector is the zero vector.
 * You can modify the original vector instead of creating a new one by passing its reference as the output.
 * @param {array<real>} vec2 The vector
 * @param {real} mag The magnitude to set the vector to
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec2_clamp_magnitude(vec2, mag, out = array_create(2)) {
    var d = point_distance(0, 0, vec2[0], vec2[1]) / mag;
    out[@ 0] = vec2[0] / d;
    out[@ 1] = vec2[1] / d;
    return out;
}

/**
 * Returns a vector2 with each component containing the smaller of the same component on the input vectors.
 * @param {array<real>} a The first vec2 to compare
 * @param {array<real>} b The second vec2 to compare
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec2_min(vec2, value, out = array_create(2)) {
    out[@ 0] = min(vec2[0], value[0]);
    out[@ 1] = min(vec2[1], value[1]);
    return out;
}

/**
 * Returns a vector2 with each component containing the larger of the same component on the input vectors.
 * @param {array<real>} a The first vec2 to compare
 * @param {array<real>} b The second vec2 to compare
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec2_max(vec2, value, out = array_create(2)) {
    out[@ 0] = max(vec2[0], value[0]);
    out[@ 1] = max(vec2[1], value[1]);
    return out;
}
#endregion

#region Number bits
/**
 * Returns a vector containing the absolute value of each component of the original vector.
 * @param {array<real>} vec2 The vector
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec2_abs(vec2, mag, out = array_create(2)) {
    out[@ 0] = abs(vec2[0]);
    out[@ 1] = abs(vec2[1]);
    return out;
}

/**
 * Returns a vector containing the fractional part of each component the original vector.
 * @param {array<real>} vec2 The vector
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec2_frac(vec2, out = array_create(2)) {
    out[@ 0] = frac(vec2[0]);
    out[@ 1] = frac(vec2[1]);
    return out;
}

/**
 * Rounds each of the components of a vector up to the next smallest integer.
 * This will not modify the original vector, unless you pass its reference as the output parameter.
 * @param {array<real>} vec2 The vector
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec2_floor(vec2, out = array_create(2)) {
    out[@ 0] = floor(vec2[0]);
    out[@ 1] = floor(vec2[1]);
    return out;
}

/**
 * Rounds each of the components of a vector up to the next largest integer.
 * This will not modify the original vector, unless you pass its reference as the output parameter.
 * @param {array<real>} vec2 The vector
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec2_ceil(vec2, out = array_create(2)) {
    out[@ 0] = ceil(vec2[0]);
    out[@ 1] = ceil(vec2[1]);
    return out;
}

/**
 * Rounds each of the components of a vector to an integer, using bankers' rounding:
 * https://stackoverflow.com/questions/45223778/is-bankers-rounding-really-more-numerically-stable
 * This will not modify the original vector, unless you pass its reference as the output parameter.
 * @param {array<real>} vec2 The vector
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec2_round(vec2, out = array_create(2)) {
    out[@ 0] = round(vec2[0]);
    out[@ 1] = round(vec2[1]);
    return out;
}
#endregion

#region All of the other stuff
/**
 * Calculates the magnitude of a vector, or how far from the origin it is.
 * @param {array<real>} vec2 The vector
 * @returns {real}
 * @pure
 */
function ddd_vec2_mag(vec2) {
    return point_distance(0, 0, vec2[0], vec2[1]);
}

/**
 * Calculates the dot product of two vectors. This is often used as a measure of how similar two vectors are:
 * https://en.wikipedia.org/wiki/Dot_product
 * @param {array<real>} a The first vec2
 * @param {array<real>} b The second vec2
 * @returns {real}
 * @pure
 */
function ddd_vec2_dot(a, b) {
    return dot_product(a[0], a[1], b[0], b[1]);
}

/**
 * Normaliz(s)es a vector, setting its magnitude equal to 1 but preserving the relative proportions of its components:
 * https://en.wikipedia.org/wiki/Unit_vector
 * This will return nonsense if the input vector is the zero vector.
 * You can modify the original vector instead of creating a new one by passing its reference as the output.
 * @param {array<real>} vec2 The vec2 to normaliz(s)e
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec2_normalize(vec2, out = array_create(2)) {
    var mag = point_distance(0, 0, vec2[0], vec2[1]);
    out[@ 0] = vec2[0] / mag;
    out[@ 1] = vec2[1] / mag;
    return out;
}

/**
 * Projects one vector onto another; this can be used to figure out how much of vector `a` heads in the direction of vector `b`.
 * https://en.wikipedia.org/wiki/Vector_projection
 * @param {array<real>} a The vec2 to do the projecting
 * @param {array<real>} b The vec2 to be projected onto
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec2_project(vec2, dir, out = array_create(2)) {
    var f = dot_product(vec2[0], vec2[1], dir[0], dir[1]) / dot_product(dir[0], dir[1], dir[0], dir[1]);
    out[@ 0] = dir[0] * f;
    out[@ 1] = dir[1] * f;
    return out;
}

/**
 * Linearly interpolates one vector to another, moving between the two by a specified percentage.
 * `amount` may be a vector or a scalar:
 * https://en.wikipedia.org/wiki/Linear_interpolation
 * @param {array<real>} a The first vec2
 * @param {array<real>} b The second vec2
 * @param {any} amount The normalized percentage to interpolate from a to b; values outside the range of [0, 1] will extrapolate instead
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec2_lerp(vec2, target, amount, out = array_create(2)) {
    if (is_array(amount)) {
        out[@ 0] = lerp(vec2[0], target[0], amount[0]);
        out[@ 1] = lerp(vec2[1], target[1], amount[1]);
    } else {
        out[@ 0] = lerp(vec2[0], target[0], amount);
        out[@ 1] = lerp(vec2[1], target[1], amount);
    }
    return out;
}

/**
 * Calculates the angle between two vectors.
 * @param {array<real>} a The first vec2
 * @param {array<real>} b The second vec2
 * @returns {real}
 * @pure
 */
function ddd_vec2_angle(a, b) {
    return darccos(dot_product(a[0], a[1], b[0], b[1]) / (point_distance(0, 0, a[0], a[1]) * point_distance(0, 0, b[0], b[1])));
}

/**
 * Move one vector towards another by an exact amount, while never overshooting.
 * @param {array<real>} a The vec2 to move from
 * @param {array<real>} b The vec2 to move to
 * @param {real} amount The distance to move `a` towards `b`
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec2_approach(a, b, amount, out = array_create(2)) {
    var total_dist = point_distance(b[0], b[1], a[0], a[1]);
    var dist = max(total_dist - amount, 0);
    var f = dist / total_dist;
    
    out[@ 0] = lerp(b[0], a[0], f);
    out[@ 1] = lerp(b[1], a[1], f);
    
    return out;
}

/**
 * Interpolates between two vectors using spherical interpolation. This can be used for things such as smoothly rotating an object.
 * Yes, it's really called that: https://en.wikipedia.org/wiki/Slerp
 * @param {array<real>} a The vec2 to slerp from
 * @param {array<real>} b The vec2 to slerp to
 * @param {real} amount The normalized percentage to slerp from a to b; values outside the range of [0, 1] will extrapolate instead
 * @param {array<real>} [out] An array to output the results into; a new one will be created if not provided (optional)
 * @returns {array<real>} Returns a new array, or the `out` array with containing the result
 * @pure
 */
function ddd_vec2_slerp(a, b, amount, out = array_create(2)) {
    var dot = dot_product_normalized(a[0], a[1], b[0], b[1]);
    var theta = arccos(dot) * amount;
    var relative_sub = ddd_vec2_sub(b, a);
    var relative_product = ddd_vec2_mul(relative_sub, dot);
    ddd_vec2_normalize(relative_product, relative_product);
    var relative_cos_product = ddd_vec2_mul(a, cos(theta));
    var relative_sin_product = ddd_vec2_mul(relative_product, sin(theta));
    return ddd_vec2_add(relative_cos_product, relative_sin_product, out);
}
#endregion