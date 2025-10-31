// Feather disable all

// I doubt many people would actually use these but it's tradition to include this stuff
#macro DDD_X 0
#macro DDD_Y 1
#macro DDD_Z 2
#macro DDD_W 3

function ddd_vec2(x, y) {
    return [x, y];
}

#region Boring stuff
function ddd_vec2_to_string(vec2) {
    return string("({0}, {1})", vec2[0], vec2[1]);
}

function ddd_vec2_set(vec2, x, y) {
    vec2[0] = x;
    vec2[1] = y;
}

function ddd_vec2_clone(vec2) {
    return [vec2[0], vec2[1]];
}

function ddd_vec2_equals(a, b) {
    return (a[0] == b[0]) && (a[1] == b[1]);
}
#endregion

#region Presets
function ddd_vec2_zero() {
    return [0, 0];
}

function ddd_vec2_one() {
    return [1, 1];
}

function ddd_vec2_infinity() {
    return [infinity, infinity];
}

function ddd_vec2_minus_infinity() {
    return [-infinity, -infinity];
}
#endregion

#region Basic arithmetic
function ddd_vec2_add(vec2, operand) {
    if (is_numeric(operand)) {
        return ddd_vec2_add_scalar(vec2, operand);
    }
    return ddd_vec2_add_vec2(vec2, operand);
}

function ddd_vec2_add_vec2(a, b) {
    return [a[0] + b[0], a[1] + b[1]];
}

function ddd_vec2_add_scalar(vec2, scalar) {
    return [vec2[0] + scalar, vec2[1] + scalar];
}

function ddd_vec2_sub(vec2, operand) {
    if (is_numeric(operand)) {
        return ddd_vec2_sub_scalar(vec2, operand);
    }
    return ddd_vec2_sub_vec2(vec2, operand);
}

function ddd_vec2_sub_vec2(a, b) {
    return [a[0] - b[0], a[1] - b[1]];
}

function ddd_vec2_sub_scalar(vec2, scalar) {
    return [vec2[0] - scalar, vec2[1] - scalar];
}

function ddd_vec2_mul(vec2, operand) {
    if (is_numeric(operand)) {
        return ddd_vec2_mul_scalar(vec2, operand);
    }
    return ddd_vec2_mul_vec2(vec2, operand);
}

function ddd_vec2_mul_vec2(a, b) {
    return [a[0] * b[0], a[1] * b[1]];
}

function ddd_vec2_mul_scalar(vec2, scalar) {
    return [vec2[0] * scalar, vec2[1] * scalar];
}

function ddd_vec2_div(vec2, operand) {
    if (is_numeric(operand)) {
        return ddd_vec2_div_scalar(vec2, operand);
    }
    return ddd_vec2_div_vec2(vec2, operand);
}

function ddd_vec2_div_vec2(a, b) {
    return [a[0] / b[0], a[1] / b[1]];
}

function ddd_vec2_div_scalar(vec2, scalar) {
    return [vec2[0] / scalar, vec2[1] / scalar];
}
#endregion

#region Bounds
function ddd_vec2_clamp(vec2, a, b) {
    return [clamp(vec2[0], a[0], b[0]), clamp(vec2[1], a[1], b[1])];
}

function ddd_vec2_clamp_magnitude(vec2, mag) {
    var d = point_distance(0, 0, vec2[0], vec2[1]) / mag;
    return [vec2[0] / d, vec2[1] / d];
}

function ddd_vec2_min(vec2, value) {
    return [min(vec2[0], value[0]), min(vec2[1], value[1])];
}

function ddd_vec2_max(vec2, value) {
    return [max(vec2[0], value[0]), max(vec2[1], value[1])];
}
#endregion

#region Number bits
function ddd_vec2_abs(vec2, mag) {
    return [abs(vec2[0]), abs(vec2[1])];
}

function ddd_vec2_frac(vec2) {
    return [frac(vec2[0]), frac(vec2[1])];
}

function ddd_vec2_floor(vec2) {
    return [floor(vec2[0]), floor(vec2[1])];
}

function ddd_vec2_ceil(vec2) {
    return [ceil(vec2[0]), ceil(vec2[1])];
}

function ddd_vec2_round(vec2) {
    return [round(vec2[0]), round(vec2[1])];
}
#endregion

#region All of the other stuff
function ddd_vec2_mag(vec2) {
    return point_distance(0, 0, vec2[0], vec2[1]);
}

function ddd_vec2_dot(a, b) {
    return dot_product(a[0], a[1], b[0], b[1]);
}

function ddd_vec2_normalize(vec2) {
    var mag = point_distance(0, 0, vec2[0], vec2[1]);
    return [vec2[0] / mag, vec2[1] / mag];
}

function ddd_vec2_normalize_in_place(vec2) {
    var mag = point_distance(0, 0, vec2[0], vec2[1]);
    vec2[0] /= mag;
    vec2[1] /= mag;
    return vec2;
}

function ddd_vec2_project(vec2, dir) {
    var f = dot_product(vec2[0], vec2[1], dir[0], dir[1]) / dot_product(dir[0], dir[1], dir[0], dir[1]);
    return [dir[0] * f, dir[1] * f];
}

function ddd_vec2_lerp(vec2, target, amount) {
    return [lerp(vec2[0], target[0], amount[0]), lerp(vec2[1], target[1], amount[1])];
}

function ddd_vec2_angle(vec2, value) {
    return darccos(dot_product(vec2[0], vec2[1], value[0], value[1]) / (point_distance(0, 0, vec2[0], vec2[1]) * point_distance(0, 0, value[0], value[1])));
}

function ddd_vec2_approach(vec2, target, amount) {
    var total_dist = point_distance(target[0], target[1], vec2[0], vec2[1]);
    var dist = max(total_dist - amount, 0);
    var f = dist / total_dist;
    
    return [
        lerp(target[0], vec2[0], f),
        lerp(target[1], vec2[1], f)
    ];
}

function ddd_vec2_slerp(vec2, target, amount) {
    var dot = dot_product_normalized(vec2[0], vec2[1], target[0], target[1]);
    var theta = arccos(dot) * amount;
    var relative_sub = ddd_vec2_sub(target, vec2);
    var relative_product = ddd_vec2_mul(relative_sub, dot);
    ddd_vec2_normalize_in_place(relative_product);
    var relative_cos_product = ddd_vec2_mul(vec2, cos(theta));
    var relative_sin_product = ddd_vec2_mul(relative_product, sin(theta));
    return ddd_vec2_add(relative_cos_product, relative_sin_product);
}
#endregion