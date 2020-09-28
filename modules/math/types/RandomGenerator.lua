local path = (...):match('(.-)[^%./]+$')

return {
    name = 'RandomGenerator',
    description = 'A random number generation object which has its own random state.',
    constructors = {
        'newRandomGenerator',
    },
    supertypes = {
        'Object',
    },
    functions = {
        {
            name = 'getSeed',
            description = 'Gets the seed of the random number generator object.\n\nThe seed is split into two numbers due to Lua\'s use of doubles for all number values - doubles can\'t accurately represent integer  values above 2^53, but the seed value is an integer number in the range of 2^64 - 1.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'low',
                            description = 'Integer number representing the lower 32 bits of the RandomGenerator\'s 64 bit seed value.',
                        },
                        {
                            type = 'number',
                            name = 'high',
                            description = 'Integer number representing the higher 32 bits of the RandomGenerator\'s 64 bit seed value.',
                        },
                    },
                },
            },
        },
        {
            name = 'getState',
            description = 'Gets the current state of the random number generator. This returns an opaque string which is only useful for later use with RandomGenerator:setState in the same major version of LÖVE.\n\nThis is different from RandomGenerator:getSeed in that getState gets the RandomGenerator\'s current state, whereas getSeed gets the previously set seed number.',
            variants = {
                {
                    description = 'The value of the state string does not depend on the current operating system.',
                    returns = {
                        {
                            type = 'string',
                            name = 'state',
                            description = 'The current state of the RandomGenerator object, represented as a string.',
                        },
                    },
                },
            },
        },
        {
            name = 'random',
            description = 'Generates a pseudo-random number in a platform independent manner.',
            variants = {
                {
                    description = 'Get uniformly distributed pseudo-random number within 1.',
                    returns = {
                        {
                            type = 'number',
                            name = 'number',
                            description = 'The pseudo-random number.',
                        },
                    },
                },
                {
                    description = 'Get uniformly distributed pseudo-random integer number within max.',
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
                    description = 'Get uniformly distributed pseudo-random integer number within max.',
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
            name = 'setSeed',
            description = 'Sets the seed of the random number generator using the specified integer number.',
            variants = {
                {
                    description = 'Due to Lua\'s use of double-precision floating point numbers, values above 2^53 cannot be accurately represented. Use the other variant of this function if your seed will have a larger value.',
                    arguments = {
                        {
                            type = 'number',
                            name = 'seed',
                            description = 'The integer number with which you want to seed the randomization. Must be within the range of 2^53.',
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
            name = 'setState',
            description = 'Sets the current state of the random number generator. The value used as an argument for this function is an opaque string and should only originate from a previous call to RandomGenerator:getState in the same major version of LÖVE.\n\nThis is different from RandomGenerator:setSeed in that setState directly sets the RandomGenerator\'s current implementation-dependent state, whereas setSeed gives it a new seed value.',
            variants = {
                {
                    description = 'The effect of the state string does not depend on the current operating system.',
                    arguments = {
                        {
                            type = 'string',
                            name = 'state',
                            description = 'The new state of the RandomGenerator object, represented as a string. This should originate from a previous call to RandomGenerator:getState.',
                        },
                    },
                },
            },
        },
    },
}