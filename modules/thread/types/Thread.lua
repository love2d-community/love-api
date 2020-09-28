local path = (...):match('(.-)[^%./]+$')

return {
    name = 'Thread',
    description = 'A Thread is a chunk of code that can run in parallel with other threads. Data can be sent between different threads with Channel objects.',
    constructors = {
        'newThread',
    },
    supertypes = {
        'Object',
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
                            name = 'err',
                            description = 'The error message, or nil if the Thread has not caused an error.',
                        },
                    },
                },
            },
        },
        {
            name = 'isRunning',
            description = 'Returns whether the thread is currently running.\n\nThreads which are not running can be (re)started with Thread:start.',
            variants = {
                {
                    returns = {
                        {
                            type = 'boolean',
                            name = 'value',
                            description = 'True if the thread is running, false otherwise.',
                        },
                    },
                },
            },
        },
        {
            name = 'start',
            description = 'Starts the thread.\n\nBeginning with version 0.9.0, threads can be restarted after they have completed their execution.',
            variants = {
                {
                },
                {
                    description = 'Arguments passed to Thread:start are accessible in the thread\'s main file via \'\'\'...\'\'\' (the vararg expression.)',
                    arguments = {
                        {
                            type = 'Variant',
                            name = 'arg1',
                            description = 'A string, number, boolean, LÖVE object, or simple table.',
                        },
                        {
                            type = 'Variant',
                            name = 'arg2',
                            description = 'A string, number, boolean, LÖVE object, or simple table.',
                        },
                        {
                            type = 'Variant',
                            name = '...',
                            description = 'You can continue passing values to the thread.',
                        },
                    },
                },
            },
        },
        {
            name = 'wait',
            description = 'Wait for a thread to finish.\n\nThis call will block until the thread finishes.',
            variants = {
                {
                },
            },
        },
    },
}