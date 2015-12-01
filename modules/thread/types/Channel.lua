return {
    name = 'Channel',
    description = 'A channel is a way to send and receive data to and from different threads.',
    constructors = {
        'getChannel',
        'newChannel'
    },
    functions = {
        {
            name = 'clear',
            description = 'Clears all the messages in the Channel queue.',
            variants = {
                {}
            }
        },
        {
            name = 'demand',
            description = 'Retrieves the value of a Channel message and removes it from the message queue.\n\nThe value of the message can be a boolean, string, number, LÖVE userdata, or a simple flat table. It waits until a message is in the queue then returns the message value.',
            variants = {
                {
                    returns = {
                        {
                            type = 'value',
                            name = 'value',
                            description = 'The contents of the message.'
                        }
                    }
                }
            }
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
                            description = 'The number of messages in the queue.'
                        }
                    }
                }
            }
        },
        {
            name = 'peek',
            description = 'Retrieves the value of a Channel message, but leaves it in the queue.\n\nThe value of the message can be a boolean, string, number or a LÖVE userdata. It returns nil if there\'s no message in the queue.',
            variants = {
                {
                    returns = {
                        {
                            type = 'value',
                            name = 'value',
                            description = 'The contents of the message.'
                        }
                    }
                }
            }
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
                            description = 'The function to call, the form of function(channel, arg1, arg2, ...) end. The Channel is passed as the first argument to the function when it is called.'
                        },
                        {
                            type = 'any',
                            name = 'arg1',
                            description = 'Additional arguments that the given function will receive when it is called.'
                        },
                        {
                            type = 'any',
                            name = '...',
                            description = 'Additional arguments that the given function will receive when it is called.'
                        }
                    },
                    returns = {
                        {
                            type = 'any',
                            name = 'ret1',
                            description = 'The first return value of the given function (if any.)'
                        },
                        {
                            type = 'any',
                            name = '...',
                            description = 'Any other return values.'
                        }
                    }
                }
            }
        },
        {
            name = 'pop',
            description = 'Retrieves the value of a Channel message and removes it from the message queue.\n\nThe value of the message can be a boolean, string, number, LÖVE userdata, or a simple flat table. It returns nil if there are no messages in the queue.',
            variants = {
                {
                    returns = {
                        {
                            type = 'value',
                            name = 'value',
                            description = 'The contents of the message.'
                        }
                    }
                }
            }
        },
        {
            name = 'push',
            description = 'Send a message to the thread Channel.\n\nThe value of the message can be a boolean, string, number, LÖVE userdata, or a simple flat table. Foreign userdata (Lua\'s files, LuaSocket, ENet, ...), functions, and tables inside tables are not supported.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'value',
                            name = 'value',
                            description = 'The contents of the message.'
                        }
                    }
                }
            }
        },
        {
            name = 'supply',
            description = 'Send a message to the thread Channel and wait for a thread to accept it.\n\nThe value of the message can be a boolean, string, number, LÖVE userdata, or a simple flat table. Foreign userdata (Lua\'s files, LuaSocket, ENet, ...), functions, and tables inside tables are not supported.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'value',
                            name = 'value',
                            description = 'The contents of the message.'
                        }
                    }
                }
            }
        },
    },
    supertypes = {
        'Object'
    }
}
