-- Script by @hahawoo aka Santos
local api = require('api')

local FAST_MODE = false

do
    local function functions(f)
        for _, function_ in ipairs(f) do
            for _, variant in ipairs(function_.variants) do
                if not variant.returns then variant.returns = {} end
                if not variant.arguments then variant.arguments = {} end
            end
        end
    end

    local function types(t)
        for _, type_ in ipairs(t) do
            if not type_.functions then type_.functions = {} end
            if not type_.constructors then type_.constructors = {} end
            if not type_.supertypes then type_.supertypes = {} end
            if not type_.subtypes then type_.subtypes = {} end

            functions(type_.functions)
        end
    end

    functions(api.functions)
    functions(api.callbacks)
    types(api.types)

    table.insert(api.modules, {
        name = 'love',
        functions = api.functions,
        callbacks = api.callbacks,
        types = api.types,
    })

    for _, module_ in ipairs(api.modules) do
        if not module_.functions then module_.functions = {} end
        if not module_.types then module_.types = {} end
        if not module_.enums then module_.enums = {} end
        if not module_.callbacks then module_.callbacks = {} end

        functions(module_.functions)
        types(module_.types)
    end
end    

local order = {
    Source = {
        {
            name = 'Playback',
            functions = {
                'play',
                'stop',
                'pause',
                'resume',
                'rewind',
                'seek',
                'setLooping',
                'setPitch',
                'setVolume',
                'isPlaying',
                'isStopped',
                'isPaused',
            },
        },
        {
            name = 'Spatial',
            functions = {
                'setPosition',
                'setDirection',
                'setRolloff',
                'setVelocity',
                'setCone',
                'setAttenuationDistances',
                'setVolumeLimits',
            },
        },
        {
            name = 'Info',
            functions = {
                'getType',
                'getChannels',
                'getDuration',
            },
        },
    },
    File = {
        'open',
        'close',
        'read',
        'lines',
        'write',
        'setBuffer',
        'flush',
        'getMode',
        'isOpen',
        'tell/seek',
        'isEOF',
        'getFilename',
        'getSize',
    },
    FileData = {
        'getFilename',
        'getExtension',
    },
    Canvas = {
        'getFormat',
        'getMSAA',
        'setFilter',
        'setWrap',
        'newImageData',
        'renderTo',
        {
            name = 'Dimensions',
            functions = {
                'getDimensions',
                'getWidth',
                'getHeight',
            }
        },
    },
    Font = {
        'setFilter',
        {
            name = 'Glyph support',
            functions = {
                'hasGlyphs',
                'setFallbacks',
            },
        {
            name = 'Info',
            functions = {
                'getWrap',
                'setLineHeight',
                'getWidth',
                'getHeight',
                'getBaseline',
                'getAscent',
                'getDescent',
            },
        },
    },
    Mesh = {
        'setTexture',
        'getVertexFormat',
        'setVertex',
        'setVertices',
        'attachAttribute',
        'setVertexAttribute',
        'is/setAttributeEnabled',
        'setVertexMap',
        'getVertexCount',
        'setDrawMode',
        'setDrawRange',
    },
    Image = {
        'getFlags',
        'setFilter',
        'setMipmapFilter',
        'setWrap',
        'refresh',
        'getData',
        {
            name = 'Dimensions',
            functions = {
                'getDimensions',
                'getWidth',
                'getHeight',
            }
        },
    },
    ParticleSystem = {
        'start',
        'stop',
        'pause',
        'reset',
        'update',
        'emit',
        'isActive',
        'isPaused',
        'isStopped',
        'clone',
        'setBufferSize',
        'getCount',
        {
            name = 'Emitter',
            functions = {
                'setPosition',
                'moveTo',
                'setAreaSpread',
                'setEmissionRate',
                'setEmitterLifetime',
            }
        },
        {
            name = 'Particles',
            functions = {
                'setColors',
                'setDirection',
                'setInsertMode',
                'setLinearAcceleration',
                'setLinearDamping',
                'setOffset',
                'setParticleLifetime',
                'setRadialAcceleration',
                'setTangentialAcceleration',
                'setRelativeRotation',
                'setRotation',
                'setSizes',
                'setSizeVariation',
                'setSpeed',
                'setSpin',
                'setSpinVariation',
                'setSpread',
                'setTexture',
                'setQuads',
                }
            }
        }
    },
    Shader = {
        'send',
        'sendColor',
        'getExternVariable',
        'getWarnings',
    },
    Text = {
        'add',
        'addf',
        'set',
        'setf',
        'clear',
        'setFont',
        {
            name = 'Dimensions',
            functions = {
                'getDimensions',
                'getWidth',
                'getHeight',
            }
        },
    },
    Video = {
        'play',
        'isPlaying',
        'pause',
        'seek',
        'rewind',
        'setSource',
        'setFilter',
        'getStream',
        {
            name = 'Dimensions',
            functions = {
                'getDimensions',
                'getWidth',
                'getHeight',
            }
        },
    },
    ImageData = {
        'setPixel',
        'mapPixel',
        'paste',
        'encode',
        {
            name = 'Dimensions',
            functions = {
                'getDimensions',
                'getWidth',
                'getHeight',
            }
        },
    },
    callbacks = {
        'load',
        'update',
        'draw',
        'quit',
        'run',
        'conf',
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
    audio = {
        {
            name = 'Playback',
            functions = {
                'play',
                'stop',
                'pause',
                'resume',
                'rewind',
            },
        },
        {
            name = 'Listener',
            functions = {
                'setPosition',
                'setOrientation',
                'setVelocity',
                'setDistanceModel',
                'setDopplerScale',
            },
        },
        {
            name = 'Other',
            functions = {
                'setVolume',
                'getSourceCount',
            },
        },
    },
    event = {
        'push',
        'poll',
        'pump',
        'wait',
        'clear',
        'quit',
    },
    filesystem = {
        {
            name = 'Mounting',
            functions = {
                'mount',
                'unmount',
            }
        },
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
                'isFile',
                'isDirectory',
                'isSymname',
                'exists',
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
        {
            name = 'Other',
            functions = {
                'setSymnamesEnabled',
                'isFused',
                'createDirectory',
                'getDirectoryItems',
                'getIdentity',
                'load',
                'setRequirePath',
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
                'setStencilTest',
            },
        },
        {
            name = 'Graphics state',
            functions = {
                'push',
                'pop',
                'reset',
                'setFont',
                'setNewFont',
                'setBackgroundColor',
                'setBlendMode',
                'setCanvas',
                'setColor',
                'setColorMask',
                'setDefaultFilter',
                'setLineJoin',
                'setLineStyle',
                'setLineWidth',
                'setShader',
                'setPointSize',
                'setPointStyle',
                'setScissor',
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
        {
            name = 'Other',
            functions = {
                'newScreenshot',
                'setWireframe',
                'clear',
                'discard',
                'present',
            },
        },
    },
    Joystick = {
        {
            name = 'Input',
            functions = {
                'isDown',
                'getAxis',
                'getAxes',
                'getHat',
                'isGamepadDown',
                'getGamepadAxis',
            }
        },
        {
            name = 'Count',
            functions = {
                'getAxisCount',
                'getButtonCount',
                'getHatCount',
            }
        },
        {
            name = 'Info',
            functions = {
                'getName',
                'getID',
                'getGUID',
                'isConnected',
                'isGamepad',
                'getGamepadMapping',
            }
        },
        {
            name = 'Vibration',
            functions = {
                'setVibration',
                'isVibrationSupported',
            }
        },
    },
    BezierCurve = {
        'evalulate',
        'render',
        'renderSegment',
        'getSegment',
        'getDerivative',
        'getDegree',
        {
            name = 'Control points',
            functions = {
                'insertControlPoint',
                'removeControlPoint',
                'setControlPoint',
                'getControlPointCount',
            }
        },
        {
            name = 'Transform',
            functions = {
                'translate',
                'scale',
                'rotate',
            }
        },
    },
    RandomGenerator = {
        'random',
        'randomNormal',
        'setSeed',
        'setState',
    },
    SoundData = {
        'setSample',
        'getSampleCount',
        'getDuration',
        'getSampleRate',
        'getBitDepth',
        'getChannels',
    },
    Thread = {
        'start',
        'wait',
        'getError',
        'isRunning',
    },
    Channel = {
        'push',
        'pop',
        'supply',
        'demand',
        'peek',
        'clear',
        'performAtomic',
        'getCount',
    },
    joystick = {
        'setJoysticks',
    },
    keyboard = {
        'isDown',
        'isScancodeDown',
        'getScancodeFromKey',
        'getKeyFromScancode',
        'setKeyRepeat',
        'setTextInput',
    },
    math = {
        'noise',
        {
            name = "Random numbers",
            functions = {
                "random",
                "randomNormal",
                "setRandomSeed",
                "setRandomState",
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
                "setPosition",
                "setX",
                "setY",
                'setGrabbed',
                'setRelativeMode',
            },
        },
        {
            name = "Cursor",
            functions = {
                "setCursor",
                "getSystemCursor",
                "setVisible",
                "hasCursor",
            },
        },
    },
    system = {
        'openURL',
        'setClipboardText',
        'vibrate',
        {
            name = 'Info',
            functions = {
                'getOS',
                'getPowerInfo',
                'getProcessorCount',
            }
        },
    },
    timer = {
        'getTime',
        'getFPS',
        'getAverageDelta',
        'getDelta',
        'sleep',
        'step',
    },
    touch = {
        'getTouches',
        'getPosition',
        'getPressure',
    },
    window = {
        'setTitle',
        'setIcon',
        'getFullscreenModes',
        'setMode',
        'setFullscreen',
        'setPosition',
        'hasFocus',
        'hasMouseFocus',
        'maximize',
        'minimize',
        'isMaximized',
        'isVisible',
        'isOpen',
        'close',
        'requestAttention',
        'getDisplayName',
        'setDisplaySleepEnabled',
        'showMessageBox',
        'fromPixels',
        'getPixelScale',
    },
}

local output = {}

local function A(s)
    table.insert(output, s)
end

local function a(s, href, name)
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

local nameTypes = {}
local nameFunctions = {}

local function makeLinks(description, typeName)
    if FAST_MODE then
        return description
    end

    -- So that (for example) Joystick:isGamepadDown isn't linked to twice for its own name and the substring Joystick:isGamepad, the name is temporarily "encoded".
    local temp = 'TEMP!'
    local function encode(s)
        return s:sub(1, 1)..temp..s:sub(2)
    end
    local function decode(s)
        return s:gsub(temp, '')
    end

    for _, v in ipairs(nameTypes) do
        if v.name ~= typeName then
            description, count = description:gsub('([ %>])'..v.name..'([\n%. \'%(%)%,])', '%1<a href="#'..encode(v.name)..'">'..encode(v.name)..'</a>%2')
        end
    end
    if (description:match('%w%.%w') or description:match('%w%:%w')) then
        for _, v in ipairs(nameFunctions) do
            description = description:gsub(v.name, '<a href="#'..encode(v.name)..'">'..encode(v.name)..'</a>')
        end
    end
    description = decode(description)
    return description
end

function getDescription(a, languageCode)
    if a.descriptiont and a.descriptiont[languageCode] then
        return (a.descriptiont[languageCode]:gsub(' %[auto%]', ''))
    end
    return a.description
end

local function doFunctions(functions, prefix, languageCode)
    for _, function_ in ipairs(functions) do
        local function make_table(t, table_name, name, type_, description)
            if t and table_name then
                A(_table(table_name))

                for _, z in ipairs(t) do
                    A(tr(''))
                    if z.default then
                        A(td(z.name..' <span class = "default">('..z.default..')</span>', name))
                    else
                        A(td(z.name, name))
                    end
                    local typeNames = {}
                    for _, t in ipairs(types) do
                        typeNames[t.name] = t.link
                    end
                    local namePart = {}
                    for match in (z.type..' / '):gmatch('(.-) %/ ') do
                        if typeNames[match] then
                            table.insert(namePart, a(match, '#'..typeNames[match]))
                        else
                            table.insert(namePart, match)
                        end
                    end
                    A(td(table.concat(namePart, ' / '), type_))
                    A(td(makeLinks(getDescription(z, languageCode)), description))
                    A(tr())
                    local function doTable(z, givenFlags)
                        if z.table then
                            local flags = z.name or givenFlags
                            A(_table('flags_table'))
                            for _, zz in ipairs(z.table) do
                                A(tr(''))
                                local default = ''
                                if zz.default then
                                     default = ' <span class = "default">('..zz.default..')</span>'
                                end

                                local nameWithoutBrackets = zz.name:gsub('[%[%]]', '')
                                local dot = '.'

                                local class
                                if name == 'ra_name returns' then
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
                                A(td(flagPart..flags..'<wbr>'..dot..namePart..default, name))

                                local typeNames = {}
                                for _, t in ipairs(types) do
                                    typeNames[t.name] = t.link
                                end
                                local namePart = {}
                                for match in (zz.type..' / '):gmatch('(.-) %/ ') do
                                    if typeNames[match] then
                                        table.insert(namePart, a(match, '#'..typeNames[match]))
                                    else
                                        table.insert(namePart, match)
                                    end
                                end
                                A(td(table.concat(namePart, ' / '), type_))
                                A(td(makeLinks(getDescription(zz, languageCode)), description))
                                A(tr())

                                doTable(zz, flags)
                            end
                        end
                    end
                    doTable(z)
                end
                A(_table())
            end
        end

        A(div('section'))
        A(p(a(span(prefix, 'prefix')..function_.name, nil, prefix..function_.name), 'name'))
        A(p(makeLinks(getDescription(function_, languageCode)), 'description'))
        for _, variant in ipairs(function_.variants) do
            local function makeList(args, class)
                local argumentList = ''
                for i, v in ipairs(args or {}) do
                    argumentList = argumentList..'<span class = "'..class..'">'..v.name..'</span>'
                    if i ~= #args then
                        argumentList = argumentList..', '
                    end
                end
                return argumentList
            end

            local returnList = ''
            if #variant.returns > 0 then
                returnList = makeList(variant.returns, 'returns')
                returnList = returnList..' = '
            end

            local argumentList = ''
            if #variant.arguments > 0 then
                argumentList = makeList(variant.arguments, 'arguments')
                argumentList = ' '..argumentList..' '
            end

            A(p(span(span(string.format('%s%s(%s)', returnList, prefix..function_.name, argumentList), 'relative'), 'synopsis_background'), 'synopsis'))

            if getDescription(variant, languageCode)then
                A(p(makeLinks(getDescription(variant, languageCode)), 'description'))
            end

            A(make_table(variant.returns, 'ra_table', 'ra_name returns', 'ra_type', 'ra_description'))
            A(make_table(variant.arguments, 'ra_table', 'ra_name arguments', 'ra_type', 'ra_description'))
        end
        A(div()) -- section
    end
end

local function doEnums(enums, languageCode)
    for _, enum in ipairs(enums or {}) do
        A(div('section'))
        A(p(a(enum.name, nil, enum.name), 'heading'))
        for _, constant in ipairs(enum.constants) do
            A(p(constant.name, 'constant_name'))
            A(p(makeLinks(getDescription(constant, languageCode)), 'constant_description'))
        end
        A(div()) -- section
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
                table.insert(nameFunctions, {name = prefix..function_.name, name = prefix..function_.name})
            end
        end
    end
end

local function insertIntoLinks(name)
    table.insert(nameTypes, {name = name, name = name})
    if name:sub(-1) == 'y' then
        table.insert(nameTypes, {name = name:sub(1, -2)..'ies', name = name})
    else
        table.insert(nameTypes, {name = name..'s', name = name})
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

loopTypes(api.types)

for moduleIndex = #api.modules, 1, -1 do
    local module_ = api.modules[moduleIndex]
    if module_.name == 'video' or module_.name == 'font' then
        table.remove(api.modules, moduleIndex)
    else
        loopFunctions(module_.functions, module_, 'love.'..module_.name..'.')
        loopTypes(module_.types, module_)
    end

    for _, enum in ipairs(module_.enums) do
        insertIntoLinks(enum.name)
    end
end

loopFunctions(api.callbacks, nil, 'love.')

table.sort(nameFunctions, function(a, b) return #a.name > #b.name end)
table.sort(nameTypes, function(a, b) return #a.name > #b.name end)

local gettersetter = {}

function makeNavigationLink(m, function_, prefix, languageCode)
    local name
    local gs = gettersetter[prefix..function_.name]
    if type(gs) == 'table' then
        name = a(gs.getterprefix, '#'..prefix..gs.getter)..span('/', 'slash')..a(function_.name, '#'..prefix..function_.name)
    elseif gettersetter[prefix..function_.name] == 'getter' then
        return
    else
        name = a(function_.name, '#'..prefix..function_.name)
    end
    local minidescription = ''
    if function_.minidescriptiont and function_.minidescriptiont[languageCode] then
        minidescription = ' ('..function_.minidescriptiont[languageCode]:gsub(' %[auto%]', '')..')'
    end
    A(p(prefix..name..minidescription, 'navigation_link'))
end

for moduleIndex, module_ in ipairs(api.modules) do
    local function f(functions, prefix)
        local t = {}
        for functionIndex, function_ in ipairs(functions) do

            local function f(key, getters)
                for _, getterprefix in ipairs(getters) do
                    if function_.name:sub(1, #getterprefix) == getterprefix and function_.name ~= 'hasCursor' then
                        local withoutprefix = function_.name:sub(#getterprefix+1)
                        t[withoutprefix] = t[withoutprefix] or {}
                        t[withoutprefix][key] = {name = function_.name, prefix = getterprefix}
                    end
                end
            end
            f('getter', {'get', 'is', 'has', 'are', 'to', 'load', 'tell'})
            f('setter', {'set', 'from', 'save', 'seek'})
        end

        for k, v in pairs(t) do
            if v.getter and v.setter then
                gettersetter[prefix..v.getter.name] = 'getter'
                gettersetter[prefix..v.setter.name] = {getter = v.getter.name, getterprefix = v.getter.prefix}
            end
        end
    end

    f(module_.functions, 'love.'..module_.name..'.')
    for _, type_ in ipairs(module_.types) do
        f(type_.functions, type_.name..':')
    end
end

local function main(languageCode)
    A([[<html><head>
    <title>L&Ouml;VE ]]..api.version..[[ Reference</title>
    <link href="https://fonts.googleapis.com/css?family=Quicksand:500" rel="stylesheet">]])
    
    if true then
        local file = io.open("pure-love.css")
        A(style(file:read("*a")))
        file:close()
    else
        A('<link href="pure-love.css" rel="stylesheet">')
    end

    A('</head><body>')

    types = {}
    for _, module_ in ipairs(api.modules) do
        if module_.types then
            for _, type_ in ipairs(module_.types) do
                table.insert(types, {name = type_.name, link = type_.name})
            end
        end
        if module_.enums then
            for _, enum in ipairs(module_.enums) do
                table.insert(types, {name = enum.name, link = enum.name})
            end
        end
    end

    -- Side navigation
    A(div('navigation'))
    A(p(a('love', '#love')))
    for _, module_ in ipairs(api.modules) do
        if module_.name ~= 'love' then
            A(p(a(module_.name, '#love.'..module_.name)))
        end
    end
    A(div()) -- navigation

    -- The 'container' class sets a margin-left to move the contents away from the side navigation.
    A(div('container'))
    -- The 'first_section' class removes the padding and border radius from the top, so that scrolling to the top of the screen and clicking 'love' in the side navigation looks the same.
    
    local function doModule(module_, typeConstructorPrefix, isFirst, languageCode)
        local heading
        local prefix

        if module_.name == 'love' then
            heading = module_.name
            prefix = module_.name..'.'
        elseif typeConstructorPrefix then
            heading = module_.name
            prefix = module_.name..':'
        else
            heading = 'love.'..module_.name
            prefix = 'love.'..module_.name..'.'
        end

        if isFirst then
            A(div('section first_section'))
        else
            A(div('section'))
        end

        A(p(a(heading, nil, heading), 'heading'))

        if typeConstructorPrefix then
            A(p(makeLinks(getDescription(module_, languageCode)), module_.name), 'description')
        end

        local function doNavigation(heading, prefix, constructorPrefix, languageCode)
            if ({
                FontData = true,
                GlyphData = true,
                Rasterizer = true,
                Decoder = true,
                VideoStream = true,
            })[heading] then
                return
            end

            if constructorPrefix then
                prefix = constructorPrefix
            end

            local functionTable = module_[heading:lower()]

            if not constructorPrefix then
                local hasFunctions = false
                for _, function_ in ipairs(functionTable or {}) do
                    if type(function_) == 'table' and not (not constructorPrefix and function_.name:sub(1, 3) == 'new') then
                        hasFunctions = true
                        break
                    end
                end
                if not hasFunctions then
                    return
                end
            end

            prefix = prefix or ''
            local done = {}

            A(p(heading, 'navigation_subheading'))

            local function outputOrderItem(orderItem, languageCode)
                for _, function_ in ipairs(functionTable) do
                    if orderItem == function_.name then
                        done[function_.name] = true
                        makeNavigationLink(module_, function_, prefix, languageCode)
                    end
                end
            end

            local orderKey = module_.name
            if heading == 'Callbacks' then
                --print(languageCode)
                orderKey = 'callbacks'
            end
            for _, orderItem in ipairs(order[orderKey] or {}) do
                if type(orderItem) == 'string' then
                    outputOrderItem(orderItem, languageCode)
                elseif heading == 'Functions' or heading == 'Callbacks' then
                    if not languageCode then
                        A(p(orderItem.name, 'navigation_subsection'))
                    end
                    for _, orderFunction in ipairs(orderItem.functions) do
                        outputOrderItem(orderFunction, languageCode)
                    end
                end
            end

            for _, function_ in ipairs(functionTable) do
                if type(function_) == 'string' then -- subtype/supertype
                    makeNavigationLink(module_, {name = function_}, prefix, languageCode)
                else
                    if not done[function_.name] and not (not constructorPrefix and function_.name:sub(1, 3) == 'new') then
                        makeNavigationLink(module_, function_, prefix, languageCode)
                    end
                end
            end
        end

        if typeConstructorPrefix then
            doNavigation('Constructors', prefix, typeConstructorPrefix, languageCode)
            doNavigation('Functions', prefix, nil, languageCode)
            doNavigation('Supertypes', prefix, nil, languageCode)
            doNavigation('Subtypes', prefix, nil, languageCode)
            A(div()) -- section

            doFunctions(module_.functions, prefix, languageCode)
        else
            doNavigation('Callbacks', prefix, nil, languageCode)
            doNavigation('Types', nil, nil, languageCode)
            doNavigation('Functions', prefix, nil, languageCode)
            doNavigation('Enums', nil, nil, languageCode)
            A(div()) -- section

            doFunctions(module_.callbacks or {}, prefix, languageCode)
            for _, type_ in ipairs(module_.types or {}) do
                doModule(type_, 'love.'..module_.name..'.', false, languageCode)
            end
            doFunctions(module_.functions, prefix, languageCode)
            doEnums(module_.enums, languageCode)
        end
    end

    for _, module_ in ipairs(api.modules) do
        if module_.name == 'love' then
            doModule(module_, false, true, languageCode)
        end
    end

    for _, module_ in ipairs(api.modules) do
        if module_.name ~= 'love' then
            doModule(module_, false, false, languageCode)
            for _, type_ in ipairs(module_.types or {}) do
                doModule(type_, 'love.'..module_.name..'.', false, languageCode)
            end
        end
    end

    A(div()) -- container

    A('</body></html>')
end

for _, languageCode in ipairs({'jp', 'ko', 'de', 'ru', 'pt'}) do
    output = {}
    main(languageCode)
    local file = io.open((languageCode or 'index')..'.html', 'w')
    local out = table.concat(output)
    if FAST_MODE then
        file:write(out)
    else
        file:write((out:gsub('Ö', '&Ouml;'):gsub('é', '&eacute;')))
    end
    file:close()
end

