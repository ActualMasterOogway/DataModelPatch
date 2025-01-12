local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameCollections");
local v1 = require(l_script_FirstAncestor_0.useNavigateToSeeAll);
local v2 = require(l_script_FirstAncestor_0.useNavigateToSortLinkWebView);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local _ = require(l_Parent_0.DiscoveryTypes);
local l_FFlagLuaAppHeaderButtonText_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppHeaderButtonText;
local l_FFlagEnableChartsSubtitleLink_0 = require(l_Parent_0.SharedFlags).FFlagEnableChartsSubtitleLink;
return function(v9, v10, v11, v12, v13, v14, v15, v16, v17, v18) --[[ Line: 16 ]] --[[ Name: useGameSortHeaderButtonParams ]]
    -- upvalues: v1 (copy), v4 (copy), v2 (copy), l_useLocalization_0 (copy), l_FFlagLuaAppHeaderButtonText_0 (copy), l_FFlagEnableChartsSubtitleLink_0 (copy)
    local v19 = v1(v10, v11, v12, v13, v14, v15);
    local v20 = v4.useCallback(function() --[[ Line: 29 ]]
        -- upvalues: v19 (copy), v9 (copy)
        v19();
        v9();
    end, {
        v19, 
        v9
    });
    local v21 = v2();
    local v23 = v4.useCallback(function() --[[ Line: 35 ]]
        -- upvalues: v10 (copy), v11 (copy), v16 (copy), v21 (copy), v15 (copy)
        local v22 = nil;
        if v10 then
            v22 = if v11 then v10.topicId else v10.gameSetTypeId;
        end;
        if v16 then
            v21(v16, v15, v10 and v10.displayName or "", v22);
        end;
    end, {
        v21, 
        v16, 
        v15, 
        v10, 
        v11
    });
    local v24 = if v16 then v23 else v20;
    local v25 = l_useLocalization_0({
        learnMore = "Feature.GameDetails.Label.LearnMore"
    });
    local v26 = if l_FFlagLuaAppHeaderButtonText_0 and v18 then v18 else if v16 then v25.learnMore else nil;
    local v27 = nil;
    if l_FFlagEnableChartsSubtitleLink_0 then
        v27 = v4.useCallback(function() --[[ Line: 59 ]]
            -- upvalues: v10 (copy), v17 (copy), v11 (copy), v21 (copy), v15 (copy), v24 (copy)
            if v10 and v17 then
                local v28 = if v11 then v10.topicId else v10.gameSetTypeId;
                v21(v17, v15, v10 and v10.displayName or "", v28);
                return;
            else
                v24();
                return;
            end;
        end, {
            v21, 
            v17, 
            v15, 
            v10, 
            v11, 
            v24
        });
    end;
    return v24, v26, v27;
end;