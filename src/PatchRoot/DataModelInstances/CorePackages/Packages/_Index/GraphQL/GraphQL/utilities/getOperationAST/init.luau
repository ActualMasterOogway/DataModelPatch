local _ = require(script.Parent.Parent.language.ast);
local l_Kind_0 = require(script.Parent.Parent.language.kinds).Kind;
return {
    getOperationAST = function(v2, v3) --[[ Line: 21 ]] --[[ Name: getOperationAST ]]
        -- upvalues: l_Kind_0 (copy)
        local v4 = nil;
        for _, v6 in pairs(v2.definitions) do
            if v6.kind == l_Kind_0.OPERATION_DEFINITION then
                if v3 == nil then
                    if v4 then
                        return nil;
                    else
                        v4 = v6;
                    end;
                elseif v6.name and v6.name.value == v3 then
                    return v6;
                end;
            end;
        end;
        return v4;
    end
};