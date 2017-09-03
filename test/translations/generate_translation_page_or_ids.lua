local serialize = (--[[--https://github.com/pkulchenko/serpent Serpent source is released under the MIT License Copyright (c) 2011-2013 Paul Kulchenko (paul@kulchenko.com) Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions: The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.--]]function()local b={[tostring(1/0)]='1/0 --[[math.huge]]',[tostring(-1/0)]='-1/0 --[[-math.huge]]',[tostring(0/0)]='0/0'}local c={thread=true,userdata=true,cdata=true}local d=debug and debug.getmetatable or getmetatable local e,f,g={},{},(_G or _ENV)for j,k in ipairs({'and','break','do','else','elseif','end','false','for','function','goto','if','in','local','nil','not','or','repeat','return','then','true','until','while'})do e[k]=true end for j,k in pairs(g)do f[k]=j end for j,k in ipairs({'coroutine','debug','io','math','string','table','os'})do for l,m in pairs(type(g[k])=='table'and g[k]or{})do f[m]=k..'.'..l end end local function h(j,k)local l,m,n,o=k.name,k.indent,k.fatal,k.maxnum local p,q,r=k.sparse,k.custom,not k.nohuge local s,t=(k.compact and''or' '),(k.maxlevel or math.huge)local u=tonumber(k.maxlength)local v,w='_'..(l or''),k.comment and(tonumber(k.comment)or math.huge)local x=k.numformat or"%.17g"local y,z,A,B={},{'local '..v..'={}'},{},0 local function C(N)return'_'..(tostring(tostring(N)):gsub("[^%w]",""):gsub("(%d%w+)",function(O)if not A[O]then B=B+1 A[O]=B end return tostring(A[O])end))end local function D(N)return type(N)=="number"and tostring(r and b[tostring(N)]or x:format(N))or type(N)~="string"and tostring(N)or("%q"):format(N):gsub("\010","n"):gsub("\026","\\026")end local function E(N,O)return w and(O or 0)<w and' --[['..select(2,pcall(tostring,N))..']]'or''end local function F(N,O)return f[N]and f[N]..E(N,O)or not n and D(select(2,pcall(tostring,N)))or error("Can't serialize "..tostring(N))end local function G(N,O)local P=O==nil and''or O local Q=type(P)=="string"and P:match("^[%l%u_][%w_]*$")and not e[P]local R=Q and P or'['..D(P)..']'return(N or'')..(Q and N and'.'or'')..R,R end local H=type(k.sortkeys)=='function'and k.sortkeys or function(N,O,P)local Q,R=tonumber(P)or 12,{number='a',string='b'}local function S(T)return("%0"..tostring(Q).."d"):format(tonumber(T))end table.sort(N,function(T,U)return(N[T]~=nil and 0 or R[type(T)]or'z')..(tostring(T):gsub("%d+",S))<(N[U]~=nil and 0 or R[type(U)]or'z')..(tostring(U):gsub("%d+",S))end)end local function I(N,O,P,Q,R,S,T)local U,V,W=type(N),(T or 0),d(N)local X,Y=G(R,O)local Z=S and((type(O)=="number")and''or O..s..'='..s)or(O~=nil and Y..s..'='..s or'')if y[N]then z[#z+1]=X..s..'='..s..y[N]return Z..'nil'..E('ref',V)end if type(W)=='table'then local ab,bb=pcall(function()return W.__tostring(N)end)local cb,db=pcall(function()return W.__serialize(N)end)if(ab or cb)then y[N]=Q or X if cb then N=db else N=tostring(N)end U=type(N)end end if U=="table"then if V>=t then return Z..'{}'..E('maxlvl',V)end y[N]=Q or X if next(N)==nil then return Z..'{}'..E(N,V)end if u and u<0 then return Z..'{}'..E('maxlen',V)end local ab,bb,cb=math.min(#N,o or#N),{},{}for ib=1,ab do bb[ib]=ib end if not o or#bb<o then local ib=#bb for jb in pairs(N)do if bb[jb]~=jb then ib=ib+1 bb[ib]=jb end end end if o and#bb>o then bb[o+1]=nil end if k.sortkeys and#bb>ab then H(bb,N,k.sortkeys)end local db=p and#bb>ab for ib,jb in ipairs(bb)do local kb,lb,mb=N[jb],type(jb),ib<=ab and not db if k.valignore and k.valignore[kb]or k.keyallow and not k.keyallow[jb]or k.keyignore and k.keyignore[jb]or k.valtypeignore and k.valtypeignore[type(kb)]or db and kb==nil then elseif lb=='table'or lb=='function'or c[lb]then if not y[jb]and not f[jb]then z[#z+1]='placeholder'local ob=G(v,C(jb))z[#z]=I(jb,ob,P,ob,v,true)end z[#z+1]='placeholder'local nb=y[N]..'['..tostring(y[jb]or f[jb]or C(jb))..']'z[#z]=nb..s..'='..s..tostring(y[kb]or I(kb,nil,P,nb))else cb[#cb+1]=I(kb,jb,P,Q,y[N],mb,V+1)if u then u=u-#cb[#cb]if u<0 then break end end end end local eb=string.rep(P or'',V)local fb=P and'{\n'..eb..P or'{'local gb=table.concat(cb,','..(P and'\n'..eb..P or s))local hb=P and"\n"..eb..'}'or'}'return(q and q(Z,fb,gb,hb)or Z..fb..gb..hb)..E(N,V)elseif c[U]then y[N]=Q or X return Z..F(N,V)elseif U=='function'then y[N]=Q or X if k.nocode then return Z.."function() --[[..skipped..]] end"..E(N,V)end local ab,bb=pcall(string.dump,N)local cb=ab and"((loadstring or load)("..D(bb)..",'@serialized'))"..E(N,V)return Z..(cb or F(N,V))else return Z..D(N)end end local J=m and"\n"or";"..s local K=I(j,l,m)local L=#z>1 and table.concat(z,J)..J or''local M=k.comment and#z>1 and s.."--[[incomplete output with shared/self-references skipped]]"or''return not l and K..M or"do local "..K..J..L.."return "..l..J.."end"end local function i(j,k)if k then for l,m in pairs(k)do j[l]=m end end return j end return function(j,k)return'return '..h(j,i({indent='    ',sortkeys=true},k))end end)()
local api = require('api')

local serialize = (--[[--https://github.com/pkulchenko/serpent Serpent source is released under the MIT License Copyright (c) 2011-2013 Paul Kulchenko (paul@kulchenko.com) Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions: The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.--]]function()local b={[tostring(1/0)]='1/0 --[[math.huge]]',[tostring(-1/0)]='-1/0 --[[-math.huge]]',[tostring(0/0)]='0/0'}local c={thread=true,userdata=true,cdata=true}local d=debug and debug.getmetatable or getmetatable local e,f,g={},{},(_G or _ENV)for j,k in ipairs({'and','break','do','else','elseif','end','false','for','function','goto','if','in','local','nil','not','or','repeat','return','then','true','until','while'})do e[k]=true end for j,k in pairs(g)do f[k]=j end for j,k in ipairs({'coroutine','debug','io','math','string','table','os'})do for l,m in pairs(type(g[k])=='table'and g[k]or{})do f[m]=k..'.'..l end end local function h(j,k)local l,m,n,o=k.name,k.indent,k.fatal,k.maxnum local p,q,r=k.sparse,k.custom,not k.nohuge local s,t=(k.compact and''or' '),(k.maxlevel or math.huge)local u=tonumber(k.maxlength)local v,w='_'..(l or''),k.comment and(tonumber(k.comment)or math.huge)local x=k.numformat or"%.17g"local y,z,A,B={},{'local '..v..'={}'},{},0 local function C(N)return'_'..(tostring(tostring(N)):gsub("[^%w]",""):gsub("(%d%w+)",function(O)if not A[O]then B=B+1 A[O]=B end return tostring(A[O])end))end local function D(N)return type(N)=="number"and tostring(r and b[tostring(N)]or x:format(N))or type(N)~="string"and tostring(N)or("%q"):format(N):gsub("\010","n"):gsub("\026","\\026")end local function E(N,O)return w and(O or 0)<w and' --[['..select(2,pcall(tostring,N))..']]'or''end local function F(N,O)return f[N]and f[N]..E(N,O)or not n and D(select(2,pcall(tostring,N)))or error("Can't serialize "..tostring(N))end local function G(N,O)local P=O==nil and''or O local Q=type(P)=="string"and P:match("^[%l%u_][%w_]*$")and not e[P]local R=Q and P or'['..D(P)..']'return(N or'')..(Q and N and'.'or'')..R,R end local H=type(k.sortkeys)=='function'and k.sortkeys or function(N,O,P)local Q,R=tonumber(P)or 12,{number='a',string='b'}local function S(T)return("%0"..tostring(Q).."d"):format(tonumber(T))end table.sort(N,function(T,U)return(N[T]~=nil and 0 or R[type(T)]or'z')..(tostring(T):gsub("%d+",S))<(N[U]~=nil and 0 or R[type(U)]or'z')..(tostring(U):gsub("%d+",S))end)end local function I(N,O,P,Q,R,S,T)local U,V,W=type(N),(T or 0),d(N)local X,Y=G(R,O)local Z=S and((type(O)=="number")and''or O..s..'='..s)or(O~=nil and Y..s..'='..s or'')if y[N]then z[#z+1]=X..s..'='..s..y[N]return Z..'nil'..E('ref',V)end if type(W)=='table'then local ab,bb=pcall(function()return W.__tostring(N)end)local cb,db=pcall(function()return W.__serialize(N)end)if(ab or cb)then y[N]=Q or X if cb then N=db else N=tostring(N)end U=type(N)end end if U=="table"then if V>=t then return Z..'{}'..E('maxlvl',V)end y[N]=Q or X if next(N)==nil then return Z..'{}'..E(N,V)end if u and u<0 then return Z..'{}'..E('maxlen',V)end local ab,bb,cb=math.min(#N,o or#N),{},{}for ib=1,ab do bb[ib]=ib end if not o or#bb<o then local ib=#bb for jb in pairs(N)do if bb[jb]~=jb then ib=ib+1 bb[ib]=jb end end end if o and#bb>o then bb[o+1]=nil end if k.sortkeys and#bb>ab then H(bb,N,k.sortkeys)end local db=p and#bb>ab for ib,jb in ipairs(bb)do local kb,lb,mb=N[jb],type(jb),ib<=ab and not db if k.valignore and k.valignore[kb]or k.keyallow and not k.keyallow[jb]or k.keyignore and k.keyignore[jb]or k.valtypeignore and k.valtypeignore[type(kb)]or db and kb==nil then elseif lb=='table'or lb=='function'or c[lb]then if not y[jb]and not f[jb]then z[#z+1]='placeholder'local ob=G(v,C(jb))z[#z]=I(jb,ob,P,ob,v,true)end z[#z+1]='placeholder'local nb=y[N]..'['..tostring(y[jb]or f[jb]or C(jb))..']'z[#z]=nb..s..'='..s..tostring(y[kb]or I(kb,nil,P,nb))else cb[#cb+1]=I(kb,jb,P,Q,y[N],mb,V+1)if u then u=u-#cb[#cb]if u<0 then break end end end end local eb=string.rep(P or'',V)local fb=P and'{\n'..eb..P or'{'local gb=table.concat(cb,','..(P and'\n'..eb..P or s))local hb=P and"\n"..eb..'}'or'}'return(q and q(Z,fb,gb,hb)or Z..fb..gb..hb)..E(N,V)elseif c[U]then y[N]=Q or X return Z..F(N,V)elseif U=='function'then y[N]=Q or X if k.nocode then return Z.."function() --[[..skipped..]] end"..E(N,V)end local ab,bb=pcall(string.dump,N)local cb=ab and"((loadstring or load)("..D(bb)..",'@serialized'))"..E(N,V)return Z..(cb or F(N,V))else return Z..D(N)end end local J=m and"\n"or";"..s local K=I(j,l,m)local L=#z>1 and table.concat(z,J)..J or''local M=k.comment and#z>1 and s.."--[[incomplete output with shared/self-references skipped]]"or''return not l and K..M or"do local "..K..J..L.."return "..l..J.."end"end local function i(j,k)if k then for l,m in pairs(k)do j[l]=m end end return j end return function(j,k)return'return '..h(j,i({indent='    ',sortkeys=true},k))end end)()


local keywords = require('keywords')
local translate = {}
local translateIDs = {}

local doingTranslationPage = false

local function add(id, s)
    if doingTranslationPage then
        for keywordIndex, keyword in ipairs(keywords) do
            s = s:gsub('(%W)'..keyword..'(%W)', '%1['..keywordIndex..']%2')
        end
        table.insert(translate, s)
    else
        table.insert(translateIDs, id)
    end
end

local function loopArgumentsOrReturns(arguments, argumentOrReturn, variantID)
    for argumentIndex, argument in ipairs(arguments or {}) do
        add(variantID..argumentOrReturn..argumentIndex..'name', argument.name)
        add(variantID..argumentOrReturn..argumentIndex, argument.description)

        for flagIndex, flag in ipairs(argument.table or {}) do
            add(variantID..argumentOrReturn..argumentIndex..'flag'..flagIndex, flag.description)
        end
    end
end

local function loopFunctions(functions, module_, moduleOrTypeOrCallback, prefix)
    for _, function_ in ipairs(functions or {}) do
        if function_.name ~= 'conf' then
            add(prefix..function_.name, function_.description)
            add(prefix..function_.name..'mini', function_.minidescription)

            for _, variant in ipairs(function_.variants) do
                local id = prefix..function_.name
                id = id..'r'
                for _, r in ipairs(variant.returns or {}) do
                    id = id..r.type
                end
                id = id..'a'
                for _, a in ipairs(variant.arguments or {}) do
                    id = id..a.type
                end
                if variant.description then
                    add(id, variant.description)
                end
                loopArgumentsOrReturns(variant.arguments, 'a', id)
                loopArgumentsOrReturns(variant.returns, 'r', id)
            end
        end
    end
end

local function loopTypes(types, module_)
    for _, type_ in ipairs(types or {}) do
        add(type_.name, type_.description)
        add(type_.name..'mini', type_.minidescription)

        loopFunctions(type_.functions, type_, 'type', type_.name..':')
    end
end

loopFunctions(api.functions, nil, 'module', 'love.')
loopFunctions(api.callbacks, nil, 'callback', 'love.')
loopTypes(api.types, nil)

for _, module_ in ipairs(api.modules) do
    add('love.'..module_.name, module_.description)
    add('love.'..module_.name..'mini', module_.minidescription)
    --print(module_.name)

    loopFunctions(module_.functions, module_, 'module', 'love.'..module_.name..'.')
    loopTypes(module_.types, module_)

    for _, enum in ipairs(module_.enums or {}) do
        add(enum.name, enum.description)
        add(enum.name..'mini', enum.minidescription)

        for constantIndex, constant in ipairs(enum.constants or {}) do
            add(enum.name..constantIndex, constant.description)
        end
    end
end

if doingTranslationPage then
    local out = {}
    for i, v in ipairs(translate) do
        table.insert(out, '')
        table.insert(out, '-----------------'..i..'----------------')
        table.insert(out, '')
        table.insert(out, v)
    end
    print(table.concat(out, '\n'))
else
    print(serialize(translateIDs))
end
