// Feather disable all

/// @func ddd_matrix_build_from_quat(position, quaternion, scale, [matrix])
/// @desc Build a transformation matrix from position, quaternion and scale.
/// @param {Array.Vec3} position The position of the transformation.
/// @param {Array.Quaternion} quaternion The quaternion of the transformation.
/// @param {Array.Vec3} scale The scale of the transformation.
/// @param {Array.Matrix} [matrix] The matrix to build into (optional).
/// @returns {Array.Matrix}
/// @pure

function ddd_matrix_build_from_quat(position, quaternion, scale, matrix = array_create(16))
{
	var qx = quaternion[0], qy = quaternion[1], qz = quaternion[2], qw = quaternion[3];
	
	var x2 = qx + qx, y2 = qy + qy, z2 = qz + qz;
	var xx = qx * x2, xy = qx * y2, xz = qx * z2;
	var yy = qy * y2, yz = qy * z2, zz = qz * z2;
	var wx = qw * x2, wy = qw * y2, wz = qw * z2;

	var sx = scale[0], sy = scale[1], sz = scale[2];

	matrix[@0] = ( 1 - ( yy + zz ) ) * sx;
	matrix[@1] = ( xy + wz ) * sx;
	matrix[@2] = ( xz - wy ) * sx;
	matrix[@3] = 0;

	matrix[@4] = ( xy - wz ) * sy;
	matrix[@5] = ( 1 - ( xx + zz ) ) * sy;
	matrix[@6] = ( yz + wx ) * sy;
	matrix[@7] = 0;

	matrix[@8] = ( xz + wy ) * sz;
	matrix[@9] = ( yz - wx ) * sz;
	matrix[@10] = ( 1 - ( xx + yy ) ) * sz;
	matrix[@11] = 0;

	matrix[@12] = position[0];
	matrix[@13] = position[1];
	matrix[@14] = position[2];
	matrix[@15] = 1;
	
	return matrix;
}