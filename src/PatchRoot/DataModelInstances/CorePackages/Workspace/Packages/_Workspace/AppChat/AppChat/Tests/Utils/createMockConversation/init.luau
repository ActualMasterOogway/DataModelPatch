local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local l_Mock_0 = require(l_Parent_0.LuaSocialLibrariesDeps).Mock;
return function(v2) --[[ Line: 16 ]]
    -- upvalues: l_Mock_0 (copy)
    local v3 = l_Mock_0.MagicMock.new();
    v3.id = v2.title;
    v3.title = v2.title;
    v3.participants = v2.participants or {};
    v3.lastUpdated = {
        GetShortRelativeTime = function() --[[ Line: 22 ]] --[[ Name: GetShortRelativeTime ]]
            -- upvalues: v2 (copy)
            return v2.shortRelativeTime or "0";
        end, 
        GetLongRelativeTime = function() --[[ Line: 25 ]] --[[ Name: GetLongRelativeTime ]]
            -- upvalues: v2 (copy)
            return v2.longRelativeTime or "0";
        end, 
        GetUnixTimestamp = function() --[[ Line: 28 ]] --[[ Name: GetUnixTimestamp ]]
            -- upvalues: v2 (copy)
            return v2.unixTime or 0;
        end
    };
    v3.serverState = "CREATED";
    v3.messages = v2.messages;
    v3.isDefaultTitle = v2.isDefaultTitle ~= nil and v2.isDefaultTitle;
    return v3;
end;