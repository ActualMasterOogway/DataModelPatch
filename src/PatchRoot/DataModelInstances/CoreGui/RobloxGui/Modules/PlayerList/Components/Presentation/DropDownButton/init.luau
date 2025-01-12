local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v4.Style.withStyle;
local l_Parent_0 = script.Parent.Parent;
local l_Connection_0 = l_Parent_0.Connection;
local l_WithLayoutValues_0 = require(l_Connection_0.LayoutValues).WithLayoutValues;
local v9 = require(l_Parent_0.PresentationCommon.IconButton);
local l_Colors_0 = require(l_CorePackages_0.Workspace.Packages.Style).Colors;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v4.App.ImageSet.Images;
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v14 = require(l_RobloxGui_0.Modules.Chrome.Enabled);
local v15 = v1.PureComponent:extend("DropDownButton");
v15.validateProps = v3.strictInterface({
    text = v3.string, 
    layoutOrder = v3.optional(v3.integer), 
    icon = v3.union(v3.string, v3.table), 
    lastButton = v3.boolean, 
    forceShowOptions = v3.boolean, 
    screenSizeX = v3.number, 
    screenSizeY = v3.number, 
    onActivated = v3.optional(v3.callback), 
    onDecline = v3.optional(v3.callback), 
    onDismiss = v3.optional(v3.callback), 
    animatingAccept = v3.optional(v3.boolean), 
    animatingDecline = v3.optional(v3.boolean), 
    animatingPercentage = v3.optional(v3.number)
});
v15.init = function(v16) --[[ Line: 45 ]] --[[ Name: init ]]
    v16.state = {
        isHovered = false, 
        isPressed = false, 
        sizeX = 100, 
        absolutePosX = 0, 
        absolutePosY = 0
    };
end;
v15.getColorBackgroundAnimation = function(v17, v18) --[[ Line: 55 ]] --[[ Name: getColorBackgroundAnimation ]]
    if v17.props.animatingPercentage == nil then
        return 0, 0;
    else
        local v19 = v17.state.sizeX - v18.DropDownRightOptionSize;
        local l_DropDownRightOptionSize_0 = v18.DropDownRightOptionSize;
        if v17.props.animatingDecline then
            v19 = v19 - v18.DropDownRightOptionSize;
        end;
        local v21 = v17.state.sizeX - v18.DropDownRightOptionSize;
        l_DropDownRightOptionSize_0 = l_DropDownRightOptionSize_0 + v21 * v17.props.animatingPercentage;
        v19 = v19 - v21 * v17.props.animatingPercentage * 0.5;
        if v19 + l_DropDownRightOptionSize_0 > v17.state.sizeX then
            v19 = v19 - (v19 + l_DropDownRightOptionSize_0 - v17.state.sizeX);
        end;
        return v19, l_DropDownRightOptionSize_0;
    end;
end;
v15.render = function(v22) --[[ Line: 76 ]] --[[ Name: render ]]
    -- upvalues: l_WithLayoutValues_0 (copy), l_withStyle_0 (copy), v14 (copy), l_Colors_0 (copy), v1 (copy), l_ImageSetLabel_0 (copy), v9 (copy), l_Images_0 (copy)
    return l_WithLayoutValues_0(function(v23) --[[ Line: 77 ]]
        -- upvalues: l_withStyle_0 (ref), v14 (ref), v22 (copy), l_Colors_0 (ref), v1 (ref), l_ImageSetLabel_0 (ref), v9 (ref), l_Images_0 (ref)
        return l_withStyle_0(function(v24) --[[ Line: 78 ]]
            -- upvalues: v14 (ref), v23 (copy), v22 (ref), l_Colors_0 (ref), v1 (ref), l_ImageSetLabel_0 (ref), v9 (ref), l_Images_0 (ref)
            local v25 = {
                Color = if v14() then v24.Theme.BackgroundUIContrast.Color else v24.Theme.BackgroundContrast.Color, 
                Transparency = v23.OverrideBackgroundTransparency * v24.Settings.PreferredTransparency
            };
            local v26 = {
                Transparency = 1, 
                Color = Color3.new(1, 1, 1)
            };
            if v22.state.isPressed then
                v26 = v24.Theme.BackgroundOnPress;
            elseif v22.state.isHovered then
                v26 = v24.Theme.BackgroundOnHover;
            end;
            local v27 = "";
            if v22.props.lastButton then
                v27 = "rbxasset://textures/ui/BottomRoundedRect8px.png";
            end;
            local v28 = true;
            if v22.props.onActivated == nil then
                v28 = v22.props.animatingAccept;
            end;
            local v29 = true;
            if v22.props.onDecline == nil then
                v29 = v22.props.animatingDecline;
            end;
            local v30 = true;
            if v22.props.onDecline == nil then
                v30 = true;
                if v22.props.animatingPercentage == nil then
                    v30 = v22.props.forceShowOptions;
                end;
            end;
            local v31, v32 = v22:getColorBackgroundAnimation(v23);
            local l_Green_0 = l_Colors_0.Green;
            if v22.props.animatingDecline then
                l_Green_0 = l_Colors_0.Red;
            elseif v22.props.forceShowOptions then
                l_Green_0 = l_Colors_0.White;
            end;
            local v34 = v23.DropDownPadding * 2 + v23.DropDownIconSize;
            local v35 = v23.DropDownRightOptionSize * 2;
            if v30 then
                v34 = v34 + v35;
            end;
            local function v36() --[[ Line: 122 ]] --[[ Name: onMouseButton1Down ]]
                -- upvalues: v30 (copy), v22 (ref)
                if not v30 then
                    v22:setState({
                        isPressed = true
                    });
                end;
            end;
            local function v37() --[[ Line: 130 ]] --[[ Name: onMouseButton1Up ]]
                -- upvalues: v22 (ref)
                v22:setState({
                    isPressed = false
                });
            end;
            return v1.createElement("ImageButton", {
                LayoutOrder = v22.props.layoutOrder, 
                Image = v27, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(8, 8, 24, 16), 
                SliceScale = 0.5, 
                ImageTransparency = v22.props.lastButton and v25.Transparency or 1, 
                ImageColor3 = v25.Color, 
                Size = UDim2.new(1, 0, 0, v23.DropDownButtonSizeY), 
                BackgroundTransparency = v22.props.lastButton and 1 or v25.Transparency, 
                BackgroundColor3 = v25.Color, 
                AutoButtonColor = false, 
                BorderSizePixel = 0, 
                [v1.Event.Activated] = not v30 and v22.props.onActivated or nil, 
                [v1.Event.MouseEnter] = function() --[[ Line: 153 ]]
                    -- upvalues: v30 (copy), v22 (ref)
                    if not v30 then
                        v22:setState({
                            isHovered = true
                        });
                    end;
                end, 
                [v1.Event.MouseLeave] = function() --[[ Line: 161 ]]
                    -- upvalues: v22 (ref)
                    v22:setState({
                        isHovered = false, 
                        isPressed = false
                    });
                end, 
                [v1.Change.AbsoluteSize] = function(v38) --[[ Line: 168 ]]
                    -- upvalues: v22 (ref)
                    v22:setState({
                        sizeX = v38.AbsoluteSize.X
                    });
                end, 
                [v1.Change.AbsolutePosition] = function(v39) --[[ Line: 174 ]]
                    -- upvalues: v22 (ref)
                    v22:setState({
                        absolutePosX = v39.AbsolutePosition.X, 
                        absolutePosY = v39.AbsolutePosition.Y
                    });
                end, 
                [v1.Event.MouseButton1Down] = v36, 
                [v1.Event.MouseButton1Up] = v37
            }, {
                ColorBackground = v1.createElement("ImageLabel", {
                    Visible = v22.props.animatingPercentage ~= nil, 
                    ZIndex = 1, 
                    Size = UDim2.new(0, v32, 1, 0), 
                    Position = UDim2.new(0, v31, 0, 0), 
                    Image = v27, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = Rect.new(8, 8, 24, 16), 
                    SliceScale = 0.5, 
                    ImageTransparency = v22.props.lastButton and v23.IconButtonBackgroundTransparency or 1, 
                    ImageColor3 = l_Green_0, 
                    BackgroundTransparency = v22.props.lastButton and 1 or v23.IconButtonBackgroundTransparency, 
                    BackgroundColor3 = l_Green_0, 
                    BorderSizePixel = 0
                }), 
                HoverBackground = v1.createElement("ImageLabel", {
                    ZIndex = 2, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    Image = v27, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = Rect.new(8, 8, 24, 16), 
                    SliceScale = 0.5, 
                    ImageTransparency = v22.props.lastButton and v26.Transparency or 1, 
                    ImageColor3 = v26.Color, 
                    BackgroundTransparency = v22.props.lastButton and 1 or v26.Transparency, 
                    BackgroundColor3 = v26.Color, 
                    BorderSizePixel = 0
                }, {
                    InitalPadding = v1.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, v23.DropDownPadding)
                    }), 
                    ListLayout = v1.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        Padding = UDim.new(0, v23.DropDownPadding)
                    }), 
                    Icon = v1.createElement(l_ImageSetLabel_0, {
                        LayoutOrder = 1, 
                        Size = UDim2.new(0, v23.DropDownIconSize, 0, v23.DropDownIconSize), 
                        ImageColor3 = v24.Theme.IconEmphasis.Color, 
                        Image = v22.props.icon, 
                        BackgroundTransparency = 1
                    }), 
                    Text = v1.createElement("TextLabel", {
                        LayoutOrder = 2, 
                        Size = UDim2.new(1, -v34, 1, 0), 
                        Text = v22.props.text, 
                        Font = v24.Font.Header2.Font, 
                        TextSize = v24.Font.BaseSize * v24.Font.Header2.RelativeSize, 
                        TextColor3 = v24.Theme.TextEmphasis.Color, 
                        TextTransparency = v24.Theme.TextEmphasis.Transparency, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        BackgroundTransparency = 1
                    }), 
                    ButtonContainer = v1.createElement("Frame", {
                        LayoutOrder = 3, 
                        Visible = v30, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, v35, 1, 0)
                    }, {
                        ConfirmButton = v28 and v1.createElement(v9, {
                            size = UDim2.new(0.5, 0, 1, 0), 
                            position = UDim2.new(0.5, 0, 0, 0), 
                            backgroundColor = v22.props.onDecline and l_Colors_0.Green or l_Colors_0.White, 
                            icon = l_Images_0["icons/actions/accept"], 
                            showBackground = v22.props.animatingPercentage == nil, 
                            onActivated = v22.props.onActivated
                        }) or nil, 
                        DeclineButton = v29 and v1.createElement(v9, {
                            size = UDim2.new(0.5, 0, 1, 0), 
                            position = UDim2.new(0, 0, 0, 0), 
                            backgroundColor = l_Colors_0.Red, 
                            icon = l_Images_0["icons/actions/reject"], 
                            showBackground = v22.props.animatingPercentage == nil, 
                            onActivated = v22.props.onDecline
                        }) or nil
                    })
                }), 
                DismissInputHandler = v1.createElement("ImageButton", {
                    Image = "", 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, v22.props.screenSizeX, 0, v22.props.screenSizeY), 
                    Position = UDim2.new(0, -v22.state.absolutePosX, 0, -v22.state.absolutePosY), 
                    Visible = v22.props.onDismiss ~= nil, 
                    [v1.Event.Activated] = v22.props.onDismiss
                }), 
                Divider = not v22.props.lastButton and v1.createElement("Frame", {
                    ZIndex = 3, 
                    Size = UDim2.new(1, 0, 0, 1), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    AnchorPoint = Vector2.new(0, 1), 
                    BackgroundTransparency = v24.Theme.Divider.Transparency, 
                    BackgroundColor3 = v24.Theme.Divider.Color, 
                    BorderSizePixel = 0
                })
            });
        end);
    end);
end;
return v2.UNSTABLE_connect2(function(v40) --[[ Line: 300 ]] --[[ Name: mapStateToProps ]]
    return {
        screenSizeX = v40.screenSize.X, 
        screenSizeY = v40.screenSize.Y
    };
end, nil)(v15);