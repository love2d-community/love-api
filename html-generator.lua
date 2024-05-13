--local API = require('api.love_api')

local loveLogo = ([[data:image/png;base64,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]]):gsub("\n", "")

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

loopTypes(API.types)

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

for moduleIndex, module_ in ipairs(API.modules) do
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
		<title>LÖVE ]]..API.version..[[ Reference</title>
		<meta name="description" content="Community-driven LÖVE API documentation in one page.">
		<meta name="keywords" content="Love2d, Documentation, Lua">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script type="text/javascript">
          function jump(link) {
            console.log(link);
            location.hash = link;
          }
          function toggleTheme(el) {
            var current = document.body.className;
            document.body.className = current == 'light' ? 'dark' : 'light';
            document.getElementById('theme').className = document.body.className;
          }
        </script>
]])

    local file = io.open("pure-love.css")
    append(style("\n"..file:read("*a")))

	append([[

	</head>
	<body>
]])
    file:close()

    types = {}
    for _, m in ipairs(API.modules) do
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

    local versions = {
        {
          version = API.version,
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
    local optionsel = ''
    for i,version in ipairs(versions) do
        if(version.version == API.version) then
            optionsel = optionsel .. '<option selected="selected" value="' .. version.link .. '">Latest (' .. version.version .. ')</option>'
        else
            optionsel = optionsel .. '<option value="' .. version.link .. '">' .. version.version .. '</option>'
        end
    end

    append([[<div class="navigation_header">
      <a href="#container">
        <img class="navigation_header_logo" src="]]..loveLogo..[[">
      </a>
      <div class="navigation_header_options">
        <select onchange="window.open(this.value)">]] .. optionsel .. [[</select>
        <div id="theme"><button onclick="toggleTheme()"></button></div>
      </div>
    </div>]])

    local mobilemenu = '<div class="mobile"><select onchange="jump(this.value)">'

    append(div('navigation_links'))
    append(p('', 'non_expandable') .. p(a('love', nil, '#callbacks' ), 'navigation_link'))

    for _, m in ipairs(API.modules) do
      append(div('navigation_container'))
      if m.types then
        append(summary('expandable'))
      else
        append(p('', 'non_expandable'))
      end

      append(p(a('love.' .. m.name, nil, '#' .. m.name), 'navigation_link'))
      mobilemenu = mobilemenu .. '<option value="#' .. m.name .. '">love.' .. m.name .. '</option>'

      if m.types then
        append(details('expandable_menu'))
        append(summary('expand'))
        append('')
        append(summary())
        for _, type_ in ipairs(m.types) do
            append(p(a(type_.name, nil, '#'..'type_'..type_.name), 'navigation_link navigation_type_link'))
        end
        append(details())
      end
      if m.types then
          append(summary())
      end
      append(div())
    end
    append(div())

    mobilemenu = mobilemenu .. '</select></div>'
    append(mobilemenu)

    append(div())
    append(div('container'))

    -- Callbacks

    append(div('module_section'))
    append(div('navigation_section'))
    append(p(a('love', 'callbacks'), 'callbacks_title'))
    append(div('navigation_links_section'))

    done = {}
    out = ''
    for _, c in ipairs(order.callbacks) do
        if type(c) == 'string' then
            for _, m in ipairs(API.callbacks) do
                if c == m.name then
                    done[m.name] = true
                    out = out .. p(span('love.', 'light') .. a(m.name, nil, '#' .. m.name), 'function_link')
                end
            end
        else
            out = out .. p(c.name, 'subsection')
            for _, f in ipairs(c.functions) do
                for _, m in ipairs(API.callbacks) do
                    if f == m.name then
                        done[m.name] = true
                        out = out .. p(span('love.', 'light') .. a(m.name, nil, '#' .. m.name), 'function_link')
                    end
                end
            end
        end
    end

    for _, m in ipairs(API.callbacks) do
        if not done[m.name] then
            append(p(span('love.', 'light') .. a(m.name, nil, '#' .. m.name), 'function_link'))
        end
    end

    append(out)

    append(div())
    append(div())

    for _, c in ipairs(API.callbacks) do
        append(div('function_section'))
        append(p(a(span('love.', 'light') .. c.name, c.name, '#' .. c.name), 'name'))
        if c.variants then
            for _, f_ in ipairs(c.variants) do
                append(p(makeLinks(c.description), 'callback_description'))
                for _, f in ipairs(c.variants) do
                    append(p(span(synopsis('', c.name, f.arguments, f.returns), 'background'), 'synopsis'))
                    append(make_table(f.arguments, 'arguments_table', 'argument_name', 'argument_type', 'argument_description'))
                    append(make_table(f.returns, 'returns_table', 'return_name', 'return_type', 'return_description'))
                end

            end
        end
        append(div())
    end

    append(div())

    -- Types
    for _, type_ in ipairs(API.types) do
        append(div('module_section'))
        append(div('navigation_section'))
        append(p(a(type_.name, 'type_'..type_.name, '#type_'..type_.name), 'type_name'))
        append(p(makeLinks(type_.description, type_.name), 'description'))
        append(div('navigation_links_section'))
        -- Type navigation functions
        if type_.functions then
            append(p('Functions', 'module_navigation'))
            for _, f_ in ipairs(type_.functions) do
                append(p(span(type_.name .. ':', 'light') .. a(f_.name, nil, '#'..type_.name..'_'..f_.name), 'function_link'))
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
                append(p(span(type_.name .. ':', 'light') .. a(f_.name, type_.name..'_'..f_.name, '#' .. type_.name..'_'..f_.name), 'name'))
                append(p(makeLinks(f_.description), 'description'))
                for _, f in ipairs(f_.variants) do
                    append(p(span(synopsis(type_.name, f_.name, f.arguments, f.returns, true), 'background'), 'synopsis'))
                    append(make_table(f.arguments, 'arguments_table', 'argument_name', 'argument_type', 'argument_description'))
                    append(make_table(f.returns, 'returns_table', 'return_name', 'return_type', 'return_description'))
                end
                append(div())
            end
        end
        append(div())
    end

    for _, m in ipairs(API.modules) do
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
            append(p(a(span('love.' .. m.name .. '.', 'light') .. f_.name, m.name..'_'..f_.name, '#' .. m.name..'_'..f_.name), 'name'))
            append(p(makeLinks(f_.description), 'description'))
            for _, f in ipairs(f_.variants or {}) do
                append(p(span(synopsis(m.name, f_.name, f.arguments, f.returns), 'background'), 'synopsis'))
                append(make_table(f.arguments, 'arguments_table', 'argument_name', 'argument_type', 'argument_description'))
                append(make_table(f.returns, 'returns_table', 'return_name', 'return_type', 'return_description'))
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
                        append(p(a(span(type_.name .. ':', 'light') .. f_.name, type_.name..'_'..f_.name, '#'..type_.name..'_'..f_.name), 'name'))
                        append(p(makeLinks(f_.description), 'description'))
                        for _, f in ipairs(f_.variants) do
                            append(p(span(synopsis(type_.name, f_.name, f.arguments, f.returns, true), 'background'), 'synopsis'))
                            append(make_table(f.arguments, 'arguments_table', 'argument_name', 'argument_type', 'argument_description'))
                            append(make_table(f.returns, 'returns_table', 'return_name', 'return_type', 'return_description'))
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
                append(p(a(enum.name, 'enum_'..enum.name, '#'..'enum_'..enum.name), 'enum_name'))
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

    append([[
        </body>
        <script type="text/javascript">
            // set default theme
            if (window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches) {
                document.body.className = 'dark';
                document.getElementById('theme').className = 'dark';
            } else {
                document.body.className = 'light';
                document.getElementById('theme').className = 'light';
            }
        </script>
    </html>]])
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

--function string_to_file(s, f)
--    file = io.open(f, 'w')
--    file:write(s)
--    file:close()
--end
--
--
--string_to_file(table.concat(output, ''), 'index.html')