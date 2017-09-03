--require('mobdebug').start()

local api = require('love-api.love_api')

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

local function makeVariantIDs()
    local function loopFunctions(functions, prefix)
        if prefix == 'File:' then
            prefix = '(File):'
        end
        if prefix == 'Image:' then
            prefix = '(Image):'
        end
        for _, function_ in ipairs(functions or {}) do
            for variantIndex, variant in ipairs(function_.variants) do
                local s = ''
                s = s..'r'
                for returnIndex, return_ in ipairs(variant.returns or {}) do
                    s = s..return_.type
                end
                s = s..'a'
                for argumentIndex, argument in ipairs(variant.arguments or {}) do
                    s = s..argument.type
                end
                s = prefix..function_.name..s
                variant.id = s
            end
        end
    end

    local function loopTypes(types)
        for _, type_ in ipairs(types or {}) do
            loopFunctions(type_.functions, type_.name..':')
        end
    end

    loopFunctions(api.functions, 'love.')
    loopFunctions(api.callbacks, 'love.')
    loopTypes(api.types)

    for _, module_ in ipairs(api.modules) do
        loopFunctions(module_.functions, 'love.'..module_.name..'.')
        loopTypes(module_.types)
    end
end

makeVariantIDs()

local function getMiniDescription(content)
    return clean(content:match('{{#set:Description=(.-)\n?}}'))
end

local function getEnumDescriptions(content, _, enumName)
    local output = {}
    output.constants = {}
    output.description = {}
    local found = false
    for line in content:gmatch("[^\n]+") do
        local a, b = line:match('^%;%s*(.-)%s*%:%s*(.+)')
        if a and b then
            b = b:gsub('}}', '')
            output.constants[a] = b
            found = true
        end
        if not found and not line:match('^%s*$') and not line:match('^%=') and not line:match('%{%{') then
            table.insert(output.description, clean(line))
        end
    end
    output.description = table.concat(output.description, '\n\n')
    output.minidescription = getMiniDescription(content)
    return output
end

local function getTypeDescriptions(content)
    local output = {}

    output.description = {}

    for line in content:gmatch("[^\n]+") do
        if not line:match('^{{newin') and line:match('^[={]') then
            break
        elseif not line:match('^%s*$') and not line:match('^{{newin') then
            table.insert(output.description, clean(line))
        end
    end

    if #output.description > 0 then
        output.description = table.concat(output.description, '\n\n')
    else
        output.description = nil
    end

    output.minidescription = getMiniDescription(content)

    return output
end

local function getFunctionDescriptions(content, language, functionName)
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

    local title = '%s*%=+%s*'
    print(functionName)
    content = content .. '== '..language.function_..' =='

    local o = {}
    local s = ''
    local t = {}
    local key
    local old = false
    local functionDescription = {}

    for line in content:gmatch("[^\n]+") do

        if line:match(title..language.arguments..title) then
            key = 'arguments'
            t[key] = {}
        elseif line:match('%{%{oldin') then
            old = true
        elseif not key and not line:match('%{%{') and not line:match('^[%s\n]*$') and not line:match('^%=.+%=$') then
            if clean(line) then
              table.insert(functionDescription, clean(line))
            end
        elseif not t.arguments and line:match(title..language.synopsis..title) then
            key = 'synopsis'
        elseif not t.arguments and line:match(title..language.function_..title)then
            key = 'description'
        elseif not t.arguments and key == 'description' and not line:match('^%{%{') then
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
            else
                if not line:match('^[%s\n]*$') then
                    table.insert(t[key], line)
                end
            end
        end
    end

    local function get(line)
        local type_, name, description = line:match('param.-%|(.-)%|(.-)%|(.-)%}%}')

        if not type_ then return end

        local type2 = type_:match('(.-) %(')
        if type2 then
            type_ = type2
        end
        return type_, name, clean(description)
    end

    local output = {}
    output.variants = {}
    for i, v in ipairs(o) do
        local t = {}
        t.returns = {}
        t.arguments = {}
        local id = functionName

        if v.description then
          t.description = clean(table.concat(v.description, '\n\n'))
        end

        id = id..'r'
        for ii, vv in ipairs(v.returns or {}) do
            local type_, name, description = get(vv)
            if type_ then
                table.insert(t.returns, {
                    type = type_,
                    name = name,
                    description = description,
                })
                id = id..type_
            end
        end

        id = id..'a'
        for ii, vv in ipairs(v.arguments or {}) do
            local type_, name, description = get(vv)
            if type_ then
                table.insert(t.arguments, {
                    type = type_,
                    name = name,
                    description = description,
                })
                id = id..type_
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
        v.id = id

        table.insert(output.variants, v)
    end

    if #functionDescription > 0 then
      output.description = clean(table.concat(functionDescription, '\n\n'))
    end

    output.minidescription = getMiniDescription(content)

    return output
end

local function getDescription(language, filename, f)
    if filename:sub(1, 5) == 'File:' then
        filename = '(File):'..filename:sub(6)
    end
    if filename:sub(1, 6) == 'Image:' then
        filename = '(Image):'..filename:sub(7)
    end
    local file = love.filesystem.read('translations/'..filename:gsub('%:', '%%3A')..'_('..language.language..')')
    if not file then
        return
    end

    content = file:match('.+%<text xml:space=\"preserve\" bytes=\"%d+\"%>(.*)%<%/text%>')
    if not content then
        print(file)
    end
    return f(content, language, filename)
end

local function addLanguage(language)

    local function loopFunctions(functions, prefix)
        for _, function_ in ipairs(functions or {}) do

            function_.descriptiont = function_.descriptiont or {}
            function_.minidescriptiont = function_.minidescriptiont or {}

            local functionDescriptions = getDescription(language, prefix..function_.name, getFunctionDescriptions)

            if functionDescriptions then
                function_.descriptiont[language.code] = functionDescriptions.description
                function_.minidescriptiont[language.code] = functionDescriptions.minidescription

                for variantIndex, variant in ipairs(function_.variants) do
                    local translatedVariant
                    for _, v in ipairs(functionDescriptions.variants) do
                        if v.id == variant.id then
                            translatedVariant = v
                        end
                    end

                    if translatedVariant then
                        for returnIndex, return_ in ipairs(variant.returns or {}) do
                            return_.descriptiont = return_.descriptiont or {}
                            return_.descriptiont[language.code] = translatedVariant.returns[returnIndex].description
                            --return_.namet = return_.namet or {}
                            --return_.namet[language.code] = translatedVariant.returns[returnIndex].name
                        end

                        for argumentIndex, argument in ipairs(variant.arguments or {}) do
                            argument.descriptiont = argument.descriptiont or {}
                            argument.descriptiont[language.code] = translatedVariant.arguments[argumentIndex].description
                            --argument.namet = argument.namet or {}
                            --argument.namet[language.code] = translatedVariant.arguments[argumentIndex].name
                        end

                        if translatedVariant.description then
                            variant.descriptiont = variant.descriptiont or {}
                            variant.descriptiont[language.code] = translatedVariant.description
                        end
                    end
                end
            end
        end
    end

    local function loopTypes(types)
        for _, type_ in ipairs(types or {}) do
            type_.descriptiont = type_.descriptiont or {}
            type_.minidescriptiont = type_.minidescription or {}

            local typeDescriptions = getDescription(language, type_.name, getTypeDescriptions)
            if typeDescriptions then
                type_.descriptiont[language.code] = typeDescriptions.description
                type_.minidescriptiont[language.code] = typeDescriptions.minidescription
            end
            loopFunctions(type_.functions, type_.name..':')
        end
    end

    loopFunctions(api.functions, 'love.')
    loopFunctions(api.callbacks, 'love.')
    loopTypes(api.types)

    for _, module_ in ipairs(api.modules) do
        loopFunctions(module_.functions, 'love.'..module_.name..'.')
        loopTypes(module_.types)

        for _, enum in ipairs(module_.enums or {}) do
            enum.descriptiont = enum.descriptiont or {}
            enum.minidescriptiont = enum.minidescriptiont or {}
            local enumDescriptions = getDescription(language, enum.name, getEnumDescriptions)
            if enumDescriptions then
                if enum.name ~= 'KeyConstant' then
                    enum.descriptiont[language.code] = enumDescriptions.description
                    enum.minidescriptiont[language.code] = enumDescriptions.minidescription
                end
                for _, constant in ipairs(enum.constants or {}) do
                    constant.descriptiont = constant.descriptiont or {}
                    local constantDescription = clean(enumDescriptions.constants[constant.name])
                    if constantDescription then
                        constant.descriptiont[language.code] = constantDescription
                    end
                end
          end
        end
    end
end

languages = {
    de = {
        code = 'de',
        function_ = 'Funktion',
        synopsis = 'Übersicht',
        arguments = 'Argumente',
        returns = 'Rückgabewerte',
        notes = 'Anmerkungen',
        see_also = 'Siehe auch',
        language = 'Deutsch',
    },

    jp = {
        code = 'jp',
        function_ = '関数',
        synopsis = '概要',
        arguments = '引数',
        returns = '返値',
        notes = '注意',
        see_also = '関数',
        language = '日本語',
    },

    ko = {
        code = 'ko',
        function_ = '함수',
        synopsis = '형식',
        arguments = '매개변수',
        returns = '리턴값',
        notes = '알아 두기',
        see_also = '같이 보기 ',
        language = '한국어',
    },

    pt = {
        code = 'pt',
        function_ = 'Função',
        synopsis = 'Sinopse',
        arguments = 'Argumentos',
        returns = 'Retorn.+',
        notes = 'Notas',
        see_also = 'Veja Também',
        language = 'Português',
    },

    ru = {
        code = 'ru',
        function_ = 'Функция',
        synopsis = 'Вид',
        arguments = 'Аргументы',
        returns = 'Возвращает',
        notes = 'Примечания',
        see_also = 'Смотрите также',
        language = 'Русский',
    },
}

addLanguage(languages.jp)
addLanguage(languages.ko)
addLanguage(languages.ru)
addLanguage(languages.de)
addLanguage(languages.pt)

love.event.quit()

local serialize = (--[[--https://github.com/pkulchenko/serpent Serpent source is released under the MIT License Copyright (c) 2011-2013 Paul Kulchenko (paul@kulchenko.com) Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions: The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.--]]function()local b={[tostring(1/0)]='1/0 --[[math.huge]]',[tostring(-1/0)]='-1/0 --[[-math.huge]]',[tostring(0/0)]='0/0'}local c={thread=true,userdata=true,cdata=true}local d=debug and debug.getmetatable or getmetatable local e,f,g={},{},(_G or _ENV)for j,k in ipairs({'and','break','do','else','elseif','end','false','for','function','goto','if','in','local','nil','not','or','repeat','return','then','true','until','while'})do e[k]=true end for j,k in pairs(g)do f[k]=j end for j,k in ipairs({'coroutine','debug','io','math','string','table','os'})do for l,m in pairs(type(g[k])=='table'and g[k]or{})do f[m]=k..'.'..l end end local function h(j,k)local l,m,n,o=k.name,k.indent,k.fatal,k.maxnum local p,q,r=k.sparse,k.custom,not k.nohuge local s,t=(k.compact and''or' '),(k.maxlevel or math.huge)local u=tonumber(k.maxlength)local v,w='_'..(l or''),k.comment and(tonumber(k.comment)or math.huge)local x=k.numformat or"%.17g"local y,z,A,B={},{'local '..v..'={}'},{},0 local function C(N)return'_'..(tostring(tostring(N)):gsub("[^%w]",""):gsub("(%d%w+)",function(O)if not A[O]then B=B+1 A[O]=B end return tostring(A[O])end))end local function D(N)return type(N)=="number"and tostring(r and b[tostring(N)]or x:format(N))or type(N)~="string"and tostring(N)or("%q"):format(N):gsub("\010","n"):gsub("\026","\\026")end local function E(N,O)return w and(O or 0)<w and' --[['..select(2,pcall(tostring,N))..']]'or''end local function F(N,O)return f[N]and f[N]..E(N,O)or not n and D(select(2,pcall(tostring,N)))or error("Can't serialize "..tostring(N))end local function G(N,O)local P=O==nil and''or O local Q=type(P)=="string"and P:match("^[%l%u_][%w_]*$")and not e[P]local R=Q and P or'['..D(P)..']'return(N or'')..(Q and N and'.'or'')..R,R end local H=type(k.sortkeys)=='function'and k.sortkeys or function(N,O,P)local Q,R=tonumber(P)or 12,{number='a',string='b'}local function S(T)return("%0"..tostring(Q).."d"):format(tonumber(T))end table.sort(N,function(T,U)return(N[T]~=nil and 0 or R[type(T)]or'z')..(tostring(T):gsub("%d+",S))<(N[U]~=nil and 0 or R[type(U)]or'z')..(tostring(U):gsub("%d+",S))end)end local function I(N,O,P,Q,R,S,T)local U,V,W=type(N),(T or 0),d(N)local X,Y=G(R,O)local Z=S and((type(O)=="number")and''or O..s..'='..s)or(O~=nil and Y..s..'='..s or'')if y[N]then z[#z+1]=X..s..'='..s..y[N]return Z..'nil'..E('ref',V)end if type(W)=='table'then local ab,bb=pcall(function()return W.__tostring(N)end)local cb,db=pcall(function()return W.__serialize(N)end)if(ab or cb)then y[N]=Q or X if cb then N=db else N=tostring(N)end U=type(N)end end if U=="table"then if V>=t then return Z..'{}'..E('maxlvl',V)end y[N]=Q or X if next(N)==nil then return Z..'{}'..E(N,V)end if u and u<0 then return Z..'{}'..E('maxlen',V)end local ab,bb,cb=math.min(#N,o or#N),{},{}for ib=1,ab do bb[ib]=ib end if not o or#bb<o then local ib=#bb for jb in pairs(N)do if bb[jb]~=jb then ib=ib+1 bb[ib]=jb end end end if o and#bb>o then bb[o+1]=nil end if k.sortkeys and#bb>ab then H(bb,N,k.sortkeys)end local db=p and#bb>ab for ib,jb in ipairs(bb)do local kb,lb,mb=N[jb],type(jb),ib<=ab and not db if k.valignore and k.valignore[kb]or k.keyallow and not k.keyallow[jb]or k.keyignore and k.keyignore[jb]or k.valtypeignore and k.valtypeignore[type(kb)]or db and kb==nil then elseif lb=='table'or lb=='function'or c[lb]then if not y[jb]and not f[jb]then z[#z+1]='placeholder'local ob=G(v,C(jb))z[#z]=I(jb,ob,P,ob,v,true)end z[#z+1]='placeholder'local nb=y[N]..'['..tostring(y[jb]or f[jb]or C(jb))..']'z[#z]=nb..s..'='..s..tostring(y[kb]or I(kb,nil,P,nb))else cb[#cb+1]=I(kb,jb,P,Q,y[N],mb,V+1)if u then u=u-#cb[#cb]if u<0 then break end end end end local eb=string.rep(P or'',V)local fb=P and'{\n'..eb..P or'{'local gb=table.concat(cb,','..(P and'\n'..eb..P or s))local hb=P and"\n"..eb..'}'or'}'return(q and q(Z,fb,gb,hb)or Z..fb..gb..hb)..E(N,V)elseif c[U]then y[N]=Q or X return Z..F(N,V)elseif U=='function'then y[N]=Q or X if k.nocode then return Z.."function() --[[..skipped..]] end"..E(N,V)end local ab,bb=pcall(string.dump,N)local cb=ab and"((loadstring or load)("..D(bb)..",'@serialized'))"..E(N,V)return Z..(cb or F(N,V))else return Z..D(N)end end local J=m and"\n"or";"..s local K=I(j,l,m)local L=#z>1 and table.concat(z,J)..J or''local M=k.comment and#z>1 and s.."--[[incomplete output with shared/self-references skipped]]"or''return not l and K..M or"do local "..K..J..L.."return "..l..J.."end"end local function i(j,k)if k then for l,m in pairs(k)do j[l]=m end end return j end return function(j,k)return'return '..h(j,i({indent='    ',sortkeys=true},k))end end)()

function removeId(t)
    if type(t) == 'table' then
      t.id = nil
        for k, v in pairs(t) do
            removeId(v)
        end
    end
end

removeId(api)

love.filesystem.write('translations.lua', serialize(api))
