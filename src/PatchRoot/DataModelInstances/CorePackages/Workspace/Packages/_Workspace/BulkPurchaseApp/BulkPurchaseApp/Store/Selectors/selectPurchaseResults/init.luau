local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local v1 = require(l_script_FirstAncestor_0.Store.Selectors.selectRobuxSpent);
local v2 = require(l_script_FirstAncestor_0.Store.Selectors.selectResultItems);
local _ = require(l_script_FirstAncestor_0.Store.Types);
return function(v4) --[[ Line: 14 ]] --[[ Name: selectPurchaseResults ]]
    -- upvalues: v1 (copy), v2 (copy)
    return {
        RobuxSpent = v1(v4), 
        Items = v2(v4)
    };
end;