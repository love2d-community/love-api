local api = require('love-api.love_api')

local function output(s)
    print('https://www.love2d.org/wiki/Special:Export/'..'_('..language..')')
end

local function loopFunctions(functions, module_, moduleOrTypeOrCallback, prefix)
    for _, function_ in ipairs(functions or {}) do
	output(prefix..function_.name)
    end
end

local function loopTypes(types, module_)
    for _, type_ in ipairs(types or {}) do
	output(type_.name)
	if type_.name == 'File' then
          type_.name = '(File)'
	end
	if type_.name == 'Image' then
          type_.name = '(Image)'
	end
        loopFunctions(type_.functions, type_, 'type', type_.name..':')
    end
end

for _, l in ipairs({'Deutsch', '日本語', '한국어', 'Português', 'Русский'}) do
    language = l
    loopFunctions(api.functions, nil, 'module', 'love.')
    loopFunctions(api.callbacks, nil, 'callback', 'love.')
    loopTypes(api.types, nil)

    for _, module_ in ipairs(api.modules) do
        output('love.'..module_.name)

        loopFunctions(module_.functions, module_, 'module', 'love.'..module_.name..'.')
        loopTypes(module_.types, module_)

        for _, enum in ipairs(module_.enums or {}) do
            output(enum.name)
        end
    end
end
