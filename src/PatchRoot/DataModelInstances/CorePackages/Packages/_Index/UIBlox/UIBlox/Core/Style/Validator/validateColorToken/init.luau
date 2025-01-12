local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.t);
return v1.strictInterface({
    Color3 = v1.Color3, 
    Transparency = v1.numberConstrained(0, 1)
});