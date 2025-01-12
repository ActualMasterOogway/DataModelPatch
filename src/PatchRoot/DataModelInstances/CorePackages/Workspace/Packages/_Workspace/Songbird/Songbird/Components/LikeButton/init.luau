local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local v1 = require(l_script_FirstAncestor_0.constants);
local v2 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local v4 = require(l_script_FirstAncestor_0.Parent.UIBlox);
local v5 = require(l_script_FirstAncestor_0.Parent.Foundation);
local l_useState_0 = v3.useState;
local l_ImageSetButton_0 = v4.Core.ImageSet.ImageSetButton;
local v8 = require(l_script_FirstAncestor_0.Flags.getFFlagSongbirdUseFoundationIconButton);
local v9 = {
    size = v1.ICON_SIZE
};
return function(v10) --[[ Line: 27 ]] --[[ Name: LikeButton ]]
    -- upvalues: v2 (copy), v9 (copy), l_useState_0 (copy), v8 (copy), v3 (copy), v5 (copy), l_ImageSetButton_0 (copy), v1 (copy)
    local v11 = v2.Dictionary.join(v9, v10);
    local v12, v13 = l_useState_0(1);
    local function v14() --[[ Line: 33 ]] --[[ Name: onInputStarted ]]
        -- upvalues: v13 (copy), v11 (copy)
        v13(0.9);
        if v11.onFavorite then
            v11.onFavorite();
        end;
    end;
    local function v15() --[[ Line: 40 ]] --[[ Name: onInputEnded ]]
        -- upvalues: v13 (copy)
        v13(1);
    end;
    if v8() then
        return (v3.createElement(v5.IconButton, {
            icon = v11.isFavorited and "icons/actions/heartOn" or "icons/actions/heartOff", 
            size = v5.Enums.IconSize.Medium, 
            onActivated = if v11.onFavorite then v11.onFavorite else function() --[[ Line: 48 ]]

            end
        }));
    else
        return (v3.createElement(l_ImageSetButton_0, {
            Image = if v11.isFavorited then v1.FILLED_FAVORITE_ICON else v1.OUTLINED_FAVORITE_ICON, 
            AutoButtonColor = false, 
            BackgroundTransparency = v12, 
            Size = v11.size, 
            ZIndex = 1, 
            [v3.Event.MouseButton1Down] = v14, 
            [v3.Event.TouchTap] = v14, 
            [v3.Event.InputEnded] = v15
        }, {
            UICorner = v3.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            })
        }));
    end;
end;