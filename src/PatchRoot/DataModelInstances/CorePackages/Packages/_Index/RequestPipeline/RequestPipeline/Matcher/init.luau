local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.HttpServiceMock);
local v2 = require(l_Parent_0.Expect);
local v3 = require(l_Parent_0.JestDiff);
local function v4() --[[ Line: 12 ]] --[[ Name: returnTrue ]]
    return true;
end;
local function v6(v5) --[[ Line: 16 ]] --[[ Name: noColor ]]
    return v5;
end;
local v7 = {};
local v8 = {
    __index = v7
};
v7.fromFilter = function(v9) --[[ Line: 34 ]] --[[ Name: fromFilter ]]
    -- upvalues: v8 (copy)
    return (setmetatable({
        name = "Anonymous matcher", 
        _filter = v9
    }, v8));
end;
v7.all = function() --[[ Line: 41 ]] --[[ Name: all ]]
    -- upvalues: v7 (copy), v4 (copy)
    return v7.fromFilter(v4);
end;
v7.matching = function(v10) --[[ Line: 45 ]] --[[ Name: matching ]]
    -- upvalues: v2 (copy), v7 (copy), v3 (copy), v6 (copy)
    local v11 = v2.objectContaining(v10);
    v11.getExpectedType = function(_) --[[ Line: 47 ]] --[[ Name: getExpectedType ]]
        return "table";
    end;
    return v7.fromFilter(function(v13) --[[ Line: 51 ]]
        -- upvalues: v11 (copy), v3 (ref), v6 (ref)
        if v11:asymmetricMatch(v13) then
            return true;
        else
            return false, v3.diff(v11, v13, {
                aAnnotation = "Expected a request that matches", 
                aColor = v6, 
                aIndicator = "-", 
                bAnnotation = "Received request", 
                bColor = v6, 
                bIndicator = "+", 
                changeColor = v6, 
                changeLineTrailingSpaceColor = v6, 
                commonColor = v6, 
                commonLineTrailingSpaceColor = v6, 
                patchColor = v6
            });
        end;
    end);
end;
v7.matches = function(v14, v15) --[[ Line: 75 ]] --[[ Name: matches ]]
    local v16, v17 = v14._filter(v15);
    if v16 then
        return {
            success = v16
        };
    else
        return {
            success = v16, 
            reason = v17
        };
    end;
end;
return v7;