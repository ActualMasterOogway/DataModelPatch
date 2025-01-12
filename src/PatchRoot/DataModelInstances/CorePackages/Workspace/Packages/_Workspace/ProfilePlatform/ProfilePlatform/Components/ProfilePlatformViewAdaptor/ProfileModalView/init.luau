local l_Parent_0 = script:FindFirstAncestor("ProfilePlatform").Parent;
local v1 = require(l_Parent_0.SharedFlags);
local v2 = require(l_Parent_0.React);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local v4 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusNavigableSurfaceWrapper_0 = v4.FocusNavigableSurfaceWrapper;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v4.FocusNavigableSurfaceIdentifierEnum;
local l_FFlagEnableUniversalFocusNavigation_0 = v1.FFlagEnableUniversalFocusNavigation;
return function(v8) --[[ Line: 23 ]]
    -- upvalues: l_useStyle_0 (copy), l_FFlagEnableUniversalFocusNavigation_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), v2 (copy), l_FocusNavigableSurfaceWrapper_0 (copy)
    local v9 = l_useStyle_0();
    local v10 = {
        AnchorPoint = Vector2.new(0.5, 0), 
        Position = UDim2.new(0.5, 0, 0, 0), 
        Size = UDim2.new(0, v8.viewWidth, 1, 0), 
        BackgroundTransparency = v9.Theme.BackgroundDefault.Transparency, 
        BackgroundColor3 = v9.Theme.BackgroundDefault.Color, 
        BorderSizePixel = 0
    };
    local v11 = if l_FFlagEnableUniversalFocusNavigation_0 then {
        surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.PopUp, 
        isIsolated = true, 
        frameProps = v10
    } else v10;
    return v2.createElement("ImageButton", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = v9.Theme.Overlay.Transparency, 
        BackgroundColor3 = v9.Theme.Overlay.Color, 
        Active = true, 
        AutoButtonColor = false
    }, {
        ProfileWindow = v2.createElement(if l_FFlagEnableUniversalFocusNavigation_0 then l_FocusNavigableSurfaceWrapper_0 else "Frame", v11, {
            ProfileTopBar = v8.renderTopBar(), 
            PeekViewContainer = v2.createElement("ScrollingFrame", {
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 1, 1, -v8.topBarHeight), 
                Position = UDim2.new(0, 0, 0, v8.topBarHeight), 
                ScrollBarThickness = 0, 
                CanvasSize = UDim2.new(1, 0, 0, 0), 
                AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                Selectable = false
            }, {
                Content = v8.renderContent()
            })
        })
    });
end;