local l_Parent_0 = script.Parent.Parent;
local l_UserInputService_0 = game:GetService("UserInputService");
local v2 = require(l_Parent_0.Enums.UpsellFlow);
local v3 = require(l_Parent_0.NativeUpsell.getUpsellFlow);
return function() --[[ Line: 8 ]]
    -- upvalues: l_UserInputService_0 (copy), v3 (copy), v2 (copy)
    local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
    return v3(l_l_UserInputService_0_Platform_0) == v2.Web;
end;