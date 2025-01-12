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
local v13 = v1.PureComponent:extend("DropDownButton");
v13.validateProps = v3.strictInterface({
    contentVisible = v3.boolean, 
    buttonTransparency = v3.any, 
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
v13.init = function(v14) --[[ Line: 45 ]] --[[ Name: init ]]
    v14.state = {
        isHovered = false, 
        isPressed = false, 
        sizeX = 100, 
        absolutePosX = 0, 
        absolutePosY = 0
    };
end;
v13.getColorBackgroundAnimation = function(v15, v16) --[[ Line: 55 ]] --[[ Name: getColorBackgroundAnimation ]]
    if v15.props.animatingPercentage == nil then
        return 0, 0;
    else
        local v17 = v15.state.sizeX - v16.DropDownRightOptionSize;
        local l_DropDownRightOptionSize_0 = v16.DropDownRightOptionSize;
        if v15.props.animatingDecline then
            v17 = v17 - v16.DropDownRightOptionSize;
        end;
        local v19 = v15.state.sizeX - v16.DropDownRightOptionSize;
        l_DropDownRightOptionSize_0 = l_DropDownRightOptionSize_0 + v19 * v15.props.animatingPercentage;
        v17 = v17 - v19 * v15.props.animatingPercentage * 0.5;
        if v17 + l_DropDownRightOptionSize_0 > v15.state.sizeX then
            v17 = v17 - (v17 + l_DropDownRightOptionSize_0 - v15.state.sizeX);
        end;
        return v17, l_DropDownRightOptionSize_0;
    end;
end;
v13.render = function(v20) --[[ Line: 76 ]] --[[ Name: render ]]
    -- upvalues: l_WithLayoutValues_0 (copy), l_withStyle_0 (copy), l_Colors_0 (copy), v1 (copy), l_ImageSetLabel_0 (copy), v9 (copy), l_Images_0 (copy)
    return l_WithLayoutValues_0(function(v21) --[[ Line: 77 ]]
        -- upvalues: l_withStyle_0 (ref), v20 (copy), l_Colors_0 (ref), v1 (ref), l_ImageSetLabel_0 (ref), v9 (ref), l_Images_0 (ref)
        return l_withStyle_0(function(v22) --[[ Line: 78 ]]
            -- upvalues: v20 (ref), v21 (copy), l_Colors_0 (ref), v1 (ref), l_ImageSetLabel_0 (ref), v9 (ref), l_Images_0 (ref)
            local v23 = {
                Transparency = 1, 
                Color = Color3.new(1, 1, 1)
            };
            if v20.state.isPressed then
                v23 = v22.Theme.BackgroundOnPress;
            elseif v20.state.isHovered then
                v23 = v22.Theme.BackgroundOnHover;
            end;
            local v24 = "";
            if v20.props.lastButton then
                v24 = "rbxasset://textures/ui/BottomRoundedRect8px.png";
            end;
            local v25 = true;
            if v20.props.onActivated == nil then
                v25 = v20.props.animatingAccept;
            end;
            local v26 = true;
            if v20.props.onDecline == nil then
                v26 = v20.props.animatingDecline;
            end;
            local v27 = true;
            if v20.props.onDecline == nil then
                v27 = true;
                if v20.props.animatingPercentage == nil then
                    v27 = v20.props.forceShowOptions;
                end;
            end;
            local v28, v29 = v20:getColorBackgroundAnimation(v21);
            local l_Green_0 = l_Colors_0.Green;
            if v20.props.animatingDecline then
                l_Green_0 = l_Colors_0.Red;
            elseif v20.props.forceShowOptions then
                l_Green_0 = l_Colors_0.White;
            end;
            local v31 = v21.DropDownPadding * 2 + v21.DropDownIconSize;
            local v32 = v21.DropDownRightOptionSize * 2;
            if v27 then
                v31 = v31 + v32;
            end;
            local function v33() --[[ Line: 114 ]] --[[ Name: onMouseButton1Down ]]
                -- upvalues: v27 (copy), v20 (ref)
                if not v27 then
                    v20:setState({
                        isPressed = true
                    });
                end;
            end;
            local function v34() --[[ Line: 122 ]] --[[ Name: onMouseButton1Up ]]
                -- upvalues: v20 (ref)
                v20:setState({
                    isPressed = false
                });
            end;
            local l_createElement_0 = v1.createElement;
            local v36 = "ImageButton";
            local v39 = {
                LayoutOrder = v20.props.layoutOrder, 
                Image = v24, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(8, 8, 24, 16), 
                SliceScale = 0.5, 
                ImageTransparency = v20.props.lastButton and v20.props.buttonTransparency or 1, 
                ImageColor3 = Color3.fromRGB(0, 0, 0), 
                Size = UDim2.new(1, 0, 0, v21.DropDownButtonSizeY), 
                BackgroundTransparency = v20.props.lastButton and 1 or v20.props.buttonTransparency, 
                BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
                AutoButtonColor = false, 
                BorderSizePixel = 0, 
                [v1.Event.Activated] = not v27 and v20.props.onActivated or nil, 
                [v1.Event.MouseEnter] = function() --[[ Line: 145 ]]
                    -- upvalues: v27 (copy), v20 (ref)
                    if not v27 then
                        v20:setState({
                            isHovered = true
                        });
                    end;
                end, 
                [v1.Event.MouseLeave] = function() --[[ Line: 153 ]]
                    -- upvalues: v20 (ref)
                    v20:setState({
                        isHovered = false, 
                        isPressed = false
                    });
                end, 
                [v1.Change.AbsoluteSize] = function(v37) --[[ Line: 160 ]]
                    -- upvalues: v20 (ref)
                    v20:setState({
                        sizeX = v37.AbsoluteSize.X
                    });
                end, 
                [v1.Change.AbsolutePosition] = function(v38) --[[ Line: 166 ]]
                    -- upvalues: v20 (ref)
                    v20:setState({
                        absolutePosX = v38.AbsolutePosition.X, 
                        absolutePosY = v38.AbsolutePosition.Y
                    });
                end, 
                [v1.Event.MouseButton1Down] = v33, 
                [v1.Event.MouseButton1Up] = v34
            };
            local v40 = {};
            local l_createElement_1 = v1.createElement;
            local v42 = "ImageLabel";
            local v43 = {};
            local v44 = false;
            if v20.props.animatingPercentage ~= nil then
                v44 = v20.props.contentVisible;
            end;
            v43.Visible = v44;
            v43.ZIndex = 1;
            v43.Size = UDim2.new(0, v29, 1, 0);
            v43.Position = UDim2.fromOffset(v28, 0);
            v43.Image = v24;
            v43.ScaleType = Enum.ScaleType.Slice;
            v43.SliceCenter = Rect.new(8, 8, 24, 16);
            v43.SliceScale = 0.5;
            v43.ImageTransparency = v20.props.lastButton and v21.IconButtonBackgroundTransparency or 1;
            v43.ImageColor3 = l_Green_0;
            v43.BackgroundTransparency = v20.props.lastButton and 1 or v21.IconButtonBackgroundTransparency;
            v43.BackgroundColor3 = l_Green_0;
            v43.BorderSizePixel = 0;
            v40.ColorBackground = l_createElement_1(v42, v43);
            v40.HoverBackground = v1.createElement("ImageLabel", {
                ZIndex = 2, 
                Size = UDim2.fromScale(1, 1), 
                Visible = v20.props.contentVisible, 
                Image = v24, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(8, 8, 24, 16), 
                SliceScale = 0.5, 
                ImageTransparency = v20.props.lastButton and v23.Transparency or 1, 
                ImageColor3 = v23.Color, 
                BackgroundTransparency = v20.props.lastButton and 1 or v23.Transparency, 
                BackgroundColor3 = v23.Color, 
                BorderSizePixel = 0
            }, {
                InitalPadding = v1.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v21.DropDownPadding)
                }), 
                ListLayout = v1.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = UDim.new(0, v21.DropDownPadding)
                }), 
                Icon = v1.createElement(l_ImageSetLabel_0, {
                    LayoutOrder = 1, 
                    Size = UDim2.fromOffset(v21.DropDownIconSize, v21.DropDownIconSize), 
                    ImageColor3 = v22.Theme.IconEmphasis.Color, 
                    Image = v20.props.icon, 
                    BackgroundTransparency = 1
                }), 
                Text = v1.createElement("TextLabel", {
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, -v31, 1, 0), 
                    Text = v20.props.text, 
                    Font = v22.Font.Header2.Font, 
                    TextSize = v22.Font.BaseSize * v22.Font.Header2.RelativeSize, 
                    TextColor3 = v22.Theme.TextEmphasis.Color, 
                    TextTransparency = v22.Theme.TextEmphasis.Transparency, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    BackgroundTransparency = 1
                }), 
                ButtonContainer = v1.createElement("Frame", {
                    LayoutOrder = 3, 
                    Visible = v27, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, v32, 1, 0)
                }, {
                    ConfirmButton = v25 and v1.createElement(v9, {
                        size = UDim2.fromScale(0.5, 1), 
                        position = UDim2.fromScale(0.5, 0), 
                        backgroundColor = v20.props.onDecline and l_Colors_0.Green or l_Colors_0.White, 
                        icon = l_Images_0["icons/actions/accept"], 
                        showBackground = v20.props.animatingPercentage == nil, 
                        onActivated = v20.props.onActivated
                    }) or nil, 
                    DeclineButton = v26 and v1.createElement(v9, {
                        size = UDim2.fromScale(0.5, 1), 
                        position = UDim2.new(0, 0, 0, 0), 
                        backgroundColor = l_Colors_0.Red, 
                        icon = l_Images_0["icons/actions/reject"], 
                        showBackground = v20.props.animatingPercentage == nil, 
                        onActivated = v20.props.onDecline
                    }) or nil
                })
            });
            l_createElement_1 = v1.createElement;
            v42 = "ImageButton";
            v43 = {
                Image = "", 
                BackgroundTransparency = 1, 
                Size = UDim2.fromOffset(v20.props.screenSizeX, v20.props.screenSizeY), 
                Position = UDim2.fromOffset(-v20.state.absolutePosX, -v20.state.absolutePosY)
            };
            v44 = false;
            if v20.props.onDismiss ~= nil then
                v44 = v20.props.contentVisible;
            end;
            v43.Visible = v44;
            v43[v1.Event.Activated] = v20.props.onDismiss;
            v40.DismissInputHandler = l_createElement_1(v42, v43);
            v40.Divider = not v20.props.lastButton and v1.createElement("Frame", {
                Visible = v20.props.contentVisible, 
                ZIndex = 3, 
                Size = UDim2.new(1, 0, 0, 1), 
                Position = UDim2.fromScale(0, 1), 
                AnchorPoint = Vector2.new(0, 1), 
                BackgroundTransparency = v22.Theme.Divider.Transparency, 
                BackgroundColor3 = v22.Theme.Divider.Color, 
                BorderSizePixel = 0
            });
            return l_createElement_0(v36, v39, v40);
        end);
    end);
end;
return v2.connect(function(v45) --[[ Line: 295 ]] --[[ Name: mapStateToProps ]]
    return {
        screenSizeX = v45.screenSize.X, 
        screenSizeY = v45.screenSize.Y
    };
end, nil)(v13);