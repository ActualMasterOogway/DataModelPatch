local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local l_EventConnection_0 = require(l_Parent_1.ReactUtils).EventConnection;
local v4 = require(l_Parent_0.Core.Style.useStyle);
local l_RunService_0 = game:GetService("RunService");
return function() --[[ Line: 22 ]]
    -- upvalues: v4 (copy), v2 (copy), l_EventConnection_0 (copy), l_RunService_0 (copy)
    local v6 = v4();
    local l_SelectionCursor_0 = v6.Theme.SelectionCursor;
    local l_Settings_0 = v6.Settings;
    local v9, v10 = v2.useBinding(0);
    local v11, v12 = v2.useBinding(l_SelectionCursor_0.GradientColorSequence);
    local v13, v14 = v2.useBinding(l_SelectionCursor_0.GradientTransparencySequence);
    return v2.createElement(v2.Fragment, {}, {
        GradientChild = v2.createElement("UIGradient", {
            Rotation = v9, 
            Color = v11, 
            Transparency = v13
        }), 
        RenderSteppedConnection = v2.createElement(l_EventConnection_0, {
            event = l_RunService_0.RenderStepped, 
            callback = function() --[[ Line: 39 ]] --[[ Name: callback ]]
                -- upvalues: v9 (copy), l_SelectionCursor_0 (copy), l_Settings_0 (copy), v10 (copy), v12 (copy), v14 (copy)
                local v15 = v9:getValue() + l_SelectionCursor_0.GradientRotationSpeed;
                local l_GradientColorSequence_0 = l_SelectionCursor_0.GradientColorSequence;
                local l_GradientTransparencySequence_0 = l_SelectionCursor_0.GradientTransparencySequence;
                if l_Settings_0.ReducedMotion then
                    local v18 = (math.sin((math.rad(v15))) + 1) / 2;
                    local l_Value_0 = l_GradientColorSequence_0.Keypoints[1].Value;
                    local l_Value_1 = l_GradientColorSequence_0.Keypoints[#l_GradientColorSequence_0.Keypoints].Value;
                    l_GradientColorSequence_0 = ColorSequence.new(l_Value_0:lerp(l_Value_1, v18));
                    local l_Value_2 = l_GradientTransparencySequence_0.Keypoints[1].Value;
                    local l_Value_3 = l_GradientTransparencySequence_0.Keypoints[#l_GradientTransparencySequence_0.Keypoints].Value;
                    l_GradientTransparencySequence_0 = NumberSequence.new(l_Value_2 + (l_Value_3 - l_Value_2) * v18);
                end;
                v10(v15);
                v12(l_GradientColorSequence_0);
                v14(l_GradientTransparencySequence_0);
            end
        })
    });
end;