# LÖVE-API

[![Build Status](https://travis-ci.org/love2d-community/love-api.svg?branch=master)](https://travis-ci.org/love2d-community/love-api)
[![LOVE](https://img.shields.io/badge/L%C3%96VE-0.11.0-EA316E.svg)](http://love2d.org/)

The complete API documentation of [LÖVE](https://love2d.org/) contained in a Lua table.

The API information is updated manually based on the [LÖVE Wiki](https://love2d.org/wiki). Therefore there is no guarantee that everything is correct and up to date. If you find any errors, outdated information or missing content, please file a [bug report](https://github.com/rm-code/love-api/issues) or create a [pull request](https://github.com/rm-code/love-api/pulls).

Contributions are more than welcome!

## Versions

- The master branch contains the most recent documentation, is constantly updated and follows the [official wiki](https://love2d.org/wiki)
- You can find the documentation for older versions by checking the [releases](https://github.com/rm-code/love-api/releases)

## Table structure

```lua
return {
    version = '0.11.0',
    functions = { -- love.something functions, currently only love.getVersion
        -- See function structure below
    },
    modules = {
        {
            name = 'modulename',
            description = 'Description.',
            types = {
                -- See type structure below
            },
            functions = {
                -- See function structure below
            },
            enums = {
                {
                    name = 'EnumName',
                    description = 'Description.',
                    constants = {
                        {
                            name = 'constantname',
                            description = 'Description.'
                        }
                    }
                }
            }
        }
    },
    types = { -- Currently only supertypes
        -- See type structure below
    },
    callbacks = {
        -- See function structure below
    }
}
```

```lua
types = {
    {
        name = 'TypeName',
        description = 'Description.',
        constructors = { -- Optional
            'newTypeName'
        },
        functions = { -- Optional
            -- See function structure below
        },
        parenttype = 'Parenttype' --Optional
        supertypes = { -- Optional
            'Supertype'
        },
        subtypes = { -- Optional
            'Subtype'
        }
    }
}
```

```lua
functions = { -- callbacks = {
    {
        name = 'functionName',
        description = 'Description.',
        variants = {
            {
                returns = { -- Optional
                    {
                        type = 'type',
                        name = 'name',
                        description = 'Description.',
                        table = { -- If type is table
                            {
                                type = 'string',
                                name = 'name',
                                description = 'Description.'
                            }
                        }
                    }
                },
                arguments = { -- Optional
                    {
                        type = 'type',
                        name = 'name',
                        default = 'default argument', -- Optional
                        description = 'Description.',
                        table = { -- If type is table
                            {
                                type = 'string',
                                name = 'name',
                                default = 'nil', -- Optional
                                description = 'Description.'
                            }
                        }
                    }
                }
            }
        }
    }
}
```

## Projects using the LÖVE-API

- [ZeroBrane Studio](http://studio.zerobrane.com/) - A lightweight Lua IDE
- [LÖVE Atom](https://atom.io/packages/love-atom) - Snippets and autocompletion for [Atom](https://atom.io/)
- [LÖVE Hints](https://gitlab.com/sdonalcreative/brackets-love-hints/) - Snippets, code hints and autocompletion for [Brackets](http://brackets.io/)
- [LÖVE-IDEA](https://github.com/rm-code/love-IDEA-plugin) - Snippets and code completion for [IntelliJ IDEA](https://www.jetbrains.com/idea/)
- [Vim LOVE Docs](https://github.com/davisdude/vim-love-docs) - Syntax highlighting for [Vim](http://www.vim.org)
- [LÖVE API for Notepad++](https://github.com/dail8859/love-api-npp) - Code completion and documentation for [Notepad++](https://notepad-plus-plus.org/)
- [love-eclipse-ldt](https://github.com/leafi/love-eclipse-ldt) - Code completion and documentation for [Lua Development Tools](https://eclipse.org/ldt/)
- [love-ide](https://github.com/rameshvarun/love-ide) - Code completion and other tools for [Atom](https://atom.io/)
- [Quick Reference](http://love2d-community.github.io/love-api/) - Online quick reference of the LÖVE API
