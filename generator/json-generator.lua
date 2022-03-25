-- Script by @MikuAuahDark

local JSON = require("JSON")
local api = require("api.love_api")

local f = assert(io.open("../love-api.json", "wb"))
f:write(JSON:encode(api, nil, {pretty = true, indent = "\t", array_newline = true, stringsAreUtf8 = true}))
