return {
    name = 'timer',
    description = 'Provides an interface to the user\'s clock.',
    functions = {
        {
            name = 'getAverageDelta',
            description = 'Returns the average delta time (seconds per frame) over the last second.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'delta',
                            description = 'The average delta time over the last second.'
                        }
                    }
                }
            }
        },
        {
            name = 'getDelta',
            description = 'Returns the time between the last two frames.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'dt',
                            description = 'The time passed (in seconds).'
                        }
                    }
                }
            }
        },
        {
            name = 'getFPS',
            description = 'Returns the current frames per second.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'fps',
                            description = 'The current FPS.'
                        }
                    }
                }
            }
        },
        {
            name = 'getTime',
            description = 'Returns the value of a timer with an unspecified starting time. This function should only be used to calculate differences between points in time, as the starting time of the timer is unknown.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'time',
                            description = 'The time in seconds.'
                        }
                    }
                }
            }
        },
        {
            name = 'sleep',
            description = 'Sleeps the program for the specified amount of time.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 's',
                            description = 'Seconds to sleep for.'
                        }
                    }
                }
            }
        },
        {
            name = 'step',
            description = 'Measures the time between two frames. Calling this changes the return value of love.timer.getDelta.',
            variants = {
                {},
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'dt',
                            description = 'The time passed (in seconds).'
                        }
                    }
                }
            }
        }
    }
}
