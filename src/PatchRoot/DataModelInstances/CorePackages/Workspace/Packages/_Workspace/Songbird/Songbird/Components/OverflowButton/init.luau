local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local v1 = require(l_script_FirstAncestor_0.constants);
local v2 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v3 = require(l_script_FirstAncestor_0.Parent.Foundation);
local v4 = require(l_script_FirstAncestor_0.Parent.React);
local v5 = require(l_script_FirstAncestor_0.Parent.UIBlox);
local l_useState_0 = v4.useState;
local l_ImageSetButton_0 = v5.Core.ImageSet.ImageSetButton;
local v8 = require(l_script_FirstAncestor_0.Flags.getFFlagSongbirdUseFoundationIconButton);
local v9 = {
    size = v1.ICON_SIZE
};
return function(v10) --[[ Line: 26 ]] --[[ Name: OverflowButton ]]
    -- upvalues: v2 (copy), v9 (copy), l_useState_0 (copy), v8 (copy), v4 (copy), v3 (copy), l_ImageSetButton_0 (copy), v1 (copy)
    local v11 = v2.Dictionary.join(v9, v10);
    local v12, v13 = l_useState_0(1);
    local function v14() --[[ Line: 32 ]] --[[ Name: onInputStarted ]]
        -- upvalues: v13 (copy), v11 (copy)
        v13(0.9);
        if v11.onActivated then
            v11.onActivated();
        end;
    end;
    local function v15() --[[ Line: 39 ]] --[[ Name: onInputEnded ]]
        -- upvalues: v13 (copy)
        v13(1);
    end;
    if v8() then
        return (v4.createElement(v3.IconButton, {
            icon = "icons/common/overflow", 
            size = v3.Enums.IconSize.Medium, 
            onActivated = if v11.onActivated then v11.onActivated else function() --[[ Line: 47 ]]

            end
        }));
    else
        return (v4.createElement(l_ImageSetButton_0, {
            Image = v1.OVERFLOW_ICON, 
            AutoButtonColor = false, 
            BackgroundTransparency = v12, 
            Size = v11.size, 
            ZIndex = 1, 
            [v4.Event.MouseButton1Down] = v14, 
            [v4.Event.TouchTap] = v14, 
            [v4.Event.InputEnded] = v15
        }, {
            UICorner = v4.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            })
        }));
    end;
end;