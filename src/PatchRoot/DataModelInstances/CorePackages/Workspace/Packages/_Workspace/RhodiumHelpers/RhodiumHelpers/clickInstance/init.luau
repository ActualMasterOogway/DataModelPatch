local l_Parent_0 = script.Parent.Parent;
local l_Element_0 = require(l_Parent_0.Rhodium).Element;
return function(v2, v3) --[[ Line: 7 ]]
    -- upvalues: l_Element_0 (copy)
    local v4 = l_Element_0.new(v2);
    if v3 then
        v4:clickWithoutValidation();
    else
        v4:click();
    end;
    wait(0);
end;