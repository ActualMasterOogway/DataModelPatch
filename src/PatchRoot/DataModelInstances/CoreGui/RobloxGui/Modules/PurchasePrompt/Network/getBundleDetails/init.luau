local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Enums.PurchaseError);
local v2 = require(l_Parent_0.Promise);
return function(v3, v4) --[[ Line: 6 ]] --[[ Name: getBundleDetails ]]
    -- upvalues: v2 (copy), v1 (copy)
    return v3.getBundleDetails(v4):andThen(function(v5) --[[ Line: 8 ]]
        -- upvalues: v2 (ref)
        return v2.resolve(v5);
    end):catch(function(_) --[[ Line: 11 ]]
        -- upvalues: v2 (ref), v1 (ref)
        return v2.reject(v1.UnknownFailure);
    end);
end;