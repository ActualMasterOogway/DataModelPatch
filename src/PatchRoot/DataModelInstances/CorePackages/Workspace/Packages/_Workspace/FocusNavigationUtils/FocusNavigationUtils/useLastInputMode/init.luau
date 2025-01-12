local l_script_FirstAncestor_0 = script:FindFirstAncestor("FocusNavigationUtils");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(script.Parent.useLastInputMethod);
local v5 = require(script.Parent.useFocusedTextBox);
local l_VRService_0 = require(l_Parent_0.MockableProxyServices).VRService;
local v7 = game:DefineFastFlag("VariableKeyboardFocusMode", false);
local v8 = {
    Keyboard = "Focus", 
    Gamepad = "Focus", 
    Mouse = "Cursor", 
    Touch = "Cursor", 
    None = "None"
};
local v9 = {
    [Enum.KeyCode.Up] = true, 
    [Enum.KeyCode.Down] = true, 
    [Enum.KeyCode.Left] = true, 
    [Enum.KeyCode.Right] = true, 
    [Enum.KeyCode.W] = true, 
    [Enum.KeyCode.A] = true, 
    [Enum.KeyCode.S] = true, 
    [Enum.KeyCode.D] = true, 
    [Enum.KeyCode.Escape] = true, 
    [Enum.KeyCode.Tab] = true
};
return function() --[[ Line: 38 ]]
    -- upvalues: v4 (copy), v7 (copy), v8 (copy), v5 (copy), v3 (copy), l_UserInputService_0 (copy), v9 (copy), l_VRService_0 (copy)
    local v10 = v4();
    if v7 then
        local v11 = v8[v10];
        local v12 = v5();
        local v13, v14 = v3.useState(v11 == "Focus");
        local v15 = v3.useRef(v11);
        v3.useEffect(function() --[[ Line: 48 ]]
            -- upvalues: l_UserInputService_0 (ref), v9 (ref), v12 (copy), v14 (copy)
            local v17 = l_UserInputService_0.InputBegan:Connect(function(v16) --[[ Line: 49 ]]
                -- upvalues: v9 (ref), v12 (ref), v14 (ref)
                if v9[v16.KeyCode] and v12 == nil then
                    v14(true);
                    return;
                else
                    v14(false);
                    return;
                end;
            end);
            return function() --[[ Line: 57 ]]
                -- upvalues: v17 (copy)
                v17:Disconnect();
            end;
        end, {
            v12
        });
        if l_VRService_0.VREnabled then
            v11 = "Cursor";
        elseif v10 == "Keyboard" then
            v11 = (not not v13 or v15.current == "Focus") and "Focus" or "Cursor";
        end;
        v15.current = v11;
        return v11;
    elseif l_VRService_0.VREnabled then
        return "Cursor";
    else
        return v8[v10];
    end;
end;