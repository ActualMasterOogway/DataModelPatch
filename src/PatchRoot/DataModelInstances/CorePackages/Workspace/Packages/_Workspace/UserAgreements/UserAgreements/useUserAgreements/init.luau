local l_Parent_0 = script:FindFirstAncestor("UserAgreements").Parent;
local v1 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_RoactAnalytics_0 = require(l_Parent_0.RoactServiceTags).RoactAnalytics;
local l_AppPlatformService_0 = require(l_Parent_0.RoactServiceTags).AppPlatformService;
local l_AppAppLifecycleService_0 = require(l_Parent_0.RoactServiceTags).AppAppLifecycleService;
local l_AppAppLifecycleObserverService_0 = require(l_Parent_0.RoactServiceTags).AppAppLifecycleObserverService;
local l_LoginStatus_0 = require(l_Parent_0.RobloxAppEnums).LoginStatus;
local l_SetCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Actions.SetCentralOverlay;
local l_CentralOverlayType_0 = require(l_Parent_0.RobloxAppEnums).CentralOverlayType;
local v13 = require(script.Parent.FetchUpdatedUserAgreements);
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_GetFFlagUseUpdatedVNGAgreementsWorkflow_0 = require(l_Parent_0.SharedFlags).GetFFlagUseUpdatedVNGAgreementsWorkflow;
local l_GetFFlagUserAgreementsIgnorePlatformService_0 = require(l_Parent_0.SharedFlags).GetFFlagUserAgreementsIgnorePlatformService;
local function v18(v17) --[[ Line: 26 ]] --[[ Name: selectIsUserLoggedIn ]]
    -- upvalues: l_LoginStatus_0 (copy)
    return v17.AuthenticationStatus.status == l_LoginStatus_0.LOGGED_IN;
end;
local function v23(v19, v20, v21, v22) --[[ Line: 30 ]] --[[ Name: showOverlay ]]
    -- upvalues: l_SetCentralOverlay_0 (copy)
    v19(l_SetCentralOverlay_0(v20, {
        agreements = v21, 
        agreementAccepted = v22
    }, {
        DisableBackButtonClose = true
    }));
end;
local _ = function(v24) --[[ Line: 39 ]] --[[ Name: shouldShowVngOverlay ]]
    for _, v26 in v24 do
        if v26.action == "ConvertToVngUser" then
            return true;
        end;
    end;
    return false;
end;
local function v41() --[[ Line: 48 ]] --[[ Name: useFetchAndHandle ]]
    -- upvalues: l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_RoactAnalytics_0 (copy), l_useDispatch_0 (copy), l_GetFFlagUseUpdatedVNGAgreementsWorkflow_0 (copy), l_useAppPolicy_0 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy), v1 (copy), v13 (copy), v23 (copy)
    local v28 = l_useRoactService_0(l_RoactNetworking_0);
    local v29 = l_useRoactService_0(l_RoactAnalytics_0);
    local v30 = l_useDispatch_0();
    local v32 = if l_GetFFlagUseUpdatedVNGAgreementsWorkflow_0() then l_useAppPolicy_0(function(v31) --[[ Line: 53 ]]
        return v31.getVNGFormRequired();
    end) else nil;
    local function v33() --[[ Line: 58 ]]

    end;
    if l_GetFFlagUseUpdatedVNGAgreementsWorkflow_0() and v32 then
        v33 = function() --[[ Line: 61 ]]
            -- upvalues: v30 (copy), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref)
            v30(l_SetCentralOverlay_0(l_CentralOverlayType_0.VngContactInfoFormWebviewPopup, {}, {
                DisableBackButtonClose = true
            }));
        end;
    end;
    return v1.useCallback(function() --[[ Line: 68 ]]
        -- upvalues: v28 (copy), v29 (copy), v30 (copy), l_GetFFlagUseUpdatedVNGAgreementsWorkflow_0 (ref), v32 (copy), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), v13 (ref), v33 (ref), v23 (ref)
        if not v28 or not v29 or not v30 then
            return;
        else
            if l_GetFFlagUseUpdatedVNGAgreementsWorkflow_0() and v32 then
                v30(l_SetCentralOverlay_0(l_CentralOverlayType_0.VngComplianceLoadingPopup, {}, {
                    DisableBackButtonClose = true
                }));
            end;
            v13(v28, v29):andThen(function(v34) --[[ Line: 80 ]]
                -- upvalues: l_GetFFlagUseUpdatedVNGAgreementsWorkflow_0 (ref), v33 (ref), v23 (ref), v30 (ref), l_CentralOverlayType_0 (ref), l_SetCentralOverlay_0 (ref)
                local v35 = false;
                if not v34 or #v34 == 0 then
                    if l_GetFFlagUseUpdatedVNGAgreementsWorkflow_0() then
                        v33();
                    end;
                    return;
                else
                    local v36;
                    for _, v38 in v34 do
                        if v38.action == "ConvertToVngUser" then
                            v36 = true;
                            v35 = true;
                        end;
                        if v35 then
                            break;
                        end;
                    end;
                    if not v35 then
                        v36 = false;
                    end;
                    v35 = false;
                    if v36 then
                        if l_GetFFlagUseUpdatedVNGAgreementsWorkflow_0() then
                            v23(v30, l_CentralOverlayType_0.VNGUserAgreementsPopup, v34, v33);
                            return;
                        else
                            v23(v30, l_CentralOverlayType_0.VNGUserAgreementsPopup, v34, function(_) --[[ Line: 92 ]]
                                -- upvalues: v30 (ref), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref)
                                v30(l_SetCentralOverlay_0(l_CentralOverlayType_0.VngContactInfoFormWebviewPopup, {}));
                            end);
                            return;
                        end;
                    else
                        v23(v30, l_CentralOverlayType_0.UserAgreementsUpdatedPopup, v34, nil);
                        return;
                    end;
                end;
            end, function(_) --[[ Line: 99 ]]
                -- upvalues: l_GetFFlagUseUpdatedVNGAgreementsWorkflow_0 (ref), v33 (ref)
                if l_GetFFlagUseUpdatedVNGAgreementsWorkflow_0() then
                    v33();
                end;
            end);
            return;
        end;
    end, {
        v28, 
        v29, 
        v30
    });
end;
local function v46() --[[ Line: 107 ]] --[[ Name: useFetchOnForegrounded ]]
    -- upvalues: l_useRoactService_0 (copy), l_AppAppLifecycleObserverService_0 (copy), l_useSelector_0 (copy), v18 (copy), v41 (copy), v1 (copy)
    local v42 = l_useRoactService_0(l_AppAppLifecycleObserverService_0);
    local v43 = l_useSelector_0(v18);
    local v44 = v41();
    v1.useEffect(function() --[[ Line: 112 ]]
        -- upvalues: v42 (copy), v43 (copy), v44 (copy)
        if not v42 or not v43 then
            return;
        else
            local v45 = v42.OnBecomeActive:Connect(v44);
            return function() --[[ Line: 118 ]]
                -- upvalues: v45 (copy)
                v45:Disconnect();
            end;
        end;
    end, {
        v42, 
        v43, 
        v44
    });
end;
local function v52() --[[ Line: 124 ]] --[[ Name: useFetchOnForegrounded_DEPRECATED ]]
    -- upvalues: v41 (copy), l_useRoactService_0 (copy), l_AppPlatformService_0 (copy), l_AppAppLifecycleService_0 (copy), l_useSelector_0 (copy), v18 (copy), v1 (copy)
    local v47 = v41();
    local v48 = l_useRoactService_0(l_AppPlatformService_0);
    local v49 = l_useRoactService_0(l_AppAppLifecycleService_0);
    local v50 = l_useSelector_0(v18);
    v1.useEffect(function() --[[ Line: 130 ]]
        -- upvalues: v48 (copy), v49 (copy), v50 (copy), v47 (copy)
        if not ((v48 or v49) and v50) then
            return;
        else
            local v51 = nil;
            if v49 then
                v51 = v49:RegisterCallback(Enum.AppLifecycleState.Active, v47, true, false);
            elseif v48 then
                v51 = v48.OnLeaveConstrained:connect(v47);
            end;
            if v51 ~= nil then
                return function() --[[ Line: 158 ]]
                    -- upvalues: v51 (ref)
                    v51:Disconnect();
                    v51 = nil;
                end;
            else
                return;
            end;
        end;
    end, {
        v50, 
        v47, 
        v48, 
        v49
    });
end;
local function v59() --[[ Line: 166 ]] --[[ Name: useFetchOnUserChanged ]]
    -- upvalues: v41 (copy), l_useSelector_0 (copy), v18 (copy), l_useAppPolicy_0 (copy), v1 (copy)
    local v53 = v41();
    local v54 = l_useSelector_0(v18);
    local v56 = l_useAppPolicy_0(function(v55) --[[ Line: 169 ]]
        return v55.getCheckUserAgreementsUpdatedOnLogin();
    end);
    local v57, v58 = v1.useState(false);
    v1.useEffect(function() --[[ Line: 174 ]]
        -- upvalues: v54 (copy), v58 (copy), v56 (copy), v57 (copy), v53 (copy)
        if not v54 then
            v58(false);
            return;
        else
            if v56 and not v57 then
                v58(true);
                v53();
            end;
            return;
        end;
    end, {
        v53, 
        v54, 
        v57, 
        v56
    });
end;
return function() --[[ Line: 187 ]] --[[ Name: useUserAgreements ]]
    -- upvalues: v59 (copy), l_GetFFlagUserAgreementsIgnorePlatformService_0 (copy), v46 (copy), v52 (copy)
    v59();
    if l_GetFFlagUserAgreementsIgnorePlatformService_0() then
        v46();
        return;
    else
        v52();
        return;
    end;
end;