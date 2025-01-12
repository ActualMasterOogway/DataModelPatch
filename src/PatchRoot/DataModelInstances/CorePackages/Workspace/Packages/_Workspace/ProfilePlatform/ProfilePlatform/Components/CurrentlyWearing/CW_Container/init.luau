local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local l_useUserExperiment_0 = require(l_Parent_0.RoactAppExperiment).useUserExperiment;
local v5 = require(l_script_FirstAncestor_0.Common.Constants);
local v6 = require(script.Parent.SortCurrentlyWearing);
local v7 = require(l_Parent_0.RoactUtils);
local l_dependencyArray_0 = v7.Hooks.dependencyArray;
local l_useSelector_0 = v7.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v7.Hooks.RoactRodux.useDispatch;
local l_useEffectOnMount_0 = v7.Hooks.useEffectOnMount;
local v12 = require(l_script_FirstAncestor_0.Analytics.AnalyticsConstants);
local v13 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v14 = require(l_script_FirstAncestor_0.Common.Enums);
local v15 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v16 = require(l_script_FirstAncestor_0.Networking.NetworkingCurrentlyWearing);
local v17 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v18 = require(l_script_FirstAncestor_0.Contexts.useProfileAnalyticsContext);
local v19 = require(script.Parent.CW_Carousel);
local v20 = game:DefineFastFlag("ProfilePlatformFixCWSortForHoldOut", false);
return function(v21) --[[ Line: 35 ]] --[[ Name: CW_Container ]]
    -- upvalues: l_useUserExperiment_0 (copy), v17 (copy), v18 (copy), v2 (copy), v15 (copy), v12 (copy), l_dependencyArray_0 (copy), l_useSelector_0 (copy), v13 (copy), v5 (copy), v14 (copy), v3 (copy), l_useDispatch_0 (copy), l_useEffectOnMount_0 (copy), v16 (copy), v20 (copy), v6 (copy), v19 (copy)
    local v23 = l_useUserExperiment_0({
        "Social.ProfilePeekView"
    }, function(v22) --[[ Line: 37 ]]
        return ((v22 or {})["Social.ProfilePeekView"] or {}).sortCurrentlyWearingVariant or "default";
    end, false);
    local v24 = v17();
    local v25 = v18();
    local l_profileUserId_0 = v24.profileUserId;
    local v29 = v2.useCallback(function(v27, v28) --[[ Line: 47 ]]
        -- upvalues: v24 (copy), v25 (copy), v15 (ref), v12 (ref)
        v24.navigateTo.itemDetails(v27);
        v25.fireAnalyticsEvent(v15.CatalogItemOpened);
        v24.externalAnalytics.catalogAnalytics.clickCatalogItemFromProfile(v12.PlayerProfile, v27, v28);
    end, l_dependencyArray_0(v24.navigateTo.itemDetails, v24.externalAnalytics.catalogAnalytics));
    local v31 = l_useSelector_0(function(v30) --[[ Line: 62 ]]
        -- upvalues: v13 (ref), v5 (ref), l_profileUserId_0 (copy), v14 (ref)
        return v13(v30, (("%*.Users.%*.components.%*.assets"):format(v5.RODUX_KEY, l_profileUserId_0, v14.Components.CurrentlyWearing))) or {};
    end);
    local v33 = v2.useMemo(function() --[[ Line: 69 ]]
        -- upvalues: v3 (ref), v31 (copy)
        return v3.List.map(v31, function(v32) --[[ Line: 70 ]]
            return v32.assetId;
        end);
    end, {
        v31
    });
    local v34 = l_useDispatch_0();
    l_useEffectOnMount_0(function() --[[ Line: 77 ]]
        -- upvalues: v34 (copy), v16 (ref), v33 (copy)
        v34(v16.GetItemDetails.API(v33)):andThen(function(_) --[[ Line: 79 ]]

        end):catch(function(_) --[[ Line: 80 ]]

        end);
    end);
    local v38 = l_useSelector_0(function(v37) --[[ Line: 85 ]]
        -- upvalues: v5 (ref)
        return v37[v5.RODUX_KEY].ItemAssets or {};
    end);
    local v46 = v2.useMemo(function() --[[ Line: 89 ]]
        -- upvalues: v33 (copy), v38 (copy), v20 (ref), v23 (copy), v3 (ref), v6 (ref)
        local v39 = {};
        local v40 = 1;
        for _, v42 in v33 do
            local v43 = v38[tostring(v42)];
            if v43 then
                v39[v40] = v43;
                v40 = v40 + 1;
            end;
        end;
        if v20 and v23 ~= "priceDecreasing" then
            return v39;
        else
            return v3.List.sort(v39, function(v44, v45) --[[ Line: 106 ]]
                -- upvalues: v6 (ref), v23 (ref)
                return v6(v44, v45, v23);
            end);
        end;
    end, {
        v38, 
        v33, 
        v23
    });
    return v2.createElement(v19, {
        layoutOrder = v21.layoutOrder, 
        assets = v46, 
        openItemDetails = v29
    });
end;