return {
    name = 'WeldJoint',
    description = 'A WeldJoint essentially glues two bodies together.',
    constructors = {
        'newWeldJoint'
    },
    functions = {
        {
            name = 'getDampingRatio',
            description = 'Returns the damping ratio of the joint.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'ratio',
                            description = 'The damping ratio.'
                        }
                    }
                }
            }
        },
        {
            name = 'getFrequency',
            description = 'Returns the frequency.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'freq',
                            description = 'The frequency in hertz.'
                        }
                    }
                }
            }
        },
        {
            name = 'setDampingRatio',
            description = 'The new damping ratio.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'ratio',
                            description = 'The new damping ratio.'
                        }
                    }
                }
            }
        },
        {
            name = 'setFrequency',
            description = 'Sets a new frequency.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'freq',
                            description = 'The new frequency in hertz.'
                        }
                    }
                }
            }
        }
    },
    supertypes = {
        'Joint'
    }
}
