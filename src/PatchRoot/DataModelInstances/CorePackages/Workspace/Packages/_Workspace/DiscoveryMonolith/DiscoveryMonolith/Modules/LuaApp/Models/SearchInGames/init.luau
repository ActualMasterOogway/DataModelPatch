local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.tutils);
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v4 = require(l_Modules_0.LuaApp.Models.GamesApi.GameSearchEntry);
local v5 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppOmniApiSearchResultDupFix);
local v6 = {
    new = function() --[[ Line: 36 ]] --[[ Name: new ]]
        return {};
    end
};
v6.mock = function() --[[ Line: 42 ]] --[[ Name: mock ]]
    -- upvalues: v6 (copy), v4 (copy)
    local v7 = v6.new();
    v7.keyword = "Meepcity";
    v7.entries = {
        v4.mock()
    };
    v7.emphasis = true;
    v7.hasMoreRows = false;
    v7.nextPageToken = nil;
    return v7;
end;
v6.fromOmniSearch = function(v8, v9, v10, v11) --[[ Line: 53 ]] --[[ Name: fromOmniSearch ]]
    -- upvalues: v6 (copy), v5 (copy)
    local v12 = v6.new();
    v12.keyword = v8;
    v12.entries = v9;
    v12.emphasis = v10;
    if v5() then
        if v11 and v11 ~= "" then
            v12.nextPageToken = v11;
            v12.hasMoreRows = true;
            return v12;
        else
            v12.nextPageToken = nil;
            v12.hasMoreRows = false;
            return v12;
        end;
    else
        v12.nextPageToken = v11;
        v12.hasMoreRows = v11 and true or false;
        return v12;
    end;
end;
v6.IsEqual = function(v13, v14) --[[ Line: 74 ]] --[[ Name: IsEqual ]]
    -- upvalues: v2 (copy)
    if not v2.shallowEqual(v13.entries, v14.entries) then
        return false;
    else
        local v15 = {
            entries = true
        };
        return v2.shallowEqual(v13, v14, v15);
    end;
end;
return v6;