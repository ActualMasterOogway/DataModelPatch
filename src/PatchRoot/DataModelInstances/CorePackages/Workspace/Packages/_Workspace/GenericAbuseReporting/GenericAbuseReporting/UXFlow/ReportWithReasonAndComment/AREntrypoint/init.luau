local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Analytics.AnalyticsProvider);
local l_LayerCollectorProvider_0 = require(l_Parent_0.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider;
local v5 = require(l_script_FirstAncestor_0.LocalizationKeys.LocalizationKeysProvider);
local v6 = require(l_Parent_0.Foundation);
local l_FoundationProvider_0 = v6.FoundationProvider;
local v8 = require(script.Parent.ReportWithReasonAndComment);
local v9 = require(l_script_FirstAncestor_0.Dialogs.ReportCompleteDialog);
local v10 = require(l_script_FirstAncestor_0.Dialogs.ReportFailedDialog);
local _ = require(l_script_FirstAncestor_0.Analytics.submitAnalytics);
local v12 = require(script.Parent.useActiveDialog);
local l_GetFFlagRefactorGenericAbuseReporting_0 = require(l_Parent_0.SharedFlags).GetFFlagRefactorGenericAbuseReporting;
local v14 = {
    Form = "Form", 
    Complete = "Complete", 
    Error = "Error"
};
return function(v15) --[[ Line: 62 ]] --[[ Name: AREntrypoint ]]
    -- upvalues: v12 (copy), v2 (copy), v14 (copy), l_LayerCollectorProvider_0 (copy), l_FoundationProvider_0 (copy), v6 (copy), v3 (copy), v5 (copy), l_GetFFlagRefactorGenericAbuseReporting_0 (copy), v8 (copy), v9 (copy), v10 (copy)
    local v16, v17 = v12();
    local v21 = v2.useCallback(function(v18, v19) --[[ Line: 65 ]]
        -- upvalues: v15 (copy), v17 (copy), v14 (ref)
        local v20 = if v15.onSubmitProps.hasNextSteps then v15.onSubmitProps.onProceedToNextStep(v18, v19) else v15.onSubmitProps.onSubmit(v18, v19);
        if v20 then
            v17(v14.Complete);
            return v20;
        else
            v17(v14.Error);
            return v20;
        end;
    end, {
        v15.onSubmitProps
    });
    local v22 = v2.useCallback(function() --[[ Line: 77 ]]
        -- upvalues: v17 (copy), v14 (ref)
        v17(v14.Form);
    end, {});
    local v23 = v2.useCallback(function() --[[ Line: 81 ]]
        -- upvalues: v15 (copy)
        if v15.onComplete then
            v15.onComplete();
        end;
    end, {
        v15.onComplete
    });
    local l_createElement_0 = v2.createElement;
    local l_l_LayerCollectorProvider_0_0 = l_LayerCollectorProvider_0;
    local v26 = {};
    local v27 = {};
    local l_createElement_1 = v2.createElement;
    local l_l_FoundationProvider_0_0 = l_FoundationProvider_0;
    local v30 = {
        theme = v6.Enums.Theme.Dark
    };
    local v31 = {};
    local l_createElement_2 = v2.createElement;
    local l_v3_0 = v3;
    local v34 = {
        onBeforeSubmitAnalytics = v15.onBeforeSubmitAnalytics, 
        onSubmitAnalytics = v15.onSubmitAnalytics
    };
    local v35 = {};
    local l_createElement_3 = v2.createElement;
    local l_v5_0 = v5;
    local v38 = {
        localizationKeys = v15.localizationKeys
    };
    local v39;
    if l_GetFFlagRefactorGenericAbuseReporting_0() then
        v39 = {};
        local v40 = false;
        if v16 == v14.Form then
            v40 = v2.createElement(v8, {
                analyticsContext = v15.analyticsContext, 
                topCustomComponent = v15.topCustomComponent, 
                footerContent = v15.footerContent, 
                reportCategories = v15.reportCategories, 
                onCloseProps = v15.onCloseProps, 
                onSubmitProps = if v15.onSubmitProps.hasNextSteps then {
                    hasNextSteps = v15.onSubmitProps.hasNextSteps, 
                    onProceedToNextStep = v21
                } else {
                    hasNextSteps = v15.onSubmitProps.hasNextSteps, 
                    onSubmit = v21
                }, 
                reportCategoryDefaultKey = v15.reportCategoryDefaultKey, 
                implSubmit = v15.implSubmit, 
                isDisabled = v15.isDisabled, 
                isReportCategoryReadonly = v15.isReportCategoryReadonly, 
                scaleDialog = v15.scaleDialog
            });
        end;
        v39.submitDialog = v40;
        v40 = false;
        if v16 == v14.Complete then
            v40 = v2.createElement(v9, {
                onDismiss = v23
            });
        end;
        v39.completeDialog = v40;
        v40 = false;
        if v16 == v14.Error then
            v40 = v2.createElement(v10, {
                onDismiss = v22
            });
        end;
        v39.errorDialog = v40;
    else
        v39 = {
            flow = v2.createElement(v8, {
                analyticsContext = v15.analyticsContext, 
                topCustomComponent = v15.topCustomComponent, 
                footerContent = v15.footerContent, 
                reportCategories = v15.reportCategories, 
                onCloseProps = v15.onCloseProps, 
                onSubmitProps = if v15.onSubmitProps.hasNextSteps then {
                    hasNextSteps = v15.onSubmitProps.hasNextSteps, 
                    onProceedToNextStep = v21
                } else {
                    hasNextSteps = v15.onSubmitProps.hasNextSteps, 
                    onSubmit = v21
                }, 
                onComplete = v15.onComplete, 
                onAbandon = v15.onAbandon, 
                implSubmit = v15.implSubmit, 
                reportCategoryDefaultKey = v15.reportCategoryDefaultKey, 
                isDisabled = v15.isDisabled, 
                isReportCategoryReadonly = v15.isReportCategoryReadonly, 
                scaleDialog = v15.scaleDialog
            })
        };
    end;
    v35.localizationKeys = l_createElement_3(l_v5_0, v38, v39);
    v31.analytics = l_createElement_2(l_v3_0, v34, v35);
    v27.FoundationProvider = l_createElement_1(l_l_FoundationProvider_0_0, v30, v31);
    return l_createElement_0(l_l_LayerCollectorProvider_0_0, v26, v27);
end;