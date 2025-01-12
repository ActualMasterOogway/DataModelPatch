local l_Parent_0 = script.Parent.Parent;
local l_Players_0 = game:GetService("Players");
local v2 = require(l_Parent_0.Enums.PurchaseError);
local v3 = require(l_Parent_0.Promise);
return function(v4, v5, v6) --[[ Line: 7 ]] --[[ Name: getIsAlreadyOwned ]]
    -- upvalues: l_Players_0 (copy), v3 (copy), v2 (copy)
    return v4.getPlayerOwns(l_Players_0.LocalPlayer, v5, v6):catch(function(_) --[[ Line: 9 ]]
        -- upvalues: v3 (ref), v2 (ref)
        return v3.reject(v2.UnknownFailure);
    end);
end;