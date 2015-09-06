return {
    name = 'touch',
    description = 'Provides an interface to touch-screen presses.',
    functions = {
        {
            name = 'getPosition',
            description = 'Gets the current position of the specified touch-press, in pixels.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'userdata',
                            name = 'id',
                            description = 'The identifier of the touch-press. Use love.touch.getTouches, love.touchpressed, or love.touchmoved to obtain touch id values.'
                        }
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'x',
                            description = 'The position along the x-axis of the touch-press inside the window, in pixels.'
                        },
                        {
                            type = 'number',
                            name = 'y',
                            description = 'The position along the y-axis of the touch-press inside the window, in pixels.'
                        }
                    }
                }
            }
        },
        {
            name = 'getTouches',
            description = 'Gets a list of all active touch-presses.',
            variants = {
                {
                    returns = {
                        {
                            type = 'table',
                            name = 'touches',
                            description = 'A list of active touch-press id values, which can be used with love.touch.getPosition.'
                        }
                    }
                }
            }
        },
    }
}
