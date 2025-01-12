local l_Parent_0 = script.Parent.Parent;
local _ = game:GetService("UserInputService");
local v2 = require(l_Parent_0.Enums.PurchaseError);
local v3 = require(l_Parent_0.Promise);
return function(v4, v5) --[[ Line: 9 ]] --[[ Name: getBalanceInfo ]]
    -- upvalues: v3 (copy), v2 (copy)
    return v4.getBalanceInfo():andThen(function(v6) --[[ Line: 11 ]]
        -- upvalues: v5 (copy), v3 (ref)
        if v5.isStudio() then
            v6.robux = 2147483647;
        end;
        return v3.resolve(v6);
    end):catch(function(_) --[[ Line: 22 ]]
        -- upvalues: v3 (ref), v2 (ref)
        return v3.reject(v2.UnknownFailure);
    end);
end;