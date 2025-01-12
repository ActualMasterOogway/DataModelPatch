local l_script_FirstAncestor_0 = script:FindFirstAncestor("MultiPageSignup");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.AppBlox);
local v4 = require(l_Parent_0.AccountSwitching);
local v5 = require(l_Parent_0.RoactAppExperiment);
local l_FullscreenPageWithSafeArea_0 = v3.FullscreenPageWithSafeArea;
local v7 = require(l_Parent_0.UserActivationFramework);
local v8 = require(l_Parent_0.RoactNavigation);
local l_memoize_0 = require(l_Parent_0.AppCommonLib).memoize;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v11 = require(l_script_FirstAncestor_0.Navigation.getMultipageSignupRoutes);
local v12 = require(l_script_FirstAncestor_0.Navigation.createMultiPageSignupNavigator);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local l_LaunchContext_0 = require(l_Parent_0.AppStartup).Enums.LaunchContext;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_useNavigationProps_0 = require(l_Parent_0.RobloxAppNavigation).useNavigationProps;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local v19 = require(l_Parent_0.RoactServiceTags);
local l_RoactNetworking_0 = v19.RoactNetworking;
local l_RoactAnalytics_0 = v19.RoactAnalytics;
local v22 = require(l_Parent_0.SharedFlags);
local l_IsPrefetchOneCopyEnabled_0 = v22.IsPrefetchOneCopyEnabled;
local l_AppOmniRecommendationsRequest_0 = v19.AppOmniRecommendationsRequest;
local v25 = require(l_Parent_0.AuthCommon);
local l_User_0 = v25.Thunks.User;
local l_HandleNewAuthCompletion_0 = v4.HandleNewAuthCompletion;
local l_AppStorageUtilities_0 = v25.Utils.AppStorageUtilities;
local l_FullPageActivationFrameworkContextProvider_0 = v7.Context.FullPageActivationFrameworkContextProvider;
local l_Namespace_0 = v7.Enums.Namespace;
local l_CreateActivationWorkflow_0 = v7.Thunks.CreateActivationWorkflow;
local l_PayloadKey_0 = v7.Enums.PayloadKey;
local l_FStringLuaMultiPageSignupIxpLayer_0 = v22.FStringLuaMultiPageSignupIxpLayer;
local v38 = l_memoize_0(function(v34, v35) --[[ Line: 57 ]]
    -- upvalues: v11 (copy), v12 (copy), v8 (copy)
    local v36 = v11();
    local v37 = v12(v36, v34, v35);
    return v8.createAppContainer(v37);
end);
return function(v39) --[[ Line: 64 ]]
    -- upvalues: l_useNavigationProps_0 (copy), v2 (copy), l_User_0 (copy), l_PayloadKey_0 (copy), l_CreateActivationWorkflow_0 (copy), l_Namespace_0 (copy), v5 (copy), l_FStringLuaMultiPageSignupIxpLayer_0 (copy), v38 (copy), l_useStyle_0 (copy), l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_useRoactService_0 (copy), l_RoactAnalytics_0 (copy), l_IsPrefetchOneCopyEnabled_0 (copy), l_AppOmniRecommendationsRequest_0 (copy), l_RoactNetworking_0 (copy), l_useAppPolicy_0 (copy), l_LaunchContext_0 (copy), l_AppStorageUtilities_0 (copy), l_HandleNewAuthCompletion_0 (copy), l_FullPageActivationFrameworkContextProvider_0 (copy), l_FullscreenPageWithSafeArea_0 (copy)
    local v42 = l_useNavigationProps_0(function(_, v41) --[[ Line: 65 ]]
        return {
            enforceResetState = v41.enforceResetState or false
        };
    end);
    local v45 = v2.useMemo(function() --[[ Line: 70 ]]
        -- upvalues: l_User_0 (ref), l_PayloadKey_0 (ref), l_CreateActivationWorkflow_0 (ref), l_Namespace_0 (ref), v42 (copy)
        local v43 = {};
        local v44 = l_User_0.fromLocalStorage();
        if v44 and v44.userId ~= -1 then
            v43[l_PayloadKey_0.PreviousUserId] = tostring(v44.userId);
        end;
        return l_CreateActivationWorkflow_0(l_Namespace_0.MultiPageSignup, v43, v42.enforceResetState);
    end, {});
    local l_shouldMultipageSignupEnableLeftRightAnimations_0 = v5.useBrowserTrackerExperiment({
        l_FStringLuaMultiPageSignupIxpLayer_0
    }, function(v46) --[[ Line: 81 ]]
        -- upvalues: l_FStringLuaMultiPageSignupIxpLayer_0 (ref)
        return {
            shouldMultipageSignupEnableLeftRightAnimations = (v46[l_FStringLuaMultiPageSignupIxpLayer_0] or {}).shouldMultipageSignupEnableLeftRightAnimations or false
        };
    end).shouldMultipageSignupEnableLeftRightAnimations;
    local v48 = v38(v45.state, l_shouldMultipageSignupEnableLeftRightAnimations_0);
    local v49 = l_useStyle_0();
    local v50 = l_useDispatch_0();
    local v51 = l_useNavigation_0();
    local v52 = l_useRoactService_0(l_RoactAnalytics_0);
    local v53 = if l_IsPrefetchOneCopyEnabled_0() then l_useRoactService_0(l_AppOmniRecommendationsRequest_0) else nil;
    local v54 = l_useRoactService_0(l_RoactNetworking_0);
    local v56 = l_useAppPolicy_0(function(v55) --[[ Line: 101 ]]
        return v55;
    end);
    local function v57() --[[ Line: 105 ]]
        -- upvalues: v51 (copy)
        v51.goBack();
    end;
    local function v58() --[[ Line: 109 ]]
        -- upvalues: v50 (copy), v39 (copy), v54 (copy), v53 (copy), v52 (copy), v56 (copy), l_LaunchContext_0 (ref)
        return v50(v39.monoDeps.LaunchApp(v54, v53, v52, v56, l_LaunchContext_0.SignUp));
    end;
    local function v59() --[[ Line: 115 ]]
        -- upvalues: v50 (copy), v39 (copy)
        return v50(v39.monoDeps.ResetAppState());
    end;
    local function v64(v60) --[[ Line: 119 ]]
        -- upvalues: l_PayloadKey_0 (ref), l_AppStorageUtilities_0 (ref), l_HandleNewAuthCompletion_0 (ref), v59 (copy), v58 (copy)
        local v61 = v60[l_PayloadKey_0.PreviousUserId];
        local v62 = l_AppStorageUtilities_0.getIncompleteSignupUserId();
        local v63 = false;
        if v61 ~= nil then
            v63 = false;
            if v61 ~= "-1" then
                v63 = v61 ~= v62;
            end;
        end;
        l_HandleNewAuthCompletion_0(v63, v59, v58, true);
    end;
    return v2.createElement(l_FullPageActivationFrameworkContextProvider_0, {
        onClose = v57, 
        onWorkflowComplete = v64, 
        initialActivationWorkflowState = v45, 
        monoDeps = v39.monoDeps
    }, {
        v2.createElement(l_FullscreenPageWithSafeArea_0, {
            includeStatusBar = true, 
            BackgroundColor3 = v49.Theme.BackgroundDefault.Color, 
            BorderSizePixel = 0
        }, {
            v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(0, 0, 0, 0), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1
            }, {
                v2.createElement(v48)
            })
        })
    });
end;