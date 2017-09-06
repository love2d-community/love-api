local api = require('love_api')

output = {}

local function A(file, s)
    output[file] = output[file] or {}
    table.insert(output[file], s)
end

local function K(file, t, s)
    if t[s] then
        A(file, s..' = \''..t[s]:gsub('\\', '\\\\'):gsub("'", "\\'"):gsub('\n', '\\n')..'\',')
    end
end

local function OPEN(file)
    A(file, '{')
    A(file, 'OPEN')
end

local function KEYOPEN(file, key)
    A(file, key..' = {')
    A(file, 'OPEN')
end

local function CLOSE(file)
    A(file, 'CLOSE')
    A(file, '},')
end

local function RETURNOPEN(file, key)
    A(file, 'return {')
    A(file, 'OPEN')
end

local function RETURNCLOSE(file)
    A(file, 'CLOSE')
    A(file, '}')
end

local function PATH(file)
    A(file, "local path = (...):match('(.-)[^%./]+$')")
    A(file, '')
end

local function S(file, s)
    A(file, "'"..s.."',")
end

local function REQUIRE(file, s)
    A(file, "require(path .. '"..s.."'),")
end

local function loopArgumentsOrReturns(file, arguments, argumentsOrReturns)
    KEYOPEN(file, argumentsOrReturns)
    for _, argument in ipairs(arguments or {}) do
        OPEN(file)
        K(file, argument, 'type')
        K(file, argument, 'name')
        K(file, argument, 'description')
        K(file, argument, 'default')

        if argument.table then
            KEYOPEN(file, 'table')
            for _, flag in ipairs(argument.table or {}) do
                OPEN(file)
                K(file, flag, 'type')
                K(file, flag, 'name')
                K(file, flag, 'description')
                K(file, flag, 'default')
                CLOSE(file)
            end
            CLOSE(file)
        end
        CLOSE(file)
    end
    CLOSE(file)
end

local function loopFunctions(file, functions)
    OPEN(file)
    for _, function_ in ipairs(functions or {}) do
        K(file, function_, 'name')
        K(file, function_, 'description')

        KEYOPEN(file, 'variants')
        for _, variant in ipairs(function_.variants) do
            if not variant.arguments and not variant.returns then
                A(file, '{},')
            else
                OPEN(file)
                if variant.arguments then
                    loopArgumentsOrReturns(file, variant.arguments, 'arguments')
                end
                if variant.returns then
                    loopArgumentsOrReturns(file, variant.returns, 'returns')
                end
                CLOSE(file)
            end
        end
        CLOSE(file)
    end
    CLOSE(file)
end

local function loopTypes(file, types, isLoveModule)
    local filePrefix = file
    for _, type_ in ipairs(types or {}) do
        if not isLoveModule then
            file = filePrefix..'types/'..type_.name
            PATH(file)
            RETURNOPEN(file)
        end
        K(file, type_, 'name')
        K(file, type_, 'description')
        K(file, type_, 'parenttype')

        local function f(s)
            KEYOPEN(file, s)
            for _, v in ipairs(type_[s] or {}) do
                S(file, v)
            end
            CLOSE(file)
        end
        f('constructors')
        f('supertypes')
        f('subtypes')

        loopFunctions(file, type_.functions)
        if not isLoveModule then
            RETURNCLOSE(file)
        end
    end
end


local file = 'love_api'

PATH(file)
RETURNOPEN(file)
K(file, api, 'version')
KEYOPEN(file, 'functions')
loopFunctions(file, api.functions)
CLOSE(file)
KEYOPEN(file, 'callbacks')
loopFunctions(file, api.callbacks)
CLOSE(file)
KEYOPEN(file, 'types')
loopTypes(file, api.types, true)
CLOSE(file)
KEYOPEN(file, 'modules')
for _, module_ in ipairs(api.modules) do
    REQUIRE(file, 'modules.'..module_.name..'.'..module_.name:sub(1, 1):upper()..module_.name:sub(2))
end
CLOSE(file)
RETURNCLOSE(file)

for _, module_ in ipairs(api.modules) do
    local filePrefix = 'modules/'..module_.name..'/'
    local file = filePrefix..module_.name:sub(1, 1):upper()..module_.name:sub(2)
    PATH(file)
    RETURNOPEN(file)
    K(file, module_, 'name')
    K(file, module_, 'description')
    if module_.types then
        KEYOPEN(file, 'types')
        for _, type_ in ipairs(module_.types or {}) do
            REQUIRE(file, 'types.'..type_.name)
        end
        CLOSE(file)
    end
    KEYOPEN(file, 'functions')
    loopFunctions(file, module_.functions)
    CLOSE(file)
    if module_.enums then
        KEYOPEN(file, 'enums')
        for _, enum in ipairs(module_.enums or {}) do
            REQUIRE(file, 'enums.'..enum.name)
        end
        CLOSE(file)
    end
    RETURNCLOSE(file)

    loopTypes(filePrefix, module_.types)

    for _, enum in ipairs(module_.enums or {}) do
        local file = filePrefix..'enums/'..enum.name
        RETURNOPEN(file)
        K(file, enum, 'name')
        K(file, enum, 'description')
        KEYOPEN(file, 'constants')
        for _, constant in ipairs(enum.constants or {}) do
            OPEN(file)
            K(file, constant, 'name')
            K(file, constant, 'description')
            CLOSE(file)
        end
        CLOSE(file)
        RETURNCLOSE(file)
    end
end

for file, contents in pairs(output) do
    local indent = 0
    local function f(s, indent)
        return string.rep(' ', indent*4)..s
    end
    for lineIndex, line in ipairs(contents) do
        if line == 'OPEN' then
            indent = indent + 1
        elseif line == 'CLOSE' then
            indent = indent - 1
        else
            contents[lineIndex] = f(line, indent)
        end
    end
    for i = #contents, 1, -1 do
        line = contents[i]
        if line == 'OPEN' then
            table.remove(contents, i)
        elseif line == 'CLOSE' then
            table.remove(contents, i)
        end
    end

    local dir = file:match('(.-)[^/]+$')
    love.filesystem.createDirectory(dir)
    love.filesystem.write(file..'.lua', table.concat(contents, '\n'))
end

function love.run()
end
