local path = (...):match('(.-)[^%./]+$')

return {
    name = 'math',
    description = 'Provides system-independent mathematical functions.',
    types = {
        require(path .. 'types.BezierCurve'),
        require(path .. 'types.RandomGenerator'),
        require(path .. 'types.Transform'),
    },
    functions = {
        {
            name = 'colorFromBytes',
            description = 'Converts a color from 0..255 to 0..1 range.',
            variants = {
                {
                    description = 'Here\'s implementation for 11.2 and earlier.\n\nfunction love.math.colorFromBytes(r, g, b, a)\n\n	if type(r) == \'table\' then\n\n		r, g, b, a = rr[2, rr[4\n\n	end\n\n	r = clamp01(floor(r + 0.5) / 255)\n\n	g = clamp01(floor(g + 0.5) / 255)\n\n	b = clamp01(floor(b + 0.5) / 255)\n\n	a = a ~= nil and clamp01(floor(a + 0.5) / 255) or nil\n\n	return r, g, b, a\n\nend\n\nWhere clamp01 is defined as follows\n\nlocal function clamp01(x)\n\n	return math.min(math.max(x, 0), 1)\n\nend',
                    arguments = {
                        {
                            type = 'number',
                            name = 'rb',
                            description = 'Red color component in 0..255 range.',
                        },
                        {
                            type = 'number',
                            name = 'gb',
                            description = 'Green color component in 0..255 range.',
                        },
                        {
                            type = 'number',
                            name = 'bb',
                            description = 'Blue color component in 0..255 range.',
                        },
                        {
                            type = 'number',
                            name = 'ab',
                            description = 'Alpha color component in 0..255 range.',
                            default = 'nil',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'r',
                            description = 'Red color component in 0..1 range.',
                        },
                        {
                            type = 'number',
                            name = 'g',
                            description = 'Green color component in 0..1 range.',
                        },
                        {
                            type = 'number',
                            name = 'b',
                            description = 'Blue color component in 0..1 range.',
                        },
                        {
                            type = 'number',
                            name = 'a',
                            description = 'Alpha color component in 0..1 range or nil if alpha is not specified.',
                        },
                    },
                },
            },
        },
        {
            name = 'colorToBytes',
            description = 'Converts a color from 0..1 to 0..255 range.',
            variants = {
                {
                    description = 'Here\'s implementation for 11.2 and earlier.\n\nfunction love.math.colorToBytes(r, g, b, a)\n\n	if type(r) == \'table\' then\n\n		r, g, b, a = rr[2, rr[4\n\n	end\n\n	r = floor(clamp01(r) * 255 + 0.5)\n\n	g = floor(clamp01(g) * 255 + 0.5)\n\n	b = floor(clamp01(b) * 255 + 0.5)\n\n	a = a ~= nil and floor(clamp01(a) * 255 + 0.5) or nil\n\n	return r, g, b, a\n\nend\n\nWhere clamp01 is defined as follows\n\nlocal function clamp01(x)\n\n	return math.min(math.max(x, 0), 1)\n\nend',
                    arguments = {
                        {
                            type = 'number',
                            name = 'r',
                            description = 'Red color component.',
                        },
                        {
                            type = 'number',
                            name = 'g',
                            description = 'Green color component.',
                        },
                        {
                            type = 'number',
                            name = 'b',
                            description = 'Blue color component.',
                        },
                        {
                            type = 'number',
                            name = 'a',
                            description = 'Alpha color component.',
                            default = 'nil',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'rb',
                            description = 'Red color component in 0..255 range.',
                        },
                        {
                            type = 'number',
                            name = 'gb',
                            description = 'Green color component in 0..255 range.',
                        },
                        {
                            type = 'number',
                            name = 'bb',
                            description = 'Blue color component in 0..255 range.',
                        },
                        {
                            type = 'number',
                            name = 'ab',
                            description = 'Alpha color component in 0..255 range or nil if alpha is not specified.',
                        },
                    },
                },
            },
        },
        {
            name = 'compress',
            description = 'Compresses a string or data using a specific compression algorithm.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'rawstring',
                            description = 'The raw (un-compressed) string to compress.',
                        },
                        {
                            type = 'CompressedDataFormat',
                            name = 'format',
                            description = 'The format to use when compressing the string.',
                            default = '\'lz4\'',
                        },
                        {
                            type = 'number',
                            name = 'level',
                            description = 'The level of compression to use, between 0 and 9. -1 indicates the default level. The meaning of this argument depends on the compression format being used.',
                            default = '-1',
                        },
                    },
                    returns = {
                        {
                            type = 'CompressedData',
                            name = 'compressedData',
                            description = 'A new Data object containing the compressed version of the string.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'Data',
                            name = 'data',
                            description = 'A Data object containing the raw (un-compressed) data to compress.',
                        },
                        {
                            type = 'CompressedDataFormat',
                            name = 'format',
                            description = 'The format to use when compressing the data.',
                            default = '\'lz4\'',
                        },
                        {
                            type = 'number',
                            name = 'level',
                            description = 'The level of compression to use, between 0 and 9. -1 indicates the default level. The meaning of this argument depends on the compression format being used.',
                            default = '-1',
                        },
                    },
                    returns = {
                        {
                            type = 'CompressedData',
                            name = 'compressedData',
                            description = 'A new Data object containing the compressed version of the raw data.',
                        },
                    },
                },
            },
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
                            description = 'The compressed data to decompress.',
                        },
                    },
                    returns = {
                        {
                            type = 'string',
                            name = 'rawstring',
                            description = 'A string containing the raw decompressed data.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'compressedstring',
                            description = 'A string containing data previously compressed with love.math.compress.',
                        },
                        {
                            type = 'CompressedDataFormat',
                            name = 'format',
                            description = 'The format that was used to compress the given string.',
                        },
                    },
                    returns = {
                        {
                            type = 'string',
                            name = 'rawstring',
                            description = 'A string containing the raw decompressed data.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'Data',
                            name = 'data',
                            description = 'A Data object containing data previously compressed with love.math.compress.',
                        },
                        {
                            type = 'CompressedDataFormat',
                            name = 'format',
                            description = 'The format that was used to compress the given data.',
                        },
                    },
                    returns = {
                        {
                            type = 'string',
                            name = 'rawstring',
                            description = 'A string containing the raw decompressed data.',
                        },
                    },
                },
            },
        },
        {
            name = 'gammaToLinear',
            description = 'Converts a color from gamma-space (sRGB) to linear-space (RGB). This is useful when doing gamma-correct rendering and you need to do math in linear RGB in the few cases where LÖVE doesn\'t handle conversions automatically.\n\nRead more about gamma-correct rendering here, here, and here.\n\nIn versions prior to 11.0, color component values were within the range of 0 to 255 instead of 0 to 1.',
            variants = {
                {
                    description = 'An alpha value can be passed into the function as a fourth argument, but it will be returned unchanged because alpha is always linear.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'r',
                            description = 'The red channel of the sRGB color to convert.',
                        },
                        {
                            type = 'number',
                            name = 'g',
                            description = 'The green channel of the sRGB color to convert.',
                        },
                        {
                            type = 'number',
                            name = 'b',
                            description = 'The blue channel of the sRGB color to convert.',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'lr',
                            description = 'The red channel of the converted color in linear RGB space.',
                        },
                        {
                            type = 'number',
                            name = 'lg',
                            description = 'The green channel of the converted color in linear RGB space.',
                        },
                        {
                            type = 'number',
                            name = 'lb',
                            description = 'The blue channel of the converted color in linear RGB space.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'table',
                            name = 'color',
                            description = 'An array with the red, green, and blue channels of the sRGB color to convert.',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'lr',
                            description = 'The red channel of the converted color in linear RGB space.',
                        },
                        {
                            type = 'number',
                            name = 'lg',
                            description = 'The green channel of the converted color in linear RGB space.',
                        },
                        {
                            type = 'number',
                            name = 'lb',
                            description = 'The blue channel of the converted color in linear RGB space.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'c',
                            description = 'The value of a color channel in sRGB space to convert.',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'lc',
                            description = 'The value of the color channel in linear RGB space.',
                        },
                    },
                },
            },
        },
        {
            name = 'getRandomSeed',
            description = 'Gets the seed of the random number generator.\n\nThe seed is split into two numbers due to Lua\'s use of doubles for all number values - doubles can\'t accurately represent integer  values above 2^53, but the seed can be an integer value up to 2^64.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'low',
                            description = 'Integer number representing the lower 32 bits of the random number generator\'s 64 bit seed value.',
                        },
                        {
                            type = 'number',
                            name = 'high',
                            description = 'Integer number representing the higher 32 bits of the random number generator\'s 64 bit seed value.',
                        },
                    },
                },
            },
        },
        {
            name = 'getRandomState',
            description = 'Gets the current state of the random number generator. This returns an opaque implementation-dependent string which is only useful for later use with love.math.setRandomState or RandomGenerator:setState.\n\nThis is different from love.math.getRandomSeed in that getRandomState gets the random number generator\'s current state, whereas getRandomSeed gets the previously set seed number.',
            variants = {
                {
                    description = 'The value of the state string does not depend on the current operating system.',
                    returns = {
                        {
                            type = 'string',
                            name = 'state',
                            description = 'The current state of the random number generator, represented as a string.',
                        },
                    },
                },
            },
        },
        {
            name = 'isConvex',
            description = 'Checks whether a polygon is convex.\n\nPolygonShapes in love.physics, some forms of Meshes, and polygons drawn with love.graphics.polygon must be simple convex polygons.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'table',
                            name = 'vertices',
                            description = 'The vertices of the polygon as a table in the form of {x1, y1, x2, y2, x3, y3, ...}.',
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'convex',
                            description = 'Whether the given polygon is convex.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x1',
                            description = 'The position of the first vertex of the polygon on the x-axis.',
                        },
                        {
                            type = 'number',
                            name = 'y1',
                            description = 'The position of the first vertex of the polygon on the y-axis.',
                        },
                        {
                            type = 'number',
                            name = 'x2',
                            description = 'The position of the second vertex of the polygon on the x-axis.',
                        },
                        {
                            type = 'number',
                            name = 'y2',
                            description = 'The position of the second vertex of the polygon on the y-axis.',
                        },
                        {
                            type = 'number',
                            name = 'x3',
                            description = 'The position of the third vertex of the polygon on the x-axis.',
                        },
                        {
                            type = 'number',
                            name = 'y3',
                            description = 'The position of the third vertex of the polygon on the y-axis.',
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'convex',
                            description = 'Whether the given polygon is convex.',
                        },
                    },
                },
            },
        },
        {
            name = 'linearToGamma',
            description = 'Converts a color from linear-space (RGB) to gamma-space (sRGB). This is useful when storing linear RGB color values in an image, because the linear RGB color space has less precision than sRGB for dark colors, which can result in noticeable color banding when drawing.\n\nIn general, colors chosen based on what they look like on-screen are already in gamma-space and should not be double-converted. Colors calculated using math are often in the linear RGB space.\n\nRead more about gamma-correct rendering here, here, and here.\n\nIn versions prior to 11.0, color component values were within the range of 0 to 255 instead of 0 to 1.',
            variants = {
                {
                    description = 'An alpha value can be passed into the function as a fourth argument, but it will be returned unchanged because alpha is always linear.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'lr',
                            description = 'The red channel of the linear RGB color to convert.',
                        },
                        {
                            type = 'number',
                            name = 'lg',
                            description = 'The green channel of the linear RGB color to convert.',
                        },
                        {
                            type = 'number',
                            name = 'lb',
                            description = 'The blue channel of the linear RGB color to convert.',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'cr',
                            description = 'The red channel of the converted color in gamma sRGB space.',
                        },
                        {
                            type = 'number',
                            name = 'cg',
                            description = 'The green channel of the converted color in gamma sRGB space.',
                        },
                        {
                            type = 'number',
                            name = 'cb',
                            description = 'The blue channel of the converted color in gamma sRGB space.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'table',
                            name = 'color',
                            description = 'An array with the red, green, and blue channels of the linear RGB color to convert.',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'cr',
                            description = 'The red channel of the converted color in gamma sRGB space.',
                        },
                        {
                            type = 'number',
                            name = 'cg',
                            description = 'The green channel of the converted color in gamma sRGB space.',
                        },
                        {
                            type = 'number',
                            name = 'cb',
                            description = 'The blue channel of the converted color in gamma sRGB space.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'lc',
                            description = 'The value of a color channel in linear RGB space to convert.',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'c',
                            description = 'The value of the color channel in gamma sRGB space.',
                        },
                    },
                },
            },
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
                            description = 'The vertices of the control polygon as a table in the form of {x1, y1, x2, y2, x3, y3, ...}.',
                        },
                    },
                    returns = {
                        {
                            type = 'BezierCurve',
                            name = 'curve',
                            description = 'A Bézier curve object.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x1',
                            description = 'The position of the first vertex of the control polygon on the x-axis.',
                        },
                        {
                            type = 'number',
                            name = 'y1',
                            description = 'The position of the first vertex of the control polygon on the y-axis.',
                        },
                        {
                            type = 'number',
                            name = 'x2',
                            description = 'The position of the second vertex of the control polygon on the x-axis.',
                        },
                        {
                            type = 'number',
                            name = 'y2',
                            description = 'The position of the second vertex of the control polygon on the y-axis.',
                        },
                        {
                            type = 'number',
                            name = 'x3',
                            description = 'The position of the third vertex of the control polygon on the x-axis.',
                        },
                        {
                            type = 'number',
                            name = 'y3',
                            description = 'The position of the third vertex of the control polygon on the y-axis.',
                        },
                    },
                    returns = {
                        {
                            type = 'BezierCurve',
                            name = 'curve',
                            description = 'A Bézier curve object.',
                        },
                    },
                },
            },
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
                            description = 'The new Random Number Generator object.',
                        },
                    },
                },
                {
                    description = 'See RandomGenerator:setSeed.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'seed',
                            description = 'The initial seed number to use for this object.',
                        },
                    },
                    returns = {
                        {
                            type = 'RandomGenerator',
                            name = 'rng',
                            description = 'The new Random Number Generator object.',
                        },
                    },
                },
                {
                    description = 'See RandomGenerator:setSeed.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'low',
                            description = 'The lower 32 bits of the seed number to use for this object.',
                        },
                        {
                            type = 'number',
                            name = 'high',
                            description = 'The higher 32 bits of the seed number to use for this object.',
                        },
                    },
                    returns = {
                        {
                            type = 'RandomGenerator',
                            name = 'rng',
                            description = 'The new Random Number Generator object.',
                        },
                    },
                },
            },
        },
        {
            name = 'newTransform',
            description = 'Creates a new Transform object.',
            variants = {
                {
                    description = 'Creates a Transform with no transformations applied. Call methods on the returned object to apply transformations.',
                    returns = {
                        {
                            type = 'Transform',
                            name = 'transform',
                            description = 'The new Transform object.',
                        },
                    },
                },
                {
                    description = 'Creates a Transform with the specified transformation applied on creation.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position of the new Transform on the x-axis.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position of the new Transform on the y-axis.',
                        },
                        {
                            type = 'number',
                            name = 'angle',
                            description = 'The orientation of the new Transform in radians.',
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
                            description = 'The new Transform object.',
                        },
                    },
                },
            },
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
                            description = 'The number used to generate the noise value.',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'value',
                            description = 'The noise value in the range of 1.',
                        },
                    },
                },
                {
                    description = 'Generates Simplex noise from 2 dimensions.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The first value of the 2-dimensional vector used to generate the noise value.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The second value of the 2-dimensional vector used to generate the noise value.',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'value',
                            description = 'The noise value in the range of 1.',
                        },
                    },
                },
                {
                    description = 'Generates Perlin noise (Simplex noise in version 0.9.2 and older) from 3 dimensions.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The first value of the 3-dimensional vector used to generate the noise value.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The second value of the 3-dimensional vector used to generate the noise value.',
                        },
                        {
                            type = 'number',
                            name = 'z',
                            description = 'The third value of the 3-dimensional vector used to generate the noise value.',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'value',
                            description = 'The noise value in the range of 1.',
                        },
                    },
                },
                {
                    description = 'Generates Perlin noise (Simplex noise in version 0.9.2 and older) from 4 dimensions.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The first value of the 4-dimensional vector used to generate the noise value.',
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The second value of the 4-dimensional vector used to generate the noise value.',
                        },
                        {
                            type = 'number',
                            name = 'z',
                            description = 'The third value of the 4-dimensional vector used to generate the noise value.',
                        },
                        {
                            type = 'number',
                            name = 'w',
                            description = 'The fourth value of the 4-dimensional vector used to generate the noise value.',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'value',
                            description = 'The noise value in the range of 1.',
                        },
                    },
                },
            },
        },
        {
            name = 'random',
            description = 'Generates a pseudo-random number in a platform independent manner. The default love.run seeds this function at startup, so you generally don\'t need to seed it yourself.',
            variants = {
                {
                    description = 'Get uniformly distributed pseudo-random real number within 1.',
                    returns = {
                        {
                            type = 'number',
                            name = 'number',
                            description = 'The pseudo-random number.',
                        },
                    },
                },
                {
                    description = 'Get a uniformly distributed pseudo-random integer within max.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'max',
                            description = 'The maximum possible value it should return.',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'number',
                            description = 'The pseudo-random integer number.',
                        },
                    },
                },
                {
                    description = 'Get uniformly distributed pseudo-random integer within max.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'min',
                            description = 'The minimum possible value it should return.',
                        },
                        {
                            type = 'number',
                            name = 'max',
                            description = 'The maximum possible value it should return.',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'number',
                            description = 'The pseudo-random integer number.',
                        },
                    },
                },
            },
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
                            description = 'Standard deviation of the distribution.',
                            default = '1',
                        },
                        {
                            type = 'number',
                            name = 'mean',
                            description = 'The mean of the distribution.',
                            default = '0',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'number',
                            description = 'Normally distributed random number with variance (stddev)² and the specified mean.',
                        },
                    },
                },
            },
        },
        {
            name = 'setRandomSeed',
            description = 'Sets the seed of the random number generator using the specified integer number. This is called internally at startup, so you generally don\'t need to call it yourself.',
            variants = {
                {
                    description = 'Due to Lua\'s use of double-precision floating point numbers, integer values above 2^53 cannot be accurately represented. Use the other variant of the function if you want to use a larger number.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'seed',
                            description = 'The integer number with which you want to seed the randomization. Must be within the range of 2^53 - 1.',
                        },
                    },
                },
                {
                    description = 'Combines two 32-bit integer numbers into a 64-bit integer value and sets the seed of the random number generator using the value.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'low',
                            description = 'The lower 32 bits of the seed value. Must be within the range of 2^32 - 1.',
                        },
                        {
                            type = 'number',
                            name = 'high',
                            description = 'The higher 32 bits of the seed value. Must be within the range of 2^32 - 1.',
                        },
                    },
                },
            },
        },
        {
            name = 'setRandomState',
            description = 'Sets the current state of the random number generator. The value used as an argument for this function is an opaque implementation-dependent string and should only originate from a previous call to love.math.getRandomState.\n\nThis is different from love.math.setRandomSeed in that setRandomState directly sets the random number generator\'s current implementation-dependent state, whereas setRandomSeed gives it a new seed value.',
            variants = {
                {
                    description = 'The effect of the state string does not depend on the current operating system.',
                    arguments = {
                        {
                            type = 'string',
                            name = 'state',
                            description = 'The new state of the random number generator, represented as a string. This should originate from a previous call to love.math.getRandomState.',
                        },
                    },
                },
            },
        },
        {
            name = 'triangulate',
            description = 'Decomposes a simple convex or concave polygon into triangles.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'table',
                            name = 'polygon',
                            description = 'Polygon to triangulate. Must not intersect itself.',
                        },
                    },
                    returns = {
                        {
                            type = 'table',
                            name = 'triangles',
                            description = 'List of triangles the polygon is composed of, in the form of {{x1, y1, x2, y2, x3, y3},  {x1, y1, x2, y2, x3, y3}, ...}.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'x1',
                            description = 'The position of the first vertex of the polygon on the x-axis.',
                        },
                        {
                            type = 'number',
                            name = 'y1',
                            description = 'The position of the first vertex of the polygon on the y-axis.',
                        },
                        {
                            type = 'number',
                            name = 'x2',
                            description = 'The position of the second vertex of the polygon on the x-axis.',
                        },
                        {
                            type = 'number',
                            name = 'y2',
                            description = 'The position of the second vertex of the polygon on the y-axis.',
                        },
                        {
                            type = 'number',
                            name = 'x3',
                            description = 'The position of the third vertex of the polygon on the x-axis.',
                        },
                        {
                            type = 'number',
                            name = 'y3',
                            description = 'The position of the third vertex of the polygon on the y-axis.',
                        },
                    },
                    returns = {
                        {
                            type = 'table',
                            name = 'triangles',
                            description = 'List of triangles the polygon is composed of, in the form of {{x1, y1, x2, y2, x3, y3},  {x1, y1, x2, y2, x3, y3}, ...}.',
                        },
                    },
                },
            },
        },
    },
    enums = {
        require(path .. 'enums.MatrixLayout'),
    },
}