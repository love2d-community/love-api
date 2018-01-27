-- Match the parent directory
local path = (...):match('(.-)[^%./]+$')

return {
    name = 'math',
    description = 'Provides system-independent mathematical functions.',
    types = {
        require(path .. 'types.BezierCurve'),
        require(path .. 'types.CompressedData'),
        require(path .. 'types.RandomGenerator')
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
                            description = 'The format to use when compressing the string.'
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
                },
                {
                    arguments = {
                        {
                            type = 'Data',
                            name = 'data',
                            description = 'A Data object containing the raw (un-compressed) data to compress.'
                        },
                        {
                            type = 'CompressedDataFormat',
                            name = 'format',
                            default = '"lz4"',
                            description = 'The format to use when compressing the data.'
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
                            description = 'A new Data object containing the compressed version of the raw data.'
                        }
                    }
                }
            }
        },
        {
            name = 'decompress',
            description = 'Decompresses a CompressedData or previously compressed string or Data object.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'CompressedData',
                            name = 'compressedData',
                            description = 'The compressed data to decompress.'
                        }
                    },
                    returns = {
                        {
                            type = 'string',
                            name = 'rawstring',
                            description = 'A string containing the raw decompressed data.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'compressedString',
                            description = 'A string containing data previously compressed with love.math.compress.'
                        },
                        {
                            type = 'CompressedDataFormat',
                            name = 'format',
                            description = 'The format that was used to compress the given string.'
                        }
                    },
                    returns = {
                        {
                            type = 'string',
                            name = 'rawstring',
                            description = 'A string containing the raw decompressed data.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'Data',
                            name = 'data',
                            description = 'A Data object containing data previously compressed with love.math.compress.'
                        },
                        {
                            type = 'CompressedDataFormat',
                            name = 'format',
                            description = 'The format that was used to compress the given data.'
                        }
                    },
                    returns = {
                        {
                            type = 'string',
                            name = 'rawstring',
                            description = 'A string containing the raw decompressed data.'
                        }
                    }
                }
            }
        },
        {
            name = 'gammaToLinear',
            description = 'Converts a color from gamma-space (sRGB) to linear-space (RGB). This is useful when doing gamma-correct rendering and you need to do math in linear RGB in the few cases where LÖVE doesn\'t handle conversions automatically.',
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
                            description = 'The new Random Number Generator object.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'seed',
                            description = 'The initial seed number to use for this object.'
                        }
                    },
                    returns = {
                        {
                            type = 'RandomGenerator',
                            name = 'rng',
                            description = 'The new Random Number Generator object.'
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
                            description = 'The higher 32 bits of the state number to use for this instance of the object.'
                        }
                    },
                    returns = {
                        {
                            type = 'RandomGenerator',
                            name = 'rng',
                            description = 'The new Random Number Generator object.'
                        }
                    }
                }
            }
        },
        {
            name = 'newTransformation',
            description = 'Creates a new Transform object.',
            variants = {
                {
                    description = 'Creates a Transform with no transformations applied. Call methods on the returned object to apply transformations.',
                    returns = {
                        {
                            type = 'Transform',
                            name = 'transform',
                            description = 'The new Transform object.'
                        }
                    }
                },
                {
                    description = 'Creates a Transform with the specified transformation applied on creation.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position of the new Transform on the x-axis.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position of the new Transform on the y-axis.'
                        },
                        {
                            type = 'number',
                            name = 'angle',
                            default = '0',
                            description = 'The orientation of the new Transform in radians.'
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
                        }
                    },
                    returns = {
                        {
                            type = 'Transform',
                            name = 'transform',
                            description = 'The new Transform object.'
                        }
                    }
                }
            }
        },
        {
            name = 'noise',
            description = 'Generates a Simplex or Perlin noise value in 1-4 dimensions. The return value will always be the same, given the same arguments.\n\nSimplex noise is closely related to Perlin noise. It is widely used for procedural content generation.\n\nThere are many webpages which discuss Perlin and Simplex noise in detail.',
            variants = {
                {
                    description = 'Generates Simplex noise from 1 dimension.',
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
                    description = 'Generates Simplex noise from 2 dimensions.',
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
                    description = 'Generates Perlin noise (Simplex noise in version 0.9.2 and older) from 3 dimensions.',
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
                    description = 'Generates Perlin noise (Simplex noise in version 0.9.2 and older) from 4 dimensions.',
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
            description = 'Generates a pseudo-random number in a platform independent manner.',
            variants = {
                {
                    description = 'Get uniformly distributed pseudo-random real number within [0, 1].',
                    returns = {
                        {
                            type = 'number',
                            name = 'number',
                            description = 'The pseudo-random number.'
                        }
                    }
                },
                {
                    description = 'Get a uniformly distributed pseudo-random integer within [1, max].',
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
                            description = 'The pseudo-random integer number.'
                        }
                    }
                },
                {
                    description = 'Get uniformly distributed pseudo-random integer within [min, max].',
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
                            description = 'The pseudo-random integer number.'
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
    },
    enums = {
        require(path .. 'enums.CompressedDataFormat')
    }
}
