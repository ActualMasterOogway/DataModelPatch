local l_Parent_0 = script:FindFirstAncestor("VirtualEvents").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Style);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v4 = require(l_Parent_0.Foundation);
local l_useDesignTokens_0 = v2.useDesignTokens;
local l_useTokens_0 = v4.Hooks.useTokens;
local l_FFlagFixEventTileDesign_0 = require(l_Parent_0.SharedFlags).FFlagFixEventTileDesign;
local l_GetFFlagLuaAppEnableFoundationColors_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableFoundationColors;
local l_FooterCornerButtonStyle_0 = require(l_Parent_0.GameTile).FooterCornerButtonStyle;
return function(v10) --[[ Line: 22 ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useTokens_0 (copy), l_useLocalization_0 (copy), l_FFlagFixEventTileDesign_0 (copy), l_GetFFlagLuaAppEnableFoundationColors_0 (copy), l_FooterCornerButtonStyle_0 (copy), v1 (copy)
    local v11 = l_useDesignTokens_0();
    local v12 = l_useTokens_0();
    local v13 = l_useLocalization_0({
        notifyMe = "Feature.VirtualEvents.NotifyMe", 
        unfollowEvent = "Feature.VirtualEvents.UnfollowEvent", 
        joinEvent = "Feature.VirtualEvents.JoinEvent"
    });
    local v14 = l_FFlagFixEventTileDesign_0 and l_GetFFlagLuaAppEnableFoundationColors_0();
    local l_Color3_0 = v11.Semantic.Color.Action.PrimaryBrand.Background.Color3;
    local l_Color3_1 = v11.Semantic.Color.Action.PrimaryBrand.Content.Color3;
    local l_joinEvent_0 = v13.joinEvent;
    if v10.buttonStyle == l_FooterCornerButtonStyle_0.Follow then
        if v14 then
            l_Color3_0 = v12.Color.ActionSubEmphasis.Background.Color3;
            l_Color3_1 = v12.Color.ActionSubEmphasis.Foreground.Color3;
        else
            l_Color3_0 = v11.Semantic.Color.Ui.Default.Color3;
            l_Color3_1 = v11.Semantic.Color.Text.Emphasis.Color3;
        end;
        l_joinEvent_0 = v13.notifyMe;
    elseif v10.buttonStyle == l_FooterCornerButtonStyle_0.Following then
        if v14 then
            l_Color3_1 = v12.Color.ActionStandard.Foreground.Color3;
        else
            l_Color3_0 = v11.Semantic.Color.Ui.Emphasis.Color3;
            l_Color3_1 = v11.Semantic.Color.BackgroundUi.Default.Color3;
        end;
        l_joinEvent_0 = v13.unfollowEvent;
    end;
    local v18 = v10.buttonStyle == l_FooterCornerButtonStyle_0.Following;
    local v19 = v10.disabled and 0.5 or 0;
    return v1.createElement("TextButton", {
        Size = UDim2.new(1, 0, 0, v11.Global.Size_350), 
        Position = UDim2.new(0, 0, 1, 0), 
        AnchorPoint = Vector2.new(0, 1), 
        TextSize = v11.Global.Size_175, 
        Font = v11.Semantic.Typography.Header.Font, 
        BackgroundColor3 = l_Color3_0, 
        TextColor3 = l_Color3_1, 
        AutoButtonColor = false, 
        Text = l_joinEvent_0, 
        BackgroundTransparency = v14 and v18 and 1 or v19, 
        TextTransparency = v19, 
        [v1.Event.Activated] = v10.onActivated
    }, {
        EventButtonCorners = v1.createElement("UICorner", {
            CornerRadius = UDim.new(0, v11.Global.Space_100)
        }), 
        OutlineFrame = if v14 and v18 then v1.createElement("Frame", {
            Size = UDim2.new(1, -2, 1, -2), 
            Position = UDim2.new(0, 1, 0, 1), 
            BackgroundTransparency = 1
        }, {
            OutlineCorner = v1.createElement("UICorner", {
                CornerRadius = UDim.new(0, v11.Global.Space_100 - 2)
            }), 
            OutlineStroke = v1.createElement("UIStroke", {
                Color = l_Color3_1, 
                Transparency = v19, 
                Thickness = 1
            })
        }) else nil
    });
end;