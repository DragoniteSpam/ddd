// Feather disable all

function ddd_vec4(x, y, z, w, out = array_create(4)) {
    out[@ 0] = x;
    out[@ 1] = y;
    out[@ 2] = z;
    out[@ 3] = w;
    return out;
}

#region Boring stuff
function ddd_vec4_to_string(vec4) {
    return string("({0}, {1}, {2}, {3})", vec4[0], vec4[1], vec4[2], vec4[3]);
}

function ddd_vec4_clone(vec4, out = array_create(4)) {
    out[@ 0] = vec4[0];
    out[@ 1] = vec4[1];
    out[@ 2] = vec4[2];
    out[@ 3] = vec4[3];
    return out;
}

function ddd_vec4_equals(a, b, out = array_create(4)) {
    out[@ 0] = (a[0] == b[0]);
    out[@ 1] = (a[1] == b[1]);
    out[@ 2] = (a[2] == b[2]);
    out[@ 3] = (a[3] == b[3]);
    return out;
}
#endregion

#region Presets
function ddd_vec4_zero(out = array_create(4)) {
    out[@ 0] = 0;
    out[@ 1] = 0;
    out[@ 2] = 0;
    out[@ 3] = 0;
    return out;
}

function ddd_vec4_one(out = array_create(4)) {
    out[@ 0] = 1;
    out[@ 1] = 1;
    out[@ 2] = 1;
    out[@ 3] = 1;
    return out;
}

function ddd_vec4_infinity(out = array_create(4)) {
    out[@ 0] = infinity;
    out[@ 1] = infinity;
    out[@ 2] = infinity;
    out[@ 3] = infinity;
    return out;
}

function ddd_vec4_minus_infinity(out = array_create(4)) {
    out[@ 0] = -infinity;
    out[@ 1] = -infinity;
    out[@ 2] = -infinity;
    out[@ 3] = -infinity;
    return out;
}
#endregion

#region Basic arithmetic
function ddd_vec4_add(vec4, operand, out = array_create(4)) {
    if (is_numeric(operand)) {
        return ddd_vec4_add_scalar(vec4, operand, out);
    }
    return ddd_vec4_add_vec4(vec4, operand, out);
}

function ddd_vec4_add_vec4(a, b, out = array_create(4)) {
    out[@ 0] = a[0] + b[0];
    out[@ 1] = a[1] + b[1];
    out[@ 2] = a[2] + b[2];
    out[@ 3] = a[3] + b[3];
    return out;
}

function ddd_vec4_add_scalar(vec4, scalar, out = array_create(4)) {
    out[@ 0] = vec4[0] + scalar;
    out[@ 1] = vec4[1] + scalar;
    out[@ 2] = vec4[2] + scalar;
    out[@ 3] = vec4[3] + scalar;
    return out;
}

function ddd_vec4_sub(vec4, operand, out = array_create(4)) {
    if (is_numeric(operand)) {
        return ddd_vec4_sub_scalar(vec4, operand, out);
    }
    return ddd_vec4_sub_vec4(vec4, operand, out);
}

function ddd_vec4_sub_vec4(a, b, out = array_create(4)) {
    out[@ 0] = a[0] - b[0];
    out[@ 1] = a[1] - b[1];
    out[@ 2] = a[2] - b[2];
    out[@ 3] = a[3] - b[3];
    return out;
}

function ddd_vec4_sub_scalar(vec4, scalar, out = array_create(4)) {
    out[@ 0] = vec4[0] - scalar;
    out[@ 1] = vec4[1] - scalar;
    out[@ 2] = vec4[2] - scalar;
    out[@ 3] = vec4[3] - scalar;
    return out;
}

function ddd_vec4_mul(vec4, operand, out = array_create(4)) {
    if (is_numeric(operand)) {
        return ddd_vec4_mul_scalar(vec4, operand, out);
    }
    return ddd_vec4_mul_vec4(vec4, operand, out);
}

function ddd_vec4_mul_vec4(a, b, out = array_create(4)) {
    out[@ 0] = a[0] * b[0];
    out[@ 1] = a[1] * b[1];
    out[@ 2] = a[2] * b[2];
    out[@ 3] = a[3] * b[3];
    return out;
}

function ddd_vec4_mul_scalar(vec4, scalar, out = array_create(4)) {
    out[@ 0] = vec4[0] * scalar;
    out[@ 1] = vec4[1] * scalar;
    out[@ 2] = vec4[2] * scalar;
    out[@ 3] = vec4[3] * scalar;
    return out;
}

function ddd_vec4_div(vec4, operand, out = array_create(4)) {
    if (is_numeric(operand)) {
        return ddd_vec4_div_scalar(vec4, operand, out);
    }
    return ddd_vec4_div_vec4(vec4, operand, out);
}

function ddd_vec4_div_vec4(a, b, out = array_create(4)) {
    out[@ 0] = a[0] / b[0];
    out[@ 1] = a[1] / b[1];
    out[@ 2] = a[2] / b[2];
    out[@ 3] = a[3] / b[3];
    return out;
}

function ddd_vec4_div_scalar(vec4, scalar, out = array_create(4)) {
    out[@ 0] = vec4[0] / scalar;
    out[@ 1] = vec4[1] / scalar;
    out[@ 2] = vec4[2] / scalar;
    out[@ 3] = vec4[3] / scalar;
    return out;
}
#endregion

#region Bounds
function ddd_vec4_clamp(vec4, a, b, out = array_create(4)) {
    out[@ 0] = clamp(vec4[0], a[0], b[0]);
    out[@ 1] = clamp(vec4[1], a[1], b[1]);
    out[@ 2] = clamp(vec4[2], a[2], b[2]);
    out[@ 3] = clamp(vec4[3], a[3], b[3]);
    return out;
}

function ddd_vec4_clamp_magnitude(vec4, mag, out = array_create(4)) {
    var d = sqrt(sqr(vec4[0]) + sqr(vec4[1]) + sqr(vec4[2]) + sqr(vec4[3])) / mag;
    out[@ 0] = vec4[0] / d;
    out[@ 1] = vec4[1] / d;
    out[@ 2] = vec4[2] / d;
    out[@ 3] = vec4[3] / d;
    return out;
}

function ddd_vec4_min(vec4, value, out = array_create(4)) {
    out[@ 0] = min(vec4[0], value[0]);
    out[@ 1] = min(vec4[1], value[1]);
    out[@ 2] = min(vec4[2], value[2]);
    out[@ 3] = min(vec4[3], value[3]);
    return out;
}

function ddd_vec4_max(vec4, value, out = array_create(4)) {
    out[@ 0] = max(vec4[0], value[0]);
    out[@ 1] = max(vec4[1], value[1]);
    out[@ 2] = max(vec4[2], value[2]);
    out[@ 3] = max(vec4[3], value[3]);
    return out;
}
#endregion

#region Number bits
function ddd_vec4_abs(vec4, mag, out = array_create(4)) {
    out[@ 0] = abs(vec4[0]);
    out[@ 1] = abs(vec4[1]);
    out[@ 2] = abs(vec4[2]);
    out[@ 3] = abs(vec4[3]);
    return out;
}

function ddd_vec4_frac(vec4, out = array_create(4)) {
    out[@ 0] = frac(vec4[0]);
    out[@ 1] = frac(vec4[1]);
    out[@ 2] = frac(vec4[2]);
    out[@ 3] = frac(vec4[3]);
    return out;
}

function ddd_vec4_floor(vec4, out = array_create(4)) {
    out[@ 0] = floor(vec4[0]);
    out[@ 1] = floor(vec4[1]);
    out[@ 2] = floor(vec4[2]);
    out[@ 3] = floor(vec4[3]);
    return out;
}

function ddd_vec4_ceil(vec4, out = array_create(4)) {
    out[@ 0] = ceil(vec4[0]);
    out[@ 1] = ceil(vec4[1]);
    out[@ 2] = ceil(vec4[2]);
    out[@ 3] = ceil(vec4[3]);
    return out;
}

function ddd_vec4_round(vec4, out = array_create(4)) {
    out[@ 0] = round(vec4[0]);
    out[@ 1] = round(vec4[1]);
    out[@ 2] = round(vec4[2]);
    out[@ 3] = round(vec4[3]);
    return out;
}
#endregion

#region All of the other stuff
function ddd_vec4_mag(vec4) {
    return sqrt(sqr(vec4[0]) + sqr(vec4[1]) + sqr(vec4[2]) + sqr(vec4[3]));
}

function ddd_vec4_dot(a, b) {
    return dot_product_3d(a[0], a[1], a[2], b[0], b[1], b[2]) + a[3] * b[3];
}

function ddd_vec4_normalize(vec4, out = array_create(4)) {
    var mag = sqrt(sqr(vec4[0]) + sqr(vec4[1]) + sqr(vec4[2]) + sqr(vec4[3]));
    out[@ 0] = vec4[0] / mag;
    out[@ 1] = vec4[1] / mag;
    out[@ 2] = vec4[2] / mag;
    out[@ 3] = vec4[3] / mag;
    return out;
}

function ddd_vec4_project(vec4, dir, out = array_create(4)) {
    var f = (dot_product_3d(vec4[0], vec4[1], vec4[2], dir[0], dir[1], dir[2]) + vec4[3] * dir[3]) / (dot_product_3d(dir[0], dir[1], dir[2], dir[0], dir[1], dir[2]) + sqr(dir[3]));
    out[@ 0] = dir[0] * f;
    out[@ 1] = dir[1] * f;
    out[@ 2] = dir[2] * f;
    out[@ 3] = dir[3] * f;
    return out;
}

function ddd_vec4_lerp(vec4, target, amount, out = array_create(4)) {
    out[@ 0] = lerp(vec4[0], target[0], amount[0]);
    out[@ 1] = lerp(vec4[1], target[1], amount[1]);
    out[@ 2] = lerp(vec4[2], target[2], amount[2]);
    out[@ 3] = lerp(vec4[3], target[3], amount[3]);
    return out;
}

function ddd_vec4_angle(vec4, value) {
    return darccos(
        (dot_product_3d(vec4[0], vec4[1], vec4[2], value[0], value[1], value[2]) + vec4[3] * value[3]) /
        (sqrt(sqr(vec4[0]) + sqr(vec4[1]) + sqr(vec4[2]) + sqr(vec4[3])) * sqrt(sqr(value[0]) + sqr(value[1]) + sqr(value[2]) + sqr(value[3])))
    );
}

function ddd_vec4_approach(vec4, target, amount, out = array_create(4)) {
    var total_dist = sqrt(target[0] * vec4[0] + target[1] * vec4[1] + target[2] * vec4[2] + target[3] * vec4[3]);
    var dist = max(total_dist - amount, 0);
    var f = dist / total_dist;
    
    out[@ 0] = lerp(target[0], vec4[0], f);
    out[@ 1] = lerp(target[1], vec4[1], f);
    out[@ 2] = lerp(target[2], vec4[2], f);
    out[@ 3] = lerp(target[3], vec4[3], f);
    
    return out;
}

function ddd_vec4_slerp(vec4, target, amount, out = array_create(4)) {
    var dot = dot_product_3d_normalized(vec4[0], vec4[1], vec4[2], target[0], target[1], target[2]) + vec4[3] * target[3];
    var theta = arccos(dot) * amount;
    var relative_sub = ddd_vec4_sub(target, vec4);
    var relative_product = ddd_vec4_mul(relative_sub, dot);
    ddd_vec4_normalize(relative_product, relative_product);
    var relative_cos_product = ddd_vec4_mul(vec4, cos(theta));
    var relative_sin_product = ddd_vec4_mul(relative_product, sin(theta));
    return ddd_vec4_add(relative_cos_product, relative_sin_product, out);
}
#endregion