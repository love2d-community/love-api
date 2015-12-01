return {
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
            description = 'Generates a pseudo-random number in a platform independent manner.',
            variants = {
                {
                    description = 'Get uniformly distributed pseudo-random number within [0, 1].',
                    returns = {
                        {
                            type = 'number',
                            name = 'number',
                            description = 'The pseudo random number.'
                        }
                    }
                },
                {
                    description = 'Get uniformly distributed pseudo-random integer number within [1, max].',
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
                    description = 'Get uniformly distributed pseudo-random integer number within [min, max].',
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
}
