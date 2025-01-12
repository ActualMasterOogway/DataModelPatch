local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.testUtils.waitForExpect);
local l_getConfig_0 = require(l_Parent_1.ReactTestingLibrary).getConfig;
local v4 = {};
local function v11(v5, v6) --[[ Line: 17 ]] --[[ Name: wait_ ]]
    -- upvalues: l_getConfig_0 (copy), v2 (copy)
    local l_v6_0 = v6;
    local l_v5_0 = v5;
    if l_v5_0 == nil then
        l_v5_0 = function() --[[ Line: 22 ]]

        end;
    end;
    if l_v6_0 == nil then
        l_v6_0 = {};
    end;
    local v9 = nil;
    local v10 = nil;
    v9 = if l_v6_0.timeout == nil then l_getConfig_0().asyncUtilTimeout else l_v6_0.timeout;
    v10 = l_v6_0.interval == nil and 50 or l_v6_0.interval;
    return v2(l_v5_0, v9, v10);
end;
v4.wait = function(...) --[[ Line: 45 ]] --[[ Name: waitWrapper ]]
    -- upvalues: l_getConfig_0 (copy), v11 (copy)
    local v12 = table.pack(...);
    return l_getConfig_0().asyncWrapper(function() --[[ Line: 47 ]]
        -- upvalues: v11 (ref), v12 (copy)
        return v11(table.unpack(v12));
    end);
end;
return v4;