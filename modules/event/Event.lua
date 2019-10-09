local path = (...):match('(.-)[^%./]+$')

return {
    name = 'event',
    description = 'Manages events, like keypresses.',
    types = {
    },
    functions = {
        {
            name = 'clear',
            description = 'Clears the event queue.',
            variants = {
                {
                },
            },
        },
        {
            name = 'poll',
            description = 'Returns an iterator for messages in the event queue.',
            variants = {
                {
                    returns = {
                        {
                            type = 'function',
                            name = 'i',
                            description = 'Iterator function usable in a for loop.',
                        },
                    },
                },
            },
        },
        {
            name = 'pump',
            description = 'Pump events into the event queue.\n\nThis is a low-level function, and is usually not called by the user, but by love.run.\n\nNote that this does need to be called for any OS to think you\'re still running,\n\nand if you want to handle OS-generated events at all (think callbacks).',
            variants = {
                {
                },
            },
        },
        {
            name = 'push',
            description = 'Adds an event to the event queue.\n\nFrom 0.10.0 onwards, you may pass an arbitrary amount of arguments with this function, though the default callbacks don\'t ever use more than six.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'Event',
                            name = 'n',
                            description = 'The name of the event.',
                        },
                        {
                            type = 'Variant',
                            name = 'a',
                            description = 'First event argument.',
                            default = 'nil',
                        },
                        {
                            type = 'Variant',
                            name = 'b',
                            description = 'Second event argument.',
                            default = 'nil',
                        },
                        {
                            type = 'Variant',
                            name = 'c',
                            description = 'Third event argument.',
                            default = 'nil',
                        },
                        {
                            type = 'Variant',
                            name = 'd',
                            description = 'Fourth event argument.',
                            default = 'nil',
                        },
                        {
                            type = 'Variant',
                            name = 'e',
                            description = 'Fifth event argument.',
                            default = 'nil',
                        },
                        {
                            type = 'Variant',
                            name = 'f',
                            description = 'Sixth event argument.',
                            default = 'nil',
                        },
                        {
                            type = 'Variant',
                            name = '...',
                            description = 'Further event arguments may follow.',
                            default = 'nil',
                        },
                    },
                },
            },
        },
        {
            name = 'quit',
            description = 'Adds the quit event to the queue.\n\nThe quit event is a signal for the event handler to close LÖVE. It\'s possible to abort the exit process with the love.quit callback.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'exitstatus',
                            description = 'The program exit status to use when closing the application.',
                            default = '0',
                        },
                    },
                },
                {
                    description = 'Restarts the game without relaunching the executable. This cleanly shuts down the main Lua state instance and creates a brand new one.',
                    arguments = {
                        {
                            type = 'string',
                            name = '\'restart\'',
                            description = 'Tells the default love.run to exit and restart the game without relaunching the executable.',
                        },
                    },
                },
            },
        },
        {
            name = 'wait',
            description = 'Like love.event.poll(), but blocks until there is an event in the queue.',
            variants = {
                {
                    returns = {
                        {
                            type = 'Event',
                            name = 'n',
                            description = 'The name of event.',
                        },
                        {
                            type = 'Variant',
                            name = 'a',
                            description = 'First event argument.',
                        },
                        {
                            type = 'Variant',
                            name = 'b',
                            description = 'Second event argument.',
                        },
                        {
                            type = 'Variant',
                            name = 'c',
                            description = 'Third event argument.',
                        },
                        {
                            type = 'Variant',
                            name = 'd',
                            description = 'Fourth event argument.',
                        },
                        {
                            type = 'Variant',
                            name = 'e',
                            description = 'Fifth event argument.',
                        },
                        {
                            type = 'Variant',
                            name = 'f',
                            description = 'Sixth event argument.',
                        },
                        {
                            type = 'Variant',
                            name = '...',
                            description = 'Further event arguments may follow.',
                        },
                    },
                },
            },
        },
    },
    enums = {
        require(path .. 'enums.Event'),
    },
}