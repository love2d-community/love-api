--[[
return {
    version = '0.11.2',
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
    byid = {}, -- Index by 'id' key
    everything = {}, -- Every table with a 'what' key
    allfullnames = {}, -- modules, functions, methods, callbacks, types, enums
    allfunctions = {}, -- functions, methods, callbacks
    noncallbackfunctions = {}, -- functions, methods
    functions = {},
    methods = {},
    callbacks = {},
    types = {},
    enums = {},
    arguments = {},
    returns = {},
    tables = {},
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

                what = 'returntable', -- or 'argumenttable'
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
--]]

return function (api)
    local functionsByName = {}
    local typesByName = {}
    local ids = {}
    local everything = {}

    local function doDescriptions(t)
            t.minidescription = t.minidescription or (t.description and t.description:match('[^\n]+'))
    end

    local function doID(a, s)
            s = s:gsub('%W', '_')
            local id = s
            local i = 1
            while ids[id] do
                    id = s..'_'..i
                    i = i + 1
            end
            ids[id] = true
            a.id = id
    end

    local function abbreviateType(s)
        for i, v in ipairs({
            'number',
            'string',
            'boolean',
            'table',
            'function',
        }) do
            if s == v then
                return s:sub(1, 1)
            end
        end
        return s
    end

    local function loopArgumentsOrReturns(arguments, argumentOrReturn, function_, variant, module_, type_)
        for argumentIndex, argument in ipairs(arguments) do
            table.insert(everything, argument)
            argument.what = argumentOrReturn
            argument.module = module_
            argument.function_ = function_
            argument.variant = variant
            argument.type_ = type_

            doID(argument, variant.id..'_'..argumentOrReturn:sub(1, 1)..argumentIndex)

            for flagIndex, flag in ipairs(argument.table or {}) do
                table.insert(everything, flag)
                flag.what = 'table'
                doID(flag, argument.id..'_t'..flagIndex)
                flag.module = module_
                flag.type_ = type_
                flag.function_ = function_
                flag.variant = variant
                flag.value = argument
            end
        end
    end

    local function loopFunctions(functions, module_, type_, prefix, what)
        for _, function_ in ipairs(functions) do
            functionsByName[prefix..function_.name] = function_
            table.insert(everything, function_)

            if not function_.what then -- could be 'callback'
                function_.what = what
            end

            function_.module = module_
            function_.type_ = type_

            doDescriptions(function_)

            function_.prefix = prefix
            function_.fullname = prefix..function_.name
            doID(function_, function_.fullname)

            for _, variant in ipairs(function_.variants) do
                table.insert(everything, variant)

                variant.returns = variant.returns or {}
                variant.arguments = variant.arguments or {}

                doDescriptions(variant)

                local id = function_.id
                local function f(t, s)
                    for i, v in ipairs(t) do
                        if v.table then
                            s = s..f(v.table, '_t')
                        else
                            s = s..abbreviateType(v.type)
                        end
                    end
                    return s
                end
                id = id..f(variant.returns, '_r')
                id = id..f(variant.arguments, '_a')

                variant.what = 'variant'
                doID(variant, id)
                variant.module = module_
                variant.type_ = type_
                variant.function_ = function_

                loopArgumentsOrReturns(variant.arguments, 'argument', function_, variant, module_, type_)
                loopArgumentsOrReturns(variant.returns, 'return', function_, variant, module_, type_)
            end
        end
    end

    local function loopTypes(types, module_)
        for _, type_ in ipairs(types) do
            table.insert(everything, type_)
            type_.what = 'type'
            doID(type_, type_.name)

            typesByName[type_.name] = type_

            doDescriptions(type_)

            type_.functions = type_.functions or {}
            type_.constructors = type_.constructors or {}
            type_.supertypes = type_.supertypes or {}
            type_.subtypes = type_.subtypes or {}

            type_.module = module_

            loopFunctions(type_.functions, module_, type_, type_.name..':', 'method')
        end
    end

    local loveModule = {
        name = 'love',
        description = '',
        functions = api.functions,
        types = api.types,
    }

    for _, v in ipairs(api.callbacks) do
        v.what = 'callback'
        table.insert(loveModule.functions, v)
    end

    table.insert(api.modules, loveModule)

    api.functions = nil
    api.callbacks = nil
    api.types = nil

    for _, module_ in ipairs(api.modules) do
        table.insert(everything, module_)
        module_.what = 'module'

        if module_.name == 'love' then
            module_.prefix = ''
        else
            module_.prefix = 'love.'
        end

        module_.fullname = module_.prefix..module_.name
        doID(module_, module_.fullname)

        doDescriptions(module_)

        module_.functions = module_.functions or {}

        module_.callbacks = {}
        module_.noncallbackfunctions = {}
        for _, function_ in ipairs(module_.functions) do
            if function_.what == 'callback' then
                table.insert(module_.callbacks, function_)
            else
                table.insert(module_.noncallbackfunctions, function_)
            end
        end

        module_.types = module_.types or {}

        local prefix
        if module_.name == 'love' then
            prefix = 'love.'
        else
            prefix = 'love.'..module_.name..'.'
        end
        loopFunctions(module_.functions, module_, type_, prefix, 'function')

        loopTypes(module_.types, module_)

        module_.enums = module_.enums or {}

        for _, enum in ipairs(module_.enums) do
            table.insert(everything, enum)

            doDescriptions(enum)

            enum.what = 'enum'
            doID(enum, enum.name)
            enum.module = module_

            for constantIndex, constant in ipairs(enum.constants) do
                table.insert(everything, constant)
                constant.what = 'constant'

                doID(constant, enum.name..'_'..constant.name)
                ids[constant.id] = true

                constant.module = module_
                constant.enum = enum
            end
        end
    end

    for _, module_ in ipairs(api.modules) do
        for _, type_ in ipairs(module_.types) do
            type_.module = module_

            if type_.parenttype then
                type_.parenttype = typesByName[type_.parenttype]
            end

            local constructors = {}
            for _, constructor in ipairs(type_.constructors) do
                local c = functionsByName['love.'..module_.name..'.'..constructor]
                if c then
                    c.constructs = type_
                    table.insert(constructors, c)
                end
            end
            type_.constructors = constructors

            local supertypes = {}
            for _, supertype in ipairs(type_.supertypes) do
                local s = typesByName[supertype]
                if s then
                    table.insert(supertypes, s)
                    table.insert(s.subtypes, type_)
                end
            end            
            type_.supertypes = supertypes
        end
    end

    for functionName, function_ in pairs(functionsByName) do
        local setterName, n = functionName:gsub(':tell', ':seek')
        if n > 0 then
            functionsByName[setterName].getter = function_
            function_.setter = functionsByName[setterName]
        else
            for _, getterPrefix in ipairs({'get', 'is', 'are', 'has'}) do
                local setterName, n = functionName:gsub('([%.%:])'..getterPrefix, '%1set')
                if n > 0 and functionsByName[setterName] then
                    functionsByName[setterName].getter = function_
                    function_.setter = functionsByName[setterName]
                end
            end
        end
    end

    local keys = {
        'byfullname',
        'byid',
        'everything',
        'allfunctions',
        'allfullnames',
        'noncallbackfunctions',
        'functions',
        'methods',
        'variants',
        'callbacks',
        'types',
        'enums',
        'constants',
        'arguments',
        'returns',
        'tables',
    }

    for _, key in ipairs(keys) do
        api[key] = {}
    end

    for _, v in ipairs(everything) do
        for _, key in ipairs(keys) do
            if v.what == key:sub(1, -2) then
                table.insert(api[key], v)
            end
        end

        if v.what == 'function' or v.what == 'method' or v.what == 'callback' then
            table.insert(api.allfunctions, v)
        end

        if v.what == 'function' or v.what == 'method' then
            table.insert(api.noncallbackfunctions, v)
        end

        if v.what == 'type' or v.what == 'enum' then
            v.fullname = v.name
        end

        if v.fullname then
            api.byfullname[v.fullname] = v
            table.insert(api.allfullnames, v)
        end

        api.byid[v.id] = v
        
        if v.what == 'type' then
            table.sort(v.subtypes, function(a, b) return a.name < b.name end)
        end
    end
    
    api.everything = everything

    return api
end
