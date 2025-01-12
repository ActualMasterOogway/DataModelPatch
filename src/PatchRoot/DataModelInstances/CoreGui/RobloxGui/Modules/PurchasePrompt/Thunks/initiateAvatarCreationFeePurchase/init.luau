local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Actions.RequestAvatarCreationFeePurchase);
local v2 = require(l_Parent_0.Promise);
local v3 = require(l_Parent_0.Thunk);
local v4 = require(l_Parent_0.Services.Network);
local v5 = require(l_Parent_0.Services.ExternalSettings);
local v6 = require(l_Parent_0.Network.getBalanceInfo);
local v7 = require(l_Parent_0.Network.getAccountInfo);
local v8 = require(l_Parent_0.Actions.ErrorOccurred);
local v9 = require(script.Parent.resolvePromptState);
local v10 = {
    v4, 
    v5
};
return function(v11, v12, v13, v14) --[[ Line: 24 ]] --[[ Name: initiateAvatarCreationFeePurchase ]]
    -- upvalues: v3 (copy), v10 (copy), v4 (copy), v5 (copy), v1 (copy), v2 (copy), v7 (copy), v6 (copy), v9 (copy), v8 (copy)
    return v3.new(script.Name, v10, function(v15, v16) --[[ Line: 25 ]]
        -- upvalues: v4 (ref), v5 (ref), v1 (ref), v13 (copy), v12 (copy), v2 (ref), v7 (ref), v6 (ref), v14 (copy), v11 (copy), v9 (ref), v8 (ref)
        local v17 = v16[v4];
        local v18 = v16[v5];
        v15:dispatch(v1(v13, v12));
        return v2.all({
            accountInfo = v7(v17, v18), 
            balanceInfo = v6(v17, v18)
        }):andThen(function(v19) --[[ Line: 35 ]]
            -- upvalues: v14 (ref), v11 (ref), v15 (copy), v9 (ref)
            local v20 = {
                PriceInRobux = v14, 
                Name = v11.name, 
                Description = v11.description
            };
            v15:dispatch(v9(v20, v19.accountInfo, v19.balanceInfo, false, true, v14));
        end):catch(function(v21) --[[ Line: 50 ]]
            -- upvalues: v15 (copy), v8 (ref)
            v15:dispatch(v8(v21));
        end);
    end);
end;