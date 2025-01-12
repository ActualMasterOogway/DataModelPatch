local l_Parent_0 = script.Parent.Parent;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_enumerate_0 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptDeps).enumerate;
local v3 = require(l_Parent_0.Utils.addRawValueMethodToEnum);
local v4 = {};
local v5 = {
    None = "None", 
    ConfirmedU13PaymentModal = "ConfirmedU13PaymentModal", 
    ConfirmedU13MonthlyThreshold1Modal = "ConfirmedU13MonthlyThreshold1Modal", 
    ConfirmedU13MonthlyThreshold2Modal = "ConfirmedU13MonthlyThreshold2Modal", 
    ConfirmedParentalConsentWarningPaymentModal13To17 = "ConfirmedParentalConsentWarningPaymentModal13To17"
};
v4.UserActionType = l_enumerate_0(script.Name, v5);
v3(v4.UserActionType, v5);
v4.Post = function(v6, v7) --[[ Line: 22 ]] --[[ Name: Post ]]
    -- upvalues: v4 (copy)
    local v8 = v4.UserActionType.toRawValue(v7);
    return v6.postPurchaseWarningAcknowledge(v8);
end;
return v4;