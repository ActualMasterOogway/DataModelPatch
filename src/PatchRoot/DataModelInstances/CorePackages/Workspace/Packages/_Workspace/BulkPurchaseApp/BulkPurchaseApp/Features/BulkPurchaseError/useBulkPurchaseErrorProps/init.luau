local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v6 = require(l_script_FirstAncestor_0.Store.Actions.BulkPurchaseEnded);
local v7 = require(l_script_FirstAncestor_0.Store.Selectors.selectPurchaseResults);
local v8 = require(l_script_FirstAncestor_0.Store.Selectors.selectErrorCode);
local _ = require(l_script_FirstAncestor_0.Enums.ErrorCodeEnum);
local _ = require(script.Parent.BulkPurchaseError);
return function() --[[ Line: 15 ]] --[[ Name: useBulkPurchaseErrorProps ]]
    -- upvalues: l_useSelector_0 (copy), v7 (copy), v8 (copy), l_useDispatch_0 (copy), v3 (copy), l_MarketplaceService_0 (copy), v6 (copy)
    local v11 = l_useSelector_0(v7);
    local v12 = l_useSelector_0(v8);
    local v13 = l_useDispatch_0();
    return {
        onDismiss = v3.useCallback(function() --[[ Line: 20 ]]
            -- upvalues: l_MarketplaceService_0 (ref), v11 (copy), v13 (copy), v6 (ref)
            l_MarketplaceService_0:signalPromptBulkPurchaseFinished(3, v11);
            v13(v6());
        end, {
            v11, 
            v13
        }), 
        errorCode = v12
    };
end;