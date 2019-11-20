local api = require('love-api.love_api')

local function deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
        setmetatable(copy, deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

function removeExcept(t, names)
    for i = #t, 1, -1 do
        local remove = true
        for _, name in ipairs(names) do
            if t[i].name == name then
                remove = false
            end
        end
        if remove then
            table.remove(t, i)
        end
    end
end


removeExcept(api.callbacks, {'conf'})
api.functions = {}
api.types = {}
for _, module_ in ipairs(api.modules) do
    module_.functions = {}
    module_.types = {}
    removeExcept(module_.enums, {'KeyConstant'})
end

local language = {
    language = 'English',
    code = 'en',
    function_ = 'Function',
    synopsis = 'Synopsis',
    arguments = 'Arguments',
    returns = 'Returns',
    notes = 'Notes',
    supertypes = 'Supertypes',
    examples = 'Example',
    see_also = 'See Also',
}

local function clean(s)
    local function literalize(str)
      return str:gsub("[%(%)%.%%%+%-%*%?%[%]%^%$]", function(c) return "%" .. c end)
    end
    if not s then return end
    if s:match(literalize('&lt;span style=&quot;color: #597E9A; font-size: 18pt&quot;&gt;')) then
      return
    end
    return (s
        :gsub('%[%[.-%|(.-)%]%]', '%1')
        :gsub('%[%[(.-)%]%]', '%1')
        :gsub('%[.- (.-)%]', '%1')
        :gsub('&lt;%/?code&gt;', '')
        :gsub(literalize('&lt;span style=&quot;color: #597E9A; font-size: 18pt&quot;&gt;'), '')
        :gsub('|%S+$', '')
        :gsub('&quot;', '\"')
    )
end

local function getEnumDescriptions(content)
    local output = {}
    output.constants = {}
    output.description = {}
    local found = false
    for line in content:gmatch("[^\n]+") do
        local a, b = line:match('^%;%s*(.-)%s*%:%s*(.+)')
        if a and b then
            b = b:gsub('}}', '')
            table.insert(output.constants, {
                name = a,
                description = clean(b)
            })
            found = true
        end
        if not found and not line:match('^%s*$') and not line:match('^%=') and not line:match('%{%{') and not line:match('^%[%[File') then
            table.insert(output.description, clean(line))
        end
    end
    output.description = table.concat(output.description, '\n\n')
    local parent = content:match('%[%[parent%:%:love%.(%a+)%]%]')

    return output, parent
end

local function getTypeDescriptions(content)
    local output = {}

    output.description = {}    
    output.supertypes = {}

    for line in content:gmatch("[^\n]+") do
        if not line:match('^{{newin') and line:match('^[={]') then
            break
        elseif not line:match('^%s*$') and not line:match('^{{newin') and not line:match('^%[%[File') then
            table.insert(output.description, clean(line))
        end
    end

    if #output.description > 0 then
        output.description = table.concat(output.description, '\n\n')
    else
        output.description = nil
    end
    
    local parent = content:match('%[%[parent%:%:love%.(%a+)%]%]')
    
    local m = content:gsub('%[%[Concept%:Current%]%]', ''):match('== '..language.supertypes..' ==(.-)==')
    if m then
        for line in m:gmatch("%[%[parent::([^\n]+)%]%]") do
            table.insert(output.supertypes, line)
        end
    end

    return output, parent
end

local function getFunctionDescriptions(content, NAME)
    local title = '%s*%=+%s*'
    content = content .. '== '..language.function_..' =='        
    content = content:gsub('&quot;', "'")

    local o = {}
    local s = ''
    local t = {}
    local key
    local old = false
    local functionDescription = {}
    local stop = false
    
    for line in content:gmatch("[^\n]+") do
        if line:match(title..language.arguments..title) then
            key = 'arguments'
            t[key] = {}
        elseif line:match('%{%{oldin') then
            old = true            
        elseif line:match('%{%{newin') then
            old = false
        elseif not key and not line:match('%{%{') and not line:match('^[%s\n]*$') and not line:match('^%=.+%=$') and not line:match('^%[%[File') then
            if clean(line) then
              table.insert(functionDescription, clean(line))
            end
        elseif not t.arguments and line:match(title..language.synopsis..title) then
            key = 'synopsis'
        elseif not t.arguments and line:match(title..language.function_..title)then
            key = 'description'
        elseif not t.arguments and key == 'description' and not line:match('^%{%{') and not line:match('^%[%[File') then
            t.description = t.description or {}
            table.insert(t.description, line)
        elseif t.arguments then
            if line:match(title..language.function_..title) or line:match(title..language.see_also..title) then
                if not old then
                    table.insert(o, deepcopy(t))
                end
                old = false
                key = 'description'
                t = {}
            elseif line:match(title..language.returns..title) then
                key = 'returns'
                t[key] = {}
            elseif line:match(title..language.notes..title) then
                key = 'notes'
                t[key] = {}
            elseif line:match('==(%s*)'..language.examples) then
                stop = true
            else
                if not line:match('^[%s\n]*$') and not stop and not line:match('^%[%[File') then
                    table.insert(t[key], line)
                end
            end
        end
    end

    local function get(line)
        local subparam = false
        local type_, name, description = line:match('^{{param.-|(.-)|(.-)|(.-)}}')

        
        if not type_ then
            type_, name, description = line:match('^{{subparam.-|(.-)|(.-)|(.-)}}')
            if not type_ then return end
            subparam = true            
        end        
        
        local type2 = type_:match('(.-) %(')
        if type2 then
            type_ = type2
        end
        
        description = clean(description)
        local d, default = name:match('(.-) %((.-%)?)%)')
        if d then
            name = d
        end
        local withoutBrackets = name:match('%[(.-)%]')
        if withoutBrackets then
            name = withoutBrackets
        end
        return type_, name, description, clean(default), subparam
    end

    local output = {}
    output.variants = {}
    for i, v in ipairs(o) do
        local t = {}
        t.returns = {}
        t.arguments = {}

        if v.description then
          t.description = clean(table.concat(v.description, '\n\n'))
        end

        for ii, vv in ipairs(v.returns or {}) do
            local type_, name, description, default, subparam = get(vv)
            if type_ then
                table.insert(t.returns, {
                    type = type_,
                    name = name,
                    description = description,
                    subparam = subparam,
                })
            end
        end

        for ii, vv in ipairs(v.arguments or {}) do
            local type_, name, description, default, subparam = get(vv)
            if type_ then
                table.insert(t.arguments, {
                    type = type_,
                    name = name,
                    description = description,
                    default = default,
                    subparam = subparam,
                })
            end
        end

        if v.notes then
            if t.description then
                t.description = t.description..'\n\n'..clean(table.concat(v.notes, '\n\n'))
            else
                t.description = clean(table.concat(v.notes, '\n\n'))
            end
        end

        local v = deepcopy(t)

        table.insert(output.variants, v)
    end

    if #functionDescription > 0 then
        output.description = clean(table.concat(functionDescription, '\n\n'))
    end
    
    for _, variant in ipairs(output.variants) do
        local subparams = {}
        local function doSubparams(args)
            for aIndex = #args, 1, -1 do
                local a = args[aIndex]
                if a.subparam then
                    table.insert(subparams, 1, a)
                    table.remove(args, aIndex)
                elseif #subparams > 0 then
                    a.table = subparams
                    subparams = {}
                end
                a.subparam = nil
            end
        end
        doSubparams(variant.arguments)
        doSubparams(variant.returns)
    end

    return output
end

function fromFile(f, filename, name, functionName)
    local file = love.filesystem.read('wiki/'..filename)
    local content = file:match('.+%<text xml:space=\"preserve\" bytes=\"%d+\"%>(.*)%<%/text%>')
        :gsub('&lt;source lang=&quot;lua&quot;&gt;', '')
        :gsub('&lt;source lang=&quot;glsl&quot;&gt;', '')
        :gsub('&lt;/source&gt;', '')
        :gsub('&lt;tt&gt;', '')
        :gsub('&lt;/tt&gt;', '')
        :gsub('&lt;nowiki&gt;', '')
        :gsub('&lt;/nowiki&gt;', '')
    local d, parent = f(content, name)
    d.name = functionName
    if parent then
        return d, parent
    else
        return d
    end
end

local functionsToInsert = {}
local methodsToInsert = {}
local callbacksToInsert = {}
local typesToInsert = {}
local enumsToInsert = {}

function isTypeOrEnum(filename)
    local file = love.filesystem.read('wiki/'..filename)
    if file:match('== Constants ==') then
        return 'enum'
    else
        return 'type'
    end
end

for _, filename in ipairs(love.filesystem.getDirectoryItems('wiki/')) do
    local name = filename:gsub('%%3A', ':'):gsub('[%(%)]', '')
    if name ~= 'KeyConstant' then
        local m, f = name:match('love%.(%a+)%.(%a+)')
        if m and f then
            table.insert(functionsToInsert, {what = 'function', module_ = m, function_ = f, filename = filename, name = name})
        else
            local t, f = name:match('(%a+)%:(%a+)')
            if t and f then
                table.insert(functionsToInsert, {what = 'method', type_ = t, function_ = f, filename = filename, name = name})
            else
                local c = name:match('love%.(%a+)')
                if c then
                    table.insert(callbacksToInsert, {what = 'callback', function_ = c, filename = filename, name = name})
                else
                    if isTypeOrEnum(filename) == 'enum' then
                        table.insert(enumsToInsert, {what = 'enum', filename = filename, name = name})
                    else
                        table.insert(typesToInsert, {what = 'type', filename = filename, name = name})
                    end
                end
            end
        end
    end
end

function insertIntoApi(t)
    if t.what == 'function' then
        for _, module_ in ipairs(api.modules) do
            if module_.name == t.module_ then
                table.insert(module_.functions, fromFile(getFunctionDescriptions, t.filename, t.name, t.function_))
            end
        end
        
    elseif t.what == 'callback' then
        if t.function_ == 'getVersion' or t.function_ == 'setDeprecationOutput' or t.function_ == 'hasDeprecationOutput' then
            table.insert(api.functions, fromFile(getFunctionDescriptions, t.filename, t.name, t.function_))
        else
            table.insert(api.callbacks, fromFile(getFunctionDescriptions, t.filename, t.name, t.function_))
        end
    elseif t.what == 'method' then
        for _, module_ in ipairs(api.modules) do
            for _, type_ in ipairs(module_.types or {}) do
                if type_.name == t.type_ then
                    type_.functions = type_.functions or {}
                    table.insert(type_.functions, fromFile(getFunctionDescriptions, t.filename, t.name, t.function_))
                end
            end
        end
    elseif t.what == 'type' then
        local d, parent = fromFile(getTypeDescriptions, t.filename, t.name, t.name)
        if d.name == 'Object' or d.name == 'Data' or d.name == 'Drawable' or d.name == 'ByteData' then
            table.insert(api.types, d)
        else
            if not parent then
                parent = 'physics'
            end
            for _, module_ in ipairs(api.modules) do
                if module_.name == parent then
                   table.insert(module_.types, d)
                end
            end
        end
    elseif t.what == 'enum' then
        local d, parent = fromFile(getEnumDescriptions, t.filename, t.name, t.name)
        if d.name == 'AreaSpreadDistribution' or d.name == 'ParticleInsertMode' then
            parent = 'graphics'
        elseif d.name == 'MatrixLayout' then
            parent = 'math'
        elseif d.name == 'BufferMode' then
            parent = 'filesystem'
        elseif d.name == 'FilterType' then
            parent = 'audio'
        end
        for _, module_ in ipairs(api.modules) do
            if module_.name == parent then
                table.insert(module_.enums, d)
            end
        end
    end
end

for i, v in ipairs(typesToInsert) do
    insertIntoApi(v)
end

for i, v in ipairs(callbacksToInsert) do
    insertIntoApi(v)
end

for i, v in ipairs(functionsToInsert) do
    insertIntoApi(v)
end

for i, v in ipairs(methodsToInsert) do
    insertIntoApi(v)
end

for i, v in ipairs(enumsToInsert) do
    insertIntoApi(v)
end

local constructors = {
    Source = {'love.audio.newSource'},
    File = {'love.filesystem.newFile'},
    FileData = {'love.filesystem.newFileData'},
    Canvas = {'love.graphics.newCanvas'},
    Font = {'love.graphics.newFont', 'love.graphics.newImageFont', 'love.graphics.setNewFont'},
    Mesh = {'love.graphics.newMesh'},
    Image = {'love.graphics.newImage'},
    ParticleSystem = {'love.graphics.newParticleSystem'},
    Quad = {'love.graphics.newQuad'},
    Shader = {'love.graphics.newShader'},
    SpriteBatch = {'love.graphics.newSpriteBatch'},
    Text = {'love.graphics.newText'},
    Video = {'love.graphics.newVideo'},
    CompressedImageData = {'love.image.newCompressedData'},
    ImageData = {'love.image.newImageData', 'Canvas:newImageData'},
    Joystick = {'love.joystick.getJoysticks'},
    BezierCurve = {'love.math.newBezierCurve'},
    CompressedData = {'love.data.compress'},
    RandomGenerator = {'love.math.newRandomGenerator'},
    Transform = {'love.math.newTransform'},
    Cursor = {'love.mouse.getSystemCursor', 'love.mouse.newCursor'},
    Body = {'love.physics.newBody'},
    ChainShape = {'love.physics.newChainShape'},
    CircleShape = {'love.physics.newCircleShape'},
    EdgeShape = {'love.physics.newEdgeShape'},
    DistanceJoint = {'love.physics.newDistanceJoint'},
    Fixture = {'love.physics.newFixture'},
    FrictionJoint = {'love.physics.newFrictionJoint'},
    GearJoint = {'love.physics.newGearJoint'},
    MotorJoint = {'love.physics.newMotorJoint'},
    MouseJoint = {'love.physics.newMouseJoint'},
    PolygonShape = {'love.physics.newPolygonShape', 'love.physics.newRectangleShape'},
    PrismaticJoint = {'love.physics.newPrismaticJoint'},
    PulleyJoint = {'love.physics.newPulleyJoint'},
    RevoluteJoint = {'love.physics.newRevoluteJoint'},
    RopeJoint = {'love.physics.newRopeJoint'},
    Shape = {'love.physics.newChainShape', 'love.physics.newEdgeShape', 'love.physics.newPolygonShape', 'love.physics.newRectangleShape'},
    Joint = {'love.physics.newDistanceJoint', 'love.physics.newFrictionJoint', 'love.physics.newGearJoint', 'love.physics.newMotorJoint', 'love.physics.newMouseJoint', 'love.physics.newPrismaticJoint', 'love.physics.newPulleyJoint', 'love.physics.newRevoluteJoint', 'love.physics.newRopeJoint', 'love.physics.newWeldJoint', 'love.physics.newWheelJoint'},
    WeldJoint = {'love.physics.newWeldJoint'},
    WheelJoint = {'love.physics.newWheelJoint'},
    World = {'love.physics.newWorld'},
    SoundData = {'love.sound.newSoundData'},
    Thread = {'love.thread.newThread'},
    Channel = {'love.thread.getChannel', 'love.thread.newChannel'},
}

for _, module_ in ipairs(api.modules) do
    for _, type_ in ipairs(module_.types or {}) do
        if constructors[type_.name] then
            type_.constructors = constructors[type_.name]
        end
    end
end

local apiExtra = require('love-api.extra')(api)

local writeLoveApi = require('write_love_api')
writeLoveApi(apiExtra)

love.event.quit()
