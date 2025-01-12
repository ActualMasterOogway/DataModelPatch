local l_CommerceService_0 = game:GetService("CommerceService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("CommercePurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v7 = require(l_script_FirstAncestor_0.Enums.CommercePurchasePromptStateEnum);
local v8 = require(l_script_FirstAncestor_0.Store.Selectors.selectPromptState);
local v9 = require(l_script_FirstAncestor_0.Store.Thunks.InitiateCommercePurchaseFlow);
return function() --[[ Line: 14 ]] --[[ Name: useCommercePurchaseRequestListenerEffect ]]
    -- upvalues: l_useDispatch_0 (copy), l_useSelector_0 (copy), v8 (copy), l_useLocalization_0 (copy), v3 (copy), l_CommerceService_0 (copy), v7 (copy), v9 (copy)
    local v10 = l_useDispatch_0();
    local v11 = l_useSelector_0(v8);
    local v12 = l_useLocalization_0({
        genericError = "CoreScripts.CommercePurchasePrompt.ErrorPrompt.GenericError"
    });
    v3.useEffect(function() --[[ Line: 20 ]]
        -- upvalues: v10 (copy), l_CommerceService_0 (ref), v11 (copy), v7 (ref), v9 (ref), v12 (copy)
        local v13 = nil;
        if v10 then
            v13 = l_CommerceService_0.PromptCommerceProductPurchaseRequested:Connect(function(v14) --[[ Line: 24 ]]
                -- upvalues: v11 (ref), v7 (ref), v10 (ref), v9 (ref), v12 (ref)
                if v11 == v7.None then
                    v10(v9(v14, v12.genericError));
                end;
            end);
        end;
        return function() --[[ Line: 31 ]]
            -- upvalues: v13 (ref)
            if v13 then
                v13:Disconnect();
                v13 = nil;
            end;
        end;
    end, {
        v10, 
        v12
    });
end;