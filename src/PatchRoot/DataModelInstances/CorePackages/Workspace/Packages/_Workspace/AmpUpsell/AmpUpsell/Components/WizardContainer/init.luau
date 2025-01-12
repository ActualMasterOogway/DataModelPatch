local l_script_FirstAncestor_0 = script:FindFirstAncestor("AmpUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v4 = require(l_script_FirstAncestor_0.Common.Enums);
local l_ActionTypeEnum_0 = v4.ActionTypeEnum;
local l_ActionStatusEnum_0 = v4.ActionStatusEnum;
local l_AccessResponseEnum_0 = v4.AccessResponseEnum;
local l_accountSettingsUpsellStrings_0 = require(l_script_FirstAncestor_0.Common.LocalizationStrings).accountSettingsUpsellStrings;
local l_LoadingSpinner_0 = require(l_Parent_0.UIBlox).App.Loading.LoadingSpinner;
local v10 = require(l_Parent_0.Cryo);
local v11 = require(l_script_FirstAncestor_0.Analytics.AnalyticsService);
local v12 = require(l_script_FirstAncestor_0.Analytics.sendModalActionEvent);
local v13 = require(l_script_FirstAncestor_0.Common.AmpApiProvider);
local v14 = require(l_script_FirstAncestor_0.Common.AppScreens);
local v15 = require(l_script_FirstAncestor_0.Components.ErrorScreen);
local l_useApolloClient_0 = require(l_Parent_0.ApolloClient).useApolloClient;
local v17 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableAmpUpsellGql);
local v18 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableAmpEmailUpsellSupport);
local v19 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableAmpIDVUpsellSupport);
local v20 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableAmpUpsellSchemaRecourses);
local v21 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableConsolidateCancelAccountSettingsUpsell);
local l_GetFFlagEnableAmpVPCUpsellSupport_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableAmpVPCUpsellSupport;
local function v27(v23) --[[ Line: 50 ]] --[[ Name: getSuccessfulActions ]]
    -- upvalues: l_ActionStatusEnum_0 (copy)
    local v24 = {};
    for v25, v26 in pairs(v23) do
        if v26 == l_ActionStatusEnum_0.Success then
            table.insert(v24, v25);
        end;
    end;
    return v24;
end;
return function(v28) --[[ Line: 60 ]] --[[ Name: WizardContainer ]]
    -- upvalues: l_useNavigation_0 (copy), v13 (copy), v11 (copy), v2 (copy), l_useApolloClient_0 (copy), v20 (copy), l_ActionTypeEnum_0 (copy), v14 (copy), v10 (copy), l_ActionStatusEnum_0 (copy), l_AccessResponseEnum_0 (copy), v18 (copy), v19 (copy), l_GetFFlagEnableAmpVPCUpsellSupport_0 (copy), v21 (copy), l_accountSettingsUpsellStrings_0 (copy), v17 (copy), v27 (copy), v12 (copy), v15 (copy), l_LoadingSpinner_0 (copy)
    local v29 = l_useNavigation_0();
    local l_featureName_0 = v28.featureName;
    local l_recourseData_0 = v28.recourseData;
    local l_entryPointEventCtx_0 = v28.entryPointEventCtx;
    local l_openUpsells_0 = v28.openUpsells;
    local l_completionCallback_0 = v28.completionCallback;
    local v35 = if v28.ampApiProvider then v28.ampApiProvider else v13;
    local v36 = if v28.analyticsService then v28.analyticsService else v11.EventStream;
    local v37 = if v28.openAccountSettingsUpsell then v28.openAccountSettingsUpsell else v29.push;
    local v38, v39 = v2.useState({});
    local v40, v41 = v2.useState(false);
    local v42 = l_useApolloClient_0();
    local v47 = v2.useCallback(function(v43, v44) --[[ Line: 78 ]]
        -- upvalues: v20 (ref), l_ActionTypeEnum_0 (ref), v14 (ref), v39 (copy), v10 (ref), v38 (copy), l_ActionStatusEnum_0 (ref), l_completionCallback_0 (copy), l_AccessResponseEnum_0 (ref), v18 (ref), v19 (ref), l_featureName_0 (copy), l_GetFFlagEnableAmpVPCUpsellSupport_0 (ref), l_recourseData_0 (copy), l_entryPointEventCtx_0 (copy), v29 (copy)
        local v45 = nil;
        v45 = if v20() then v44.action else v43;
        if v45 == l_ActionTypeEnum_0.Phone then
            return {
                eventContext = "AmpUpsell", 
                origin = v14.AmpWizardContainer, 
                onSuccess = function() --[[ Line: 90 ]] --[[ Name: onSuccess ]]
                    -- upvalues: v39 (ref), v10 (ref), v38 (ref), l_ActionTypeEnum_0 (ref), l_ActionStatusEnum_0 (ref)
                    v39(v10.Dictionary.join(v38, {
                        [l_ActionTypeEnum_0.Phone] = l_ActionStatusEnum_0.Success
                    }));
                end, 
                onFailure = function() --[[ Line: 95 ]] --[[ Name: onFailure ]]
                    -- upvalues: l_completionCallback_0 (ref), l_AccessResponseEnum_0 (ref), v10 (ref), v38 (ref), l_ActionTypeEnum_0 (ref), l_ActionStatusEnum_0 (ref)
                    l_completionCallback_0(l_AccessResponseEnum_0.Denied, v10.Dictionary.join(v38, {
                        [l_ActionTypeEnum_0.Phone] = l_ActionStatusEnum_0.Failure
                    }));
                end, 
                onCancelled = function() --[[ Line: 101 ]] --[[ Name: onCancelled ]]
                    -- upvalues: l_completionCallback_0 (ref), l_AccessResponseEnum_0 (ref), v10 (ref), v38 (ref), l_ActionTypeEnum_0 (ref), l_ActionStatusEnum_0 (ref)
                    l_completionCallback_0(l_AccessResponseEnum_0.Denied, v10.Dictionary.join(v38, {
                        [l_ActionTypeEnum_0.Phone] = l_ActionStatusEnum_0.Cancelled
                    }));
                end
            };
        elseif v18() and v45 == l_ActionTypeEnum_0.AddedEmail then
            return {
                eventContext = "AmpUpsell", 
                closeOnEmailUpdate = true, 
                addEmailOver13TextKey = "Feature.VerificationUpsell.Description.IDVerificationAddEmailText", 
                addEmailUnder13TextKey = "Feature.VerificationUpsell.Description.IDVerificationAddEmailText", 
                addEmailTitleKey = "Feature.VerificationUpsell.Heading.AddEmail", 
                successCallback = function(_) --[[ Line: 115 ]] --[[ Name: successCallback ]]
                    -- upvalues: v39 (ref), v10 (ref), v38 (ref), l_ActionTypeEnum_0 (ref), l_ActionStatusEnum_0 (ref)
                    v39(v10.Dictionary.join(v38, {
                        [l_ActionTypeEnum_0.Email] = l_ActionStatusEnum_0.Success
                    }));
                end, 
                failureCallback = function() --[[ Line: 120 ]] --[[ Name: failureCallback ]]
                    -- upvalues: l_completionCallback_0 (ref), l_AccessResponseEnum_0 (ref), v10 (ref), v38 (ref), l_ActionTypeEnum_0 (ref), l_ActionStatusEnum_0 (ref)
                    l_completionCallback_0(l_AccessResponseEnum_0.Denied, v10.Dictionary.join(v38, {
                        [l_ActionTypeEnum_0.Phone] = l_ActionStatusEnum_0.Failure
                    }));
                end, 
                closeCentralOverlay = function() --[[ Line: 126 ]] --[[ Name: closeCentralOverlay ]]

                end
            };
        elseif v19() and v45 == l_ActionTypeEnum_0.GovernmentId then
            return {
                featureName = l_featureName_0, 
                onSuccess = function() --[[ Line: 131 ]] --[[ Name: onSuccess ]]
                    -- upvalues: v39 (ref), v10 (ref), v38 (ref), l_ActionTypeEnum_0 (ref), l_ActionStatusEnum_0 (ref)
                    v39(v10.Dictionary.join(v38, {
                        [l_ActionTypeEnum_0.GovernmentId] = l_ActionStatusEnum_0.Success
                    }));
                end, 
                onFailure = function() --[[ Line: 139 ]] --[[ Name: onFailure ]]
                    -- upvalues: l_completionCallback_0 (ref), l_AccessResponseEnum_0 (ref), v10 (ref), v38 (ref), l_ActionTypeEnum_0 (ref), l_ActionStatusEnum_0 (ref)
                    l_completionCallback_0(l_AccessResponseEnum_0.Denied, v10.Dictionary.join(v38, {
                        [l_ActionTypeEnum_0.GovernmentId] = l_ActionStatusEnum_0.Failure
                    }));
                end, 
                onCancelled = function() --[[ Line: 148 ]] --[[ Name: onCancelled ]]
                    -- upvalues: l_completionCallback_0 (ref), l_AccessResponseEnum_0 (ref), v10 (ref), v38 (ref), l_ActionTypeEnum_0 (ref), l_ActionStatusEnum_0 (ref)
                    l_completionCallback_0(l_AccessResponseEnum_0.Denied, v10.Dictionary.join(v38, {
                        [l_ActionTypeEnum_0.GovernmentId] = l_ActionStatusEnum_0.Cancelled
                    }));
                end
            };
        elseif l_GetFFlagEnableAmpVPCUpsellSupport_0() and (v45 == l_ActionTypeEnum_0.ParentConsent or v45 == l_ActionTypeEnum_0.ParentLink) then
            return {
                recourseAction = v44.action, 
                parentConsentTypes = v44.parentConsentTypes, 
                recourseData = l_recourseData_0, 
                entryPointEventCtx = l_entryPointEventCtx_0, 
                onCancel = function() --[[ Line: 168 ]] --[[ Name: onCancel ]]
                    -- upvalues: l_completionCallback_0 (ref), l_AccessResponseEnum_0 (ref), v10 (ref), v38 (ref), v45 (ref), l_ActionStatusEnum_0 (ref)
                    l_completionCallback_0(l_AccessResponseEnum_0.Denied, v10.Dictionary.join(v38, {
                        [v45] = l_ActionStatusEnum_0.Cancelled
                    }));
                end, 
                onSuccess = function() --[[ Line: 174 ]] --[[ Name: onSuccess ]]
                    -- upvalues: l_completionCallback_0 (ref), l_AccessResponseEnum_0 (ref), v10 (ref), v38 (ref), v45 (ref), l_ActionStatusEnum_0 (ref)
                    l_completionCallback_0(l_AccessResponseEnum_0.Denied, v10.Dictionary.join(v38, {
                        [v45] = l_ActionStatusEnum_0.Success
                    }));
                end, 
                onRetryAmp = function() --[[ Line: 180 ]] --[[ Name: onRetryAmp ]]
                    -- upvalues: v29 (ref), v39 (ref), v10 (ref), v38 (ref), v45 (ref), l_ActionStatusEnum_0 (ref)
                    v29.pop();
                    v39(v10.Dictionary.join(v38, {
                        [v45] = l_ActionStatusEnum_0.RetryRequested
                    }));
                end
            };
        else
            return {};
        end;
    end, {
        v38
    });
    local v54 = v2.useCallback(function(v48, v49) --[[ Line: 195 ]]
        -- upvalues: v20 (ref), l_openUpsells_0 (copy), v47 (copy), v21 (ref), l_featureName_0 (copy), l_accountSettingsUpsellStrings_0 (ref), v29 (copy), l_completionCallback_0 (copy), l_AccessResponseEnum_0 (ref), v10 (ref), v38 (copy), l_ActionTypeEnum_0 (ref), l_ActionStatusEnum_0 (ref), v39 (copy), v37 (copy)
        local v50 = nil;
        local v51 = nil;
        local v52 = nil;
        if v20() then
            if #v49 == 0 then
                return;
            else
                v51 = v49[1].action;
                v52 = v49[1];
            end;
        elseif #v48 == 0 then
            return;
        else
            v51 = v48[1];
        end;
        local v53 = l_openUpsells_0[v51];
        if v53 ~= nil then
            v53((v47(v51, v52)));
            return;
        else
            v50 = if v21() then {
                featureName = l_featureName_0, 
                localizationStrings = l_accountSettingsUpsellStrings_0[v51], 
                onCloseModal = function() --[[ Line: 222 ]] --[[ Name: onCloseModal ]]
                    -- upvalues: v29 (ref), l_completionCallback_0 (ref), l_AccessResponseEnum_0 (ref), v10 (ref), v38 (ref), l_ActionTypeEnum_0 (ref), l_ActionStatusEnum_0 (ref)
                    v29.pop();
                    l_completionCallback_0(l_AccessResponseEnum_0.Denied, v10.Dictionary.join(v38, {
                        [l_ActionTypeEnum_0.GovernmentId] = l_ActionStatusEnum_0.Cancelled
                    }));
                end
            } else {
                featureName = l_featureName_0, 
                localizationStrings = l_accountSettingsUpsellStrings_0[v51], 
                onCloseModal = function() --[[ Line: 237 ]] --[[ Name: onCloseModal ]]
                    -- upvalues: v29 (ref), l_completionCallback_0 (ref), l_AccessResponseEnum_0 (ref), v10 (ref), v38 (ref), l_ActionTypeEnum_0 (ref), l_ActionStatusEnum_0 (ref)
                    v29.pop();
                    l_completionCallback_0(l_AccessResponseEnum_0.Denied, v10.Dictionary.join(v38, {
                        [l_ActionTypeEnum_0.GovernmentId] = l_ActionStatusEnum_0.Cancelled
                    }));
                end, 
                onCancelled = function() --[[ Line: 247 ]] --[[ Name: onCancelled ]]
                    -- upvalues: v29 (ref), v39 (ref), v10 (ref), v38 (ref), l_ActionTypeEnum_0 (ref), l_ActionStatusEnum_0 (ref)
                    v29.pop();
                    v39(v10.Dictionary.join(v38, {
                        [l_ActionTypeEnum_0.GovernmentId] = l_ActionStatusEnum_0.Cancelled
                    }));
                end
            };
            v37(v50);
            return;
        end;
    end, {});
    local v57 = v2.useCallback(function(v55) --[[ Line: 262 ]]
        -- upvalues: v41 (copy), v17 (ref), v35 (copy), v42 (copy), v27 (ref), v38 (copy), l_AccessResponseEnum_0 (ref), v54 (copy), l_completionCallback_0 (copy)
        v41(false);
        local v56 = if v17() then v35.upsellFeatureAccessGql(v42, v55, (v27(v38))) else v35.upsellFeatureAccess(v55, (v27(v38)));
        if v56.access == l_AccessResponseEnum_0.Error then
            v41(true);
            return;
        elseif v56.access == l_AccessResponseEnum_0.Actionable then
            v54(v56.recourse, v56.recourses);
            return;
        elseif v56.access == l_AccessResponseEnum_0.Granted then
            l_completionCallback_0(l_AccessResponseEnum_0.Granted, v38);
            return;
        elseif v56.access == l_AccessResponseEnum_0.Denied then
            l_completionCallback_0(l_AccessResponseEnum_0.Denied, v38);
            return;
        else
            l_completionCallback_0(l_AccessResponseEnum_0.Pending, v38);
            return;
        end;
    end, {
        v35
    });
    v2.useEffect(function() --[[ Line: 280 ]]
        -- upvalues: v12 (ref), v36 (copy), v14 (ref), l_featureName_0 (copy)
        v12(v36, v14.AmpWizardContainer, l_featureName_0, "Shown");
    end, {
        v36
    });
    v2.useEffect(function() --[[ Line: 284 ]]
        -- upvalues: v57 (copy), l_featureName_0 (copy)
        v57(l_featureName_0);
    end, {
        v38, 
        l_featureName_0, 
        l_completionCallback_0
    });
    if v40 then
        return v2.createElement(v15, {
            featureName = l_featureName_0, 
            onRetry = function() --[[ Line: 291 ]] --[[ Name: onRetry ]]
                -- upvalues: v41 (copy), v57 (copy), l_featureName_0 (copy)
                v41(false);
                v57(l_featureName_0);
            end, 
            onCancel = function() --[[ Line: 295 ]] --[[ Name: onCancel ]]
                -- upvalues: l_completionCallback_0 (copy), l_AccessResponseEnum_0 (ref), v38 (copy)
                l_completionCallback_0(l_AccessResponseEnum_0.Denied, v38);
            end
        });
    else
        return v2.createElement(l_LoadingSpinner_0, {
            size = UDim2.fromOffset(42, 42), 
            position = UDim2.fromScale(0.5, 0.5), 
            anchorPoint = Vector2.new(0.5, 0.5)
        });
    end;
end;