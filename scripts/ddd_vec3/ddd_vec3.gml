// Feather disable all

// I doubt many people would actually use these but it's tradition to include this stuff
#macro DDD_X 0
#macro DDD_Y 1
#macro DDD_Z 2
#macro DDD_W 3

function ddd_vec3(x, y, z, out = array_create(3)) {
    out[@ 0] = x;
    out[@ 1] = y;
    out[@ 2] = z;
    return out;
}

#region Boring stuff
function ddd_vec3_to_string(vec3) {
    return string("({0}, {1}, {2})", vec3[0], vec3[1], vec3[2]);
}

function ddd_vec3_clone(vec3, out = array_create(3)) {
    out[@ 0] = vec3[0];
    out[@ 1] = vec3[1];
    out[@ 2] = vec3[2];
    return out;
}

function ddd_vec3_equals(a, b, out = array_create(3)) {
    out[@ 0] = (a[0] == b[0]);
    out[@ 1] = (a[1] == b[1]);
    out[@ 2] = (a[2] == b[2]);
    return out;
}
#endregion

#region Presets
function ddd_vec3_zero(out = array_create(3)) {
    out[@ 0] = 0;
    out[@ 1] = 0;
    out[@ 2] = 0;
    return out;
}

function ddd_vec3_one(out = array_create(3)) {
    out[@ 0] = 1;
    out[@ 1] = 1;
    out[@ 2] = 1;
    return out;
}

function ddd_vec3_infinity(out = array_create(3)) {
    out[@ 0] = infinity;
    out[@ 1] = infinity;
    out[@ 2] = infinity;
    return out;
}

function ddd_vec3_minus_infinity(out = array_create(3)) {
    out[@ 0] = -infinity;
    out[@ 1] = -infinity;
    out[@ 2] = -infinity;
    return out;
}
#endregion

#region Basic arithmetic
function ddd_vec3_add(vec3, operand, out = array_create(3)) {
    if (is_numeric(operand)) {
        return ddd_vec3_add_scalar(vec3, operand, out);
    }
    return ddd_vec3_add_vec3(vec3, operand, out);
}

function ddd_vec3_add_vec3(a, b, out = array_create(3)) {
    out[@ 0] = a[0] + b[0];
    out[@ 1] = a[1] + b[1];
    out[@ 2] = a[2] + b[2];
    return out;
}

function ddd_vec3_add_scalar(vec3, scalar, out = array_create(3)) {
    out[@ 0] = vec3[0] + scalar;
    out[@ 1] = vec3[1] + scalar;
    out[@ 2] = vec3[2] + scalar;
    return out;
}

function ddd_vec3_sub(vec3, operand, out = array_create(3)) {
    if (is_numeric(operand)) {
        return ddd_vec3_sub_scalar(vec3, operand, out);
    }
    return ddd_vec3_sub_vec3(vec3, operand, out);
}

function ddd_vec3_sub_vec3(a, b, out = array_create(3)) {
    out[@ 0] = a[0] - b[0];
    out[@ 1] = a[1] - b[1];
    out[@ 2] = a[2] - b[2];
    return out;
}

function ddd_vec3_sub_scalar(vec3, scalar, out = array_create(3)) {
    out[@ 0] = vec3[0] - scalar;
    out[@ 1] = vec3[1] - scalar;
    out[@ 2] = vec3[2] - scalar;
    return out;
}

function ddd_vec3_mul(vec3, operand, out = array_create(3)) {
    if (is_numeric(operand)) {
        return ddd_vec3_mul_scalar(vec3, operand, out);
    }
    return ddd_vec3_mul_vec3(vec3, operand, out);
}

function ddd_vec3_mul_vec3(a, b, out = array_create(3)) {
    out[@ 0] = a[0] * b[0];
    out[@ 1] = a[1] * b[1];
    out[@ 2] = a[2] * b[2];
    return out;
}

function ddd_vec3_mul_scalar(vec3, scalar, out = array_create(3)) {
    out[@ 0] = vec3[0] * scalar;
    out[@ 1] = vec3[1] * scalar;
    out[@ 2] = vec3[2] * scalar;
    return out;
}

function ddd_vec3_div(vec3, operand, out = array_create(3)) {
    if (is_numeric(operand)) {
        return ddd_vec3_div_scalar(vec3, operand, out);
    }
    return ddd_vec3_div_vec3(vec3, operand, out);
}

function ddd_vec3_div_vec3(a, b, out = array_create(3)) {
    out[@ 0] = a[0] / b[0];
    out[@ 1] = a[1] / b[1];
    out[@ 2] = a[2] / b[2];
    return out;
}

function ddd_vec3_div_scalar(vec3, scalar, out = array_create(3)) {
    out[@ 0] = vec3[0] / scalar;
    out[@ 1] = vec3[1] / scalar;
    out[@ 2] = vec3[2] / scalar;
    return out;
}
#endregion

#region Bounds
function ddd_vec3_clamp(vec3, a, b, out = array_create(3)) {
    out[@ 0] = clamp(vec3[0], a[0], b[0]);
    out[@ 1] = clamp(vec3[1], a[1], b[1]);
    out[@ 2] = clamp(vec3[2], a[2], b[2]);
    return out;
}

function ddd_vec3_clamp_magnitude(vec3, mag, out = array_create(3)) {
    var d = point_distance_3d(0, 0, 0, vec3[0], vec3[1], vec3[2]) / mag;
    out[@ 0] = vec3[0] / d;
    out[@ 1] = vec3[1] / d;
    out[@ 2] = vec3[2] / d;
    return out;
}

function ddd_vec3_min(vec3, value, out = array_create(3)) {
    out[@ 0] = min(vec3[0], value[0]);
    out[@ 1] = min(vec3[1], value[1]);
    out[@ 2] = min(vec3[2], value[2]);
    return out;
}

function ddd_vec3_max(vec3, value, out = array_create(3)) {
    out[@ 0] = max(vec3[0], value[0]);
    out[@ 1] = max(vec3[1], value[1]);
    out[@ 2] = max(vec3[2], value[2]);
    return out;
}
#endregion

#region Number bits
function ddd_vec3_abs(vec3, mag, out = array_create(3)) {
    out[@ 0] = abs(vec3[0]);
    out[@ 1] = abs(vec3[1]);
    out[@ 2] = abs(vec3[2]);
    return out;
}

function ddd_vec3_frac(vec3, out = array_create(3)) {
    out[@ 0] = frac(vec3[0]);
    out[@ 1] = frac(vec3[1]);
    out[@ 2] = frac(vec3[2]);
    return out;
}

function ddd_vec3_floor(vec3, out = array_create(3)) {
    out[@ 0] = floor(vec3[0]);
    out[@ 1] = floor(vec3[1]);
    out[@ 2] = floor(vec3[2]);
    return out;
}

function ddd_vec3_ceil(vec3, out = array_create(3)) {
    out[@ 0] = ceil(vec3[0]);
    out[@ 1] = ceil(vec3[1]);
    out[@ 2] = ceil(vec3[2]);
    return out;
}

function ddd_vec3_round(vec3, out = array_create(3)) {
    out[@ 0] = round(vec3[0]);
    out[@ 1] = round(vec3[1]);
    out[@ 2] = round(vec3[2]);
    return out;
}
#endregion

#region All of the other stuff
function ddd_vec3_mag(vec3) {
    return point_distance_3d(0, 0, 0, vec3[0], vec3[1], vec3[2]);
}

function ddd_vec3_dot(a, b) {
    return dot_product_3d(a[0], a[1], a[2], b[0], b[1], b[2]);
}

function ddd_vec3_normalize(vec3, out = array_create(3)) {
    var mag = point_distance_3d(0, 0, 0, vec3[0], vec3[1], vec3[2]);
    out[@ 0] = vec3[0] / mag;
    out[@ 1] = vec3[1] / mag;
    out[@ 2] = vec3[2] / mag;
    return out;
}

function ddd_vec3_project(vec3, dir, out = array_create(3)) {
    var f = dot_product_3d(vec3[0], vec3[1], vec3[2], dir[0], dir[1], dir[2]) / dot_product_3d(dir[0], dir[1], dir[2], dir[0], dir[1], dir[2]);
    out[@ 0] = dir[0] * f;
    out[@ 1] = dir[1] * f;
    out[@ 2] = dir[2] * f;
    return out;
}

function ddd_vec3_lerp(vec3, target, amount, out = array_create(3)) {
    out[@ 0] = lerp(vec3[0], target[0], amount[0]);
    out[@ 1] = lerp(vec3[1], target[1], amount[1]);
    out[@ 2] = lerp(vec3[2], target[2], amount[2]);
    return out;
}

function ddd_vec3_angle(vec3, value) {
    return darccos(
        dot_product_3d(vec3[0], vec3[1], vec3[2], value[0], value[1], value[2]) /
        (point_distance_3d(0, 0, 0, vec3[0], vec3[1], vec3[2]) * point_distance_3d(0, 0, 0, value[0], value[1], value[2]))
    );
}

function ddd_vec3_cross(a, b, out = array_create(3)) {
    out[0] = a[1] * b[2] - b[1] * a[2];
    out[1] = a[2] * b[0] - b[2] * a[0];
    out[2] = a[0] * b[1] - b[0] * a[1];
    return out;
};

function ddd_vec3_approach(vec3, target, amount, out = array_create(3)) {
    var total_dist = point_distance_3d(target[0], target[1], target[2], vec3[0], vec3[1], vec3[2]);
    var dist = max(total_dist - amount, 0);
    var f = dist / total_dist;
    
    out[@ 0] = lerp(target[0], vec3[0], f);
    out[@ 1] = lerp(target[1], vec3[1], f);
    out[@ 2] = lerp(target[2], vec3[2], f);
    
    return out;
}

function ddd_vec3_slerp(vec3, target, amount, out = array_create(3)) {
    var dot = dot_product_3d_normalized(vec3[0], vec3[1], vec3[2], target[0], target[1], target[2]);
    var theta = arccos(dot) * amount;
    var relative_sub = ddd_vec3_sub(target, vec3);
    var relative_product = ddd_vec3_mul(relative_sub, dot);
    ddd_vec3_normalize(relative_product, relative_product);
    var relative_cos_product = ddd_vec3_mul(vec3, cos(theta));
    var relative_sin_product = ddd_vec3_mul(relative_product, sin(theta));
    return ddd_vec3_add(relative_cos_product, relative_sin_product, out);
}
#endregion