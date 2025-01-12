local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.RoactNavigation);
local l_JavascriptHybrid_0 = require(l_script_FirstAncestor_0.Common.Constants).JavascriptHybrid;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local v7 = require(l_Parent_0.SocialToast);
local l_Images_0 = require(l_Parent_0.UIBlox).App.ImageSet.Images;
local v9 = require(l_Parent_0.UserProfiles);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v12 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v13 = require(l_script_FirstAncestor_0.Flags.FFlagEditProfileFetchUserInfoOnLoad);
local v14 = require(l_script_FirstAncestor_0.Flags.FFlagEditProfileUseSocialToast);
local v15 = require(l_script_FirstAncestor_0.Analytics);
local l_EventNames_0 = v15.EventNames;
local l_useAnalytics_0 = v15.useAnalytics;
return v4.withNavigation(function(v18) --[[ Line: 36 ]] --[[ Name: EditUsernameWrapper ]]
    -- upvalues: l_useLocalUserId_0 (copy), v9 (copy), l_useLocalization_0 (copy), v12 (copy), v14 (copy), v7 (copy), l_useAnalytics_0 (copy), l_JavascriptHybrid_0 (copy), l_EventNames_0 (copy), v3 (copy), l_UrlBuilder_0 (copy), l_HttpService_0 (copy), v13 (copy), l_Images_0 (copy)
    local v19 = l_useLocalUserId_0();
    local v20 = v9.Hooks.useUserProfilesFetch({
        userIds = {
            v19
        }, 
        query = v9.Queries.userProfilesAllNamesByUserIds
    });
    local v21 = l_useLocalization_0({
        updated = v12.UsernameUpdated
    });
    local v22 = nil;
    if v14 then
        v22 = v7.useOpenToast();
    end;
    local v23 = l_useAnalytics_0();
    local function _(v24) --[[ Line: 53 ]] --[[ Name: getFeatureStringFromHybridEvent ]]
        -- upvalues: l_JavascriptHybrid_0 (ref)
        if v24.moduleID == l_JavascriptHybrid_0.Module.Navigation and v24.functionName == l_JavascriptHybrid_0.Function.navigateToFeature and v24.params and v24.params.params then
            return v24.params.params.feature;
        else
            return nil;
        end;
    end;
    local function _(v26) --[[ Line: 78 ]] --[[ Name: isCloseEditUsername ]]
        -- upvalues: l_JavascriptHybrid_0 (ref)
        return (if v26.moduleID == l_JavascriptHybrid_0.Module.Navigation and v26.functionName == l_JavascriptHybrid_0.Function.navigateToFeature and v26.params and v26.params.params then v26.params.params.feature else nil) == l_JavascriptHybrid_0.Feature.CloseUpdateUsernameModal;
    end;
    local function _(v28) --[[ Line: 83 ]] --[[ Name: isCompletedEditUsername ]]
        -- upvalues: l_JavascriptHybrid_0 (ref)
        return (if v28.moduleID == l_JavascriptHybrid_0.Module.Navigation and v28.functionName == l_JavascriptHybrid_0.Function.navigateToFeature and v28.params and v28.params.params then v28.params.params.feature else nil) == l_JavascriptHybrid_0.Feature.UpdateUsernameModalSuccess;
    end;
    local function _() --[[ Line: 88 ]] --[[ Name: updateUsername ]]
        -- upvalues: v20 (copy), v23 (copy), l_EventNames_0 (ref)
        v20.refetch();
        v23.fireAnalyticsEvent(l_EventNames_0.UsernameSaved);
    end;
    return v3.createElement(v18.BrowserWrapperComponent, {
        isVisible = true, 
        webViewVisible = true, 
        modal = false, 
        url = l_UrlBuilder_0.static.settings.account() .. "?changeusername", 
        isGenericWebview = true, 
        javaScriptCallback = function(v31) --[[ Line: 100 ]] --[[ Name: javaScriptCallback ]]
            -- upvalues: l_HttpService_0 (ref), l_JavascriptHybrid_0 (ref), v20 (copy), v23 (copy), l_EventNames_0 (ref), v13 (ref), v18 (copy), v14 (ref), v22 (ref), v21 (copy), l_Images_0 (ref)
            local v32 = l_HttpService_0:JSONDecode(v31);
            if (if v32.moduleID == l_JavascriptHybrid_0.Module.Navigation and v32.functionName == l_JavascriptHybrid_0.Function.navigateToFeature and v32.params and v32.params.params then v32.params.params.feature else nil) == l_JavascriptHybrid_0.Feature.UpdateUsernameModalSuccess then
                v20.refetch();
                v23.fireAnalyticsEvent(l_EventNames_0.UsernameSaved);
                if v13 and v18.onUsernameChanged then
                    v18.onUsernameChanged();
                end;
                v18.navigation.goBack();
                if v14 then
                    v22({
                        toastTitle = v21.updated, 
                        iconImage = l_Images_0["icons/actions/accept"]
                    });
                    return;
                else
                    v18.showToast(v21.updated);
                    return;
                end;
            else
                if (if v32.moduleID == l_JavascriptHybrid_0.Module.Navigation and v32.functionName == l_JavascriptHybrid_0.Function.navigateToFeature and v32.params and v32.params.params then v32.params.params.feature else nil) == l_JavascriptHybrid_0.Feature.CloseUpdateUsernameModal then
                    v18.navigation.goBack();
                end;
                return;
            end;
        end
    });
end);