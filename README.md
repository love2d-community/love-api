# LÖVE-API

[![Build Status](https://travis-ci.org/love2d-community/love-api.svg?branch=master)](https://travis-ci.org/love2d-community/love-api)
[![LOVE](https://img.shields.io/badge/L%C3%96VE-11.3-EA316E.svg)](http://love2d.org/)

The complete API documentation of [LÖVE](https://love2d.org/) contained in a Lua table.

The API information is updated manually based on the [LÖVE Wiki](https://love2d.org/wiki). Therefore there is no guarantee that everything is correct and up to date. If you find any errors, outdated information or missing content, please file a [bug report](https://github.com/rm-code/love-api/issues) or create a [pull request](https://github.com/rm-code/love-api/pulls).

Contributions are more than welcome!

## Versions

- The master branch contains the most recent documentation, is constantly updated and follows the [official wiki](https://love2d.org/wiki)
- You can find the documentation for older versions by checking the [releases](https://github.com/rm-code/love-api/releases)

## Projects using the LÖVE-API

- [ZeroBrane Studio](http://studio.zerobrane.com/) - A lightweight Lua IDE
- [LÖVE Atom](https://atom.io/packages/love-atom) - Snippets and autocompletion for [Atom](https://atom.io/)
- [LÖVE Hints](https://gitlab.com/sdonalcreative/brackets-love-hints/) - Snippets, code hints and autocompletion for [Brackets](http://brackets.io/)
- [LÖVE-IDEA](https://github.com/rm-code/love-IDEA-plugin) - Snippets and code completion for [IntelliJ IDEA](https://www.jetbrains.com/idea/)
- [Vim LOVE Docs](https://github.com/davisdude/vim-love-docs) - Syntax highlighting for [Vim](http://www.vim.org)
- [LÖVE API for Notepad++](https://github.com/dail8859/love-api-npp) - Code completion and documentation for [Notepad++](https://notepad-plus-plus.org/)
- [love-eclipse-ldt](https://github.com/leafi/love-eclipse-ldt) - Code completion and documentation for [Lua Development Tools](https://eclipse.org/ldt/)
- [love-ide](https://github.com/rameshvarun/love-ide) - Code completion and other tools for [Atom](https://atom.io/)
- [Emmy-love-api](https://github.com/EmmyLua/Emmy-love-api) - A script to generate LÖVE API autocomplete files for EmmyLua
- [love2d-tl](https://github.com/MikuAuahDark/love2d-tl) - Type definitions for [Teal](https://github.com/teal-language/tl)
- [Quick Reference](http://love2d-community.github.io/love-api/) - Online quick reference of the LÖVE API

## Table structure

```lua
return {
    version = '11.3',
    functions = { -- Functions not in modules, currently only love.getVersion
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
        supertypes = { -- Optional
            'Supertype'
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

## Extra

For ease of use, `extra.lua` adds some extra tables.

It is required like this:

```lua
api = require('love-api.extra')(require('love-api.love_api'))
```

It makes the following changes:

* The objects/functions/callbacks in the "love module" are now in a module like the other modules, named "love".
* Table fields which were optional before now contain empty tables (these fields: functions, types, enums, returns, arguments, constructors, supertypes)
* Types now have a table of **subtypes**. 
* **what** field is a string saying what the table is, e.g.  'function', 'method', 'argument' etc.
* **id** field is a unique string for each table with a **what** field.
* There are now fields pointing to where a table comes from, e.g. an argument table has the fields **module**, **function_** and **variant**.
* Modules and functions have the fields **fullname** (e.g. 'love.graphics.newImage') and **prefix** (e.g. 'love.graphics.')
* Functions have an optional field **constructs**, which points to the type it constructs, and **getter** and **setter** which is the corresponding getter/setter to the state the function sets/gets.
* **api.everything** contains every table with a **what** field.
* There are fields with subsets of **api.everything**, e.g. **api.allfunctions** (containing functions, methods and callbacks), **api.enums**, etc.
* **api.byfullname** which is indexed by fullname, and **api.byid** which is indexed by ID. For example `api.byfullname['love.graphics.draw']`

### Example: function synopsis list

```lua
api = require('extra')(require('love-api.love_api'))

table.sort(api.variants, function(a, b) return a.function_.fullname < b.function_.fullname end)

local s = ''

for _, variant in ipairs(api.variants) do
    local function list(t)
        local s = ''

        for i, a in ipairs(t) do
            s = s..a.name

            if a.default then
                s = s..' ['..a.default..']'
            end

            if i ~= #t then
                s = s..', '
            end
        end

        return s
    end

    if #variant.returns > 0 then
        s = s..list(variant.returns)..' = '
    end

    s = s..variant.function_.fullname..'('

    if #variant.arguments > 0 then
        s = s..list(variant.arguments)
    end

    s = s..')\n'
end

print(s)
```

## Extra table structure

```lua
return {
    version = '11.3',
    modules = {
        {
            name = 'modulename',
            fullname = 'love.modulename', -- or 'love'
            prefix = 'love.' -- or '' for 'love'

            description = 'Description.',
            minidescription = 'Description.',

            types = {},
            functions = {},
            enums = {},

            what = 'module',
            id = 'love_modulename',
        }
    },

    byfullname = {}, -- Indexed by 'fullname' key
    byid = {}, -- Indexed by 'id' key
    
    everything = {}, -- Every table with a 'what' key
    
    allfullnames = {}, -- modules, functions, methods, callbacks, types, enums
    allfunctions = {}, -- functions, methods, callbacks
    noncallbackfunctions = {}, -- functions, methods
    
    functions = {},
    methods = {},
    callbacks = {},
    variants = {},
    arguments = {},
    returns = {},
    tables = {},
    types = {},
    enums = {},
    constants = {},
}

enums = {
    {
        name = 'EnumName',
        fullname = name,
        description = 'Description.',
        minidescription = 'Description.',

        constants = {
            {
                name = 'constantname',
                description = 'Description.',
                minidescription = 'Description.',

                what = 'constant'
                id = 'EnumName1',
                module = moduleTable,
                enum = enumTable,
            }
        }

        what = 'enum',
        id = 'EnumName',
        module = moduleTable,
    }
}

types = {
    {
        name = 'TypeName',
        fullname = name,
        description = 'Description.',
        minidescription = 'Description.',

        functions = {},

        parenttype = 'Parenttype' -- Optional
        supertypes = {
            SupertypeTable,
        },
        subtypes = {
            SubtypeTable,
        }
        constructors = {
            newTypeNameTable,
        },

        what = 'type',
        id = 'TypeName',
        module = moduleTable,
    }
}

functions = {
    {
        name = 'functionName',
        fullname = 'love.module.functionName',
        prefix = 'love.module.',
        description = 'Description.',
        minidescription = 'Description.',

        setter = setterTable, -- Optional
        getter = getterTable, -- Optional
        constructs = typeTable, -- Optional

        variants = {
            {
                description = 'Description.', -- Optional

                returns = {},
                arguments = {},

                what = 'variant',
                id = 'love_module_functionName_rb_ast',
                module = moduleTable,
                function_ = functionTable,
                type_ = typeTable,
            }
        }

        what = 'function', -- or 'method' or 'callback'
        id = 'love_module_functionName',
        module = moduleTable,
        type_ = typeTable,
    }
}

returns = { -- or arguments
    {
        type = 'type',
        name = 'name',
        default = 'default argument', -- If argument and not return
        description = 'Description.',

        table = { -- If type is 'table'
            {
                type = 'string',
                name = 'name',
                default = 'default argument', -- If argument and not return
                description = 'Description.',

                what = 'table',
                id = 'love_module_functionName_rb_ast_a2_t1',
                module = moduleTable,
                type_ = typeTable,
                function_ = functionTable,
                variant = variantTable,
                value = returnTable, -- or argumentTable
            },
        }

        what = 'return', -- or 'argument'
        id = 'love_module_functionName_rb_ast_r1',
        module = moduleTable,
        type_ = typeTable,
        function_ = functionTable,
        variant = variantTable,
    }
}
```
