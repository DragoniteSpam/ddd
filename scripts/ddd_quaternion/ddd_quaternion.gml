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

#region Boring stuff

/// @func ddd_quaternion_to_string(quaternion)
/// @desc Format quaternion into a string.
/// @param {Array.Quaternion} quaternion Quaternion to format to string.
/// @returns {String}
function ddd_quaternion_to_string(quaternion)
{
    return string("Quaternion({0}, {1}, {2}, {3})", quaternion[0], quaternion[1], quaternion[2], quaternion[3]);
}

/// @func ddd_quaternion_set(quaternion, x, y, z, w)
/// @desc Set new quaternion components.
/// @param {Array.Quaternion} quaternion Quaternion to set new components to.
/// @param {Real} x x-component.
/// @param {Real} y y-component.
/// @param {Real} z z-component.
/// @param {Real} w w-component.
/// @returns {Undefined}
function ddd_quaternion_set(quaternion, x, y, z, w)
{
    quaternion[@ 0] = x;
    quaternion[@ 1] = y;
    quaternion[@ 2] = z;
    quaternion[@ 3] = w;
}

/// @func ddd_quaternion_clone(quaternion)
/// @desc Clone a quaternion.
/// @param {Array.Quaternion} quaternion Quaternion to clone.
/// @returns {Array.Quaternion}
function ddd_quaternion_clone(quaternion)
{
    return [quaternion[0], quaternion[1], quaternion[2], quaternion[3]];
}

/// @func ddd_quaternion_equals(a, b)
/// @desc Compare two quaternions and return true if both equal eachother.
/// @param {Array.Quaternion} a Quaternion A to compare.
/// @param {Array.Quaternion} b Quaternion B to compare.
/// @returns {Bool}
function ddd_quaternion_equals(a, b)
{
    return (a[0] == b[0]) && (a[1] == b[1]) && (a[2] == b[2]) && (a[3] == b[3]);
}

#endregion

#region Arithmatic

/// @func ddd_quaternion_multiply(a, b, [quaternion])
/// @desc Multiply two quaternions together.
/// @param {Array.Quaternion} a Quaternion A.
/// @param {Array.Quaternion} b Quaternion B.
/// @param {Array.Quaternion} [quaternion] Quaternion to multiply to (optional).
/// @returns {Array.Quaternion}
function ddd_quaternion_multiply(a, b, quaternion = array_create(4))
{
	// Multiply
	var quatX = a[3] * b[0] + a[0] * b[3] + a[1] * b[2] - a[2] * b[1];
	var quatY = a[3] * b[1] + a[1] * b[3] + a[2] * b[0] - a[0] * b[2];
	var quatZ = a[3] * b[2] + a[2] * b[3] + a[0] * b[1] - a[1] * b[0];
	var quatW = a[3] * b[3] - a[0] * b[0] - a[1] * b[1] - a[2] * b[2];
	
	// Set
	quaternion[@ 0] = quatX;
	quaternion[@ 1] = quatY;
	quaternion[@ 2] = quatZ;
	quaternion[@ 3] = quatW;
	
	// Return
	return quaternion;
}

/// @func ddd_quaternion_scale(a, b, [quaternion])
/// @desc Scale a quaternion.
/// @param {Array.Quaternion} a Quaternion.
/// @param {Real} s Scalar.
/// @param {Array.Quaternion} [quaternion] Quaternion to scale to (optional).
/// @returns {Array.Quaternion}
function ddd_quaternion_scale(a, s, quaternion = array_create(4))
{
	// Set
	quaternion[@ 0] *= s;
	quaternion[@ 1] *= s;
	quaternion[@ 2] *= s;
	quaternion[@ 3] *= s;
	
	// Return
	return quaternion;
}

#endregion

#region Utilities

/// @func ddd_quaternion_magnitude(quaternion)
/// @desc Returns the magnitude of a given quaternion.
/// @param {Array.Quaternion} quaternion The quaternion to return the magnitude of.
/// @returns {Real}
function ddd_quaternion_magnitude(quaternion)
{
	return sqrt(quaternion[0] * quaternion[0] + quaternion[1] * quaternion[1] + quaternion[2] * quaternion[2] + quaternion[3] * quaternion[3]);
}

/// @func ddd_quaternion_normalize(quaternion)
/// @desc Normalizes a quaternion and returns a new quaternion.
/// @param {Array.Quaternion} quaternion The quaternion to normalize.
/// @returns {Array.Quaternion}
function ddd_quaternion_normalize(quaternion)
{
	// Get magnitude of quaternion
	var m = ddd_quaternion_magnitude(quaternion);
	
	// Error check
	if (m == 0) return ddd_quaternion_identity();
	
	// Return normalized quaternion
	return [quaternion[0] / m, quaternion[1] / m, quaternion[2] / m, quaternion[3] / m];
}

/// @func ddd_quaternion_normalize_in_place(quaternion)
/// @desc Normalizes a quaternion and overwrites the input quaternion.
/// @param {Array.Quaternion} quaternion The quaternion to normalize.
/// @returns {Array.Quaternion}
function ddd_quaternion_normalize_in_place(quaternion)
{
	// Get magnitude of quaternion
	var m = ddd_quaternion_magnitude(quaternion);
	
	// Error check
	if (m == 0)
	{
		quaternion[@ 0] = 0;
		quaternion[@ 1] = 0;
		quaternion[@ 2] = 0;
		quaternion[@ 3] = 1;
	}
	
	// Normalize quaternion
	quaternion[@ 0] /= m;
	quaternion[@ 1] /= m;
	quaternion[@ 2] /= m;
	quaternion[@ 3] /= m;
	
	// Return
	return quaternion;
}

/// @func ddd_quaternion_conjugate(quaternion)
/// @desc Conjugates a quaternion and returns a new quaternion.
/// @param {Array.Quaternion} quaternion The quaternion to conjugate.
/// @returns {Array.Quaternion}
function ddd_quaternion_conjugate(quaternion)
{
	return [-quaternion[0], -quaternion[1], -quaternion[2], quaternion[3]];
}

/// @func ddd_quaternion_conjugate_in_place(quaternion)
/// @desc Conjugates a quaternion and overwrites the input quaternion.
/// @param {Array.Quaternion} quaternion The quaternion to conjugate.
/// @returns {Array.Quaternion}
function ddd_quaternion_conjugate_in_place(quaternion)
{
	quaternion[@ 0] *= -1;
	quaternion[@ 1] *= -1;
	quaternion[@ 2] *= -1;
	return quaternion;
}

/// @func ddd_quaternion_inverse(quaternion)
/// @desc Inverts a quaternion and returns a new quaternion.
/// @param {Array.Quaternion} quaternion The quaternion to invert.
/// @returns {Array.Quaternion}
function ddd_quaternion_inverse(quaternion)
{
	// Get magnitude^2
	var m2 = quaternion[0] * quaternion[0] + quaternion[1] * quaternion[1] + quaternion[2] * quaternion[2] + quaternion[3] * quaternion[3];
	
	// Identity
	if (m2 == 0) return ddd_quaternion_identity();
	
	// Return inverse
	return [-quaternion[0] / m2, -quaternion[1] / m2, -quaternion[2] / m2, quaternion[3] / m2];
}

/// @func ddd_quaternion_inverse_in_place(quaternion)
/// @desc Inverts a quaternion and overwrites the input quaternion.
/// @param {Array.Quaternion} quaternion The quaternion to invert.
/// @returns {Array.Quaternion}
function ddd_quaternion_inverse_in_place(quaternion)
{
	// Get magnitude^2
	var m2 = quaternion[0] * quaternion[0] + quaternion[1] * quaternion[1] + quaternion[2] * quaternion[2] + quaternion[3] * quaternion[3];
	
	// Identity
	if (m2 == 0)
	{
		quaternion[@ 0] = 0;
		quaternion[@ 1] = 0;
		quaternion[@ 2] = 0;
		quaternion[@ 3] = 1;
	}
	
	// Inverse
	quaternion[@ 0] = -quaternion[@ 0] / m2;
	quaternion[@ 1] = -quaternion[@ 1] / m2;
	quaternion[@ 2] = -quaternion[@ 2] / m2;
	quaternion[@ 3] =  quaternion[@ 3] / m2;
	
	// Return inverse
	return quaternion;
}

/// @func ddd_quaternion_dot(a, b)
/// @desc Return the dot product of two quaternions.
/// @param {Array.Quaternion} a Quaternion A.
/// @param {Array.Quaternion} b Quaternion B.
/// @returns {Real}
function ddd_quaternion_dot(a, b)
{
	return a[0] * b[0] + a[1] * b[1] + a[2] * b[2] + a[3] * b[3];
}

/// @func ddd_quaternion_rotate_vec3(quaternion, vec3)
/// @desc Rotate a vector from a quaternion
/// @param {Array.Quaternion} quaternion Quaternion.
/// @param {Array.Vec3} vector Vector to rotate.
/// @returns {Array.Vec3}
function ddd_quaternion_rotate_vec3(quaternion, vec3)
{
	// Get vec3 as vec4
	var v = [vec3[0], vec3[1], vec3[2], 0];
	
	// Get quaternion conjugate
	var qc = ddd_quaternion_conjugate(quaternion);
	
	// Rotate
	var r = ddd_quaternion_multiply(ddd_quaternion_multiply(quaternion, v), qc);
	
	// Return
	return [r[0], r[1], r[2]];
}

#endregion

#region Interpolation

/// @func ddd_quaternion_flerp(a, b, amt, [quaternion])
/// @desc Fast linear interpolation of two quaternions by a given amount, doesn't take the shortest path.
/// @param {Array.Quaternion} a Quaternion A.
/// @param {Array.Quaternion} b Quaternion B.
/// @param {Real} amt Amount to interpolate by.
/// @param {Array.Quaternion} [quaternion] Quaternion to lerp to (optional).
/// @returns {Array.Quaternion}
function ddd_quaternion_flerp(a, b, amt, quaternion = array_create(4))
{
	// Lerp
	quaternion[@ 0] = lerp(a[0], b[0], amt);
	quaternion[@ 1] = lerp(a[1], b[1], amt);
	quaternion[@ 2] = lerp(a[2], b[2], amt);
	quaternion[@ 3] = lerp(a[3], b[3], amt);
	
	// Return
	return quaternion;
}

/// @func ddd_quaternion_lerp(a, b, amt, [quaternion])
/// @desc Linear interpolation of two quaternions by a given amount, take the shortest path.
/// @param {Array.Quaternion} a Quaternion A.
/// @param {Array.Quaternion} b Quaternion B.
/// @param {Real} amt Amount to interpolate by.
/// @param {Array.Quaternion} [quaternion] Quaternion to lerp to (optional).
/// @returns {Array.Quaternion}
function ddd_quaternion_lerp(a, b, amt, quaternion = array_create(4))
{
	// Locals of the quaternions
	var ax = a[0], ay = a[1], az = a[2], aw = a[3];
	var bx = b[0], by = b[1], bz = b[2], bw = b[3];
	
	// Get dot product of quaternions
	var dot = ddd_quaternion_dot(a, b);
	
	if (dot < 0)
	{
		// Invert components to take the shortest path around.
		bx *= -1;
		by *= -1;
		bz *= -1;
		bw *= -1;
	}
	
	// Lerp
	quaternion[@ 0] = lerp(ax, bx, amt);
	quaternion[@ 1] = lerp(ay, by, amt);
	quaternion[@ 2] = lerp(az, bz, amt);
	quaternion[@ 3] = lerp(aw, bw, amt);
	
	// Return
	return quaternion;
}

/// @func ddd_quaternion_slerp(a, b, amt, [quaternion])
/// @desc Spherical linear interpolation of two quaternions by a given amount, take the shortest path.
/// @param {Array.Quaternion} a Quaternion A.
/// @param {Array.Quaternion} b Quaternion B.
/// @param {Real} amt Amount to interpolate by.
/// @param {Array.Quaternion} [quaternion] Quaternion to lerp to (optional).
/// @returns {Array.Quaternion}
function ddd_quaternion_slerp(a, b, amt, quaternion = array_create(4))
{
	// Locals of the quaternions
	var ax = a[0], ay = a[1], az = a[2], aw = a[3];
	var bx = b[0], by = b[1], bz = b[2], bw = b[3];
	
	// Get dot product of quaternions
	var dot = ddd_quaternion_dot(a, b);
	
	if (dot < 0)
	{
		// Invert components to take the shortest path around.
		bx *= -1;
		by *= -1;
		bz *= -1;
		bw *= -1;
		
		dot *= -1;
	}
	
	if (dot > 0.99)
	{
		// We do the linear interpolation here
		quaternion[@ 0] = lerp(ax, bx, amt);
		quaternion[@ 1] = lerp(ay, by, amt);
		quaternion[@ 2] = lerp(az, bz, amt);
		quaternion[@ 3] = lerp(aw, bw, amt);
		
		// Return
		return quaternion;
	}
	
	// Actual spherical lerp now
	var theta_0 = arccos(dot);
	var theta = theta_0 * amt;
	var sin_theta = sin(theta);
	var sin_theta_0 = sin(theta_0);
	
	var s1 = cos(theta) - dot * sin_theta / sin_theta_0;
	var s2 = sin_theta / sin_theta_0;
	
	// Set quaternion
	quaternion[@ 0] = s1 * a[0] + s2 * b[0];
	quaternion[@ 1] = s1 * a[1] + s2 * b[1];
	quaternion[@ 2] = s1 * a[2] + s2 * b[2];
	quaternion[@ 3] = s1 * a[3] + s2 * b[3];
	
	// Return
	return quaternion;
}

/// @func ddd_quaternion_nlerp(a, b, amt, [quaternion])
/// @desc Normalized linear interpolation of two quaternions by a given amount, take the shortest path.
/// @param {Array.Quaternion} a Quaternion A.
/// @param {Array.Quaternion} b Quaternion B.
/// @param {Real} amt Amount to interpolate by.
/// @param {Array.Quaternion} [quaternion] Quaternion to lerp to (optional).
/// @returns {Array.Quaternion}
function ddd_quaternion_nlerp(a, b, amt, quaternion = array_create(4))
{
	// Do normal lerp first
	quaternion = ddd_quaternion_lerp(a, b, amt, quaternion);
	
	// Normalize
	quaternion = ddd_quaternion_normalize_in_place(quaternion);
	
	// Return
	return quaternion;
}

#endregion

#region Conversion

/// @func ddd_quaternion_to_axis_angle(quaternion, [vec4])
/// @desc Convert a quaternion to an axis angle. Returns a vec4 [axisX, axisY, axisZ, angle (degrees)].
/// @param {Array.Quaternion} quaternion The quaternion to convert.
/// @param {Array.Vec4} [vec4] The vector to convert to [axisX, axisY, axisZ, angle (degrees)] (optional).
/// @returns {Array.Vec4}
function ddd_quaternion_to_axis_angle(quaternion, vec4 = array_create(4))
{
	// Get angle and scale
	var angle = 2 * darccos(quaternion[3]);
	var scale = sqrt(1 - quaternion[3] * quaternion[3]);
	
	// If scale is really small, the direction doesn't really matter
	if (scale < 0.0001)
	{
		vec4[@ 0] = 1;
		vec4[@ 1] = 0;
		vec4[@ 2] = 0;
		vec4[@ 3] = 0;
		
		return vec4;
	}
	
	// To axis angle
	vec4[@ 0] = quaternion[0] / scale;
	vec4[@ 1] = quaternion[1] / scale;
 	vec4[@ 2] = quaternion[2] / scale;
	vec4[@ 3] = angle;
	
	// Return
	return vec4;
}

/// @func ddd_quaternion_to_euler(quaternion, [vec3])
/// @desc Convert a quaternion to euler angles. Returns a vec3 [xAngle, yAngle, zAngle] in degrees.
/// @param {Array.Quaternion} quaternion The quaternion to convert.
/// @param {Array.Vec3} [vec3] The vector to convert to [xAngle, yAngle, zAngle] (optional).
/// @returns {Array.Vec3}
function ddd_quaternion_to_euler(quaternion, vec3 = array_create(3))
{
	// Local vars of quaternion components
	var qx = quaternion[0], qy = quaternion[1], qz = quaternion[2], qw = quaternion[3];
	
	// Get roll (x-axis)
	var sinp = 2 * (qw * qx - qy * qz);
	var roll;
	
	if (abs(sinp) >= 1)
	{
		roll = sign(sinp) * (pi / 2);
	}
	else
	{
		roll = darcsin(sinp);
	}
	
	// Get pitch (y-axis)
	var pitch = darctan2(2 * (qw * qy + qx * qz), 1 - 2 * (qx * qx + qy * qy));
	
	// Get yaw (zaxis)
	var yaw = darctan2(2 * (qw * qz + qx * qy), 1 - 2 * (qx * qx + qz * qz));
	
	// Set vec3 components
	vec3[@ 0] = roll;
	vec3[@ 1] = pitch;
	vec3[@ 2] = yaw;
	
	// Return
	return vec3;
}

#endregion