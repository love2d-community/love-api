-- Script by @hahawoo aka Santos
local love_api = require('love-api.love_api')

local order = {
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


local output = ''

local function append(s)
    output = output..s..'\n'
end

local function a(s, name, href)
    local attr = ''
    if href then
        attr = ' href = "'..href..'"'
    end
    if name then
        attr = ' name = "'..name..'"'
    end
    return '<a'..attr..'>'..s..'</a>'
end

local function class(tag, s, class)
    if not class then
        return '<'..tag ..'>'..s..'</'..tag..'>'
    else
        return '<'..tag..' class = "'..class..'">'..s..'</'..tag..'>'
    end
end

local function open_close(s, t)
    if not s then
        return '</'..t..'>'
    elseif s == '' then
        return '<'..t..'>'
    else
        return '<'..t..' class = "'..s..'">'
    end
end

local function div(s) return open_close(s, 'div') end
local function _table(s) return open_close(s, 'table') end
local function tr(s) return open_close(s, 'tr') end

local function p(s, c) return class('p', s:gsub('\n', '<br />'), c) end
local function span(s, c) return class('span', s, c) end
local function h1(s, c) return class('h1', s, c) end
local function h2(s, c) return class('h2', s, c) end
local function h3(s, c) return class('h3', s, c) end
local function td(s, c) return class('td', s, c) end
local function style(s, c) return class('style', s, c) end

local gettersetter = {}

local function make_function_navigation_link(m, f_, prefix)
    local link
    local gs = gettersetter[prefix..f_.name]
    if type(gs) == 'table' then
        link = a(gs.getterprefix, nil, '#'..prefix..gs.getter)..span('/', 'slash')..a(f_.name, nil, '#'..prefix..f_.name)
    elseif gettersetter[prefix..f_.name] == 'getter' then
        return
    else
        link = a(f_.name, nil, '#'..prefix..f_.name)
    end
    return p(prefix..link, 'link')
end

local linkTypes = {}
local linkFunctions = {}

local function splitPrefix(s)
    return s:match('(.+[%.%:])(.+)')
end

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
    if (description:match('%w%.%w') or description:match('%w%:%w')) then
        for _, v in ipairs(linkFunctions) do
            description = description:gsub(v.name, '<a href="#'..v.link..'">'..encode(v.name)..'</a>')
        end
    end
    description = decode(description)
    return description
end

local function doFunctions(f_, name)

    local function make_table(t, table_name, name, type_, description)
        local output = ''
        if t and table_name then
            output = output.._table(table_name)

            for _, z in ipairs(t) do
                output = output..tr('')
                if z.default then
                    output = output..td(z.name..' <span class = "default">('..z.default..')</span>', name)
                else
                    output = output..td(z.name, name)
                end
                outputted_name = false
                for _, t in ipairs(types) do
                    if z.type == t.name then
                        output = output..td(a(z.type, nil, '#'..t.linkname), type_)
                        outputted_name = true
                        break
                    end
                end
                if not outputted_name then
                    output = output..td(z.type, type_)
                end
                output = output..td(makeLinks(z.description), description)
                output = output..tr()
                local function doTable(z, givenFlags)
                    if z.table then
                        local flags = z.name or givenFlags
                        output = output.._table('flags_table')
                        for _, zz in ipairs(z.table) do
                            output = output..tr('')
                            local default = ''
                            if zz.default then
                                 default = ' <span class = "default">('..zz.default..')</span>'
                            end

                            local nameWithoutBrackets = zz.name:gsub('[%[%]]', '')
                            local dot = '.'

                            local class
                            if table_name == 'returns_table' then
                                class = 'returns'
                            else
                                class = 'arguments'
                            end

                            local namePart
                            if zz.name ~= nameWithoutBrackets then
                                dot = ''
                                namePart = '[<span class = "'..class..'">'..nameWithoutBrackets..'</span>]'
                            else
                                namePart = '<span class = "'..class..'">'..zz.name..'</span>'
                            end

                            local flagPart = ''
                            if givenFlags then
                                flagPart = givenFlags..'<wbr>'..dot..'<span class = "'..class..'">'
                            end
                            output = output..td(flagPart..flags..'<wbr>'..dot..namePart..default, name)

                            outputted_name = false
                            for _, t in ipairs(types) do
                                if zz.type == t.name then
                                    output = output..td(a(zz.type, nil, '#'..t.linkname), type_)
                                    outputted_name = true
                                    break
                                end
                            end
                            if not outputted_name then
                                output = output..td(zz.type, type_)
                            end
                            output = output..td(makeLinks(zz.description), description)
                            output = output..tr()

                            doTable(zz, flags)
                        end
                    end
                end
                doTable(z)
            end
            output = output.._table()
        end

        return output
    end

    append(div('section'))
    local prefix, functionName = splitPrefix(name)
    append(p(a(span(prefix, 'prefix')..functionName, name), 'name'))
    append(p(makeLinks(f_.description), 'description'))
    for _, f in ipairs(f_.variants) do
        local function ar(args, class)
            local argument_list = ''
            for i, v in ipairs(args or {}) do
                argument_list = argument_list..'<span class = "'..class..'">'..v.name..'</span>'
                if i ~= #args then
                    argument_list = argument_list..', '
                end
            end
            return argument_list
        end

        local argument_list = ar(f.arguments, 'arguments')
        if f.arguments then
            argument_list = ' '..argument_list..' '
        end
        local return_list = ar(f.returns, 'returns')
        if f.returns then
            return_list = return_list..' = '
        end

        append(p(span(string.format('%s%s(%s)', return_list, prefix..f_.name, argument_list), 'synopsis_background'), 'synopsis'))

        if f.description then
            append(p(makeLinks(f.description), 'description'))
        end

        append(make_table(f.returns, 'ra_table', 'ra_name returns', 'ra_type', 'ra_description'))
        append(make_table(f.arguments, 'ra_table', 'ra_name arguments', 'ra_type', 'ra_description'))
    end
    append(div())
end

local function doTypes(types, moduleName)
    for _, type_ in ipairs(types or {}) do
        -- Type navigation title
        
        append(div('section'))
        append(p(a(type_.name, type_.name), 'heading'))
        append(p(makeLinks(type_.description), type_.name), 'description')
        append(div('navigation_links_section'))
        if type_.constructors then
            append(p('Constructors', 'module_navigation'))
            for _, constructor in ipairs(type_.constructors) do
                local modulePart = ''
                if moduleName then
                    modulePart = moduleName..'.'
                end
                append(p('love.'..modulePart..a(constructor, nil, '#love.'..moduleName..'.'..constructor), 'link'))
            end
        end
        -- Type navigation functions

        if type_.functions then
            append(p('Functions', 'module_navigation'))
            for _, f_ in ipairs(type_.functions) do
                local prefix = type_.name..':'
                local link = make_function_navigation_link(type_, f_, prefix)
                if link then
                    append(link)
                end
            end
        end

        local function t(types, s)
            if types then
                append(p(s, 'module_navigation'))
                for _, supertype in ipairs(types) do
                    if
                        supertype ~= 'FontData' and
                        supertype ~= 'GlyphData' and
                        supertype ~= 'Rasterizer' and
                        supertype ~= 'Decoder' and
                        supertype ~= 'VideoStream'
                    then
                        append(p(a(supertype, nil, '#'..supertype), 'link'))
                    end
                end
            end
        end
        t(type_.supertypes, 'Supertypes')
        t(type_.subtypes, 'Subtypes')

        append(div())
        append(div())

        for _, f_ in ipairs(type_.functions or {}) do
            doFunctions(f_, type_.name..':'..f_.name)
        end
    end
end

local function loopFunctions(functions, module_, prefix)
    if functions then
        for functionIndex = #functions, 1, -1 do
            local function_ = functions[functionIndex]
            if module_ and 
                ((module_.name == 'filesystem' and (function_.name == 'setSource' or function_.name == 'init')) or
                (module_.name == 'sound' and function_.name == 'newDecoder'))
            then
                table.remove(functions, functionIndex)
            else
                table.insert(linkFunctions, {name = prefix..function_.name, link = prefix..function_.name})
            end
        end
    end
end

local function insertIntoLinks(name)
    table.insert(linkTypes, {name = name, link = name})
    if name:sub(-1) == 'y' then
        table.insert(linkTypes, {name = name:sub(1, -2)..'ies', link = name})
    else
        table.insert(linkTypes, {name = name..'s', link = name})
    end
end

local function loopTypes(types, module_)
    if types then
        for typeIndex = #types, 1, -1 do
            local type_ = types[typeIndex]
            if type_.name ~= 'Decoder' then
                insertIntoLinks(type_.name)
                loopFunctions(type_.functions, type_, type_.name..':')
            else
                table.remove(types, typeIndex)
            end
        end
    end
end

loopTypes(love_api.types)

for moduleIndex = #love_api.modules, 1, -1 do
    local module_ = love_api.modules[moduleIndex]
    if module_.name == 'video' or module_.name == 'font' then
        table.remove(love_api.modules, moduleIndex)
    else
        loopFunctions(module_.functions, module_, 'love.'..module_.name..'.')
        loopTypes(module_.types, module_)
    end

    for _, enum in ipairs(module_.enums or {}) do
        insertIntoLinks(enum.name)
    end
end

loopFunctions(love_api.callbacks, nil, 'love.')

table.sort(linkFunctions, function(a, b) return #a.name > #b.name end)
table.sort(linkTypes, function(a, b) return #a.name > #b.name end)

for moduleIndex, module_ in ipairs(love_api.modules) do
    local function loopFunctions2(functions, prefix)
        local t = {}
        for functionIndex, function_ in ipairs(functions or {}) do
            for _, getterprefix in ipairs({'get', 'is', 'has', 'are', 'to', 'load', 'tell'}) do
                if function_.name:sub(1, #getterprefix) == getterprefix and function_.name ~= 'hasCursor' then
                    local withoutprefix = function_.name:sub(#getterprefix+1)
                    if not t[withoutprefix] then
                        t[withoutprefix] = {}
                    end
                    t[withoutprefix].getter = {name = function_.name, prefix = getterprefix}
                end
            end
            for _, setterprefix in ipairs({'set', 'from', 'save', 'seek'}) do
                if function_.name:sub(1, #setterprefix) == setterprefix and function_.name ~= 'hasCursor' then
                    local withoutprefix = function_.name:sub(#setterprefix+1)
                    if not t[withoutprefix] then
                        t[withoutprefix] = {}
                    end
                    t[withoutprefix].setter = {name = function_.name, prefix = setterprefix}
                end
            end
        end
        for k, v in pairs(t) do
            if v.getter and v.setter then
                gettersetter[prefix..v.getter.name] = 'getter'
                gettersetter[prefix..v.setter.name] = {getter = v.getter.name, getterprefix = v.getter.prefix}
            end
        end
    end

    loopFunctions2(module_.functions, 'love.'..module_.name..'.')
    for _, type_ in ipairs(module_.types or {}) do
        loopFunctions2(type_.functions, type_.name..':')
    end
end

local function main()
    append([[<html>
    <head>
    <title>L&Ouml;VE ]]..love_api.version..[[ Reference</title>
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
    for _, m in ipairs(love_api.modules) do
        if m.types then
            for _, t in ipairs(m.types) do
                table.insert(types, {name = t.name, linkname = t.name})
            end
        end
        if m.enums then
            for _, t in ipairs(m.enums) do
                table.insert(types, {name = t.name, linkname = t.name})
            end
        end
    end

    -- Navigation
    append(div('navigation'))

    append(p(a('love', nil, '#love' )))

    for _, m in ipairs(love_api.modules) do
        append(p(a(m.name, nil, '#love.'..m.name)))
    end

    append(div())
    append(div('container'))

    -- Callbacks

    append(div('module_section'))
    append(div('section callbacks_section'))
    append(p(a('love', 'love'), 'heading'))

    append(p('Callbacks', 'module_navigation'))
    done = {}
    out = ''
    for _, c in ipairs(order.callbacks) do
        if type(c) == 'string' then
            for _, m in ipairs(love_api.callbacks) do
                if c == m.name then
                    done[m.name] = true
                    out = out..p('love.'..a(m.name, nil, '#love.'..m.name), 'link')
                end
            end
        else
            out = out..p(c.name, 'subsection')
            for _, f in ipairs(c.functions) do
                for _, m in ipairs(love_api.callbacks) do
                    if f == m.name then
                        done[m.name] = true
                        out = out..p('love.'..a(m.name, nil, '#love.'..m.name), 'link')
                    end
                end
            end
        end
    end

    for _, m in ipairs(love_api.callbacks) do
        if not done[m.name] then
            append(p('love.'..a(m.name, nil, '#love.'..m.name), 'link'))
        end
    end

    append(out)

    local has_functions
    if love_api.types then
        for _, type_ in ipairs(love_api.types) do
            if not has_functions then
                append(p('Types', 'module_navigation'))
                has_functions = true
            end
            append(p(a(type_.name, nil, '#'..type_.name), 'link'))
        end
    end

    if love_api.functions then
        for _, type_ in ipairs(love_api.functions) do
            append(p('Functions', 'module_navigation'))
            append(p('love.'..a(type_.name, nil, '#love.'..type_.name), 'link'))
        end
    end

    if love_api.enums then
        append(p('Enums', 'module_navigation'))
        for _, type_ in ipairs(love_api.enums) do
            append(p(a(type_.name, nil, '#'..type_.name), 'link'))
        end
    end

    append(div())

    for _, f_ in ipairs(love_api.callbacks or {}) do
        doFunctions(f_, 'love.'..f_.name)
    end

    append(div())

    for _, f_ in ipairs(love_api.functions or {}) do
        doFunctions(f_, 'love.'..f_.name)
    end

    doTypes(love_api.types)

    for _, m in ipairs(love_api.modules) do
        -- Module name
        append(div('module_section'))
        append(div('section'))
        append(p(a('love.'..m.name, 'love.'..m.name), 'heading'))

        -- Types navigation
        append(div('navigation_links_section'))
        local has_functions = false
        if m.types then
            for _, type_ in ipairs(m.types) do
                if not has_functions then
                    append(p('Types', 'module_navigation'))
                    has_functions = true
                end
                append(p(a(type_.name, nil, '#'..type_.name), 'link'))
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
                local lovedotmodule = 'love.'..m.name..'.'
                local link = make_function_navigation_link(m, f_, lovedotmodule)
                if link then
                    out = out..(link)
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
                            out = out..make_link(f_, m)
                        end
                    end
                else
                    out = out..p(c.name, 'subsection')
                    for _, f in ipairs(c.functions) do
                        for _, f_ in ipairs(m.functions) do
                            if f == f_.name then
                                done[f_.name] = true
                                out = out..make_link(f_, m)
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
                append(p(a(type_.name, nil, '#'..type_.name), 'link'))
            end
        end
        append(div())
        append(div())

        -- Functions for modules

        table.sort(m.functions, function(a, b) return a.name < b.name end)

        for _, f_ in ipairs(m.functions or {}) do
            doFunctions(f_, 'love.'..m.name..'.'..f_.name)
        end

        -- Types
        doTypes(m.types, m.name)

        for _, enum in ipairs(m.enums or {}) do
            append(div('section'))
            append(p(a(enum.name, enum.name), 'heading'))
            for _, constant in ipairs(enum.constants) do
                append(p(constant.name, 'constant_name'))
                append(p(makeLinks(constant.description), 'constant_description'))
            end
            append(div())
        end

        append(div())
    end
    append(div())

    append('</body></html>')
end

main()

local file = io.open('index.html', 'w')
file:write((output:gsub('�', '&Ouml;'):gsub('Ö', '&Ouml;'):gsub('é', '&eacute;')))
file:close()
