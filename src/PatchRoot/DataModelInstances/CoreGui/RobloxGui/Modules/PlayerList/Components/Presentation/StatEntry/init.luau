local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.t);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v6 = require(l_RobloxGui_0.Modules.GameTranslator);
local l_Parent_0 = script.Parent.Parent;
local l_Connection_0 = l_Parent_0.Connection;
local l_WithLayoutValues_0 = require(l_Connection_0.LayoutValues).WithLayoutValues;
local l_Parent_1 = l_Parent_0.Parent;
local v11 = require(l_Parent_1.FormatStatString);
local v12 = v2.PureComponent:extend("StatEntry");
v12.validateProps = v3.strictInterface({
    statName = v3.string, 
    statValue = v3.optional(v3.any), 
    isTitleEntry = v3.boolean, 
    isTeamEntry = v3.boolean, 
    layoutOrder = v3.integer, 
    backgroundStyle = v3.strictInterface({
        Color = v3.Color3, 
        Transparency = v3.number
    }), 
    overlayStyle = v3.strictInterface({
        Color = v3.Color3, 
        Transparency = v3.number
    }), 
    doubleOverlay = v3.boolean, 
    textStyle = v3.strictInterface({
        Color = v3.Color3, 
        Transparency = v3.number, 
        StrokeColor = v3.optional(v3.Color3), 
        StrokeTransparency = v3.optional(v3.number)
    }), 
    onActivated = v3.optional(v3.callback), 
    onSelectionGained = v3.optional(v3.callback), 
    onSelectionLost = v3.optional(v3.callback), 
    onMouseEnter = v3.optional(v3.callback), 
    onMouseLeave = v3.optional(v3.callback), 
    onMouseDown = v3.optional(v3.callback), 
    onInputEnded = v3.optional(v3.callback)
});
v12.render = function(v13) --[[ Line: 56 ]] --[[ Name: render ]]
    -- upvalues: l_WithLayoutValues_0 (copy), l_withStyle_0 (copy), v6 (copy), l_CoreGui_0 (copy), v11 (copy), v2 (copy)
    return l_WithLayoutValues_0(function(v14) --[[ Line: 57 ]]
        -- upvalues: l_withStyle_0 (ref), v6 (ref), l_CoreGui_0 (ref), v13 (copy), v11 (ref), v2 (ref)
        return l_withStyle_0(function(v15) --[[ Line: 58 ]]
            -- upvalues: v6 (ref), l_CoreGui_0 (ref), v13 (ref), v14 (copy), v11 (ref), v2 (ref)
            local v16 = v6:TranslateGameText(l_CoreGui_0, v13.props.statName);
            local v17 = nil;
            local v18 = nil;
            if not v14.IsTenFoot then
                v17 = v15.Font.CaptionHeader.Font;
                v18 = v15.Font.CaptionHeader.RelativeSize * v15.Font.BaseSize;
            else
                v18 = v14.StatTextSize;
                v17 = v14.StatFont;
                if v13.props.isTitleEntry then
                    v17 = v14.TitleStatFont;
                elseif v13.props.isTeamEntry then
                    v17 = v14.TeamStatFont;
                end;
            end;
            local v19 = v11(v13.props.statValue);
            local v20 = {};
            if v14.IsTenFoot then
                v20.Shadow = v2.createElement("ImageLabel", {
                    BackgroundTransparency = 1, 
                    Image = v14.ShadowImage, 
                    Position = UDim2.new(0, -v14.ShadowSize, 0, 0), 
                    Size = UDim2.new(1, v14.ShadowSize * 2, 1, v14.ShadowSize), 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = v14.ShadowSliceRect
                });
            end;
            v20.StatText = v2.createElement("TextLabel", {
                Size = v13.props.isTitleEntry and UDim2.new(1, 0, 0.5, 0) or UDim2.new(1, 0, 1, 0), 
                Position = v13.props.isTitleEntry and UDim2.new(0, 0, 0.5, 0) or UDim2.new(0, 0, 0, 0), 
                BackgroundTransparency = 1, 
                Font = v17, 
                TextSize = v18, 
                TextColor3 = v13.props.textStyle.Color, 
                TextTransparency = v13.props.textStyle.Transparency, 
                TextStrokeColor3 = v13.props.textStyle.StrokeColor, 
                TextStrokeTransparency = v13.props.textStyle.StrokeTransparency, 
                Text = v19, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                Active = true
            }, {
                v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v14.StatTextPadding)
                }) or nil
            });
            if v13.props.isTitleEntry then
                v20.StatName = v2.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 0.5, 0), 
                    Position = UDim2.new(0, 0, 0, 0), 
                    BackgroundTransparency = 1, 
                    Font = v14.StatNameFont, 
                    TextSize = v18, 
                    TextColor3 = v13.props.textStyle.Color, 
                    TextTransparency = v13.props.textStyle.Transparency, 
                    TextStrokeColor3 = v13.props.textStyle.StrokeColor, 
                    TextStrokeTransparency = v13.props.textStyle.StrokeTransparency, 
                    Text = v16, 
                    Active = true, 
                    ClipsDescendants = true
                });
            end;
            return v2.createElement("TextButton", {
                Text = "", 
                LayoutOrder = v13.props.layoutOrder, 
                Size = UDim2.new(0, v14.StatEntrySizeX, 1, 0), 
                BackgroundTransparency = v13.props.backgroundStyle.Transparency, 
                BackgroundColor3 = v13.props.backgroundStyle.Color, 
                BorderSizePixel = 0, 
                AutoLocalize = false, 
                AutoButtonColor = false, 
                Selectable = false, 
                [v2.Event.Activated] = v13.props.onActivated, 
                [v2.Event.SelectionGained] = v13.props.onSelectionGained, 
                [v2.Event.SelectionLost] = v13.props.onSelectionLost, 
                [v2.Event.MouseEnter] = v13.props.onMouseEnter, 
                [v2.Event.MouseLeave] = v13.props.onMouseLeave, 
                [v2.Event.MouseButton1Down] = v13.props.onMouseDown, 
                [v2.Event.MouseButton1Up] = v13.props.onInputEnded, 
                [v2.Event.InputEnded] = function(_, v22) --[[ Line: 144 ]]
                    -- upvalues: v13 (ref)
                    if v22.UserInputType == Enum.UserInputType.Touch then
                        if v13.props.onMouseLeave then
                            v13.props.onMouseLeave();
                        end;
                        if v13.props.onInputEnded then
                            v13.props.onInputEnded();
                        end;
                    end;
                end
            }, {
                DoubleOverLay = v2.createElement("Frame", {
                    ZIndex = 1, 
                    Visible = v13.props.doubleOverlay, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = v13.props.overlayStyle.Transparency, 
                    BackgroundColor3 = v13.props.overlayStyle.Color, 
                    BorderSizePixel = 0
                }), 
                OverlayFrame = v2.createElement("Frame", {
                    ZIndex = 2, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = v13.props.overlayStyle.Transparency, 
                    BackgroundColor3 = v13.props.overlayStyle.Color, 
                    BorderSizePixel = 0
                }, v20)
            });
        end);
    end);
end;
return v12;