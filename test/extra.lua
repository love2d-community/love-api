--[[
return {
  version = '0.10.2',
  modules = {
    {
      name = 'modulename',
      fullname = 'love.modulename', -- or 'love'
      prefix = 'love.' -- or '' for 'love'

      description = 'Description.',
      descriptiont = {},
      minidescription = 'Description.',
      minidescriptiont = {},

      types = {},
      functions = {},
      enums = {},

      what = 'module',
    }
  },

  everything = {}, -- Every table with a 'what' key
  allfunctions = {}, -- function, methods, callbacks
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

    description = 'Description.',
    descriptiont = {},
    minidescription = 'Description.',
    minidescriptiont = {},

    constants = {
      {
        name = 'constantname',
        description = 'Description.',
        descriptiont = {}
        minidescription = 'Description.',
        minidescriptiont = {}

        what = 'constant'
        module = moduleTable,
        enum = enumTable,
      }
    }

    what = 'enum',
    module = moduleTable,
  }
}

types = {
  {
    name = 'TypeName',

    description = 'Description.',
    descriptiont = {},
    minidescription = 'Description.',
    minidescriptiont = {},

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
    module = moduleTable,
  }
}

functions = {
  {
    name = 'functionName',
    fullname = 'love.module.functionName',
    prefix = 'love.module.',

    description = 'Description.',
    descriptiont = {},
    minidescription = 'Description.',
    minidescriptiont = {},

    setter = setterTable, -- Optional
    getter = getterTable, -- Optional
    constructs = typeTable, -- Optional

    variants = {
      {
        description = 'Description.', -- Optional
        descriptiont = {}, -- Optional

        returns = {},
        arguments = {},

        what = 'function' -- or 'callback'
        module = moduleTable,
        function_ = functionTable,
      }
    }

    what = 'function', -- or 'method' or 'callback'
    module = moduleTable,
  }
}

returns = { -- or arguments
  {
    type = 'type',
    name = 'name',
    default = 'default argument', -- If argument and not return

    description = 'Description.',
    descriptiont = {},

    table = { -- If type is 'table'
      {
        type = 'string',
        name = 'name',
        default = 'default argument', -- If argument and not return

        description = 'Description.',
        descriptiont = {},

        what = 'returntable', -- or 'argumenttable'
        module = moduleTable,
        function_ = functionTable,
        variant = variantTable,
        value = returnTable, -- or argumentTable
      },
    }

    what = 'return', -- or 'argument'
    module = moduleTable,
    function_ = functionTable,
    variant = variantTable,
  }
}
--]]

local api = require('love_api')

local functionsByName = {}
local typesByName = {}
local everything = {}

local function doDescriptions(t)
    t.descriptiont = t.descriptiont or {}
    t.minidescription = t.description:match('[^\n]+')
    t.minidescriptiont = {}
    for language, translation in pairs(t.descriptiont) do
        t.minidescriptiont[language] = translation:match('[^\n]+')
    end
end

local function loopArgumentsOrReturns(arguments, argumentOrReturn, function_, variant, module_)
    for _, argument in ipairs(arguments) do
        table.insert(everything, argument)
        argument.descriptiont = argument.descriptiont or {}
        argument.what = argumentOrReturn
        argument.module = module_
        argument.function_ = function_
        argument.variant = variant

        for _, flag in ipairs(argument.table or {}) do
            table.insert(everything, flag)
            flag.descriptiont = flag.descriptiont or {}
            flag.what = 'table'
            flag.module = module_
            flag.function_ = function_
            flag.variant = variant
            flag.value = argument
        end
    end
end

local function loopFunctions(functions, module_, prefix, what)
    for _, function_ in ipairs(functions) do
        functionsByName[prefix..function_.name] = function_
        table.insert(everything, function_)

        if not function_.what then -- could be 'callback'
            function_.what = what
        end

        function_.module = module_

        doDescriptions(function_)

        function_.prefix = prefix
        function_.fullname = prefix..function_.name

        for _, variant in ipairs(function_.variants) do
            table.insert(everything, variant)
            variant.what = 'variant'
            variant.module = module_
            variant.function_ = function_

            variant.returns = variant.returns or {}
            variant.arguments = variant.arguments or {}

            loopArgumentsOrReturns(variant.arguments, 'argument', function_, variant, module_)
            loopArgumentsOrReturns(variant.returns, 'return', function_, variant, module_)
        end
    end
end

local function loopTypes(types)
    for _, type_ in ipairs(types) do
        table.insert(everything, type_)
        type_.what = 'type'
        typesByName[type_.name] = type_

        doDescriptions(type_)

        type_.functions = type_.functions or {}
        type_.constructors = type_.constructors or {}
        type_.supertypes = type_.supertypes or {}
        type_.subtypes = type_.subtypes or {}

        loopFunctions(type_.functions, type_, type_.name..':', 'method')
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

    doDescriptions(module_)

    module_.functions = module_.functions or {}
    module_.types = module_.types or {}

    local prefix
    if module_.name == 'love' then
        prefix = 'love.'
    else
        prefix = 'love.'..module_.name..'.'
    end
    loopFunctions(module_.functions, module_, prefix, 'function')

    loopTypes(module_.types)

    module_.enums = module_.enums or {}

    for _, enum in ipairs(module_.enums) do
        table.insert(everything, enum)

        doDescriptions(enum)

        enum.what = 'enum'
        enum.module = module_

        for _, constant in ipairs(enum.constants) do
            table.insert(everything, constant)
            constant.descriptiont = constant.descriptiont or {}
            constant.what = 'constant'
            constant.module = module_
            constant.enum = enum
        end
    end
end

for _, module_ in ipairs(api.modules) do
    for _, type_ in ipairs(module_.types) do
        if type_.parenttype then
            type_.parenttype = typesByName[type_.parenttype]
        end

        for i, constructor in ipairs(type_.constructors) do
            type_.constructors[i] = functionsByName['love.'..module_.name..'.'..constructor]
            type_.constructors[i].constructs = type_
        end

        for i, supertype in ipairs(type_.supertypes) do
            type_.supertypes[i] = typesByName[supertype]
        end

        for i, subtype in ipairs(type_.subtypes) do
            type_.subtypes[i] = typesByName[subtype]
        end
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
    'everything',
    'allfunctions',
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
end

api.everything = everything

return api
