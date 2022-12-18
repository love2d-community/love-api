-- Script by @hahawoo aka Santos
love = require('api.love_api')

local loveLogo = ([[data:image/png;base64,
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
rkJggg==]]):gsub("\n", "")

local linkTypes = {}
local linkFunctions = {}

local function loopFunctions(functions, module_, moduleOrTypeOrCallback, prefix)
    for functionIndex, function_ in ipairs(functions or {}) do
        if module_.name == 'filesystem' and (function_.name == 'setSource' or function_.name == 'init') then
            table.remove(module_.functions, functionIndex)
        else
            linkFunctions[prefix..function_.name] = module_.name..'_'..function_.name
        end
    end
end

local function loopTypes(types, module_)
    for _, type_ in ipairs(types or {}) do
        loopFunctions(type_.functions, type_, 'type', type_.name..':')
        linkTypes[type_.name] = 'type_'..type_.name
        if linkTypes[type_.name]:sub(-1) == 'y' then
            linkTypes[type_.name:sub(1, -2)..'ies'] = 'type_'..type_.name
        else
            linkTypes[type_.name..'s'] = 'type_'..type_.name
        end
    end
end

loopTypes(love.types)

local function makeLinks(description, typeName)
    for k, v in pairs(linkTypes) do
        if v ~= 'type_'..(typeName or '') then
            description = description:gsub('([ %>])'..k..'([\n%. \'%(])', '%1<a href="#'..v..'">'..k..'</a>%2')
        end
    end
    for k, v in pairs(linkFunctions) do
        description = description:gsub(k, '<a href="#'..v..'">'..k..'</a>')
    end
    return description
end

for moduleIndex, module_ in ipairs(love.modules) do
    print(module_.name)
    loopFunctions(module_.functions, module_, 'module', 'love.'..module_.name..'.')
    loopTypes(module_.types, module_)

    for _, enum in ipairs(module_.enums or {}) do
    end
end

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

output = {}

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
                            link = a(getterprefix, nil, '#'..m.name..'_'..f_.name) .. span('/', 'light') .. a(f__.name, nil, '#'..m.name..'_'..f__.name)
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
    append([[<!DOCTYPE html>
<html>
    <head>
		<meta charset="UTF-8">
		<title>LÖVE ]]..love.version..[[ Reference</title>
		<meta name="description" content="Community-driven LÖVE API documentation in one page.">
		<meta name="keywords" content="Love2d, Documentation, Lua">
]])

    local file = io.open("pure-love.css")
    append(style("\n"..file:read("*a")))
	append([[

	</head>
	<body>
]])
    file:close()

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

    append([[<div class="navigation_header">
      <a href="#container">
        <img class="navigation_header_logo" src="]]..loveLogo..[[">
      </a>
      <p> ]]..love.version..[[ </p>
    </div>]])

    append(div('navigation_links'))
    append(p('', 'non_expandable') .. p(a('love', nil, '#callbacks' ), 'navigation_link'))

    for _, m in ipairs(love.modules) do
      append(div('navigation_container'))
      if m.types then
        append(summary('expandable'))
      else
        append(p('', 'non_expandable'))
      end

      append(p(a('love.' .. m.name, nil, '#' .. m.name), 'navigation_link'))

      if m.types then
        append(details('expandable_menu'))
        append(summary('expand'))
        append('')
        append(summary())
        for _, type_ in ipairs(m.types) do
            append(p(a('&#45&nbsp;' .. type_.name, nil, '#'..'type_'..type_.name), 'navigation_link navigation_type_link'))
        end
        append(details())
      end
      if m.types then
          append(summary())
      end
      append(div())
    end
    append(div())

    append(div('navigation_footer'))
    local versions = {
      {
        version = 'latest',
        link = 'http://love2d-community.github.io/love-api/',
      },
      {
        version = '11.0',
        link = 'http://love2d-community.github.io/love-api/0.10.0/',
      },
      {
        version = '0.10.2',
        link = 'http://love2d-community.github.io/love-api/0.10.2/',
      },
      {
        version = '0.10.1',
        link = 'http://love2d-community.github.io/love-api/0.10.1/'
      },
      {
        version = '0.10.0',
        link = 'http://love2d-community.github.io/love-api/0.10.0/'
      },
      {
        version = '0.9.2',
        link = 'http://love2d-community.github.io/love-api/0.9.2/'
      },
      {
        version = '0.9.1',
        link = 'http://love2d-community.github.io/love-api/0.9.1/'
      }
    }
    append('Version: <select onchange="window.open(this.value)">')
    for i,version in ipairs(versions) do
      if(version.version == 'latest') then
        append('<option selected="selected" value="' .. version.link .. '">' .. version.version .. '</option>')
      else
        append('<option value="' .. version.link .. '">' .. version.version .. '</option>')
      end
    end
    append('</select>')
    append(div())

    append(div())
    append(div('container'))

    -- Callbacks

    append(div('module_section'))
    append(div('navigation_section'))
    append(p(a('Callbacks', 'callbacks'), 'callbacks_title'))
    append(div('navigation_links_section'))

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

    append(div())
    append(div())

    for _, c in ipairs(love.callbacks) do
        append(div('function_section'))
        append(p(a(span('love.', 'light') .. c.name, c.name), 'name'))
        if c.variants then
            for _, f_ in ipairs(c.variants) do
                append(p(makeLinks(c.description), 'callback_description'))
                for _, f in ipairs(c.variants) do
                    append(p(span(synopsis('', c.name, f.arguments, f.returns), 'background'), 'synopsis'))
                    append(make_table(f.returns, 'returns_table', 'return_name', 'return_type', 'return_description'))
                    append(make_table(f.arguments, 'arguments_table', 'argument_name', 'argument_type', 'argument_description'))
                end

            end
        end
        append(div())
    end

    append(div())

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
                append(p(a(span(type_.name .. ':', 'light') .. f_.name, nil, '#'..type_.name..'_'..f_.name), 'function_link'))
            end
        end
        -- Type navigation supertypes
        if type_.supertypes then
            append(p('Supertypes', 'module_navigation'))
            for _, supertype in ipairs(type_.supertypes) do
                append(p(a(supertype, nil, '#type_'..supertype), 'function_link'))
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

        -- Functions for modules

        table.sort(m.functions, function(a, b) return a.name < b.name end)

        for _, f_ in ipairs(m.functions) do
            append(div('function_section'))
            append(p(a(span('love.' .. m.name .. '.', 'light') .. f_.name, m.name..'_'..f_.name), 'name'))
            append(p(makeLinks(f_.description), 'description'))
            for _, f in ipairs(f_.variants or {}) do
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
                is_object = false
                if type_.supertypes then
                    append(p('Supertypes', 'module_navigation'))
                    for _, supertype in ipairs(type_.supertypes) do
                        append(p(a(supertype, nil, '#type_'..supertype), 'function_link'))
                        if supertype == 'Object' then
                            is_object = true
                        end
                    end
                end
                if not is_object then
                    --print(type_.name..' does not have supertype Object.')
                end
                append(div())
                append(div())


                if type_.functions then
                    for _, f_ in ipairs(type_.functions) do
                        append(div('function_section'))
                        append(p(a(span(type_.name .. ':', 'light') .. f_.name, type_.name..'_'..f_.name), 'name'))
                        append(p(makeLinks(f_.description), 'description'))
                        for _, f in ipairs(f_.variants) do
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

    append('\t</body></html>')
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

summary = function (c)
    return open_close(c ,'summary')
end

details = function (c)
    return open_close(c ,'details')
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
                        if zz.name ~= nameWithoutBrackets then
                            dot = ''
                            namePart = '<span class = "light">[</span><span class = "green">'..nameWithoutBrackets..'</span><span class = "light">]</span>'
                        else
                            namePart = '<span class = "green">'..zz.name..'</span>'
                        end
                        if givenFlags then
                            output = output .. td('<span class = "light">'..givenFlags..'<wbr>'..dot..'</span><span class = "green">'..flags..'</span><wbr><span class = "light">'..dot..'</span>'..namePart..default, name)
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
        return '<' .. t .. ' id = "' .. s .. '" class = "' .. s .. '">'
    end
end

function _table(s)
    return open_close(s, 'table')
end

function tr(s)
    return open_close(s, 'tr')
end

function append(s)
    table.insert(output, s)
end

main()

function string_to_file(s, f)
    file = io.open(f, 'w')
    file:write(s)
    file:close()
end


string_to_file(table.concat(output, ''), 'index.html')
