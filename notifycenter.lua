local curl = require "luacurl"
local json = require "cjson"

local M = {}


local function implode(list, delimiter)
        local len = #list
        if len == 0 then
                return ""
        end
        local string = '"' .. list[1] .. '"'
        for i = 2, len do
                string = string .. delimiter .. '"' .. list[i] .. '"'
        end
        return string
end

local function build_json(pushIds, message)
        if type(pushIds)=="table" then
                pushIds = implode(pushIds, ',')
        elseif type(pushIds)=="string" then
                pushIds = '"' .. pushIds .. '"'
        end
        local json_data = '{"pushIds":[' .. pushIds .. '],"message":"' .. message ..'"}'
        return json_data
end

function M.notify(pushIds, message)
        assert(type(pushIds)=="string" or type(pushIds)=="table", "notify expects Channel to be string or table")
        assert(type(message)=="string", "notify expects Message to be string")
        local c = curl.new()
        c:setopt(curl.OPT_URL, "https://api.notify.center/notify")
        c:setopt(curl.OPT_POST, true)
        c:setopt(curl.OPT_WRITEFUNCTION,  function(str) end)
        --c:setopt(curl.OPT_HTTPHEADER, "Content-Type: application/json")
        c:setopt(curl.OPT_POSTFIELDS, build_json(pushIds, message))
        res = c:perform()
        c:close()
end

return M

