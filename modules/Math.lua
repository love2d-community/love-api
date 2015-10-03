return {
    name = 'math',
    description = 'Provides system-independent mathematical functions.',
    types = {
        {
            name = 'BezierCurve',
            description = 'A Bézier curve object that can evaluate and render Bézier curves of arbitrary degree.',
            constructors = {
                'newBezierCurve'
            },
            functions = {
                {
                    name = 'evalulate',
                    description = 'Evaluate Bézier curve at parameter t. The parameter must be between 0 and 1 (inclusive).\n\nThis function can be used to move objects along paths or tween parameters. However it should not be used to render the curve, see BezierCurve:render for that purpose.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 't',
                                    description = 'Where to evaluate the curve.'
                                }
                            },
                            returns = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'x coordinate of the curve at parameter t.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'y coordinate of the curve at parameter t.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getControlPoint',
                    description = 'Get coordinates of the i-th control point. Indices start with 1.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'i',
                                    description = 'Index of the control point.'
                                }
                            },
                            returns = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'Position of the control point along the x axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'Position of the control point along the y axis.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getControlPointCount',
                    description = 'Get the number of control points in the Bézier curve.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'count',
                                    description = 'The number of control points.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getDegree',
                    description = 'Get degree of the Bézier curve. The degree is equal to number-of-control-points - 1.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'degree',
                                    description = 'Degree of the Bézier curve.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getDerivative',
                    description = 'Get the derivative of the Bézier curve.\n\nThis function can be used to rotate sprites moving along a curve in the direction of the movement and compute the direction perpendicular to the curve at some parameter t.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'BezierCurve',
                                    name = 'derivative',
                                    description = 'The derivative curve.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'insertControlPoint',
                    description = 'Insert control point after the i-th control point. Indices start with 1. Negative indices wrap around: -1 is the last control point, -2 the one before the last, etc.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'x',
                                    description = 'Position of the control point along the x axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'y',
                                    description = 'Position of the control point along the y axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'i',
                                    default = '-1',
                                    description = 'Index of the control point.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'render',
                    description = 'Get a list of coordinates to be used with love.graphics.line.\n\nThis function samples the Bézier curve using recursive subdivision. You can control the recursion depth using the depth parameter.\n\nIf you are just interested to know the position on the curve given a parameter, use BezierCurve:evalulate.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'depth',
                                    default = '5',
                                    description = 'Number of recursive subdivision steps.'
                                }
                            },
                            returns = {
                                {
                                    type = 'table',
                                    name = 'coordinates',
                                    description = 'List of x,y-coordinate pairs of points on the curve.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'rotate',
                    description = 'Rotate the Bézier curve by an angle.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'angle',
                                    description = 'Rotation angle in radians.'
                                },
                                {
                                    type = 'number',
                                    name = 'ox',
                                    default = '0',
                                    description = 'X coordinate of the rotation center.'
                                },
                                {
                                    type = 'number',
                                    name = 'oy',
                                    default = '0',
                                    description = 'Y coordinate of the rotation center.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'scale',
                    description = 'Scale the Bézier curve by a factor.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 's',
                                    description = 'Scale factor.'
                                },
                                {
                                    type = 'number',
                                    name = 'ox',
                                    default = '0',
                                    description = 'X coordinate of the scaling center.'
                                },
                                {
                                    type = 'number',
                                    name = 'oy',
                                    default = '0',
                                    description = 'Y coordinate of the scaling center.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setControlPoint',
                    description = 'Set coordinates of the i-th control point. Indices start with 1.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'i',
                                    description = 'Index of the control point.'
                                },
                                {
                                    type = 'number',
                                    name = 'ox',
                                    description = 'Position of the control point along the x axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'oy',
                                    description = 'Position of the control point along the y axis.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'translate',
                    description = 'Move the Bézier curve by an offset.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'dx',
                                    description = 'Offset along the x axis.'
                                },
                                {
                                    type = 'number',
                                    name = 'dy',
                                    description = 'Offset along the y axis.'
                                }
                            }
                        }
                    }
                }
            },
            supertypes = {
                'Object'
            }
        },
        {
            name = 'CompressedData',
            description = 'Represents byte data compressed using a specific algorithm.\n\nlove.math.decompress can be used to de-compress the data.',
            constructors = {
                'love.math.compress'
            },
            functions = {
                {
                    name = 'getFormat',
                    description = 'Gets the compression format of the CompressedData.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'CompressedDataFormat',
                                    name = 'format',
                                    description = 'The format of the CompressedData.'
                                }
                            }
                        }
                    }
                }
            },
            supertypes = {
                'Data',
                'Object'
            }
        },
        {
            name = 'RandomGenerator',
            description = 'A random number generation object which has its own random state.',
            constructors = {
                'newRandomGenerator'
            },
            functions = {
                {
                    name = 'getSeed',
                    description = 'Gets the state of the random number generator.\n\nThe state is split into two numbers due to Lua\'s use of doubles for all number values - doubles can\'t accurately represent integer values above 2^53.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'low',
                                    description = 'Integer number representing the lower 32 bits of the random number generator\'s 64 bit state value.'
                                },
                                {
                                    type = 'number',
                                    name = 'high',
                                    description = 'Integer number representing the higher 32 bits of the random number generator\'s 64 bit state value.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'getState',
                    description = 'Gets the current state of the random number generator. This returns an opaque implementation-dependent string which is only useful for later use with RandomGenerator:setState.\n\nThis is different from RandomGenerator:getSeed in that getState gets the RandomGenerator\'s current state, whereas getSeed gets the previously set seed number.\n\nThe value of the state string does not depend on the current operating system.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'string',
                                    name = 'state',
                                    description = 'The current state of the RandomGenerator object, represented as a string.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'random',
                    description = 'Generates a pseudo random number in a platform independent way.',
                    variants = {
                        {
                            returns = {
                                {
                                    type = 'number',
                                    name = 'number',
                                    description = 'The pseudo random number.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'max',
                                    description = 'The maximum possible value it should return.'
                                }
                            },
                            returns = {
                                {
                                    type = 'number',
                                    name = 'number',
                                    description = 'The pseudo random number.'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'min',
                                    description = 'The minimum possible value it should return.'
                                },
                                {
                                    type = 'number',
                                    name = 'max',
                                    description = 'The maximum possible value it should return.'
                                }
                            },
                            returns = {
                                {
                                    type = 'number',
                                    name = 'number',
                                    description = 'The pseudo random number.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'randomNormal',
                    description = 'Get a normally distributed pseudo random number.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'stddev',
                                    default = '1',
                                    description = 'Standard deviation of the distribution.'
                                },
                                {
                                    type = 'number',
                                    name = 'mean',
                                    default = '0',
                                    description = 'The mean of the distribution.'
                                }
                            },
                            returns = {
                                {
                                    type = 'number',
                                    name = 'number',
                                    description = 'Normally distributed random number with variance (stddev)² and the specified mean.'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setSeed',
                    description = 'Sets the seed of the random number generator using the specified integer number.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'seed',
                                    description = 'The integer number with which you want to seed the randomization. Must be within the range of [1, 2^53].'
                                }
                            }
                        },
                        {
                            arguments = {
                                {
                                    type = 'number',
                                    name = 'low',
                                    description = 'The lower 32 bits of the state value. Must be within the range of [0, 2^32 - 1].'
                                },
                                {
                                    type = 'number',
                                    name = 'high',
                                    default = '0';
                                    description = 'The higher 32 bits of the state value. Must be within the range of [0, 2^32 - 1].'
                                }
                            }
                        }
                    }
                },
                {
                    name = 'setState',
                    description = 'Sets the current state of the random number generator. The value used as an argument for this function is an opaque implementation-dependent string and should only originate from a previous call to RandomGenerator:getState.\n\nThis is different from RandomGenerator:setSeed in that setState directly sets the RandomGenerator\'s current implementation-dependent state, whereas setSeed gives it a new seed value.\n\nThe effect of the state string does not depend on the current operating system.',
                    variants = {
                        {
                            arguments = {
                                {
                                    type = 'string',
                                    name = 'state',
                                    description = 'The new state of the RandomGenerator object, represented as a string. This should originate from a previous call to RandomGenerator:getState.'
                                }
                            }
                        }
                    }
                }
            },
            supertypes = {
                'Object'
            }
        },
    },
    functions = {
        {
            name = 'compress',
            description = 'Compresses a string or data using a specific compression algorithm.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'rawstring',
                            description = 'The raw (un-compressed) string to compress.'
                        },
                        {
                            type = 'CompressedDataFormat',
                            name = 'format',
                            default = '"lz4"',
                            description = 'The format to compress the string to.'
                        },
                        {
                            type = 'number',
                            name = 'level',
                            default = '-1',
                            description = 'The level of compression to use, between 0 and 9. -1 indicates the default level. The meaning of this argument depends on the compression format being used.'
                        }
                    },
                    returns = {
                        {
                            type = 'CompressedData',
                            name = 'compressedData',
                            description = 'A new Data object containing the compressed version of the string.'
                        }
                    }
                }
            }
        },
        {
            name = 'gammaToLinear',
            description = 'Converts a color from gamma-space (sRGB) to linear-space (RGB). This is useful when doing gamma-correct rendering using colors created based on what they look like on-screen.\n\nGamma-space sRGB has more precision in the lower end than linear RGB. Using this function to convert from sRGB to RGB can result in non-integer color values, which get truncated to integers and lose precision when used with other functions such as love.graphics.setColor.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'r',
                            description = 'The red channel of the sRGB color to convert.'
                        },
                        {
                            type = 'number',
                            name = 'g',
                            description = 'The green channel of the sRGB color to convert.'
                        },
                        {
                            type = 'number',
                            name = 'b',
                            description = 'The blue channel of the sRGB color to convert.'
                        }
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'lr',
                            description = 'The red channel of the converted color in linear RGB space.'
                        },
                        {
                            type = 'number',
                            name = 'lg',
                            description = 'The green channel of the converted color in linear RGB space.'
                        },
                        {
                            type = 'number',
                            name = 'lb',
                            description = 'The blue channel of the converted color in linear RGB space.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'table',
                            name = 'color',
                            description = 'An array with the red, green, and blue channels of the sRGB color to convert.'
                        }
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'lr',
                            description = 'The red channel of the converted color in linear RGB space.'
                        },
                        {
                            type = 'number',
                            name = 'lg',
                            description = 'The green channel of the converted color in linear RGB space.'
                        },
                        {
                            type = 'number',
                            name = 'lb',
                            description = 'The blue channel of the converted color in linear RGB space.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'c',
                            description = 'The value of a color channel in sRGB space to convert.'
                        }
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'lc',
                            description = 'The value of the color channel in linear RGB space.'
                        }
                    }
                }
            }
        },
        {
            name = 'getRandomSeed',
            description = 'Gets the seed of the random number generator.\n\nThe state is split into two numbers due to Lua\'s use of doubles for all number values - doubles can\'t accurately represent integer values above 2^53.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'low',
                            description = 'Integer number representing the lower 32 bits of the random number generator\'s 64 bit state value.'
                        },
                        {
                            type = 'number',
                            name = 'high',
                            description = 'Integer number representing the higher 32 bits of the random number generator\'s 64 bit state value.'
                        }
                    }
                }
            }
        },
        {
            name = 'getRandomState',
            description = 'Gets the current state of the random number generator. This returns an opaque implementation-dependent string which is only useful for later use with RandomGenerator:setState.\n\nThis is different from RandomGenerator:getSeed in that getState gets the RandomGenerator\'s current state, whereas getSeed gets the previously set seed number.\n\nThe value of the state string does not depend on the current operating system.',
            variants = {
                {
                    returns = {
                        {
                            type = 'string',
                            name = 'state',
                            description = 'The current state of the RandomGenerator object, represented as a string.'
                        }
                    }
                }
            }
        },
        {
            name = 'isConvex',
            description = 'Checks whether a polygon is convex.\n\nPolygonShapes in love.physics, some forms of Mesh, and polygons drawn with love.graphics.polygon must be simple convex polygons.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'table',
                            name = 'vertices',
                            description = 'The vertices of the polygon as a table in the form of {x1, y1, x2, y2, x3, y3, ...}.'
                        }
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'convex',
                            description = 'Whether the given polygon is convex.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x1',
                            description = 'The position of the first vertex of the polygon on the x-axis.'
                        },
                        {
                            type = 'number',
                            name = 'y1',
                            description = 'The position of the first vertex of the polygon on the y-axis.'
                        },
                        {
                            type = 'number',
                            name = 'x2',
                            description = 'The position of the second vertex of the polygon on the x-axis.'
                        },
                        {
                            type = 'number',
                            name = 'y2',
                            description = 'The position of the second vertex of the polygon on the y-axis.'
                        },
                        {
                            type = 'number',
                            name = 'x3',
                            description = 'The position of the third vertex of the polygon on the x-axis.'
                        },
                        {
                            type = 'number',
                            name = 'y3',
                            description = 'The position of the third vertex of the polygon on the y-axis.'
                        },
                        {
                            type = 'number',
                            name = '...',
                            description = 'Additional vertices.'
                        }
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'convex',
                            description = 'Whether the given polygon is convex.'
                        }
                    }
                }
            }
        },
        {
            name = 'linearToGamma',
            description = 'Converts a color from linear-space (RGB) to gamma-space (sRGB). This is useful when storing linear RGB color values in an image, because the linear RGB color space has less precision than sRGB for dark colors, which can result in noticeable color banding when drawing.\n\nIn general, colors chosen based on what they look like on-screen are already in gamma-space and should not be double-converted. Colors calculated using math are often in the linear RGB space.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'lr',
                            description = 'The red channel of the linear RGB color to convert.'
                        },
                        {
                            type = 'number',
                            name = 'lg',
                            description = 'The green channel of the linear RGB color to convert.'
                        },
                        {
                            type = 'number',
                            name = 'lb',
                            description = 'The blue channel of the linear RGB color to convert.'
                        }
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'cr',
                            description = 'The red channel of the converted color in gamma sRGB space.'
                        },
                        {
                            type = 'number',
                            name = 'cg',
                            description = 'The green channel of the converted color in gamma sRGB space.'
                        },
                        {
                            type = 'number',
                            name = 'cb',
                            description = 'The blue channel of the converted color in gamma sRGB space.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'table',
                            name = 'color',
                            description = 'An array with the red, green, and blue channels of the linear RGB color to convert.'
                        }
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'cr',
                            description = 'The red channel of the converted color in gamma sRGB space.'
                        },
                        {
                            type = 'number',
                            name = 'cg',
                            description = 'The green channel of the converted color in gamma sRGB space.'
                        },
                        {
                            type = 'number',
                            name = 'cb',
                            description = 'The blue channel of the converted color in gamma sRGB space.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'lc',
                            description = 'The value of a color channel in linear RGB space to convert.'
                        }
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'c',
                            description = 'The value of the color channel in gamma sRGB space.'
                        }
                    }
                }
            }
        },
        {
            name = 'newBezierCurve',
            description = 'Creates a new BezierCurve object.\n\nThe number of vertices in the control polygon determines the degree of the curve, e.g. three vertices define a quadratic (degree 2) Bézier curve, four vertices define a cubic (degree 3) Bézier curve, etc.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'table',
                            name = 'vertices',
                            description = 'The vertices of the control polygon as a table in the form of {x1, y1, x2, y2, x3, y3, ...}.'
                        }
                    },
                    returns = {
                        {
                            type = 'BezierCurve',
                            name = 'curve',
                            description = 'A Bézier curve object.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x1',
                            description = 'The position of the first vertex of the control polygon on the x-axis.'
                        },
                        {
                            type = 'number',
                            name = 'y1',
                            description = 'The position of the first vertex of the control polygon on the y-axis.'
                        },
                        {
                            type = 'number',
                            name = 'x2',
                            description = 'The position of the second vertex of the control polygon on the x-axis.'
                        },
                        {
                            type = 'number',
                            name = 'y2',
                            description = 'The position of the second vertex of the control polygon on the y-axis.'
                        },
                        {
                            type = 'number',
                            name = 'x3',
                            description = 'The position of the third vertex of the control polygon on the x-axis.'
                        },
                        {
                            type = 'number',
                            name = 'y3',
                            description = 'The position of the third vertex of the control polygon on the y-axis.'
                        },
                        {
                            type = 'number',
                            name = '...',
                            description = 'Additional vertices.'
                        }
                    },
                    returns = {
                        {
                            type = 'BezierCurve',
                            name = 'curve',
                            description = 'A Bézier curve object.'
                        }
                    }
                }
            }
        },
        {
            name = 'newRandomGenerator',
            description = 'Creates a new RandomGenerator object which is completely independent of other RandomGenerator objects and random functions.',
            variants = {
                {
                    returns = {
                        {
                            type = 'RandomGenerator',
                            name = 'rng',
                            description = 'A Random Number Generator object.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'low',
                            description = 'The lower 32 bits of the state number to use for this instance of the object.'
                        },
                        {
                            type = 'number',
                            name = 'high',
                            default = '0',
                            description = 'The higher 32 bits of the state number to use for this instance of the object.'
                        }
                    },
                    returns = {
                        {
                            type = 'RandomGenerator',
                            name = 'rng',
                            description = 'A Random Number Generator object.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'seed',
                            description = 'A state of a RandomGenerator object returned by RandomGenerator:getState.'
                        }
                    },
                    returns = {
                        {
                            type = 'RandomGenerator',
                            name = 'rng',
                            description = 'A Random Number Generator object.'
                        }
                    }
                }
            }
        },
        {
            name = 'noise',
            description = 'Generates a Simplex noise value in 1-4 dimensions.\n\nSimplex noise is closely related to Perlin noise. It is widely used for procedural content generation.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The number used to generate the noise value.'
                        }
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'value',
                            description = 'The noise value in the range of [0, 1].'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The first value of the 2-dimensional vector used to generate the noise value.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The second value of the 2-dimensional vector used to generate the noise value.'
                        }
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'value',
                            description = 'The noise value in the range of [0, 1].'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The first value of the 3-dimensional vector used to generate the noise value.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The second value of the 3-dimensional vector used to generate the noise value.'
                        },
                        {
                            type = 'number',
                            name = 'z',
                            description = 'The third value of the 3-dimensional vector used to generate the noise value.'
                        }
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'value',
                            description = 'The noise value in the range of [0, 1].'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The first value of the 4-dimensional vector used to generate the noise value.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The second value of the 4-dimensional vector used to generate the noise value.'
                        },
                        {
                            type = 'number',
                            name = 'z',
                            description = 'The third value of the 4-dimensional vector used to generate the noise value.'
                        },
                        {
                            type = 'number',
                            name = 'w',
                            description = 'The fourth value of the 4-dimensional vector used to generate the noise value.'
                        }
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'value',
                            description = 'The noise value in the range of [0, 1].'
                        }
                    }
                }
            }
        },
        {
            name = 'random',
            description = 'Generates a pseudo random number in a platform independent way.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'number',
                            description = 'The pseudo random number.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'max',
                            description = 'The maximum possible value it should return.'
                        }
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'number',
                            description = 'The pseudo random number.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'min',
                            description = 'The minimum possible value it should return.'
                        },
                        {
                            type = 'number',
                            name = 'max',
                            description = 'The maximum possible value it should return.'
                        }
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'number',
                            description = 'The pseudo random number.'
                        }
                    }
                }
            }
        },
        {
            name = 'randomNormal',
            description = 'Get a normally distributed pseudo random number.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'stddev',
                            default = '1',
                            description = 'Standard deviation of the distribution.'
                        },
                        {
                            type = 'number',
                            name = 'mean',
                            default = '0',
                            description = 'The mean of the distribution.'
                        }
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'number',
                            description = 'Normally distributed random number with variance (stddev)² and the specified mean.'
                        }
                    }
                }
            }
        },
        {
            name = 'setRandomSeed',
            description = 'Sets the seed of the random number generator using the specified integer number.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'seed',
                            description = 'The integer number with which you want to seed the randomization. Must be within the range of [1, 2^53].'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'low',
                            description = 'The lower 32 bits of the state value. Must be within the range of [0, 2^32 - 1].'
                        },
                        {
                            type = 'number',
                            name = 'high',
                            default = '0';
                            description = 'The higher 32 bits of the state value. Must be within the range of [0, 2^32 - 1].'
                        }
                    }
                }
            }
        },
        {
            name = 'setRandomState',
            description = 'Gets the current state of the random number generator. This returns an opaque implementation-dependent string which is only useful for later use with RandomGenerator:setState.\n\nThis is different from RandomGenerator:getSeed in that getState gets the RandomGenerator\'s current state, whereas getSeed gets the previously set seed number.\n\nThe value of the state string does not depend on the current operating system.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'state',
                            description = 'The current state of the RandomGenerator object, represented as a string.'
                        }
                    }
                }
            }
        },
        {
            name = 'triangulate',
            description = 'Triangulate a simple polygon.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'table',
                            name = 'polygon',
                            description = 'Polygon to triangulate. Must not intersect itself.'
                        }
                    },
                    returns = {
                        {
                            type = 'table',
                            name = 'triangles',
                            description = 'List of triangles the polygon is composed of, in the form of {{x1, y1, x2, y2, x3, y3}, {x1, y1, x2, y2, x3, y3}, ...}.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x1',
                            description = 'The position of the first vertex of the polygon on the x-axis.'
                        },
                        {
                            type = 'number',
                            name = 'y1',
                            description = 'The position of the first vertex of the polygon on the y-axis.'
                        },
                        {
                            type = 'number',
                            name = 'x2',
                            description = 'The position of the second vertex of the polygon on the x-axis.'
                        },
                        {
                            type = 'number',
                            name = 'y2',
                            description = 'The position of the second vertex of the polygon on the y-axis.'
                        },
                        {
                            type = 'number',
                            name = 'x3',
                            description = 'The position of the third vertex of the polygon on the x-axis.'
                        },
                        {
                            type = 'number',
                            name = 'y3',
                            description = 'The position of the third vertex of the polygon on the y-axis.'
                        },
                        {
                            type = 'number',
                            name = '...',
                            description = 'Additional vertices.'
                        }
                    },
                    returns = {
                        {
                            type = 'table',
                            name = 'triangles',
                            description = 'List of triangles the polygon is composed of, in the form of {{x1, y1, x2, y2, x3, y3}, {x1, y1, x2, y2, x3, y3}, ...}.'
                        }
                    }
                }
            }
        }
    }
}
