-- Script by @hahawoo aka Santos
love = require('api.love_api')

local linkTypes = {}
local linkFunctions = {}

local function loopFunctions(functions, module_, prefix)
    if functions then
        for functionIndex = #functions, 1, -1 do
            local function_ = functions[functionIndex]
            if module_ and module_.name == 'filesystem' and (function_.name == 'setSource' or function_.name == 'init') then
                table.remove(functions, functionIndex)
            else
                local name
                table.insert(linkFunctions, {name = prefix..function_.name, link = module_.name..'_'..function_.name})
            end
        end
    end
end

local function loopTypes(types, module_)
    for _, type_ in ipairs(types or {}) do
        table.insert(linkTypes, {name = type_.name, link = 'type_'..type_.name})
        if type_.name:sub(-1) == 'y' then
            table.insert(linkTypes, {name = type_.name:sub(1, -2)..'ies', link = 'type_'..type_.name})
        else
            table.insert(linkTypes, {name = type_.name..'s', link = 'type_'..type_.name})
        end
        loopFunctions(type_.functions, type_, type_.name..':')
    end
end

loopTypes(love.types)

local function makeLinks(description, typeName)
    local temp = 'TEMP!'
    local function encode(s)
        return s:sub(1, 1)..temp..s:sub(2)
    end

    local function decode(s)
        return s:gsub(temp, '')
    end

    for _, v in ipairs(linkTypes) do
        if v.name ~= typeName then
            description, count = description:gsub('([ %>])'..v.name..'([\n%. \'%(%)%,])', '%1<a href="#'..v.link..'">'..encode(v.name)..'</a>%2')
        end
    end
    for _, v in ipairs(linkFunctions) do
        if description:match('setSymlinksEnabled') then
            --print(v.name)
        end
        description = description:gsub(v.name, '<a href="#'..v.link..'">'..encode(v.name)..'</a>')
    end
    description = decode(description)
    return description
end

for moduleIndex = #love.modules, 1, -1 do
    local module_ = love.modules[moduleIndex]
    if module_.name == 'video' or module_.name == 'font' then
        table.remove(love.modules, moduleIndex)
    else
        loopFunctions(module_.functions, module_, 'love.'..module_.name..'.')
        loopTypes(module_.types, module_)

        for _, enum in ipairs(module_.enums or {}) do
        end
    end
end

table.sort(linkFunctions, function(a, b) return #a.name > #b.name end)
table.sort(linkTypes, function(a, b) return #a.name > #b.name end)

order = {
    callbacks = {
        'load',
        'update',
        'draw',
        'quit',
        'run',
        {
            name = 'Input',
            functions = {
                'keypressed',
                'keyreleased',
                'textedited',
                'textinput',
                'mousepressed',
                'mousereleased',
                'mousemoved',
                'mousefocus',
                'wheelmoved',
                'touchmoved',
                'touchpressed',
                'touchreleased',
                'joystickpressed',
                'joystickreleased',
                'joystickaxis',
                'joystickhat',
                'joystickadded',
                'joystickremoved',
                'gamepadpressed',
                'gamepadreleased',
                'gamepadaxis',
            },
        },
        {

            name = 'Window',
            functions = {
                'resize',
                'visible',
                'focus',
                'filedropped',
                'directorydropped',
            },
        },
        {
            name = 'Error handling',
            functions = {
                'errhand',
                'threaderror',
                'lowmemory',
            },
        },
    },
    graphics = {
        {
            name = 'Drawing',
            functions = {
                'draw',
                'print',
                'printf',
                'line',
                'polygon',
                'rectangle',
                'circle',
                'ellipse',
                'arc',
                'point',
                'points',
            },
        },
        {
            name = 'Stencil',
            functions = {
                'stencil',
                'getStencilTest',
            },
        },
        {
            name = 'Graphics state',
            functions = {
                'push',
                'pop',
                'reset',
                'getFont',
                'setNewFont',
                'getBackgroundColor',
                'getBlendMode',
                'getCanvas',
                'getColor',
                'getColorMask',
                'getDefaultFilter',
                'getLineJoin',
                'getLineStyle',
                'getLineWidth',
                'getShader',
                'getPointSize',
                'getPointStyle',
                'getScissor',
                'intersectScissor',
                'isWireframe',
                'setStencil',
                'setInvertedStencil',
            },
        },
        {
            name = 'Coordinate system',
            functions = {
                'origin',
                'rotate',
                'scale',
                'shear',
                'translate',
            },
        },
        {
            name = 'Window',
            functions = {
                'getDimensions',
                'getHeight',
                'getWidth',
            },
        },
        {
            name = 'Info',
            functions = {
                'getCanvasFormats',
                'getCompressedImageFormats',
                'getFullscreenModes',
                'getStats',
                'getSystemLimit',
                'getSystemLimits',
                'getRendererInfo',
                'isSupported',
                'getFSAA',
                'getSupported',
                'isGammaCorrect',
            },
        },
    },
    filesystem = {
        'areSymlinksEnabled',
        'isFused',
        'isSymlink',
        'createDirectory',
        'getDirectoryItems',
        'getIdentity',
        'isFile',
        'isDirectory',
        'exists',
        'load',
        'mount',
        'unmount',
        {
            name = 'Directory paths',
            functions = {
                'getAppdataDirectory',
                'getRealDirectory',
                'getSaveDirectory',
                'getSourceBaseDirectory',
                'getUserDirectory',
                'getWorkingDirectory',
            },
        },
        {
            name = 'File properties',
            functions = {
                'getLastModified',
                'getSize',
            },
        },
        {
            name = 'File operations',
            functions = {
                'read',
                'lines',
                'write',
                'append',
                'remove',
            },
        },
    },
    math = {
        {
            name = "Random numbers",
            functions = {
                "random",
                "randomNormal",
                "getRandomSeed",
                "getRandomState",
            },
        },
        {
            name = "Polygons",
            functions = {
                "isConvex",
                "triangulate",
            },
        },
        {
            name = "Compression",
            functions = {
                "compress",
                "decompress",
            },
        },
        {
            name = "Color",
            functions = {
                "linearToGamma",
                "gammaToLinear",
            },
        },
    },
    mouse = {
        {
            name = "Input",
            functions = {
                "isDown",
                "getPosition",
                "getX",
                "getY",
            },
        },
        {
            name = "Cursor",
            functions = {
                "getCursor",
                "getSystemCursor",
                "hasCursor",
            },
        },
    },
}

output = ''

function make_function_navigation_link(m, f_, prefix)
    local getterprefixes = {'get', 'is', 'has', 'are', 'to', 'load', 'tell'}
    local setterprefixes = {'set', 'from', 'save', 'seek'}
    local link

    for _, getterprefix in ipairs(getterprefixes) do
        if f_.name:sub(1, #getterprefix) == getterprefix and f_.name ~= 'hasCursor' then
            local getterwithoutprefix = f_.name:sub(#getterprefix+1)
            for _, f__ in ipairs(m.functions) do
                for _, setterprefix in ipairs(setterprefixes) do
                    if f__.name:sub(1, #setterprefix) == setterprefix then
                        local setterwithoutprefix = f__.name:sub(#setterprefix+1)
                        if getterwithoutprefix == setterwithoutprefix then
                            link = a(getterprefix, nil, '#'..m.name..'_'..f_.name) .. span('/', 'slash') .. a(f__.name, nil, '#'..m.name..'_'..f__.name)
                            break
                        end
                    end
                end
            end
        end
    end

    for _, setterprefix in ipairs(setterprefixes) do
        if f_.name:sub(1, #setterprefix) == setterprefix then
            local setterwithoutprefix = f_.name:sub(#setterprefix+1)
            for _, f__ in ipairs(m.functions) do
                for _, getterprefix in ipairs(getterprefixes) do
                    if f__.name:sub(1, #getterprefix) == getterprefix then
                        local getterwithoutprefix = f__.name:sub(#getterprefix+1)
                        if getterwithoutprefix == setterwithoutprefix then
                            return
                        end
                    end
                end
            end
        end
    end

    if not link then
        link =  a(f_.name, nil, '#'..m.name..'_'..f_.name)
    end

    return p(prefix .. link, 'function_link')
end

function main()
    append([[<html>
    <head>
    <title>L&Ouml;VE ]]..love.version..[[ Reference</title>
    <link href="https://fonts.googleapis.com/css?family=Quicksand:500" rel="stylesheet">
    </head>
    <body>]])
    
    ---[[
    local file = io.open("pure-love.css")
    append(style(file:read("*a")))
    file:close()
    --]]
    --[[
    append('<link href="pure-love.css" rel="stylesheet">')
    --]]

    types = {}
    for _, m in ipairs(love.modules) do
        if m.types then
            for _, t in ipairs(m.types) do
                table.insert(types, {name = t.name, fullname = 'type_' .. t.name})
            end
        end
        if m.enums then
            for _, t in ipairs(m.enums) do
                table.insert(types, {name = t.name, fullname = 'enum_' .. t.name})
            end
        end
    end

    -- Navigation
    append(div('navigation'))

    append(p(a('love', nil, '#love' ), 'navigation_link'))

    for _, m in ipairs(love.modules) do
        append(p(a(m.name, nil, '#' .. m.name), 'navigation_link'))
    end

    append(div())
    append(div('container'))

    -- Callbacks

    append(div('module_section'))
    append(div('navigation_section callbacks_navigation_section'))
    append(p(a('love', 'love'), 'callbacks_title'))
    append(div('navigation_links_section'))

    append(p('Callbacks', 'module_navigation'))
    done = {}
    out = ''
    for _, c in ipairs(order.callbacks) do
        if type(c) == 'string' then
            for _, m in ipairs(love.callbacks) do
                if c == m.name then
                    done[m.name] = true
                    out = out .. p(span('love.', 'light') .. a(m.name, nil, '#' .. m.name), 'function_link')
                end
            end
        else
            out = out .. p(c.name, 'subsection')
            for _, f in ipairs(c.functions) do
                for _, m in ipairs(love.callbacks) do
                    if f == m.name then
                        done[m.name] = true
                        out = out .. p(span('love.', 'light') .. a(m.name, nil, '#' .. m.name), 'function_link')
                    end
                end
            end
        end
    end

    for _, m in ipairs(love.callbacks) do
        if not done[m.name] then
            append(p(span('love.', 'light') .. a(m.name, nil, '#' .. m.name), 'function_link'))
        end
    end

    append(out)

    local has_functions
    if love.types then
        for _, type_ in ipairs(love.types) do
            if not has_functions then
                append(p('Types', 'module_navigation'))
                has_functions = true
            end
            append(p(a(type_.name, nil, '#'..'type_'..type_.name), 'type_link'))
        end
    end

    if love.functions then
        for _, type_ in ipairs(love.functions) do
            append(p('Functions', 'module_navigation'))
            append(p(span('love.', 'light') .. a(type_.name, nil, '#love_' .. type_.name), 'function_link'))
        end
    end

    if love.enums then
        append(p('Enums', 'module_navigation'))
        for _, type_ in ipairs(love.enums) do
            append(p(a(type_.name, nil, '#'..'enum_'..type_.name), 'enum_link'))
        end
    end

    append(div())
    append(div())

    for _, c in ipairs(love.callbacks) do
        append(div('function_section'))
        append(p(a(span('love.', 'light') .. c.name, c.name), 'name'))
        if c.variants then
            for _, f_ in ipairs(c.variants) do
                append(p(makeLinks(c.description), 'description'))
                for _, f in ipairs(c.variants) do
                    if f.description then
                        append(p(makeLinks(f.description), 'description'))
                    end
                    append(p(span(synopsis('', c.name, f.arguments, f.returns), 'background'), 'synopsis'))
                    append(make_table(f.returns, 'returns_table', 'return_name', 'return_type', 'return_description'))
                    append(make_table(f.arguments, 'arguments_table', 'argument_name', 'argument_type', 'argument_description'))
                end

            end
        end
        append(div())
    end

    append(div())

    for _, f_ in ipairs(love.functions) do
        append(div('function_section'))
        append(p(a(span('love.', 'light') .. f_.name, 'love_'..f_.name), 'name'))
        append(p(makeLinks(f_.description), 'description'))
        for _, f in ipairs(f_.variants) do
            if f.description then
                append(p(makeLinks(f.description), 'description'))
            end
            append(p(span(synopsis('', f_.name, f.arguments, f.returns), 'background'), 'synopsis'))
            append(make_table(f.returns, 'returns_table', 'return_name', 'return_type', 'return_description'))
            append(make_table(f.arguments, 'arguments_table', 'argument_name', 'argument_type', 'argument_description'))
        end
        append(div())
    end

    -- Types
    for _, type_ in ipairs(love.types) do
        append(div('module_section'))
        append(div('navigation_section'))
        append(p(a(type_.name, 'type_'..type_.name), 'type_name'))
        append(p(makeLinks(type_.description, type_.name), 'description'))
        append(div('navigation_links_section'))
        -- Type navigation functions
        if type_.functions then
            append(p('Functions', 'module_navigation'))
            for _, f_ in ipairs(type_.functions) do
                append(p(span(type_.name..':', 'light') .. a(f_.name, nil, '#'..type_.name..'_'..f_.name), 'function_link'))
            end
        end
        -- Type navigation supertypes
        if type_.supertypes then
            append(p('Supertypes', 'module_navigation'))
            for _, supertype in ipairs(type_.supertypes) do
                append(p(a(supertype, nil, '#type_'..supertype), 'function_link'))
            end
        end
        -- Type navigation subtypes
        if type_.subtypes then
            append(p('Subtypes', 'module_navigation'))
            for _, subtype in ipairs(type_.subtypes) do
                append(p(a(subtype, nil, '#type_'..subtype), 'function_link'))
            end
        end
        append(div())
        append(div())
        if type_.functions then
            for _, f_ in ipairs(type_.functions) do
                append(div('function_section'))
                append(p(a(span(type_.name .. ':', 'light') .. f_.name, type_.name..'_'..f_.name), 'name'))
                append(p(makeLinks(f_.description), 'description'))
                for _, f in ipairs(f_.variants) do
                    if f.description then
                        append(p(makeLinks(f.description), 'description'))
                    end
                    append(p(span(synopsis(type_.name, f_.name, f.arguments, f.returns, true), 'background'), 'synopsis'))
                    append(make_table(f.returns, 'returns_table', 'return_name', 'return_type', 'return_description'))
                    append(make_table(f.arguments, 'arguments_table', 'argument_name', 'argument_type', 'argument_description'))
                end
                append(div())
            end
        end
        append(div())
    end

    for _, m in ipairs(love.modules) do
        -- Module name
        append(div('module_section'))
        append(div('module_navigation_section'))
        append(p(a(span('love.', 'light')..m.name, m.name), 'module_name'))
        -- Module navigation
        -- Types navigation
        append(div('navigation_links_section'))
        local has_functions = false
        if m.types then
            for _, type_ in ipairs(m.types) do
                if not has_functions then
                    append(p('Types', 'module_navigation'))
                    has_functions = true
                end
                append(p(a(type_.name, nil, '#'..'type_'..type_.name), 'type_link'))
            end
        end

        -- Function navigation

        local is_not_other_constructor = function(name)
            return name ~= 'newImageFont' and name ~= 'newRectangleShape' --  and name ~= 'getJoysticks' and name ~= 'getSystemCursor'
        end

        local has_functions = false
        for _, f_ in ipairs(m.functions) do
            if is_not_other_constructor(f_.name) then
                local is_not_constructor = true
                if f_.name:sub(1, 3) == 'new' then
                    local test = false
                    for i, v in ipairs(types) do
                        if v.name == f_.name:sub(4) then
                            is_not_constructor = true
                        end
                    end
                    if test then
                        has_functions = true
                    end
                else
                    has_functions = true
                end
            end
        end

        if has_functions then
            append(p('Functions', 'module_navigation'))
        end

        local make_link = function(f_, m)
            local out = ''
            local is_not_constructor = true
            if f_.name:sub(1, 3) == 'new' then
                for i, v in ipairs(types) do
                    if v.name == f_.name:sub(4) then
                        is_not_constructor = false
                    end
                end
            end
            if not is_not_other_constructor(f_.name) then
                is_not_constructor = false
            end

            if is_not_constructor then
                local lovedotmodule = span('love.' .. m.name .. '.', 'light')
                local link = make_function_navigation_link(m, f_, lovedotmodule)
                if link then
                    out = out .. (link)
                end
            end
            return out
        end

        done = {}
        out = ''
        if order[m.name] then
            for _, c in ipairs(order[m.name]) do
                if type(c) == 'string' then
                    for _, f_ in ipairs(m.functions) do
                        if c == f_.name then
                            done[f_.name] = true
                            out = out .. make_link(f_, m)
                        end
                    end
                else
                    out = out .. p(c.name, 'subsection')
                    for _, f in ipairs(c.functions) do
                        for _, f_ in ipairs(m.functions) do
                            if f == f_.name then
                                done[f_.name] = true
                                out = out .. make_link(f_, m)
                            end
                        end
                    end
                end
            end
        end

        for _, f_ in ipairs(m.functions) do
            if not done[f_.name] then
                append(make_link(f_, m))
            end
        end

        append(out)

        -- Enums navigation
        if m.enums then
            append(p('Enums', 'module_navigation'))
            for _, type_ in ipairs(m.enums) do
                append(p(a(type_.name, nil, '#'..'enum_'..type_.name), 'enum_link'))
            end
        end
        append(div())
        append(div())

        -- Functions for modules

        table.sort(m.functions, function(a, b) return a.name < b.name end)

        for _, f_ in ipairs(m.functions) do
            append(div('function_section'))
            append(p(a(span('love.' .. m.name .. '.', 'light') .. f_.name, m.name..'_'..f_.name), 'name'))
            append(p(makeLinks(f_.description), 'description'))
            for _, f in ipairs(f_.variants) do
                if f.description then
                    append(p(makeLinks(f.description), 'description'))
                end
                append(p(span(synopsis(m.name, f_.name, f.arguments, f.returns), 'background'), 'synopsis'))
                append(make_table(f.returns, 'returns_table', 'return_name', 'return_type', 'return_description'))
                append(make_table(f.arguments, 'arguments_table', 'argument_name', 'argument_type', 'argument_description'))
            end
            append(div())
        end
        -- Types
        if m.types then
            for _, type_ in ipairs(m.types) do
                -- Type navigation title

                append(div('navigation_section'))
                append(p(a(type_.name, 'type_'..type_.name), 'type_name'))
                append(p(makeLinks(type_.description:gsub('\\n', '<br />'), type_.name), 'description'))
                append(div('navigation_links_section'))
                if type_.constructors then
                    append(p('Constructors', 'module_navigation'))
                    for _, constructor in ipairs(type_.constructors) do
                        append(p(span('love.'..m.name ..'.', 'light') .. a(constructor, nil, '#'..m.name..'_'..constructor), 'function_link'))
                    end
                end
                -- Type navigation functions

                if type_.functions then
                    append(p('Functions', 'module_navigation'))
                    for _, f_ in ipairs(type_.functions) do
                        local prefix = span(type_.name .. ':', 'light')
                        local link = make_function_navigation_link(type_, f_, prefix)
                        if link then
                            append(link)
                        end
                    end
                end
                -- Type navigation supertypes
                if type_.supertypes then
                    append(p('Supertypes', 'module_navigation'))
                    for _, supertype in ipairs(type_.supertypes) do
                        append(p(a(supertype, nil, '#type_'..supertype), 'function_link'))
                    end
                end
                if type_.subtypes then
                    append(p('Subtypes', 'module_navigation'))
                    for _, subtype in ipairs(type_.subtypes) do
                        append(p(a(subtype, nil, '#type_'..subtype), 'function_link'))
                    end
                end

                append(div())
                append(div())


                if type_.functions then
                    for _, f_ in ipairs(type_.functions) do
                        append(div('function_section'))
                        append(p(a(span(type_.name .. ':', 'light') .. f_.name, type_.name..'_'..f_.name), 'name'))
                        append(p(makeLinks(f_.description), 'description'))
                        for _, f in ipairs(f_.variants) do
                            if f.description then
                                append(p(makeLinks(f.description), 'description'))
                            end
                            append(p(span(synopsis(type_.name, f_.name, f.arguments, f.returns, true), 'background'), 'synopsis'))
                            append(make_table(f.returns, 'returns_table', 'return_name', 'return_type', 'return_description'))
                            append(make_table(f.arguments, 'arguments_table', 'argument_name', 'argument_type', 'argument_description'))
                        end
                        append(div())
                    end
                end
            end
        end


        -- Enums for modules
        if m.enums then
            for _, enum in ipairs(m.enums) do
                append(div('enum_section'))
                append(p(a(enum.name, 'enum_'..enum.name), 'enum_name'))
                for _, constant in ipairs(enum.constants) do
                    append(p(constant.name, 'constant_name'))
                    append(p(makeLinks(constant.description), 'constant_description'))
                end
                append(div())
            end
        end

        append(div())
    end
    append(div())

    append('</body></html>')
end

a = function (s, name, href)
    if not name and not href then
        return '<a>' .. s .. '</a>'
    elseif not name then
        return '<a href = "' .. href .. '">' .. s .. '</a>'
    elseif not href then
        return '<a name = "' .. name .. '">' .. s .. '</a>'
    else
        return '<a name = "' .. name .. '" href = "' .. href .. '">' .. s .. '</a>'
    end
end

class = function (tag, s, class)
    if not class then
        return '<' .. tag ..'>' .. s .. '</' .. tag .. '>'
    else
        return '<' .. tag .. ' class = "' .. class .. '">' .. s .. '</' .. tag .. '>'
    end
end

p = function (s, c)
    return class('p', s:gsub('\n\n', '<br /><br />'), c)
end

span = function (s, c)
    return class('span', s, c)
end

h1 = function (s, c)
    return class('h1', s, c)
end

h2 = function (s, c)
    return class('h2', s, c)
end

h3 = function (s, c)
    return class('h3', s, c)
end

td = function (s, c)
    return class('td', s, c)
end

style = function (s, c)
    return class('style', s, c)
end

div = function (c)
    return open_close(c ,'div')
end

function make_table(t, table_name, name, type, description)
    local output = ''
    if t and table_name then
        output = output .. _table(table_name)

        for _, z in ipairs(t) do
            output = output .. tr('')
            if z.default then
                output = output .. td(z.name .. ' <span class = "default">(' .. z.default .. ')</span>', name)
            else
                output = output .. td(z.name, name)
            end
            outputted_name = false
            for _, t in ipairs(types) do
                if z.type == t.name then
                    output = output .. td(a(z.type, nil, '#'..t.fullname), type)
                    outputted_name = true
                    break
                end
            end
            if not outputted_name then
                if z.type ~= 'string' and z.type ~= 'light userdata' and z.type ~= 'number' and z.type ~= 'boolean' and z.type ~= 'table' and z.type ~= 'mixed' and z.type ~= 'function' and z.type ~= 'any' and z.type ~= 'value' then
                    -- print(z.type)
                end
                output = output .. td(z.type, type)
            end
            output = output .. td(makeLinks(z.description), description)
            output = output .. tr()
            local function doTable(z, givenFlags)
                if z.table then
                    local flags = z.name or givenFlags
                    output = output .. _table('flags_table')
                    for _, zz in ipairs(z.table) do
                        output = output .. tr('')
                        local default = ''
                        if zz.default then
                             default = ' <span class = "default">(' .. zz.default .. ')</span>'
                        end
                        local nameWithoutBrackets = zz.name:gsub('[%[%]]', '')
                        local dot = '.'
                        local namePart
                        local class
                        if table_name == 'returns_table' then
                            class = 'return_name'
                        else
                            class = 'argument_name'
                        end

                        if zz.name ~= nameWithoutBrackets then
                            dot = ''
                            namePart = '<span class = "light">[</span><span class = "'..class..'">'..nameWithoutBrackets..'</span><span class = "light">]</span>'
                        else
                            namePart = '<span class = "'..class..'">'..zz.name..'</span>'
                        end
                        if givenFlags then
                            output = output .. td('<span class = "light">'..givenFlags..'<wbr>'..dot..'</span><span class = "'..class..'">'..flags..'</span><wbr><span class = "light">'..dot..'</span>'..namePart..default, name)
                        else
                            output = output .. td('<span class = "light">'..flags..'<wbr>'..dot..'</span>'..namePart..default, name)
                        end
                        outputted_name = false
                        for _, t in ipairs(types) do
                            if zz.type == t.name then
                                output = output .. td(a(zz.type, nil, '#'..t.fullname), type)
                                outputted_name = true
                                break
                            end
                        end
                        if not outputted_name then
                            output = output .. td(zz.type, type)
                        end
                        output = output .. td(makeLinks(zz.description), description)
                        output = output .. tr()

                        doTable(zz, flags)
                    end
                    --output = output .. _table()
                end
            end
            doTable(z)
        end
        output = output .. _table()
    end

    return output
end

function synopsis(module_name, function_name, arguments, returns, types)
    argument_list = ''
    return_list = ''

    if arguments then
        for i, v in ipairs(arguments) do
            argument_list = argument_list .. '<span class = "argument">'
            argument_list = argument_list .. v.name
            argument_list = argument_list .. '</span>'
            if i ~= #arguments then
                argument_list = argument_list .. ', '
            end
        end
    end

    if returns then
        for i, v in ipairs(returns) do
            return_list = return_list .. '<span class = "return">'
            return_list = return_list .. v.name
            return_list = return_list .. '</span>'
            if i ~= #returns then
                return_list = return_list .. ', '
            end
        end
        return_list = return_list .. ' = '
    end

    if module_name == '' then
        if arguments then
            return string.format('%slove.%s( %s )', return_list, function_name, argument_list)
        else
            return string.format('%slove.%s()', return_list, function_name, argument_list)
        end
    end

    if not types then
        if arguments then
            return string.format('%slove.%s.%s( %s )', return_list, module_name, function_name, argument_list)
        else
            return string.format('%slove.%s.%s()', return_list, module_name, function_name)
        end
    else
        if arguments then
            return string.format('%s%s:%s( %s )', return_list, module_name, function_name, argument_list)
        else
            return string.format('%s%s:%s()', return_list, module_name, function_name)
        end
    end
end

function open_close(s, t)
    if not s then
        return '</' .. t .. '>'
    elseif s == '' then
        return '<' .. t .. '>'
    else
        return '<' .. t .. ' class = "' .. s .. '">'
    end
end

function _table(s)
    return open_close(s, 'table')
end

function tr(s)
    return open_close(s, 'tr')
end

function append(s)
    output = output .. s .. '\n'
end

main()

function string_to_file(s, f)
    file = io.open(f, 'w')
    file:write(s)
    file:close()
end


string_to_file(output:gsub('�', '&Ouml;'):gsub('Ö', '&Ouml;'):gsub('é', '&eacute;'), 'index.html')
