local l_Parent_0 = script:FindFirstAncestor("ContactImporter").Parent;
local l_useUserExperiment_0 = require(l_Parent_0.RoactAppExperiment).useUserExperiment;
local v2 = game:DefineFastString("ContactsListLayer", "Social.ContactList");
local v3 = game:DefineFastString("PVVariant", "pv_upsell");
local function v6(v4) --[[ Line: 9 ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v5 = ((v4 or {})[v2] or {})[v3];
    if v5 == "require_pv" then
        return true;
    elseif v5 == "do_not_require_pv_has_pv_upsell" then
        return false;
    elseif v5 == "do_not_require_pv_no_pv_upsell" then
        return false;
    else
        return true;
    end;
end;
local function v9(v7) --[[ Line: 24 ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v8 = ((v7 or {})[v2] or {})[v3];
    if v8 == "require_pv" then
        return true;
    elseif v8 == "do_not_require_pv_has_pv_upsell" then
        return true;
    elseif v8 == "do_not_require_pv_no_pv_upsell" then
        return false;
    else
        return true;
    end;
end;
local function v12(v10) --[[ Line: 39 ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v11 = ((v10 or {})[v2] or {})[v3];
    if v11 == "require_pv" then
        return false;
    elseif v11 == "do_not_require_pv_has_pv_upsell" then
        return true;
    elseif v11 == "do_not_require_pv_no_pv_upsell" then
        return false;
    else
        return false;
    end;
end;
return {
    useIsPVRequired = function(v13) --[[ Line: 55 ]] --[[ Name: useIsPVRequired ]]
        -- upvalues: l_useUserExperiment_0 (copy), v2 (copy), v6 (copy)
        return l_useUserExperiment_0({
            v2
        }, v6, v13.isExposureEnabled);
    end, 
    useShouldShowPVUpsell = function(v14) --[[ Line: 58 ]] --[[ Name: useShouldShowPVUpsell ]]
        -- upvalues: l_useUserExperiment_0 (copy), v2 (copy), v9 (copy)
        return l_useUserExperiment_0({
            v2
        }, v9, v14.isExposureEnabled);
    end, 
    usePVUpsellV2 = function(v15) --[[ Line: 61 ]] --[[ Name: usePVUpsellV2 ]]
        -- upvalues: l_useUserExperiment_0 (copy), v2 (copy), v12 (copy)
        return l_useUserExperiment_0({
            v2
        }, v12, v15.isExposureEnabled);
    end
};