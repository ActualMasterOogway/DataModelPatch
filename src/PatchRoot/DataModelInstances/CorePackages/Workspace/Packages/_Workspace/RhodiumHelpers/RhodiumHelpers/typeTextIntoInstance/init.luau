local l_Parent_0 = script.Parent.Parent;
local l_Element_0 = require(l_Parent_0.Rhodium).Element;
local v2 = require(script.Parent.typeTextIntoElement);
return function(v3, v4) --[[ Line: 11 ]]
    -- upvalues: l_Element_0 (copy), v2 (copy)
    local v5 = l_Element_0.new(v3);
    v2(v5, v4);
end;