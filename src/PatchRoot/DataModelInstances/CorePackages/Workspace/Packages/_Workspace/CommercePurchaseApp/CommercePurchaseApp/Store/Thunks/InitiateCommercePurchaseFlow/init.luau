local l_script_FirstAncestor_0 = script:FindFirstAncestor("CommercePurchaseApp");
local l_CommerceService_0 = game:GetService("CommerceService");
local v2 = require(l_script_FirstAncestor_0.Store.Actions.CommercePurchaseFailed);
local v3 = require(l_script_FirstAncestor_0.Store.Actions.CommercePurchaseStarted);
local v4 = require(l_script_FirstAncestor_0.Store.Actions.CommercePurchaseCheckout);
local v5 = require(l_script_FirstAncestor_0.Store.Actions.CommercePurchaseEnded);
local v6 = require(l_script_FirstAncestor_0.Enums.ErrorCodeEnum);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v8 = require(l_Parent_0.ToastRodux);
local l_ToastType_0 = v8.Enums.ToastType;
local l_SetCurrentToastMessage_0 = v8.Actions.SetCurrentToastMessage;
local function _(v11) --[[ Line: 15 ]] --[[ Name: convertErrorMessageToErrorCode ]]
    -- upvalues: v6 (copy)
    if v11 == "NotPurchasable" then
        return v6.NotPurchasable;
    else
        return v6.Generic;
    end;
end;
local function v17(v13, v14, v15) --[[ Line: 23 ]] --[[ Name: handleError ]]
    -- upvalues: v6 (copy), l_SetCurrentToastMessage_0 (copy), l_ToastType_0 (copy), v5 (copy), v2 (copy)
    local v16 = if v13 == "NotPurchasable" then v6.NotPurchasable else v6.Generic;
    if v16 == v6.Generic then
        v14:dispatch(l_SetCurrentToastMessage_0({
            toastType = l_ToastType_0.NetworkingError, 
            toastTitle = v15
        }));
        v14:dispatch(v5());
        return;
    else
        v14:dispatch(v2(v16));
        return;
    end;
end;
return function(v18, v19) --[[ Line: 37 ]] --[[ Name: InitiateCommercePurchaseFlow ]]
    -- upvalues: v3 (copy), l_CommerceService_0 (copy), v4 (copy), v17 (copy)
    return function(v20) --[[ Line: 38 ]]
        -- upvalues: v3 (ref), v18 (copy), l_CommerceService_0 (ref), v4 (ref), v17 (ref), v19 (copy)
        v20:dispatch(v3(v18));
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 40 ]]
            -- upvalues: l_CommerceService_0 (ref), v18 (ref)
            return l_CommerceService_0:PrepareCommerceProductPurchase(v18);
        end);
        if l_status_0 then
            v20:dispatch(v4(l_result_0.CheckoutSessionId));
            return;
        else
            v17(l_result_0, v20, v19);
            return;
        end;
    end;
end;