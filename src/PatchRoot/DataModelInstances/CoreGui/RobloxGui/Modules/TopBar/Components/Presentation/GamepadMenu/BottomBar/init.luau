local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v4.Core.Style.withStyle;
local l_Images_0 = v4.App.ImageSet.Images;
local v7 = require(script.Parent.ButtonHint);
local v8 = l_Images_0["icons/controls/keys/xboxB"];
local v9 = l_Images_0["icons/controls/keys/xboxX"];
local v10 = l_Images_0["icons/controls/keys/xboxY"];
local v11 = v1.PureComponent:extend("BottomBar");
v11.validateProps = v3.strictInterface({
    screenSize = v3.Vector2, 
    respawnEnabled = v3.boolean
});
v11.init = function(v12) --[[ Line: 31 ]] --[[ Name: init ]]
    v12:setState({
        leftLayoutSize = 0, 
        rightLayoutSize = 0
    });
    v12.leftLayoutSizeChanged = function(v13) --[[ Line: 37 ]]
        -- upvalues: v12 (copy)
        v12:setState({
            leftLayoutSize = v13.AbsoluteContentSize.X
        });
    end;
    v12.rightLayoutSizeChanged = function(v14) --[[ Line: 43 ]]
        -- upvalues: v12 (copy)
        v12:setState({
            rightLayoutSize = v14.AbsoluteContentSize.X
        });
    end;
end;
v11.render = function(v15) --[[ Line: 50 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v1 (copy), v7 (copy), v8 (copy), v9 (copy), v10 (copy)
    return l_withStyle_0(function(v16) --[[ Line: 51 ]]
        -- upvalues: v15 (copy), v1 (ref), v7 (ref), v8 (ref), v9 (ref), v10 (ref)
        local l_Theme_0 = v16.Theme;
        local v18 = math.min(72, v15.props.screenSize.Y * 0.1);
        return v1.createElement("Frame", {
            Visible = v15.state.leftLayoutSize < v15.props.screenSize.X, 
            BorderSizePixel = 0, 
            BackgroundTransparency = l_Theme_0.BackgroundUIContrast.Transparency, 
            BackgroundColor3 = l_Theme_0.BackgroundUIContrast.Color, 
            Size = UDim2.new(1, 0, 0, v18), 
            Position = UDim2.fromScale(0, 1), 
            AnchorPoint = Vector2.new(0, 1)
        }, {
            Padding = v1.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 24), 
                PaddingRight = UDim.new(0, 24)
            }), 
            LeftFrame = v1.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(0.5, 1)
            }, {
                Layout = v1.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = UDim.new(0, 40), 
                    [v1.Change.AbsoluteContentSize] = v15.leftLayoutSizeChanged
                }), 
                LeaveHint = v1.createElement(v7, {
                    localizationKey = "CoreScripts.TopBar.Back", 
                    keyImage = v8
                })
            }), 
            RightFrame = v1.createElement("Frame", {
                Visible = v15.state.leftLayoutSize + v15.state.rightLayoutSize < v15.props.screenSize.X, 
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(0.5, 1), 
                Position = UDim2.fromScale(1, 0), 
                AnchorPoint = Vector2.new(1, 0)
            }, {
                Layout = v1.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = UDim.new(0, 40), 
                    [v1.Change.AbsoluteContentSize] = v15.rightLayoutSizeChanged
                }), 
                LeaveHint = v1.createElement(v7, {
                    layoutOrder = 2, 
                    localizationKey = "CoreScripts.TopBar.Leave", 
                    keyImage = v9
                }), 
                RespawnHint = v15.props.respawnEnabled and v1.createElement(v7, {
                    layoutOrder = 1, 
                    localizationKey = "CoreScripts.TopBar.Respawn", 
                    keyImage = v10
                })
            })
        });
    end);
end;
return v2.UNSTABLE_connect2(function(v19) --[[ Line: 126 ]] --[[ Name: mapStateToProps ]]
    return {
        screenSize = v19.displayOptions.screenSize, 
        respawnEnabled = v19.respawn.enabled
    };
end, nil)(v11);