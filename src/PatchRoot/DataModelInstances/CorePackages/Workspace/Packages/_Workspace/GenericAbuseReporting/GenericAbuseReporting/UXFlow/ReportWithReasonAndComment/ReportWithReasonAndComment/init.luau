local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Common.Frame);
local v4 = require(l_script_FirstAncestor_0.Dialogs.SimpleSubmitDialog);
local v5 = require(l_script_FirstAncestor_0.Dialogs.ReportCompleteDialog);
local v6 = require(l_script_FirstAncestor_0.Dialogs.ReportFailedDialog);
local v7 = require(l_script_FirstAncestor_0.LocalizationKeys.DefaultLocalizationKeys);
local v8 = require(l_script_FirstAncestor_0.Analytics.Actions.OnFormLoaded);
local v9 = require(l_script_FirstAncestor_0.Analytics.useAnalyticsSubmitDispatch);
local v10 = require(l_script_FirstAncestor_0.Analytics.useAnalyticsDispatch);
local v11 = require(script.Parent.useActiveDialog);
local l_GetFFlagRefactorGenericAbuseReporting_0 = require(l_Parent_0.SharedFlags).GetFFlagRefactorGenericAbuseReporting;
return function(v13) --[[ Line: 43 ]] --[[ Name: ReportWithReasonAndComment ]]
    -- upvalues: v9 (copy), v10 (copy), v11 (copy), v7 (copy), v2 (copy), v8 (copy), l_GetFFlagRefactorGenericAbuseReporting_0 (copy), v3 (copy), v4 (copy), v5 (copy), v6 (copy)
    local v14 = v9();
    local v15 = v10();
    local v16, v17 = v11();
    local v18 = v13.onCloseProps and v13.onCloseProps.hasPreviousSteps;
    if v13.localizationKeys then
        v13.localizationKeys.formTitle = v13.localizationKeys.formTitle or v7.formTitle;
        v13.localizationKeys.formSubmit = v13.localizationKeys.formSubmit or v7.formSubmit;
    end;
    v2.useEffect(function() --[[ Line: 54 ]]
        -- upvalues: v15 (copy), v8 (ref), v13 (copy)
        v15(v8({
            context = v13.analyticsContext, 
            place_id = game.PlaceId, 
            accumulated_time_ms = workspace:GetServerTimeNow() * 1000
        }));
    end, {
        v15, 
        v13.analyticsContext
    });
    local v23 = if l_GetFFlagRefactorGenericAbuseReporting_0() then v2.useCallback(function(v19, v20) --[[ Line: 64 ]]
        -- upvalues: v13 (copy), v14 (copy)
        if (if v13.onSubmitProps.hasNextSteps then v13.onSubmitProps.onProceedToNextStep(v19, v20) else v13.onSubmitProps.onSubmit(v19, v20)) and not v13.onSubmitProps.hasNextSteps then
            v14("Submit");
        end;
    end, {
        v14, 
        v13.onSubmitProps
    }) else v2.useCallback(function(v21, v22) --[[ Line: 72 ]]
        -- upvalues: v13 (copy), v17 (copy)
        if v13.implSubmit(v21, v22) then
            v17("Complete");
            return;
        else
            v17("Error");
            return;
        end;
    end, {
        v13.implSubmit
    });
    local v24 = v2.useCallback(function() --[[ Line: 81 ]]
        -- upvalues: v13 (copy), v14 (copy)
        if v13.onComplete then
            v13.onComplete();
        end;
        v14("Submit");
    end, {
        v14, 
        v13.onComplete
    });
    local v25 = if l_GetFFlagRefactorGenericAbuseReporting_0() then v2.useCallback(function() --[[ Line: 90 ]]
        -- upvalues: v13 (copy), v14 (copy)
        if v13.onCloseProps then
            if v13.onCloseProps.hasPreviousSteps then
                v13.onCloseProps.onBackToPreviousStep();
                return;
            else
                v13.onCloseProps.onAbandon();
                v14("Abandon");
                return;
            end;
        else
            v14("Abandon");
            return;
        end;
    end, {
        v14, 
        v13.onCloseProps
    }) else v2.useCallback(function() --[[ Line: 102 ]]
        -- upvalues: v13 (copy), v14 (copy)
        if v13.onAbandon then
            v13.onAbandon();
        end;
        v14("Abandon");
    end, {
        v14, 
        v13.onAbandon
    });
    local v26 = v2.useCallback(function() --[[ Line: 109 ]]
        -- upvalues: v17 (copy)
        v17("Form");
    end, {});
    local l_createElement_0 = v2.createElement;
    local l_v3_0 = v3;
    local v29 = {
        Size = UDim2.fromScale(1, 1)
    };
    local v30;
    if l_GetFFlagRefactorGenericAbuseReporting_0() then
        v30 = {
            submitDialog = v2.createElement(v4, {
                topCustomComponent = v13.topCustomComponent, 
                footerContent = v13.footerContent, 
                localizationKeys = v13.localizationKeys, 
                reportCategories = v13.reportCategories, 
                reportCategoryDefaultKey = v13.reportCategoryDefaultKey, 
                onSubmit = v23, 
                onAbandon = v25, 
                isDisabled = v13.isDisabled, 
                isReportCategoryReadonly = v13.isReportCategoryReadonly, 
                useBackButton = v18, 
                scaleDialog = v13.scaleDialog
            })
        };
    else
        v30 = {};
        local v31 = false;
        if v16 == "Form" then
            v31 = v2.createElement(v4, {
                topCustomComponent = v13.topCustomComponent, 
                footerContent = v13.footerContent, 
                reportCategories = v13.reportCategories, 
                reportCategoryDefaultKey = v13.reportCategoryDefaultKey, 
                onSubmit = v23, 
                onAbandon = v25, 
                isDisabled = v13.isDisabled, 
                isReportCategoryReadonly = v13.isReportCategoryReadonly, 
                scaleDialog = v13.scaleDialog
            });
        end;
        v30.submitDialog = v31;
        v31 = false;
        if v16 == "Complete" then
            v31 = v2.createElement(v5, {
                onDismiss = v24
            });
        end;
        v30.completeDialog = v31;
        v31 = false;
        if v16 == "Error" then
            v31 = v2.createElement(v6, {
                onDismiss = v26
            });
        end;
        v30.errorDialog = v31;
    end;
    return l_createElement_0(l_v3_0, v29, v30);
end;