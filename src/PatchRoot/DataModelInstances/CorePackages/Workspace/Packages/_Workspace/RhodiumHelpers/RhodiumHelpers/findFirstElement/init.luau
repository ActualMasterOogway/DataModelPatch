local l_Parent_0 = script.Parent.Parent;
local l_Element_0 = require(l_Parent_0.Rhodium).Element;
local l_findFirstInstance_0 = require(l_Parent_0.TestUtils).findFirstInstance;
return function(v3, v4) --[[ Line: 17 ]]
    -- upvalues: l_findFirstInstance_0 (copy), l_Element_0 (copy)
    local v5 = l_findFirstInstance_0(v3, v4);
    if v5 then
        return l_Element_0.new("game." .. v5:GetFullName());
    else
        return nil;
    end;
end;