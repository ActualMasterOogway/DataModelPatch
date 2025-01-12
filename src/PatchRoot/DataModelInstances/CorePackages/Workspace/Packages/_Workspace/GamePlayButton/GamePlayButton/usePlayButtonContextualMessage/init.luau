local l_script_FirstAncestor_0 = script:FindFirstAncestor("GamePlayButton");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_script_FirstAncestor_0.PlayButtonStates);
local l_PlayabilityStatusEnum_0 = require(l_Parent_0.PlayabilityRodux).Enums.PlayabilityStatusEnum;
local l_getAppFeaturePolicies_0 = require(l_Parent_0.UniversalAppPolicy).getAppFeaturePolicies;
local l_LaunchErrorLocalizationKeys_0 = require(l_Parent_0.GameLaunch).LaunchErrorLocalizationKeys;
local l_Localization_0 = require(l_Parent_0.RobloxAppLocales).Localization;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useGameInfosSelector_0 = require(l_Parent_0.GameInfosRodux).useGameInfosSelector;
local l_useGameProductInfoSelector_0 = require(l_Parent_0.GameProductInfoRodux).useGameProductInfoSelector;
local l_FFlagLuaAppFiatPaidAccess_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFiatPaidAccess;
local v12 = nil;
local v13 = "";
local function _(v14, v15) --[[ Line: 23 ]] --[[ Name: translateString ]]
    -- upvalues: l_LocalizationService_0 (copy), v12 (ref), l_Localization_0 (copy), v13 (ref)
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    if v12 == nil then
        v12 = l_Localization_0.new(l_RobloxLocaleId_0);
        v13 = l_RobloxLocaleId_0;
    end;
    if v13 ~= l_RobloxLocaleId_0 then
        v12:SetLocale(l_RobloxLocaleId_0);
        v13 = l_RobloxLocaleId_0;
    end;
    return v12:Format(v14, v15);
end;
local function v22(v18, v19, v20) --[[ Line: 36 ]]
    -- upvalues: l_PlayabilityStatusEnum_0 (copy), l_FFlagLuaAppFiatPaidAccess_0 (copy), l_getAppFeaturePolicies_0 (copy), l_LaunchErrorLocalizationKeys_0 (copy)
    if v19 then
        if v18 == nil or (v19.playabilityStatus == l_PlayabilityStatusEnum_0.PurchaseRequired or l_FFlagLuaAppFiatPaidAccess_0 and v19.playabilityStatus == l_PlayabilityStatusEnum_0.FiatPurchaseRequired) and (v20 == nil or v20.isForSale == false) then
            return "Feature.ExperienceDetails.UnplayableError.UnplayableOther";
        else
            if v19.playabilityStatus == l_PlayabilityStatusEnum_0.DeviceRestricted then
                local v21 = l_getAppFeaturePolicies_0().getPlatformDisplayName() or "";
                if v21 ~= "" then
                    return "Feature.ExperienceDetails.UnplayableError.DeviceRestrictedCustom", {
                        device = v21
                    };
                end;
            end;
            return l_LaunchErrorLocalizationKeys_0[v19.playabilityStatus];
        end;
    else
        return nil;
    end;
end;
return function(v23, v24, v25) --[[ Line: 74 ]]
    -- upvalues: l_useSelector_0 (copy), l_useGameInfosSelector_0 (copy), l_useGameProductInfoSelector_0 (copy), v3 (copy), v22 (copy), l_LocalizationService_0 (copy), v12 (ref), l_Localization_0 (copy), v13 (ref)
    local v26 = false;
    local v28 = l_useSelector_0(function(v27) --[[ Line: 75 ]]
        -- upvalues: v23 (copy)
        return v27.GameDetails[v23];
    end);
    local v29 = l_useGameInfosSelector_0(v23);
    local v30 = v28 and v28.rootPlaceId or v29 and v29.placeId or nil;
    local v31 = l_useGameProductInfoSelector_0(v23);
    local v32 = nil;
    local v33 = nil;
    if v24 == v3.UnplayableOther then
        local v34, v35 = v22(v30, v25, v31);
        v32 = v34;
        v33 = v35;
    end;
    local v36;
    if v32 then
        local l_v32_0 = v32;
        local l_v33_0 = v33;
        local l_RobloxLocaleId_1 = l_LocalizationService_0.RobloxLocaleId;
        if v12 == nil then
            v12 = l_Localization_0.new(l_RobloxLocaleId_1);
            v13 = l_RobloxLocaleId_1;
        end;
        if v13 ~= l_RobloxLocaleId_1 then
            v12:SetLocale(l_RobloxLocaleId_1);
            v13 = l_RobloxLocaleId_1;
        end;
        v36 = v12:Format(l_v32_0, l_v33_0);
        v26 = v36;
    end;
    if not v26 then
        v36 = nil;
    end;
    v26 = false;
    return v36;
end;