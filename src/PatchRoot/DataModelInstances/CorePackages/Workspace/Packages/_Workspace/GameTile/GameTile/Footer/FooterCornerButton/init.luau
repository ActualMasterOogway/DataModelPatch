local l_Parent_0 = script:FindFirstAncestor("GameTile").Parent;
local v1 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v3 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v3.Hooks.useTokens;
local l_useMemo_0 = v1.useMemo;
local l_useState_0 = v1.useState;
local l_FFlagFixEventTileDesign_0 = require(l_Parent_0.SharedFlags).FFlagFixEventTileDesign;
local l_GetFFlagLuaAppEnableFoundationColors_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableFoundationColors;
local l_Image_0 = v3.Image;
local v10 = require(script.Parent.FooterCornerButtonStyle);
return function(v11) --[[ Line: 25 ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useTokens_0 (copy), l_useState_0 (copy), l_useMemo_0 (copy), v10 (copy), l_FFlagFixEventTileDesign_0 (copy), l_GetFFlagLuaAppEnableFoundationColors_0 (copy), v1 (copy), l_Image_0 (copy)
    local v12 = l_useDesignTokens_0();
    local v13 = l_useTokens_0();
    local v14, v15 = l_useState_0(false);
    local l_Size_500_0 = v12.Global.Size_500;
    local v18 = l_useMemo_0(function() --[[ Line: 32 ]]
        -- upvalues: l_Size_500_0 (copy), v14 (copy), v11 (copy)
        local v17 = UDim2.new(0, l_Size_500_0, 0, l_Size_500_0);
        if v14 and not v11.disabled then
            return v17 + UDim2.new(0, 2, 0, 2);
        else
            return v17;
        end;
    end, {
        v14, 
        v11.disabled
    });
    local v19 = l_useMemo_0(function() --[[ Line: 40 ]]
        -- upvalues: v11 (copy), v10 (ref)
        if v11.buttonStyle == v10.Follow then
            return "icons/common/notificationOff";
        elseif v11.buttonStyle == v10.Following then
            return "icons/common/notificationOn";
        else
            return "icons/common/play";
        end;
    end, {
        v11.buttonStyle
    });
    local v20 = l_FFlagFixEventTileDesign_0 and l_GetFFlagLuaAppEnableFoundationColors_0();
    local v21 = l_useMemo_0(function() --[[ Line: 51 ]]
        -- upvalues: v11 (copy), v10 (ref), v20 (copy), v13 (copy), v12 (copy)
        if v11.buttonStyle == v10.Follow then
            if v20 then
                return v13.Inverse.Content.Default.Color3;
            else
                return v12.Semantic.Color.Ui.Default.Color3;
            end;
        elseif v11.buttonStyle == v10.Following then
            if v20 then
                return v13.Color.ActionSubEmphasis.Background.Color3;
            else
                return v12.Semantic.Color.Ui.Emphasis.Color3;
            end;
        else
            return v12.Semantic.Color.Action.PrimaryBrand.Background.Color3;
        end;
    end, {
        v11.buttonStyle
    });
    local v22 = l_useMemo_0(function() --[[ Line: 64 ]]
        -- upvalues: v11 (copy), v10 (ref), v12 (copy)
        if v11.buttonStyle == v10.Follow then
            return v12.Semantic.Color.Text.Emphasis;
        elseif v11.buttonStyle == v10.Following then
            return v12.Semantic.Color.BackgroundUi.Default;
        else
            return v12.Semantic.Color.Action.PrimaryBrand.Content;
        end;
    end, {
        v11.buttonStyle
    });
    return v1.createElement("Frame", {
        Size = UDim2.new(0, l_Size_500_0 + v12.Global.Size_150, 1, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = 2
    }, {
        EventButton = v1.createElement("TextButton", {
            Size = v18, 
            Position = UDim2.new(0, l_Size_500_0 / 2, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            AutoButtonColor = false, 
            BackgroundColor3 = v21, 
            BackgroundTransparency = v11.disabled and 0.5 or 0, 
            Text = "", 
            [v1.Event.MouseEnter] = function() --[[ Line: 86 ]]
                -- upvalues: v15 (copy)
                v15(true);
            end, 
            [v1.Event.MouseLeave] = function() --[[ Line: 89 ]]
                -- upvalues: v15 (copy)
                v15(false);
            end, 
            [v1.Event.Activated] = v11.onActivated
        }, {
            Icon = v1.createElement(l_Image_0, {
                Image = v19, 
                Size = UDim2.new(0, v12.Global.Size_250, 0, v12.Global.Size_250), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                imageStyle = v22
            }), 
            Corners = v1.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0)
            })
        })
    });
end;