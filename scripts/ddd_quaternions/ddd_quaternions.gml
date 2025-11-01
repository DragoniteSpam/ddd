// Feather disable all

/*
	Quaternions are a way of representing a rotation in 3D space without the woes of Euler. Quaternions have 4 components; X, Y, Z and W, all clamped between -1 and 1.
	Whilst quaternions are not as intuitive as Euler, they do have two extra advantages. Quaternions do not gimble lock, that it to say you can rotate in any which way without
	one of the rotation axis getting locked. Quaternions can also interpolate much more smoothly, which is great for animations.
*/

#region Build functions

/// @func ddd_quaternion_identity([quaternion])
/// @desc Build an identity quaternion and return it back.
/// @param {Array.Quaternion} [quaternion] Quaternion to identity-ify (optional).
/// @returns {Array.Quaternion}
function ddd_quaternion_identity(quaternion = array_create(4))
{
	// An identity quaternion is always (0, 0, 0, 1), which represents no rotation
	quaternion[@ 0] = 0;
	quaternion[@ 1] = 0;
	quaternion[@ 2] = 0;
	quaternion[@ 3] = 1;
	
	return quaternion;
}

/// @func ddd_quaternion_from_axis_angle(axisX, axisY, axisZ, angle, [quaternion])
/// @desc Build a quaternion from an axis angle.
/// @param {Real} axisX x-component of rotation axis.
/// @param {Real} axisY y-component of rotation axis.
/// @param {Real} axisZ z-component of rotation axis.
/// @param {Real} angle Rotation angle in degrees.
/// @param {Array.Quaternion} [quaternion] Quaternion to build to (optional).
/// @returns {Array.Quaternion}
function ddd_quaternion_from_axis_angle(axisX, axisY, axisZ, angle, quaternion = array_create(4))
{
	/// https://github.com/JujuAdams/basic-quaternions/blob/master/scripts/QuatFromAxisAngle/QuatFromAxisAngle.gml
	// Get inverse length to normalize the axis vector
	var inverse_length = 1 / sqrt(axisX * axisX + axisY * axisY + axisZ * axisZ);
	axisX *= inverse_length;
	axisY *= inverse_length;
	axisZ *= inverse_length;
	
	// Get the sine of the angle divided by 2
	var angle_sin = dsin(angle * 0.5);
	
	// Set quaternion
	quaternion[@ 0] = axisX * angle_sin;
	quaternion[@ 1] = axisY * angle_sin;
	quaternion[@ 2] = axisZ * angle_sin;
	quaternion[@ 3] = dcos(angle * 0.5);
	
	// Return
	return quaternion;
}

/// @func ddd_quaternion_from_euler(angleX, angleY, angleZ, [quaternion])
/// @desc Build a quaternion from an euler angle.
/// @param {Real} angleX x-angle in degrees.
/// @param {Real} angleY y-angle in degrees.
/// @param {Real} angleZ z-angle in degrees.
/// @param {Array.Quaternion} [quaternion] Quaternion to build to (optional).
/// @returns {Array.Quaternion}
function ddd_quaternion_from_euler(angleX, angleY, angleZ, quaternion = array_create(4))
{
	/// https://github.com/JujuAdams/basic-quaternions/blob/master/scripts/QuatFromEulerAngles/QuatFromEulerAngles.gml
	// Get the sine and cosine of the angles divided by 2
	var sinX = dsin(angleX * 0.5);
	var sinY = dsin(angleY * 0.5);
	var sinZ = dsin(angleZ * 0.5);
	var cosX = dcos(angleX * 0.5);
	var cosY = dcos(angleY * 0.5);
	var cosZ = dcos(angleZ * 0.5);
	
	// Set quaternion
	quaternion[@ 0] = sinX * cosY * cosZ + cosX * sinY * sinZ;
	quaternion[@ 1] = cosX * sinY * cosZ - sinX * cosY * sinZ;
	quaternion[@ 2] = cosX * cosY * sinZ - sinX * sinY * cosZ;
	quaternion[@ 3] = cosX * cosY * cosZ + sinX * sinY * sinZ;
	
	// Return
	return quaternion;
}

#endregion