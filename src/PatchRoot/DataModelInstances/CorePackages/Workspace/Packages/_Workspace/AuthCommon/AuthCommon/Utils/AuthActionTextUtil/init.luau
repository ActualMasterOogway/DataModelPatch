local l_IXPService_0 = game:GetService("IXPService");
local l_Parent_0 = script:FindFirstAncestor("AuthCommon").Parent;
local l_FFlagEnableNewAuthActionTextExperiment_0 = require(l_Parent_0.SharedFlags).FFlagEnableNewAuthActionTextExperiment;
local l_FStringNewAuthActionTextIXPLayer_0 = require(l_Parent_0.SharedFlags).FStringNewAuthActionTextIXPLayer;
local v4 = {};
local function _() --[[ Line: 11 ]] --[[ Name: isNewAuthActionTextEnabled ]]
    -- upvalues: l_FFlagEnableNewAuthActionTextExperiment_0 (copy), l_IXPService_0 (copy), l_FStringNewAuthActionTextIXPLayer_0 (copy)
    if not l_FFlagEnableNewAuthActionTextExperiment_0 then
        return false;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 16 ]]
            -- upvalues: l_IXPService_0 (ref), l_FStringNewAuthActionTextIXPLayer_0 (ref)
            return l_IXPService_0:GetBrowserTrackerLayerVariables(l_FStringNewAuthActionTextIXPLayer_0);
        end);
        if l_status_0 then
            return l_result_0.enableTextChange or false;
        else
            return false;
        end;
    end;
end;
v4.getLogInLabelText = function() --[[ Line: 27 ]] --[[ Name: getLogInLabelText ]]
    -- upvalues: l_FFlagEnableNewAuthActionTextExperiment_0 (copy), l_IXPService_0 (copy), l_FStringNewAuthActionTextIXPLayer_0 (copy)
    local v8;
    if not l_FFlagEnableNewAuthActionTextExperiment_0 then
        v8 = false;
    else
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 16 ]]
            -- upvalues: l_IXPService_0 (ref), l_FStringNewAuthActionTextIXPLayer_0 (ref)
            return l_IXPService_0:GetBrowserTrackerLayerVariables(l_FStringNewAuthActionTextIXPLayer_0);
        end);
        v8 = if l_status_1 then l_result_1.enableTextChange or false else false;
    end;
    if v8 then
        return "Authentication.Login.Action.SignIn";
    else
        return "Authentication.Login.Action.LogInCapitalized";
    end;
end;
v4.getSignUpLabelText = function() --[[ Line: 35 ]] --[[ Name: getSignUpLabelText ]]
    -- upvalues: l_FFlagEnableNewAuthActionTextExperiment_0 (copy), l_IXPService_0 (copy), l_FStringNewAuthActionTextIXPLayer_0 (copy)
    local v11;
    if not l_FFlagEnableNewAuthActionTextExperiment_0 then
        v11 = false;
    else
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 16 ]]
            -- upvalues: l_IXPService_0 (ref), l_FStringNewAuthActionTextIXPLayer_0 (ref)
            return l_IXPService_0:GetBrowserTrackerLayerVariables(l_FStringNewAuthActionTextIXPLayer_0);
        end);
        v11 = if l_status_2 then l_result_2.enableTextChange or false else false;
    end;
    if v11 then
        return "Authentication.SignUp.Action.CreateAccount";
    else
        return "Authentication.SignUp.Label.SignUp";
    end;
end;
v4.getQuickSignInLabelText = function() --[[ Line: 43 ]] --[[ Name: getQuickSignInLabelText ]]
    -- upvalues: l_FFlagEnableNewAuthActionTextExperiment_0 (copy), l_IXPService_0 (copy), l_FStringNewAuthActionTextIXPLayer_0 (copy)
    local v14;
    if not l_FFlagEnableNewAuthActionTextExperiment_0 then
        v14 = false;
    else
        local l_status_3, l_result_3 = pcall(function() --[[ Line: 16 ]]
            -- upvalues: l_IXPService_0 (ref), l_FStringNewAuthActionTextIXPLayer_0 (ref)
            return l_IXPService_0:GetBrowserTrackerLayerVariables(l_FStringNewAuthActionTextIXPLayer_0);
        end);
        v14 = if l_status_3 then l_result_3.enableTextChange or false else false;
    end;
    if v14 then
        return "Authentication.CrossDevice.Heading.QuickLogin";
    else
        return "Authentication.CrossDevice.Action.LoginWithDevice";
    end;
end;
v4.getSignUpVerificationSingleStepParagraphText = function() --[[ Line: 51 ]] --[[ Name: getSignUpVerificationSingleStepParagraphText ]]
    -- upvalues: l_FFlagEnableNewAuthActionTextExperiment_0 (copy), l_IXPService_0 (copy), l_FStringNewAuthActionTextIXPLayer_0 (copy)
    local v17;
    if not l_FFlagEnableNewAuthActionTextExperiment_0 then
        v17 = false;
    else
        local l_status_4, l_result_4 = pcall(function() --[[ Line: 16 ]]
            -- upvalues: l_IXPService_0 (ref), l_FStringNewAuthActionTextIXPLayer_0 (ref)
            return l_IXPService_0:GetBrowserTrackerLayerVariables(l_FStringNewAuthActionTextIXPLayer_0);
        end);
        v17 = if l_status_4 then l_result_4.enableTextChange or false else false;
    end;
    if v17 then
        return "Authentication.SignUp.Description.VerificationPage.CreateAccount";
    else
        return "Authentication.SignUp.Description.VerificationPage";
    end;
end;
v4.getSignUpVerificationParagraphTextWithNextButton = function() --[[ Line: 59 ]] --[[ Name: getSignUpVerificationParagraphTextWithNextButton ]]
    return "Authentication.SignUp.Description.ClickNextAgreeToTerms";
end;
return v4;