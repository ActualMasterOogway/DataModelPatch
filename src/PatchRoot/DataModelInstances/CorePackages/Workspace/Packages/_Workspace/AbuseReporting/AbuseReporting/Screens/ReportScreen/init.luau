local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.Analytics);
local v5 = require(l_Parent_0.ServerUI);
local l_ReactServerUIView_0 = v5.ReactServerUIView;
local v7 = require(l_Parent_0.Cryo);
local l_Navigation_0 = v5.Navigation;
local v9 = require(l_Parent_0.HttpRequest);
local v10 = require(l_Parent_0.RoduxNetworking);
local v11 = require(l_Parent_0.ReactFocusNavigation);
local l_FocusNavigationEventNameEnum_0 = require(l_Parent_0.FocusNavigationUtils).FocusNavigationEventNameEnum;
local v13 = require(l_Parent_0.InputHandlers);
local v14 = require(l_Parent_0.ToastRodux);
local _ = require(l_script_FirstAncestor_0.Common.Types);
local l_useState_0 = v3.useState;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v18 = require(l_script_FirstAncestor_0.Common.Constants);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v20 = require(l_Parent_0.tutils);
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local v22 = require(l_script_FirstAncestor_0.Templates.ReportFullscreenTemplate);
local v23 = require(l_script_FirstAncestor_0.Transformers.DynamicDialogUITransformer);
local v24 = require(l_script_FirstAncestor_0.Components.ReportListSelection);
local v25 = require(l_script_FirstAncestor_0.Components.ReportSubmission);
local v26 = require(l_script_FirstAncestor_0.Components.constructAbuseReportTags);
local v27 = require(l_Parent_0.SharedFlags);
local l_GetFFlagDSALuaGeoGateBEDUIDevMode_0 = v27.GetFFlagDSALuaGeoGateBEDUIDevMode;
local l_GetFFlagEnableAbuseReportMutedError_0 = v27.GetFFlagEnableAbuseReportMutedError;
local l_isInDSAFeaturesOverrideList_0 = require(l_Parent_0.DsaIllegalContentReporting).isInDSAFeaturesOverrideList;
local l_isShowEUDSAIllegalContentReportingLink_0 = require(l_Parent_0.DsaIllegalContentReporting).isShowEUDSAIllegalContentReportingLink;
local v32 = {
    ListSelection = "listSelection", 
    Submission = "submission"
};
local v33 = {
    toastMessage = "Feature.ReportAbuse.Label.Confirmation.Title", 
    toastSubMessage = "Feature.ReportAbuse.Label.Confirmation.Subheading", 
    isLocalized = false, 
    toastType = v14.Enums.ToastType.SuccessConfirmation
};
local v34 = {
    toastMessage = "Feature.ReportAbuse.Message.ErrorSubmit", 
    isLocalized = false, 
    toastType = v14.Enums.ToastType.NetworkingError
};
local function v72(v35) --[[ Line: 80 ]] --[[ Name: ReportScreen ]]
    -- upvalues: l_useDispatch_0 (copy), l_useState_0 (copy), v4 (copy), v7 (copy), v3 (copy), v13 (copy), v11 (copy), l_FocusNavigationEventNameEnum_0 (copy), v9 (copy), v10 (copy), v23 (copy), v32 (copy), v24 (copy), v25 (copy), v26 (copy), v14 (copy), v33 (copy), l_GetFFlagEnableAbuseReportMutedError_0 (copy), l_mutedError_0 (copy), v20 (copy), v34 (copy), v22 (copy), v18 (copy), l_GetFFlagDSALuaGeoGateBEDUIDevMode_0 (copy), l_isShowEUDSAIllegalContentReportingLink_0 (copy), l_isInDSAFeaturesOverrideList_0 (copy), l_ReactServerUIView_0 (copy), l_LocalizationService_0 (copy)
    local v36 = l_useDispatch_0();
    local v37, v38 = l_useState_0({});
    local v39 = nil;
    local function _() --[[ Line: 84 ]]
        -- upvalues: v39 (ref), v4 (ref), v35 (copy)
        if not v39 then
            v39 = v4.new(v35.platform, v35.context);
        end;
        return v39;
    end;
    local function _(v41, v42) --[[ Line: 91 ]]
        -- upvalues: v38 (copy), v7 (ref)
        v38(function(v43) --[[ Line: 92 ]]
            -- upvalues: v7 (ref), v42 (copy), v41 (copy)
            local v44 = table.clone(v43);
            table.insert(v44, v7.Dictionary.join(v42, {
                tagKey = v41
            }));
            return v44;
        end);
    end;
    local v47 = v3.useCallback(v13.onRelease(function(_) --[[ Line: 105 ]]
        -- upvalues: v39 (ref), v4 (ref), v35 (copy)
        if not v39 then
            v39 = v4.new(v35.platform, v35.context);
        end;
        v39:onReportAbandoned();
    end), {
        v39
    });
    local v48 = v11.useEventHandler(l_FocusNavigationEventNameEnum_0.NavigateBack, v47);
    local v49 = v9.config({
        requestFunction = v9.requestFunctions.HttpRbxApi
    });
    local v50 = v10.config({
        keyPath = "AbuseReporting", 
        networkImpl = v49
    });
    local v66 = v23.new({
        componentMap = {
            [v32.ListSelection] = {
                name = v32.ListSelection, 
                component = v24, 
                props = {
                    onItemSelected = function(v51, v52) --[[ Line: 130 ]] --[[ Name: onItemSelected ]]
                        -- upvalues: v38 (copy), v7 (ref), v39 (ref), v4 (ref), v35 (copy)
                        local l_params_0 = v51.params;
                        local l_tagKey_0 = l_params_0.tagKey;
                        local v55 = {
                            tagValues = v52.tagValues, 
                            heading = l_params_0.heading, 
                            humanReadableText = v52.humanReadableText
                        };
                        v38(function(v56) --[[ Line: 92 ]]
                            -- upvalues: v7 (ref), v55 (copy), l_tagKey_0 (copy)
                            local v57 = table.clone(v56);
                            table.insert(v57, v7.Dictionary.join(v55, {
                                tagKey = l_tagKey_0
                            }));
                            return v57;
                        end);
                        if not v39 then
                            v39 = v4.new(v35.platform, v35.context);
                        end;
                        v39:onSingleListItemSelected();
                    end, 
                    onCancel = function() --[[ Line: 142 ]] --[[ Name: onCancel ]]
                        -- upvalues: v39 (ref), v4 (ref), v35 (copy)
                        if not v39 then
                            v39 = v4.new(v35.platform, v35.context);
                        end;
                        v39:onReportAbandoned();
                        v35.navigation.goBack();
                    end
                }
            }, 
            [v32.Submission] = {
                name = v32.Submission, 
                component = v25, 
                props = {
                    onCancel = function() --[[ Line: 152 ]] --[[ Name: onCancel ]]
                        -- upvalues: v39 (ref), v4 (ref), v35 (copy)
                        if not v39 then
                            v39 = v4.new(v35.platform, v35.context);
                        end;
                        v39:onReportAbandoned();
                        v35.navigation.goBack();
                    end, 
                    onMounted = function() --[[ Line: 156 ]] --[[ Name: onMounted ]]
                        -- upvalues: v39 (ref), v4 (ref), v35 (copy)
                        if not v39 then
                            v39 = v4.new(v35.platform, v35.context);
                        end;
                        v39:onSubmissionPageMount();
                    end, 
                    onSubmit = function(v58) --[[ Line: 159 ]] --[[ Name: onSubmit ]]
                        -- upvalues: v26 (ref), v35 (copy), v50 (copy), v36 (copy), v14 (ref), v33 (ref), l_GetFFlagEnableAbuseReportMutedError_0 (ref), l_mutedError_0 (ref), v20 (ref), v34 (ref), v39 (ref), v4 (ref)
                        local l_url_0 = v58.params.url;
                        local v60 = {
                            safetyEvent = {
                                tags = v26(v58.report, {
                                    context = v35.context, 
                                    platform = v35.platform, 
                                    assetId = v35.assetId, 
                                    reportAbuseVector = v35.reportAbuseVector
                                })
                            }
                        };
                        local v63 = v50.POST("SubmitAbuseReport", function(v61, _) --[[ Line: 174 ]]
                            -- upvalues: l_url_0 (copy), v60 (copy)
                            return v61(l_url_0):body(v60);
                        end);
                        v36(v63.API()):andThen(function(_) --[[ Line: 179 ]]
                            -- upvalues: v36 (ref), v14 (ref), v33 (ref)
                            v36(v14.Actions.SetCurrentToastMessage(v33));
                        end):catch(function(v65) --[[ Line: 182 ]]
                            -- upvalues: l_GetFFlagEnableAbuseReportMutedError_0 (ref), l_mutedError_0 (ref), v20 (ref), v36 (ref), v14 (ref), v34 (ref)
                            if l_GetFFlagEnableAbuseReportMutedError_0() then
                                l_mutedError_0("(Abuse Reporting [Console]) submission failed: " .. v20.toString(v65));
                            end;
                            v36(v14.Actions.SetCurrentToastMessage(v34));
                        end);
                        if not v39 then
                            v39 = v4.new(v35.platform, v35.context);
                        end;
                        v39:onReportSubmitted();
                        v35.navigation.goBack();
                    end
                }
            }
        }, 
        templateMap = {
            default = {
                component = v22
            }
        }
    });
    local function v68(v67) --[[ Line: 204 ]]
        -- upvalues: v32 (ref), v37 (copy)
        if v67.name == v32.Submission then
            return {
                report = v37
            };
        else
            return {};
        end;
    end;
    local l_V1_0 = v18.BEDUI_VERSIONS.V1;
    if l_GetFFlagDSALuaGeoGateBEDUIDevMode_0() then
        if l_isShowEUDSAIllegalContentReportingLink_0() then
            l_V1_0 = v18.BEDUI_VERSIONS.DEV;
        end;
    elseif l_isInDSAFeaturesOverrideList_0() then
        l_V1_0 = v18.BEDUI_VERSIONS.DEV;
    end;
    return v3.createElement(l_ReactServerUIView_0, {
        url = "abuse-reporting/v1/dynamic-dialog", 
        queryArgs = {
            version = l_V1_0, 
            surface = v35.platform, 
            context = v35.context, 
            locale = l_LocalizationService_0.RobloxLocaleId, 
            target_type = v35.reportAbuseVector, 
            target_id = v35.assetId
        }, 
        mapComponentPropsFromState = v68, 
        transform = function(v70) --[[ Line: 239 ]] --[[ Name: transform ]]
            -- upvalues: v66 (copy)
            return v66:transform(v70);
        end, 
        onError = function(v71) --[[ Line: 242 ]] --[[ Name: onError ]]
            -- upvalues: l_GetFFlagEnableAbuseReportMutedError_0 (ref), l_mutedError_0 (ref), v20 (ref), v36 (copy), v14 (ref), v34 (ref), v35 (copy)
            if l_GetFFlagEnableAbuseReportMutedError_0() then
                l_mutedError_0("(Abuse Reporting [Console]) BEDUI fetch failed: " .. v20.toString(v71));
            end;
            v36(v14.Actions.SetCurrentToastMessage(v34));
            v35.navigation.goBack();
        end, 
        ref = v48
    });
end;
return function(v73) --[[ Line: 253 ]] --[[ Name: ReportScreenNavigationWrapper ]]
    -- upvalues: l_useNavigation_0 (copy), v3 (copy), l_Navigation_0 (copy), v72 (copy), v7 (copy)
    local v74 = l_useNavigation_0();
    local v75 = v74.getParam("reportData", {});
    return v3.createElement(l_Navigation_0, {}, {
        Screen = v3.createElement(v72, v7.Dictionary.join(v73, v75, {
            navigation = v74
        }))
    });
end;