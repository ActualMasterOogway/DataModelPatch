local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Promise);
local v2 = require(l_Parent_0.Utils.parseSubscriptionError);
local v3 = require(l_Parent_0.Flags.GetFFlagEnableRobloxCreditPurchase);
return function(v4, v5, v6) --[[ Line: 6 ]] --[[ Name: performSubscriptionPurchase ]]
    -- upvalues: v3 (copy), v1 (copy), v2 (copy)
    if v3() then
        return v4.performSubscriptionPurchase(v5, v6):catch(function(v7) --[[ Line: 8 ]]
            -- upvalues: v1 (ref), v2 (ref)
            return v1.reject(v2(v7));
        end);
    else
        return v4.DEPRECATED_performSubscriptionPurchase(v5):catch(function(v8) --[[ Line: 12 ]]
            -- upvalues: v1 (ref), v2 (ref)
            return v1.reject(v2(v8));
        end);
    end;
end;