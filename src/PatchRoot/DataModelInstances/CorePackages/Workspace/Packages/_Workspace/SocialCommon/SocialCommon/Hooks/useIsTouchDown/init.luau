local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_Parent_1.React);
local l_useExternalEvent_0 = require(l_Parent_1.UIBlox).Core.Hooks.useExternalEvent;
local v5 = require(l_Parent_0.Utils.InputUtilities);
return function() --[[ Line: 13 ]]
    -- upvalues: v3 (copy), v5 (copy), l_useExternalEvent_0 (copy), l_UserInputService_0 (copy)
    local v6, v7 = v3.useState(false);
    local v9 = v3.useCallback(function(v8) --[[ Line: 16 ]]
        -- upvalues: v5 (ref), v7 (copy)
        if v5.isTouchInput(v8) then
            v7(true);
        end;
    end, {
        v7
    });
    local v11 = v3.useCallback(function(v10) --[[ Line: 22 ]]
        -- upvalues: v5 (ref), v7 (copy)
        if v5.isTouchInput(v10) then
            v7(false);
        end;
    end, {
        v7
    });
    l_useExternalEvent_0(l_UserInputService_0.InputBegan, v9);
    l_useExternalEvent_0(l_UserInputService_0.InputEnded, v11);
    return v6;
end;