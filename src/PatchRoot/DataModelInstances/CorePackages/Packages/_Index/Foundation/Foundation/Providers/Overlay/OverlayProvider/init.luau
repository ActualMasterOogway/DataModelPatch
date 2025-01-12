local l_CoreGui_0 = game:GetService("CoreGui");
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local v3 = if l_Players_0.LocalPlayer and l_RunService_0:IsRunning() then l_Players_0.LocalPlayer:WaitForChild("PlayerGui", 3) else nil;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v6 = require(l_script_FirstAncestor_0.Utility.isCoreGui);
local v7 = require(script.Parent.OverlayContext);
local v8 = require(l_Parent_0.React);
local v9 = require(l_Parent_0.ReactRoblox);
local v10 = if v6 then l_CoreGui_0 else v3;
return function(v11) --[[ Line: 24 ]] --[[ Name: OverlayProvider ]]
    -- upvalues: v8 (copy), v7 (copy), v10 (copy), v9 (copy)
    local v12, v13 = v8.useState(v11.gui);
    local v15 = v8.useCallback(function(v14) --[[ Line: 27 ]]
        -- upvalues: v13 (copy)
        v13(v14);
    end, {});
    v8.useEffect(function() --[[ Line: 31 ]]
        -- upvalues: v11 (copy), v13 (copy)
        if v11.gui ~= nil then
            v13(v11.gui);
        end;
    end, {
        v11.gui
    });
    return v8.createElement(v7.Provider, {
        value = {
            overlay = v12
        }
    }, {
        FoundationOverlay = if not v11.gui and v10 then v9.createPortal(v8.createElement("ScreenGui", {
            Enabled = true, 
            DisplayOrder = 1e999, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets, 
            ref = v15
        }), v10) else nil, 
        Children = v8.createElement(v8.Fragment, nil, v11.children)
    });
end;