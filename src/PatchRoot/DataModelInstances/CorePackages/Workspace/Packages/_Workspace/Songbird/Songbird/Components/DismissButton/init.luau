local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v2 = require(l_script_FirstAncestor_0.Parent.Foundation);
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local v4 = require(l_script_FirstAncestor_0.Parent.UIBlox);
local l_useState_0 = v3.useState;
local v6 = require(l_script_FirstAncestor_0.constants);
local v7 = require(l_script_FirstAncestor_0.Hooks.useLocalUserId);
local v8 = require(l_script_FirstAncestor_0.Analytics.AnalyticActions);
local v9 = require(l_script_FirstAncestor_0.Analytics.sendAnalytics);
local l_ImageSetButton_0 = v4.Core.ImageSet.ImageSetButton;
local v11 = require(l_script_FirstAncestor_0.Flags.getFFlagUseResizedDismissIcon);
local v12 = require(l_script_FirstAncestor_0.Flags.getFFlagSongbirdUseFoundationIconButton);
local v13 = {
    size = v6.ICON_SIZE, 
    icon = "icons/navigation/close", 
    iconSize = v2.Enums.IconSize.Medium
};
return function(v14) --[[ Line: 36 ]] --[[ Name: DismissButton ]]
    -- upvalues: v1 (copy), v13 (copy), v7 (copy), l_useState_0 (copy), v9 (copy), v8 (copy), v12 (copy), v3 (copy), v2 (copy), v11 (copy), l_ImageSetButton_0 (copy), v6 (copy)
    local v15 = v1.Dictionary.join(v13, v14);
    local v16 = v7();
    local v17, v18 = l_useState_0(1);
    local function v19() --[[ Line: 43 ]] --[[ Name: onInputStarted ]]
        -- upvalues: v18 (copy), v16 (copy), v9 (ref), v8 (ref), v15 (copy)
        v18(0.9);
        if v16 > 0 then
            v9({
                userId = v16, 
                action = v8.UserDismiss
            });
        end;
        if v15.onDismiss then
            v15.onDismiss();
        end;
    end;
    local function v20() --[[ Line: 58 ]] --[[ Name: onInputEnded ]]
        -- upvalues: v18 (copy)
        v18(1);
    end;
    if v12() then
        return (v3.createElement(v2.IconButton, {
            icon = v15.icon, 
            layoutOrder = v15.layoutOrder, 
            size = v15.iconSize, 
            onActivated = if v15.onDismiss then v15.onDismiss else function() --[[ Line: 67 ]]

            end, 
            ZIndex = 1
        }));
    elseif v11() then
        return (v3.createElement("Frame", {
            Size = v15.size, 
            BackgroundTransparency = 1, 
            ZIndex = 1
        }, {
            Icon = v3.createElement(l_ImageSetButton_0, {
                Image = v6.CLOSE_ICON, 
                AutoButtonColor = false, 
                BackgroundTransparency = v17, 
                Size = UDim2.fromOffset(30, 30), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                [v3.Event.MouseButton1Down] = v19, 
                [v3.Event.TouchTap] = v19, 
                [v3.Event.InputEnded] = v20
            }, {
                UICorner = v3.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                })
            })
        }));
    else
        return (v3.createElement(l_ImageSetButton_0, {
            Image = v6.CLOSE_ICON, 
            AutoButtonColor = false, 
            BackgroundTransparency = v17, 
            Size = v15.size, 
            ZIndex = 1, 
            [v3.Event.MouseButton1Down] = v19, 
            [v3.Event.TouchTap] = v19, 
            [v3.Event.InputEnded] = v20
        }, {
            UICorner = v3.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            })
        }));
    end;
end;