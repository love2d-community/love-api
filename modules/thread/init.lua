return {
    name = 'Thread',
    description = 'A Thread is a chunk of code that can run in parallel with other threads.\n\nThreads will place all Lua errors in "error". To retrieve the error, call Thread:get(\'error\') in the main thread.',
    constructors = {
        'newThread'
    },
    functions = {
        {
            name = 'getError',
            description = 'Retrieves the error string from the thread if it produced an error.',
            variants = {
                {
                    returns = {
                        {
                            type = 'string',
                            name = 'message',
                            description = 'The error message.'
                        }
                    }
                }
            }
        },
        {
            name = 'start',
            description = 'Starts the thread.\n\nThreads can be restarted after they have completed their execution.',
            variants = {
                {},
                {
                    arguments = {
                        {
                            type = 'value',
                            name = 'arg1',
                            description = 'A string, number, boolean, LÖVE object, or simple table.'
                        },
                        {
                            type = 'value',
                            name = 'arg2',
                            description = 'A string, number, boolean, LÖVE object, or simple table.'
                        },
                        {
                            type = 'value',
                            name = '...',
                            description = 'You can continue passing values to the thread.'
                        }
                    }
                }
            }
        },
        {
            name = 'wait',
            description = 'Wait for a thread to finish. This call will block until the thread finishes.',
            variants = {
                {}
            }
        },
        {
            name = 'isRunning',
            description = 'Returns whether the thread is currently running.\n\nThreads which are not running can be (re)started with Thread:start.',
            variants = {
                {
                    returns = {
                        type = 'boolean',
                        name = 'running',
                        description = 'True if the thread is running, false otherwise.'
                    }
                }
            }
        }
    },
    supertypes = {
        'Object'
    }
}
