return {
	name = 'Transform',
	description = 'Object containing a coordinate system transformation.\n\nThe love.graphics module has several functions and function variants which accept Transform objects.',
	constructors = {
		'newTransform'
	},
	functions = {
		{
			name = 'apply',
			description = 'Applies the given other Transform object to this one.',
			variants = {
				{
					arguments = {
						{
							type = 'Transform',
							name = 'other',
							description = 'The other Transform object to apply to this Transform.'
						}
					},
					returns = {
						{
							type = 'Transform',
							name = 'transform',
							description = 'The Transform object the method was called on. Allows easily chaining Transform methods.'
						}
					}
				}
			}
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
							description = 'The copy of this Transform.'
						}
					}
				}
			}
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
							description = 'The first column of the first row of the matrix.'
						},
						{
							type = 'number',
							name = 'e1_2',
							description = 'The second column of the first row of the matrix.'
						},
						{
							type = 'number',
							name = '...',
							description = 'Additional matrix elements.'
						},
						{
							type = 'number',
							name = 'e4_4',
							description = 'The fourth column of the fourth row of the matrix.'
						}
					}
				}
			}
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
							description = 'A new Transform object representing the inverse of this Transform\'s matrix.'
						}
					}
				}
			}
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
							description = 'The x component of the position with the transform applied.'
						},
						{
							type = 'number',
							name = 'localY',
							description = 'The y component of the position with the transform applied.'
						}
					},
					returns = {
						{
							type = 'number',
							name = 'globalX',
							description = 'The x component of the position in global coordinates.'
						},
						{
							type = 'number',
							name = 'globalY',
							description = 'The y component of the position in global coordinates.'
						}
					}
				}
			}
		},
		{
			name = 'reset',
			description = 'Resets the Transform to an identity state. All previously applied transformations are erased.',
			variants = {
				{
					returns = {
						type = 'Transform',
						name = 'transform',
						description = 'The Transform object the method was called on. Allows easily chaining Transform methods.'
					}
				}
			}
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
							description = 'The relative angle in radians to rotate this Transform by.'
						}
					},
					returns = {
						{
							type = 'Transform',
							name = 'transform',
							description = 'The Transform object the method was called on. Allows easily chaining Transform methods.'
						}
					}
				}
			}
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
							description = 'The relative scale factor along the x-axis.'
						},
						{
							type = 'number',
							name = 'sy',
							description = 'The relative scale factor along the y-axis.'
						}
					},
					returns = {
						{
							type = 'Transform',
							name = 'transform',
							description = 'The Transform object the method was called on. Allows easily chaining Transform methods.'
						}
					}
				}
			}
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
							description = 'The first column of the first row of the matrix.'
						},
						{
							type = 'number',
							name = 'e1_2',
							description = 'The second column of the first row of the matrix.'
						},
						{
							type = 'number',
							name = '...',
							description = 'Additional matrix elements.'
						},
						{
							type = 'number',
							name = 'e4_4',
							description = 'The fourth column of the fourth row of the matrix.'
						}
					},
					returns = {
						{
							type = 'Transform',
							name = 'transform',
							description = 'The Transform object the method was called on. Allows easily chaining Transform methods.'
						}
					}
				},
				{
					arguments = {
						{
							type = 'MatrixLayout',
							name = 'layout',
							description = 'How to interpret the matrix element arguments (row-major or column-major).'
						},
						{
							type = 'number',
							name = 'e1_1',
							description = 'The first column of the first row of the matrix.'
						},
						{
							type = 'number',
							name = 'e1_2',
							description = 'The second column of the first row of the matrix.'
						},
						{
							type = 'number',
							name = '...',
							description = 'Additional matrix elements.'
						},
						{
							type = 'number',
							name = 'e4_4',
							description = 'The fourth column of the fourth row of the matrix.'
						}
					},
					returns = {
						{
							type = 'Transform',
							name = 'transform',
							description = 'The Transform object the method was called on. Allows easily chaining Transform methods.'
						}
					}
				},
				{
					arguments = {
						{
							type = 'MatrixLayout',
							name = 'layout',
							description = 'How to interpret the matrix element arguments (row-major or column-major).'
						},
						{
							type = 'table',
							name = 'matrix',
							description = 'A flat table containing the 16 matrix elements.'
						}
					},
					returns = {
						{
							type = 'Transform',
							name = 'transform',
							description = 'The Transform object the method was called on. Allows easily chaining Transform methods.'
						}
					}
				},
				{
					arguments = {
						{
							type = 'MatrixLayout',
							name = 'layout',
							description = 'How to interpret the matrix element arguments (row-major or column-major).'
						},
						{
							type = 'table',
							name = 'matrix',
							description = 'A table of 4 tables, with each sub-table containing 4 matrix elements.'
						}
					},
					returns = {
						{
							type = 'Transform',
							name = 'transform',
							description = 'The Transform object the method was called on. Allows easily chaining Transform methods.'
						}
					}
				}
			}
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
							description = 'The position of the Transform on the x-axis.'
						},
						{
							type = 'number',
							name = 'y',
							description = 'The position of the Transform on the y-axis.'
						},
						{
							type = 'number',
							name = 'angle',
							default = '0',
							description = 'The orientation of the Transform in radians.'
						},
						{
							type = 'number',
							name = 'sx',
							default = '1',
							description = 'Scale factor on the x-axis.'
						},
						{
							type = 'number',
							name = 'sy',
							default = 'sx',
							description = 'Scale factor on the y-axis.'
						},
						{
							type = 'number',
							name = 'ox',
							default = '0',
							description = 'Origin offset on the x-axis.'
						},
						{
							type = 'number',
							name = 'oy',
							default = '0',
							description = 'Origin offset on the y-axis.'
						},
						{
							type = 'number',
							name = 'kx',
							default = '0',
							description = 'Shearing / skew factor on the x-axis.'
						},
						{
							type = 'number',
							name = 'ky',
							default = '0',
							description = 'Shearing / skew factor on the y-axis.'
						},
					},
					returns = {
						{
							type = 'Transform',
							name = 'transform',
							description = 'The Transform object the method was called on. Allows easily chaining Transform methods.'
						}
					}
				}
			}
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
							description = 'The shear factor along the x-axis.'
						},
						{
							type = 'number',
							name = 'ky',
							description = 'The shear factor along the y-axis.'
						}
					},
					returns = {
						{
							type = 'Transform',
							name = 'transform',
							description = 'The Transform object the method was called on. Allows easily chaining Transform methods.'
						}
					}
				}
			}
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
							description = 'The x component of the position in global coordinates.'
						},
						{
							type = 'number',
							name = 'globalY',
							description = 'The y component of the position in global coordinates.'
						}
					},
					returns = {
						{
							type = 'number',
							name = 'localX',
							description = 'The x component of the position with the transform applied.'
						},
						{
							type = 'number',
							name = 'localY',
							description = 'The y component of the position with the transform applied.'
						}
					}
				}
			}
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
							description = 'The relative translation along the x-axis.'
						},
						{
							type = 'number',
							name = 'dy',
							description = 'The relative translation along the y-axis.'
						}
					},
					returns = {
						{
							type = 'Transform',
							name = 'transform',
							description = 'The Transform object the method was called on. Allows easily chaining Transform methods.'
						}
					}
				}
			}
		}
	},
	parenttype = 'Object',
    supertypes = {
        'Object'
	},
	notes = 'Transform objects have a custom * (multiplication) operator. result = tA * tB is equivalent to result = tA:clone():apply(tB). It maps to the matrix multiplication operation that Transform:apply performs.\n\nThe * operator creates a new Transform object, so it is not recommended to use it heavily in per-frame code.'
}