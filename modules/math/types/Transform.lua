local path = (...):match('(.-)[^%./]+$')

return {
    name = 'Transform',
    description = 'Object containing a coordinate system transformation.\n\nThe love.graphics module has several functions and function variants which accept Transform objects.',
    constructors = {
        'newTransform',
    },
    supertypes = {
        'Object',
    },
    functions = {
        {
            name = 'apply',
            description = 'Applies the given other Transform object to this one.\n\nThis effectively multiplies this Transform\'s internal transformation matrix with the other Transform\'s (i.e. self * other), and stores the result in this object.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'Transform',
                            name = 'other',
                            description = 'The other Transform object to apply to this Transform.',
                        },
                    },
                    returns = {
                        {
                            type = 'Transform',
                            name = 'transform',
                            description = 'The Transform object the method was called on. Allows easily chaining Transform methods.',
                        },
                    },
                },
            },
        },
        {
            name = 'clone',
            description = 'Creates a new copy of this Transform.',
            variants = {
                {
                    returns = {
                        {
                            type = 'Transform',
                            name = 'clone',
                            description = 'The copy of this Transform.',
                        },
                    },
                },
            },
        },
        {
            name = 'getMatrix',
            description = 'Gets the internal 4x4 transformation matrix stored by this Transform. The matrix is returned in row-major order.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'e1_1',
                            description = 'The first column of the first row of the matrix.',
                        },
                        {
                            type = 'number',
                            name = 'e1_2',
                            description = 'The second column of the first row of the matrix.',
                        },
                        {
                            type = 'number',
                            name = '...',
                            description = 'Additional matrix elements.',
                        },
                        {
                            type = 'number',
                            name = 'e4_4',
                            description = 'The fourth column of the fourth row of the matrix.',
                        },
                    },
                },
            },
        },
        {
            name = 'inverse',
            description = 'Creates a new Transform containing the inverse of this Transform.',
            variants = {
                {
                    returns = {
                        {
                            type = 'Transform',
                            name = 'inverse',
                            description = 'A new Transform object representing the inverse of this Transform\'s matrix.',
                        },
                    },
                },
            },
        },
        {
            name = 'inverseTransformPoint',
            description = 'Applies the reverse of the Transform object\'s transformation to the given 2D position.\n\nThis effectively converts the given position from the local coordinate space of the Transform into global coordinates.\n\nOne use of this method can be to convert a screen-space mouse position into global world coordinates, if the given Transform has transformations applied that are used for a camera system in-game.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'localX',
                            description = 'The x component of the position with the transform applied.',
                        },
                        {
                            type = 'number',
                            name = 'localY',
                            description = 'The y component of the position with the transform applied.',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'globalX',
                            description = 'The x component of the position in global coordinates.',
                        },
                        {
                            type = 'number',
                            name = 'globalY',
                            description = 'The y component of the position in global coordinates.',
                        },
                    },
                },
            },
        },
        {
            name = 'isAffine2DTransform',
            description = 'Checks whether the Transform is an affine transformation.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'affine',
                            description = 'true if the transform object is an affine transformation, false otherwise.',
                        },
                    },
                },
            },
        },
        {
            name = 'reset',
            description = 'Resets the Transform to an identity state. All previously applied transformations are erased.',
            variants = {
                {
                    returns = {
                        {
                            type = 'Transform',
                            name = 'transform',
                            description = 'The Transform object the method was called on. Allows easily chaining Transform methods.',
                        },
                    },
                },
            },
        },
        {
            name = 'rotate',
            description = 'Applies a rotation to the Transform\'s coordinate system. This method does not reset any previously applied transformations.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'angle',
                            description = 'The relative angle in radians to rotate this Transform by.',
                        },
                    },
                    returns = {
                        {
                            type = 'Transform',
                            name = 'transform',
                            description = 'The Transform object the method was called on. Allows easily chaining Transform methods.',
                        },
                    },
                },
            },
        },
        {
            name = 'scale',
            description = 'Scales the Transform\'s coordinate system. This method does not reset any previously applied transformations.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'sx',
                            description = 'The relative scale factor along the x-axis.',
                        },
                        {
                            type = 'number',
                            name = 'sy',
                            description = 'The relative scale factor along the y-axis.',
                            default = 'sx',
                        },
                    },
                    returns = {
                        {
                            type = 'Transform',
                            name = 'transform',
                            description = 'The Transform object the method was called on. Allows easily chaining Transform methods.',
                        },
                    },
                },
            },
        },
        {
            name = 'setMatrix',
            description = 'Directly sets the Transform\'s internal 4x4 transformation matrix.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'e1_1',
                            description = 'The first column of the first row of the matrix.',
                        },
                        {
                            type = 'number',
                            name = 'e1_2',
                            description = 'The second column of the first row of the matrix.',
                        },
                        {
                            type = 'number',
                            name = '...',
                            description = 'Additional matrix elements.',
                        },
                        {
                            type = 'number',
                            name = 'e4_4',
                            description = 'The fourth column of the fourth row of the matrix.',
                        },
                    },
                    returns = {
                        {
                            type = 'Transform',
                            name = 'transform',
                            description = 'The Transform object the method was called on. Allows easily chaining Transform methods.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'MatrixLayout',
                            name = 'layout',
                            description = 'How to interpret the matrix element arguments (row-major or column-major).',
                        },
                        {
                            type = 'number',
                            name = 'e1_1',
                            description = 'The first column of the first row of the matrix.',
                        },
                        {
                            type = 'number',
                            name = 'e1_2',
                            description = 'The second column of the first row or the first column of the second row of the matrix, depending on the specified layout.',
                        },
                        {
                            type = 'number',
                            name = '...',
                            description = 'Additional matrix elements.',
                        },
                        {
                            type = 'number',
                            name = 'e4_4',
                            description = 'The fourth column of the fourth row of the matrix.',
                        },
                    },
                    returns = {
                        {
                            type = 'Transform',
                            name = 'transform',
                            description = 'The Transform object the method was called on. Allows easily chaining Transform methods.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'MatrixLayout',
                            name = 'layout',
                            description = 'How to interpret the matrix element arguments (row-major or column-major).',
                        },
                        {
                            type = 'table',
                            name = 'matrix',
                            description = 'A flat table containing the 16 matrix elements.',
                        },
                    },
                    returns = {
                        {
                            type = 'Transform',
                            name = 'transform',
                            description = 'The Transform object the method was called on. Allows easily chaining Transform methods.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'MatrixLayout',
                            name = 'layout',
                            description = 'How to interpret the matrix element arguments (row-major or column-major).',
                        },
                        {
                            type = 'table',
                            name = 'matrix',
                            description = 'A table of 4 tables, with each sub-table containing 4 matrix elements.',
                        },
                    },
                    returns = {
                        {
                            type = 'Transform',
                            name = 'transform',
                            description = 'The Transform object the method was called on. Allows easily chaining Transform methods.',
                        },
                    },
                },
            },
        },
        {
            name = 'setTransformation',
            description = 'Resets the Transform to the specified transformation parameters.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position of the Transform on the x-axis.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position of the Transform on the y-axis.',
                        },
                        {
                            type = 'number',
                            name = 'angle',
                            description = 'The orientation of the Transform in radians.',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'sx',
                            description = 'Scale factor on the x-axis.',
                            default = '1',
                        },
                        {
                            type = 'number',
                            name = 'sy',
                            description = 'Scale factor on the y-axis.',
                            default = 'sx',
                        },
                        {
                            type = 'number',
                            name = 'ox',
                            description = 'Origin offset on the x-axis.',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'oy',
                            description = 'Origin offset on the y-axis.',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'kx',
                            description = 'Shearing / skew factor on the x-axis.',
                            default = '0',
                        },
                        {
                            type = 'number',
                            name = 'ky',
                            description = 'Shearing / skew factor on the y-axis.',
                            default = '0',
                        },
                    },
                    returns = {
                        {
                            type = 'Transform',
                            name = 'transform',
                            description = 'The Transform object the method was called on. Allows easily chaining Transform methods.',
                        },
                    },
                },
            },
        },
        {
            name = 'shear',
            description = 'Applies a shear factor (skew) to the Transform\'s coordinate system. This method does not reset any previously applied transformations.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'kx',
                            description = 'The shear factor along the x-axis.',
                        },
                        {
                            type = 'number',
                            name = 'ky',
                            description = 'The shear factor along the y-axis.',
                        },
                    },
                    returns = {
                        {
                            type = 'Transform',
                            name = 'transform',
                            description = 'The Transform object the method was called on. Allows easily chaining Transform methods.',
                        },
                    },
                },
            },
        },
        {
            name = 'transformPoint',
            description = 'Applies the Transform object\'s transformation to the given 2D position.\n\nThis effectively converts the given position from global coordinates into the local coordinate space of the Transform.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'globalX',
                            description = 'The x component of the position in global coordinates.',
                        },
                        {
                            type = 'number',
                            name = 'globalY',
                            description = 'The y component of the position in global coordinates.',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'localX',
                            description = 'The x component of the position with the transform applied.',
                        },
                        {
                            type = 'number',
                            name = 'localY',
                            description = 'The y component of the position with the transform applied.',
                        },
                    },
                },
            },
        },
        {
            name = 'translate',
            description = 'Applies a translation to the Transform\'s coordinate system. This method does not reset any previously applied transformations.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'dx',
                            description = 'The relative translation along the x-axis.',
                        },
                        {
                            type = 'number',
                            name = 'dy',
                            description = 'The relative translation along the y-axis.',
                        },
                    },
                    returns = {
                        {
                            type = 'Transform',
                            name = 'transform',
                            description = 'The Transform object the method was called on. Allows easily chaining Transform methods.',
                        },
                    },
                },
            },
        },
    },
}