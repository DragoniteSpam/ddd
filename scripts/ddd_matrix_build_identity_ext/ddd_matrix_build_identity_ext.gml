// Feather disable all

/// @desc Sets the contents of a matrix to the indentity matrix.
/// @param {Array.Matrix} matrix The matrix to build into.
/// @returns {Array.Matrix}
/// @pure

function ddd_matrix_build_identity_ext(matrix)
{
    static identityMatrix = matrix_build_identity();
    array_copy(matrix, 0, identityMatrix, 0, 16);
    return matrix;
}