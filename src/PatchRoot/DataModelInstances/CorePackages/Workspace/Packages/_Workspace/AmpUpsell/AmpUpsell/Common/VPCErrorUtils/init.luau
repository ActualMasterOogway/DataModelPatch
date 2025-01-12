local l_script_FirstAncestor_0 = script:FindFirstAncestor("AmpUpsell");
local v1 = require(script.Parent.Enums);
local l_VPCErrorCategoriesEnum_0 = v1.VPCErrorCategoriesEnum;
local l_VPCRetryBehaviorEnum_0 = v1.VPCRetryBehaviorEnum;
local l_VPCErrorCodesEnum_0 = v1.VPCErrorCodesEnum;
local l_vpcErrorCategoryToMessageStrings_0 = require(l_script_FirstAncestor_0.Common.LocalizationStrings).vpcErrorCategoryToMessageStrings;
local v6 = require(l_script_FirstAncestor_0.Flags.GetFFlagUseNewVPCErrorCopy);
local v7 = {
    [l_VPCErrorCodesEnum_0.InvalidEmailAddress] = l_VPCErrorCategoriesEnum_0.InvalidEmail, 
    [l_VPCErrorCodesEnum_0.EmailNotUnique] = l_VPCErrorCategoriesEnum_0.InvalidEmail, 
    [l_VPCErrorCodesEnum_0.LinkingIneligible] = l_VPCErrorCategoriesEnum_0.InvalidEmail, 
    [l_VPCErrorCodesEnum_0.ParentAtLinkLimit] = l_VPCErrorCategoriesEnum_0.InvalidEmail, 
    [l_VPCErrorCodesEnum_0.SenderFlooded] = l_VPCErrorCategoriesEnum_0.Flooded, 
    [l_VPCErrorCodesEnum_0.ReceiverFlooded] = l_VPCErrorCategoriesEnum_0.Flooded, 
    [l_VPCErrorCodesEnum_0.InvalidParameter] = l_VPCErrorCategoriesEnum_0.BadUserInput, 
    [l_VPCErrorCodesEnum_0.UpdateUserSettingRequestInvalid] = l_VPCErrorCategoriesEnum_0.BadUserInput, 
    [l_VPCErrorCodesEnum_0.AlreadyLinked] = l_VPCErrorCategoriesEnum_0.UserStateRecoursePathMismatch, 
    [l_VPCErrorCodesEnum_0.ChildAtLinkLimit] = l_VPCErrorCategoriesEnum_0.UserStateRecoursePathMismatch, 
    [l_VPCErrorCodesEnum_0.NoLinkedParents] = l_VPCErrorCategoriesEnum_0.UserStateRecoursePathMismatch, 
    [l_VPCErrorCodesEnum_0.SenderFloodedRequestCreated] = l_VPCErrorCategoriesEnum_0.SenderFloodedRequestCreated, 
    [l_VPCErrorCodesEnum_0.Unknown] = l_VPCErrorCategoriesEnum_0.InternalVPCError, 
    [l_VPCErrorCodesEnum_0.ServiceUnavailable] = l_VPCErrorCategoriesEnum_0.InternalVPCError, 
    [l_VPCErrorCodesEnum_0.IllegalState] = l_VPCErrorCategoriesEnum_0.InternalVPCError, 
    [l_VPCErrorCodesEnum_0.InvalidUserID] = l_VPCErrorCategoriesEnum_0.GenericError, 
    [l_VPCErrorCodesEnum_0.ConsentAlreadyApplied] = l_VPCErrorCategoriesEnum_0.GenericError, 
    [l_VPCErrorCodesEnum_0.ConsentAlreadyRequestedConflictingData] = l_VPCErrorCategoriesEnum_0.GenericError, 
    [l_VPCErrorCodesEnum_0.ReceiverNotWhitelisted] = l_VPCErrorCategoriesEnum_0.GenericError, 
    [l_VPCErrorCodesEnum_0.InvalidComplianceFeature] = l_VPCErrorCategoriesEnum_0.GenericError, 
    [l_VPCErrorCodesEnum_0.ChildTooOld] = l_VPCErrorCategoriesEnum_0.GenericError, 
    [l_VPCErrorCodesEnum_0.UserForgotten] = l_VPCErrorCategoriesEnum_0.GenericError, 
    [l_VPCErrorCodesEnum_0.UnsupportedNotificationType] = l_VPCErrorCategoriesEnum_0.GenericError, 
    [l_VPCErrorCodesEnum_0.UnsupportedRequestType] = l_VPCErrorCategoriesEnum_0.GenericError, 
    [l_VPCErrorCodesEnum_0.ChildIneligibleForConsent] = l_VPCErrorCategoriesEnum_0.GenericError
};
local v8 = {
    [l_VPCErrorCodesEnum_0.InvalidEmailAddress] = l_VPCErrorCategoriesEnum_0.InvalidEmail, 
    [l_VPCErrorCodesEnum_0.EmailNotUnique] = l_VPCErrorCategoriesEnum_0.InvalidEmail, 
    [l_VPCErrorCodesEnum_0.LinkingIneligible] = l_VPCErrorCategoriesEnum_0.InvalidEmail, 
    [l_VPCErrorCodesEnum_0.ParentAtLinkLimit] = l_VPCErrorCategoriesEnum_0.InvalidEmail, 
    [l_VPCErrorCodesEnum_0.SenderFlooded] = l_VPCErrorCategoriesEnum_0.SenderFlooded, 
    [l_VPCErrorCodesEnum_0.ReceiverFlooded] = l_VPCErrorCategoriesEnum_0.ReceiverFlooded, 
    [l_VPCErrorCodesEnum_0.InvalidParameter] = l_VPCErrorCategoriesEnum_0.BadUserInput, 
    [l_VPCErrorCodesEnum_0.UpdateUserSettingRequestInvalid] = l_VPCErrorCategoriesEnum_0.BadUserInput, 
    [l_VPCErrorCodesEnum_0.AlreadyLinked] = l_VPCErrorCategoriesEnum_0.UserStateRecoursePathMismatch, 
    [l_VPCErrorCodesEnum_0.ChildAtLinkLimit] = l_VPCErrorCategoriesEnum_0.UserStateRecoursePathMismatch, 
    [l_VPCErrorCodesEnum_0.NoLinkedParents] = l_VPCErrorCategoriesEnum_0.UserStateRecoursePathMismatch, 
    [l_VPCErrorCodesEnum_0.SenderFloodedRequestCreated] = l_VPCErrorCategoriesEnum_0.SenderFloodedRequestCreated, 
    [l_VPCErrorCodesEnum_0.Unknown] = l_VPCErrorCategoriesEnum_0.InternalVPCError, 
    [l_VPCErrorCodesEnum_0.ServiceUnavailable] = l_VPCErrorCategoriesEnum_0.InternalVPCError, 
    [l_VPCErrorCodesEnum_0.IllegalState] = l_VPCErrorCategoriesEnum_0.InternalVPCError, 
    [l_VPCErrorCodesEnum_0.InvalidUserID] = l_VPCErrorCategoriesEnum_0.GenericError, 
    [l_VPCErrorCodesEnum_0.ConsentAlreadyApplied] = l_VPCErrorCategoriesEnum_0.GenericError, 
    [l_VPCErrorCodesEnum_0.ConsentAlreadyRequestedConflictingData] = l_VPCErrorCategoriesEnum_0.ConflictingPendingConsent, 
    [l_VPCErrorCodesEnum_0.ReceiverNotWhitelisted] = l_VPCErrorCategoriesEnum_0.GenericError, 
    [l_VPCErrorCodesEnum_0.InvalidComplianceFeature] = l_VPCErrorCategoriesEnum_0.GenericError, 
    [l_VPCErrorCodesEnum_0.ChildTooOld] = l_VPCErrorCategoriesEnum_0.GenericError, 
    [l_VPCErrorCodesEnum_0.UserForgotten] = l_VPCErrorCategoriesEnum_0.GenericError, 
    [l_VPCErrorCodesEnum_0.UnsupportedNotificationType] = l_VPCErrorCategoriesEnum_0.GenericError, 
    [l_VPCErrorCodesEnum_0.UnsupportedRequestType] = l_VPCErrorCategoriesEnum_0.GenericError, 
    [l_VPCErrorCodesEnum_0.ChildIneligibleForConsent] = l_VPCErrorCategoriesEnum_0.GenericError
};
local v9 = {
    [l_VPCErrorCategoriesEnum_0.InternalVPCError] = l_VPCRetryBehaviorEnum_0.RetryVPC, 
    [l_VPCErrorCategoriesEnum_0.InvalidEmail] = l_VPCRetryBehaviorEnum_0.RetryVPC, 
    [l_VPCErrorCategoriesEnum_0.Flooded] = l_VPCRetryBehaviorEnum_0.NoRetry, 
    [l_VPCErrorCategoriesEnum_0.SenderFlooded] = l_VPCRetryBehaviorEnum_0.NoRetry, 
    [l_VPCErrorCategoriesEnum_0.ReceiverFlooded] = l_VPCRetryBehaviorEnum_0.NoRetry, 
    [l_VPCErrorCategoriesEnum_0.BadUserInput] = l_VPCRetryBehaviorEnum_0.NoRetry, 
    [l_VPCErrorCategoriesEnum_0.UserStateRecoursePathMismatch] = l_VPCRetryBehaviorEnum_0.RetryAMP, 
    [l_VPCErrorCategoriesEnum_0.SenderFloodedRequestCreated] = l_VPCRetryBehaviorEnum_0.Success, 
    [l_VPCErrorCategoriesEnum_0.GenericError] = l_VPCRetryBehaviorEnum_0.NoRetry, 
    [l_VPCErrorCategoriesEnum_0.ConflictingPendingConsent] = l_VPCRetryBehaviorEnum_0.NoRetry
};
return {
    getStringsFromErrorCodeAndRetryNum = function(v10, v11) --[[ Line: 103 ]] --[[ Name: getStringsFromErrorCodeAndRetryNum ]]
        -- upvalues: l_VPCErrorCodesEnum_0 (copy), v6 (copy), v8 (copy), v7 (copy), l_VPCErrorCategoriesEnum_0 (copy), l_vpcErrorCategoryToMessageStrings_0 (copy)
        if v11 >= 4 then
            v10 = l_VPCErrorCodesEnum_0.SenderFlooded;
        end;
        local v12 = nil;
        v12 = if v6() then v8[v10] else v7[v10];
        if v12 == nil then
            v12 = l_VPCErrorCategoriesEnum_0.GenericError;
        end;
        return l_vpcErrorCategoryToMessageStrings_0[v12];
    end, 
    getRetryBehaviorFromErrorCodeAndRetryNum = function(v13, v14) --[[ Line: 84 ]] --[[ Name: getRetryBehaviorFromErrorCodeAndRetryNum ]]
        -- upvalues: l_VPCErrorCodesEnum_0 (copy), v6 (copy), v8 (copy), v7 (copy), l_VPCErrorCategoriesEnum_0 (copy), v9 (copy)
        if v14 >= 4 then
            v13 = l_VPCErrorCodesEnum_0.SenderFlooded;
        end;
        local v15 = nil;
        v15 = if v6() then v8[v13] else v7[v13];
        if v15 == nil then
            v15 = l_VPCErrorCategoriesEnum_0.GenericError;
        end;
        return v9[v15];
    end, 
    VPCErrorCategoriesEnum = l_VPCErrorCategoriesEnum_0, 
    VPCRetryBehaviorEnum = l_VPCRetryBehaviorEnum_0
};