local v0 = require(script.Parent.null);
return {
    isNillish = function(v1) --[[ Line: 3 ]] --[[ Name: isNillish ]]
        -- upvalues: v0 (copy)
        local v2 = true;
        if v1 ~= nil then
            v2 = v1 == v0;
        end;
        return v2;
    end, 
    isNotNillish = function(v3) --[[ Line: 7 ]] --[[ Name: isNotNillish ]]
        -- upvalues: v0 (copy)
        local v4 = false;
        if v3 ~= nil then
            v4 = v3 ~= v0;
        end;
        return v4;
    end
};