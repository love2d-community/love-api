return {
    name = 'thread',
    description = 'Allows you to work with threads.\n\nThreads are separate Lua environments, running in parallel to the main code. As their code runs separately, they can be used to compute complex operations without adversely affecting the frame rate of the main thread. However, as they are separate environments, they cannot access the variables and functions of the main thread, and communication between threads is limited.\n\nAll LOVE objects (userdata) are shared among threads so you\'ll only have to send their references across threads. You may run into concurrency issues if you manipulate an object on multiple threads at the same time.\n\nWhen a Thread is started, it only loads the love.thread module. Every other module has to be loaded with require.',
    types = {
        {
            name = 'Thread',
            description = 'A Thread is a chunk of code that can run in parallel with other threads.\n\nThreads will place all Lua errors in "error". To retrieve the error, call Thread:get(\'error\') in the main thread.',
            constructors = {
                'newThread'
            },
            functions = {
                {
                    name = 'getError',
                    description = 'Retrieves the error string from the thread if it produced a error.',
                    functions = {
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
                    functions = {
                        {}
                    }
                },
                {
                    name = 'wait',
                    description = 'Wait for a thread to finish. This call will block until the thread finishes.',
                    functions = {
                        {}
                    }
                },
                {
                    name = 'isRunning',
                    description = 'Returns whether the thread is currently running.\n\nThreads which are not running can be (re)started with Thread:start.',
                    functions = {
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
        },
        {
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
                    functions = {
                        {}
                    }
                },
                {
                    name = 'demand',
                    description = 'Retrieves the value of a Channel message and removes it from the message queue.\n\nThe value of the message can be a boolean, string, number, LÖVE userdata, or a simple flat table. It waits until a message is in the queue then returns the message value.',
                    functions = {
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
                    functions = {
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
                    functions = {
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
                    name = 'pop',
                    description = 'Retrieves the value of a Channel message and removes it from the message queue.\n\nThe value of the message can be a boolean, string, number, LÖVE userdata, or a simple flat table. It returns nil if there are no messages in the queue.',
                    functions = {
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
                    functions = {
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
                    functions = {
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
    },
    functions = {
        {
            name = 'getChannel',
            description = 'Creates or retrieves a named thread channel.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'The name of the channel you want to create or retrieve.'
                        }
                    },
                    returns = {
                        {
                            type = 'Channel',
                            name = 'channel',
                            description = 'A named channel object which can be further manipulated.'
                        }
                    }
                }
            }
        },
        {
            name = 'newChannel',
            description = 'Create a new unnamed thread channel.\n\nOne use for them is to pass new unnamed channels to other threads via Channel:push',
            functions = {
                {
                    returns = {
                        {
                            type = 'Channel',
                            name = 'channel',
                            description = 'A unnamed channel object which can be further manipulated.'
                        }
                    }
                }
            }
        },
        {
            name = 'newThread',
            description = 'Creates a new Thread from a File or Data object.',
            functions = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'filename',
                            description = 'The name of the Lua File to use as source.'
                        }
                    },
                    returns = {
                        {
                            type = 'Thread',
                            name = 'thread',
                            description = 'A new Thread that has yet to be started.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'FileData',
                            name = 'fileData',
                            description = 'The FileData containing the Lua code to use as the source.'
                        }
                    },
                    returns = {
                        {
                            type = 'Thread',
                            name = 'thread',
                            description = 'A new Thread that has yet to be started.'
                        }
                    }
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'codestring',
                            description = 'A string containing the Lua code to use as the source.'
                        }
                    },
                    returns = {
                        {
                            type = 'Thread',
                            name = 'thread',
                            description = 'A new Thread that has yet to be started.'
                        }
                    }
                }
            }
        }
    }
}
