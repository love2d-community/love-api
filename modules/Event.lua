return {
    name = 'event',
    description = 'Manages events, like keypresses.',
    functions = {
        {
            name = 'clear',
            description = 'Clears the event queue.',
            functions = {
                {}
            }
        },
        {
            name = 'poll',
            description = 'Returns an iterator for messages in the event queue.',
            functions = {
                {
                    returns = {
                        {
                            type = 'function',
                            name = 'i',
                            description = 'Iterator function usable in a for loop.'
                        }
                    }
                }
            }
        },
        {
            name = 'pump',
            description = 'Pump events into the event queue. This is a low-level function, and is usually not called by the user, but by love.run. Note that this does need to be called for any OS to think you\'re still running, and if you want to handle OS-generated events at all (think callbacks). love.event.pump can only be called from the main thread, but afterwards, the rest of love.event can be used from any other thread.',
            functions = {
                {}
            }
        },
        {
            name = 'push',
            description = 'Adds an event to the event queue.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'Event',
                            name = 'e',
                            description = 'The name of the event.'
                        },
                        {
                            type = 'mixed',
                            name = 'a',
                            default = 'nil',
                            description = 'First event argument.'
                        },
                        {
                            type = 'mixed',
                            name = 'b',
                            default = 'nil',
                            description = 'Second event argument.'
                        },
                        {
                            type = 'mixed',
                            name = 'c',
                            default = 'nil',
                            description = 'Third event argument.'
                        },
                        {
                            type = 'mixed',
                            name = 'd',
                            default = 'nil',
                            description = 'Fourth event argument.'
                        }
                    }
                }
            }
        },
        {
            name = 'quit',
            description = 'Adds the quit event to the queue.\n\nThe quit event is a signal for the event handler to close LÖVE. It\'s possible to abort the exit process with the love.quit callback.',
            functions = {
                {}
            }
        },
        {
            name = 'wait',
            description = 'Like love.event.poll but blocks until there is an event in the queue.',
            functions = {
                {
                    returns = {
                        {
                            type = 'Event',
                            name = 'e',
                            description = 'The type of event.'
                        },
                        {
                            type = 'mixed',
                            name = 'a',
                            description = 'First event argument.'
                        },
                        {
                            type = 'mixed',
                            name = 'b',
                            description = 'Second event argument.'
                        },
                        {
                            type = 'mixed',
                            name = 'c',
                            description = 'Third event argument.'
                        },
                        {
                            type = 'mixed',
                            name = 'd',
                            description = 'Fourth event argument.'
                        }
                    }
                }
            }
        }
    },
    enums = {
        {
            name = 'Event',
            constants = {
                {
                    name = 'focus',
                    description = 'Window focus gained or lost'
                },
                {
                    name = 'joystickpressed',
                    description = 'Joystick pressed'
                },
                {
                    name = 'joystickreleased',
                    description = 'Joystick released'
                },
                {
                    name = 'keypressed',
                    description = 'Key pressed'
                },
                {
                    name = 'keyreleased',
                    description = 'Key released'
                },
                {
                    name = 'mousepressed',
                    description = 'Mouse pressed'
                },
                {
                    name = 'mousereleased',
                    description = 'Mouse released'
                },
                {
                    name = 'quit',
                    description = 'Quit'
                },
            }
        }
    }
}