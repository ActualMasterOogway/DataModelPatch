local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v4 = require(l_Modules_0.LuaApp.Actions.Games.AddOmniRecommendations);
return function(v5, v6) --[[ Line: 8 ]]
    -- upvalues: v4 (copy), v2 (copy)
    v5 = v5 or {};
    if v6.type == v4.name then
        if v6.isAppend then
            for v7, v8 in pairs(v6.recommendations) do
                local v9 = v5[v7];
                if v9 then
                    local v10 = v2.List.join(v9.sorts, v8.sorts);
                    local v11 = v2.Dictionary.join(v9, v8);
                    v11.sorts = v10;
                    v11.metadata = nil;
                    v5 = v2.Dictionary.join(v5, {
                        [v7] = v11
                    });
                end;
            end;
            return v5;
        else
            local v12 = table.clone(v6.recommendations);
            for _, v14 in pairs(v12) do
                v14.metadata = nil;
            end;
            v5 = v2.Dictionary.join(v5, v12);
        end;
    end;
    return v5;
end;