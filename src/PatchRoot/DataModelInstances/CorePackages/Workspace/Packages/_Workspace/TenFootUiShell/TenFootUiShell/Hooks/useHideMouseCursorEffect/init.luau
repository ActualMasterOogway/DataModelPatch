local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script:FindFirstAncestor("TenFootUiShell").Parent;
local v2 = require(l_Parent_0.React);
return function() --[[ Line: 6 ]] --[[ Name: useHideMouseCursorEffect ]]
    -- upvalues: v2 (copy), l_UserInputService_0 (copy)
    v2.useEffect(function() --[[ Line: 7 ]]
        -- upvalues: l_UserInputService_0 (ref)
        l_UserInputService_0.MouseIconEnabled = false;
    end, {});
end;