local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Actions.ErrorOccurred);
local v2 = require(l_Parent_0.Actions.PurchaseCompleteRecieved);
local _ = require(l_Parent_0.Actions.SetWindowState);
local v4 = require(l_Parent_0.Actions.SetPromptState);
local v5 = require(l_Parent_0.Enums.PromptState);
local _ = require(l_Parent_0.Enums.WindowState);
local v7 = require(l_Parent_0.Network.performSubscriptionPurchase);
local v8 = require(l_Parent_0.Services.ExternalSettings);
local v9 = require(l_Parent_0.Services.Network);
local v10 = require(l_Parent_0.Thunk);
local v11 = require(l_Parent_0.Thunks.hideWindow);
local v12 = {
    v8, 
    v9
};
return function(v13) --[[ Line: 19 ]] --[[ Name: launchSubscriptionPurchase ]]
    -- upvalues: v10 (copy), v12 (copy), v8 (copy), v9 (copy), v2 (copy), v11 (copy), v7 (copy), v1 (copy), v4 (copy), v5 (copy)
    return v10.new(script.Name, v12, function(v14, v15) --[[ Line: 20 ]]
        -- upvalues: v8 (ref), v9 (ref), v2 (ref), v11 (ref), v7 (ref), v13 (copy), v1 (ref), v4 (ref), v5 (ref)
        local v16 = v15[v8];
        local v17 = v15[v9];
        if v16.isStudio() then
            v14:dispatch(v2());
            v14:dispatch(v11());
            return nil;
        else
            v7(v17, v14:getState().promptRequest.id, v13):catch(function(v18) --[[ Line: 31 ]]
                -- upvalues: v14 (copy), v1 (ref)
                v14:dispatch(v1(v18));
            end);
            v14:dispatch(v4(v5.UpsellInProgress));
            v14:dispatch(v11());
            return nil;
        end;
    end);
end;