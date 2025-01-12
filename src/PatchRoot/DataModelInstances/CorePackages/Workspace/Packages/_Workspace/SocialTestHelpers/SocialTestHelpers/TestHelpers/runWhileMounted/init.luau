local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTestHelpers");
local l_Roact_0 = require(l_script_FirstAncestor_0.dependencies).Roact;
return function(v2, v3) --[[ Line: 16 ]] --[[ Name: runWhileMounted ]]
    -- upvalues: l_Roact_0 (copy)
    local l_ScreenGui_0 = Instance.new("ScreenGui");
    l_ScreenGui_0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
    l_ScreenGui_0.Parent = game:GetService("CoreGui");
    local v5 = l_Roact_0.mount(v2, l_ScreenGui_0);
    v3(l_ScreenGui_0);
    l_Roact_0.unmount(v5);
end;