local path = (...):match('(.-)[^%./]+$')

return {
    name = 'thread',
    description = 'Allows you to work with threads.\n\nThreads are separate Lua environments, running in parallel to the main code. As their code runs separately, they can be used to compute complex operations without adversely affecting the frame rate of the main thread. However, as they are separate environments, they cannot access the variables and functions of the main thread, and communication between threads is limited.\n\nAll LOVE objects (userdata) are shared among threads so you\'ll only have to send their references across threads. You may run into concurrency issues if you manipulate an object on multiple threads at the same time.\n\nWhen a Thread is started, it only loads the love.thread module. Every other module has to be loaded with require.',
    types = {
        require(path .. 'types.Channel'),
        require(path .. 'types.Thread'),
    },
    functions = {
        {
            name = 'getChannel',
            description = 'Creates or retrieves a named thread channel.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'name',
                            description = 'The name of the channel you want to create or retrieve.',
                        },
                    },
                    returns = {
                        {
                            type = 'Channel',
                            name = 'channel',
                            description = 'The Channel object associated with the name.',
                        },
                    },
                },
            },
        },
        {
            name = 'newChannel',
            description = 'Create a new unnamed thread channel.\n\nOne use for them is to pass new unnamed channels to other threads via Channel:push on a named channel.',
            variants = {
                {
                    returns = {
                        {
                            type = 'Channel',
                            name = 'channel',
                            description = 'The new Channel object.',
                        },
                    },
                },
            },
        },
        {
            name = 'newThread',
            description = 'Creates a new Thread from a filename, string or FileData object containing Lua code.',
            variants = {
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'filename',
                            description = 'The name of the Lua file to use as the source.',
                        },
                    },
                    returns = {
                        {
                            type = 'Thread',
                            name = 'thread',
                            description = 'A new Thread that has yet to be started.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'FileData',
                            name = 'fileData',
                            description = 'The FileData containing the Lua code to use as the source.',
                        },
                    },
                    returns = {
                        {
                            type = 'Thread',
                            name = 'thread',
                            description = 'A new Thread that has yet to be started.',
                        },
                    },
                },
                {
                    arguments = {
                        {
                            type = 'string',
                            name = 'codestring',
                            description = 'A string containing the Lua code to use as the source. It needs to either be at least 1024 characters long, or contain at least one newline.',
                        },
                    },
                    returns = {
                        {
                            type = 'Thread',
                            name = 'thread',
                            description = 'A new Thread that has yet to be started.',
                        },
                    },
                },
            },
        },
    },
    enums = {
    },
}