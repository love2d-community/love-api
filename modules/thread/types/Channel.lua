local path = (...):match('(.-)[^%./]+$')

return {
    name = 'Channel',
    description = 'An object which can be used to send and receive data between different threads.',
    constructors = {
        'newChannel',
        'getChannel',
    },
    supertypes = {
        'Object',
    },
    functions = {
        {
            name = 'clear',
            description = 'Clears all the messages in the Channel queue.',
            variants = {
                {
                },
            },
        },
        {
            name = 'demand',
            description = 'Retrieves the value of a Channel message and removes it from the message queue.\n\nIt waits until a message is in the queue then returns the message value.',
            variants = {
                {
                    returns = {
                        {
                            type = 'Variant',
                            name = 'value',
                            description = 'The contents of the message.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'timeout',
                            description = 'The maximum amount of time to wait.',
                        },
                    },
                    returns = {
                        {
                            type = 'Variant',
                            name = 'value',
                            description = 'The contents of the message or nil if the timeout expired.',
                        },
                    },
                },
            },
        },
        {
            name = 'getCount',
            description = 'Retrieves the number of messages in the thread Channel queue.',
            variants = {
                {
                    returns = {
                        {
                            type = 'number',
                            name = 'count',
                            description = 'The number of messages in the queue.',
                        },
                    },
                },
            },
        },
        {
            name = 'hasRead',
            description = 'Gets whether a pushed value has been popped or otherwise removed from the Channel.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'number',
                            name = 'id',
                            description = 'An id value previously returned by Channel:push.',
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'hasread',
                            description = 'Whether the value represented by the id has been removed from the Channel via Channel:pop, Channel:demand, or Channel:clear.',
                        },
                    },
                },
            },
        },
        {
            name = 'peek',
            description = 'Retrieves the value of a Channel message, but leaves it in the queue.\n\nIt returns nil if there\'s no message in the queue.',
            variants = {
                {
                    returns = {
                        {
                            type = 'Variant',
                            name = 'value',
                            description = 'The contents of the message.',
                        },
                    },
                },
            },
        },
        {
            name = 'performAtomic',
            description = 'Executes the specified function atomically with respect to this Channel.\n\nCalling multiple methods in a row on the same Channel is often useful. However if multiple Threads are calling this Channel\'s methods at the same time, the different calls on each Thread might end up interleaved (e.g. one or more of the second thread\'s calls may happen in between the first thread\'s calls.)\n\nThis method avoids that issue by making sure the Thread calling the method has exclusive access to the Channel until the specified function has returned.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'function',
                            name = 'func',
                            description = 'The function to call, the form of function(channel, arg1, arg2, ...) end. The Channel is passed as the first argument to the function when it is called.',
                        },
                        {
                            type = 'any',
                            name = 'arg1',
                            description = 'Additional arguments that the given function will receive when it is called.',
                        },
                        {
                            type = 'any',
                            name = '...',
                            description = 'Additional arguments that the given function will receive when it is called.',
                        },
                    },
                    returns = {
                        {
                            type = 'any',
                            name = 'ret1',
                            description = 'The first return value of the given function (if any.)',
                        },
                        {
                            type = 'any',
                            name = '...',
                            description = 'Any other return values.',
                        },
                    },
                },
            },
        },
        {
            name = 'pop',
            description = 'Retrieves the value of a Channel message and removes it from the message queue.\n\nIt returns nil if there are no messages in the queue.',
            variants = {
                {
                    returns = {
                        {
                            type = 'Variant',
                            name = 'value',
                            description = 'The contents of the message.',
                        },
                    },
                },
            },
        },
        {
            name = 'push',
            description = 'Send a message to the thread Channel.\n\nSee Variant for the list of supported types.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'Variant',
                            name = 'value',
                            description = 'The contents of the message.',
                        },
                    },
                    returns = {
                        {
                            type = 'number',
                            name = 'id',
                            description = 'Identifier which can be supplied to Channel:hasRead',
                        },
                    },
                },
            },
        },
        {
            name = 'supply',
            description = 'Send a message to the thread Channel and wait for a thread to accept it.\n\nSee Variant for the list of supported types.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'Variant',
                            name = 'value',
                            description = 'The contents of the message.',
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'Whether the message was successfully supplied (always true).',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'Variant',
                            name = 'value',
                            description = 'The contents of the message.',
                        },
                        {
                            type = 'number',
                            name = 'timeout',
                            description = 'The maximum amount of time to wait.',
                        },
                    },
                    returns = {
                        {
                            type = 'boolean',
                            name = 'success',
                            description = 'Whether the message was successfully supplied before the timeout expired.',
                        },
                    },
                },
            },
        },
    },
}