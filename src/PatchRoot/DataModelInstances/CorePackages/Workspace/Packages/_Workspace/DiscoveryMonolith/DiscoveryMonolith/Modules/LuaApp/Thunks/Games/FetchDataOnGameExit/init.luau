local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v4 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedConstants);
local v5 = require(l_Modules_0.LuaApp.Thunks.Omni.ApiFetchOmniRecommendations);
local function v11(v6, v7, v8, v9) --[[ Line: 9 ]] --[[ Name: refreshOmniRecommendations ]]
    -- upvalues: v5 (copy), l_AppPage_0 (copy), v4 (copy)
    return v8:dispatch(v5(v6, v7, l_AppPage_0.Home, nil, nil, v4.OmniRecommendationsRequestIntent.GameExit, v9)):catch(function(v10) --[[ Line: 22 ]]
        warn("We failed to refresh omni recommendations on game exit!", v10);
    end);
end;
return function(v12, v13, v14) --[[ Line: 27 ]]
    -- upvalues: v11 (copy)
    return function(v15) --[[ Line: 28 ]]
        -- upvalues: v11 (ref), v12 (copy), v13 (copy), v14 (copy)
        return v11(v12, v13, v15, v14);
    end;
end;