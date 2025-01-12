local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui").RobloxGui;
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(script.Parent.Parent.Util.setMouseVisibility);
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Parent_0 = script.Parent.Parent;
local v8 = require(l_Parent_0.Constants);
local l_FrameHeight_0 = v8.TopBarFormatting.FrameHeight;
local l_WindowPadding_0 = v8.Padding.WindowPadding;
local l_MinSize_0 = v8.MainWindowInit.MinSize;
local l_Components_0 = l_Parent_0.Components;
local v13 = require(l_Components_0.DevConsoleTopBar);
local l_Actions_0 = script.Parent.Parent.Actions;
local v15 = require(l_Actions_0.ChangeDevConsoleSize);
local v16 = require(l_Actions_0.SetDevConsoleVisibility);
local v17 = require(l_Actions_0.SetDevConsoleMinimized);
local v18 = require(l_RobloxGui_0.Modules.Flags.GetFFlagRequestServerStatsFix);
local v19 = v5.PureComponent:extend("DevConsoleWindow");
v19.onMinimizeClicked = function(v20) --[[ Line: 32 ]] --[[ Name: onMinimizeClicked ]]
    v20.props.dispatchSetDevConsoleMinimized(true);
end;
v19.onMaximizeClicked = function(v21) --[[ Line: 36 ]] --[[ Name: onMaximizeClicked ]]
    v21.props.dispatchSetDevConsoleMinimized(false);
end;
v19.onCloseClicked = function(v22) --[[ Line: 40 ]] --[[ Name: onCloseClicked ]]
    -- upvalues: v18 (copy)
    if v18() then
        v22.props.onCloseCallback(false);
    end;
    v22.props.dispatchSetDevConsolVisibility(false);
end;
v19.init = function(v23) --[[ Line: 47 ]] --[[ Name: init ]]
    -- upvalues: l_MinSize_0 (copy), l_UserInputService_0 (copy), v5 (copy)
    v23.setDevConsoleSize = function(v24, v25, v26) --[[ Line: 48 ]]
        -- upvalues: l_MinSize_0 (ref)
        local v27 = v26.X - v25.X;
        local v28 = v26.Y - v25.Y;
        v27 = v27 < l_MinSize_0.X and l_MinSize_0.X or v27;
        local v29 = v28 < l_MinSize_0.Y and l_MinSize_0.Y or v28;
        v24.props.dispatchChangeDevConsoleSize(UDim2.new(0, v27, 0, v29));
    end;
    v23.resizeInputBegan = function(_, v31) --[[ Line: 58 ]]
        -- upvalues: v23 (copy), l_UserInputService_0 (ref)
        if v31.UserInputType == Enum.UserInputType.MouseButton1 then
            local v32 = nil;
            local v33 = nil;
            local function v37(v34) --[[ Line: 62 ]] --[[ Name: onInputChanged ]]
                -- upvalues: v23 (ref)
                local l_AbsolutePosition_0 = v23.ref.current.AbsolutePosition;
                local l_Position_0 = v34.Position;
                v23:setDevConsoleSize(l_AbsolutePosition_0, l_Position_0);
            end;
            do
                local l_v32_0, l_v33_0 = v32, v33;
                local function v41(v40) --[[ Line: 68 ]] --[[ Name: onInputEnded ]]
                    -- upvalues: l_v32_0 (ref), l_v33_0 (ref)
                    if v40.UserInputType == Enum.UserInputType.MouseButton1 then
                        l_v32_0:Disconnect();
                        l_v33_0:Disconnect();
                    end;
                end;
                l_v32_0 = l_UserInputService_0.InputChanged:Connect(v37);
                l_v33_0 = l_UserInputService_0.InputEnded:Connect(v41);
            end;
        end;
    end;
    v23.doGamepadMenuButton = function(v42) --[[ Line: 80 ]]
        -- upvalues: v23 (copy)
        if v23.props.isVisible then
            local v43 = true;
            if v42.KeyCode ~= Enum.KeyCode.ButtonStart then
                v43 = v42.KeyCode == Enum.KeyCode.Escape;
            end;
            if v43 then
                v23.props.dispatchSetDevConsolVisibility(false);
            end;
        end;
    end;
    v23.ref = v5.createRef();
    v23.state = {
        resizing = false
    };
end;
v19.didMount = function(v44) --[[ Line: 96 ]] --[[ Name: didMount ]]
    -- upvalues: v4 (copy), l_UserInputService_0 (copy)
    delay(0, function() --[[ Line: 100 ]]
        -- upvalues: v44 (copy)
        if v44.ref.current then
            local l_AbsolutePosition_1 = v44.ref.current.AbsolutePosition;
            local l_AbsolutePosition_2 = v44.ref.current.ResizeButton.AbsolutePosition;
            v44:setDevConsoleSize(l_AbsolutePosition_1, l_AbsolutePosition_2);
        end;
    end);
    v4(v44.props.isVisible);
    v44.gamepadMenuListener = l_UserInputService_0.InputBegan:Connect(v44.doGamepadMenuButton);
end;
v19.willUnmount = function(v47) --[[ Line: 112 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_GuiService_0 (copy)
    if l_GuiService_0.SelectedCoreObject == v47.ref.current then
        l_GuiService_0.SelectedCoreObject = nil;
    end;
    v47.gamepadMenuListener:Disconnect();
end;
v19.didUpdate = function(v48, v49, _) --[[ Line: 120 ]] --[[ Name: didUpdate ]]
    -- upvalues: v4 (copy), l_GuiService_0 (copy), l_UserInputService_0 (copy)
    v4(v48.props.isVisible);
    if v48.props.isMinimized and l_GuiService_0.SelectedCoreObject == v48.ref.current then
        l_GuiService_0.SelectedCoreObject = nil;
        return;
    else
        if v48.props.isVisible ~= v49.isVisible or v48.props.currTabIndex ~= v49.currTabIndex then
            if l_UserInputService_0:GetLastInputType() == Enum.UserInputType.Gamepad1 and v48.props.isVisible then
                l_GuiService_0.SelectedCoreObject = v48.ref.current;
                return;
            else
                l_GuiService_0.SelectedCoreObject = nil;
            end;
        end;
        return;
    end;
end;
v19.render = function(v51) --[[ Line: 137 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), l_RobloxGui_0 (copy), v5 (copy), l_WindowPadding_0 (copy), v13 (copy), l_FrameHeight_0 (copy)
    local l_isVisible_0 = v51.props.isVisible;
    local l_formFactor_0 = v51.props.formFactor;
    local l_isDeveloperView_0 = v51.props.isDeveloperView;
    local l_currTabIndex_0 = v51.props.currTabIndex;
    local l_tabList_0 = v51.props.tabList;
    local l_isMinimized_0 = v51.props.isMinimized;
    local l_position_0 = v51.props.position;
    local l_size_0 = v51.props.size;
    local _ = v51.state.resizing;
    local l_l_size_0_0 = l_size_0;
    local v62 = UDim2.new();
    local v63 = {};
    local v64 = 16;
    if l_formFactor_0 ~= v8.FormFactor.Large then
        local l_AbsoluteSize_0 = l_RobloxGui_0.AbsoluteSize;
        l_size_0 = UDim2.new(0, l_AbsoluteSize_0.X, 0, l_AbsoluteSize_0.Y);
        l_position_0 = UDim2.new(0, 0, 0, 0);
        v62 = UDim2.new(0, 16, 0, 0);
        l_l_size_0_0 = l_size_0 + UDim2.new(0, -32, 0, 0);
        v64 = 0;
    end;
    v63.UIListLayout = v5.createElement("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        Padding = UDim.new(0, l_WindowPadding_0)
    });
    if l_isMinimized_0 then
        v63.TopBar = v5.createElement(v13, {
            LayoutOrder = 1, 
            formFactor = l_formFactor_0, 
            isMinimized = true, 
            onMinimizeClicked = function() --[[ Line: 180 ]] --[[ Name: onMinimizeClicked ]]
                -- upvalues: v51 (copy)
                v51:onMinimizeClicked();
            end, 
            onMaximizeClicked = function() --[[ Line: 183 ]] --[[ Name: onMaximizeClicked ]]
                -- upvalues: v51 (copy)
                v51:onMaximizeClicked();
            end, 
            onCloseClicked = function() --[[ Line: 186 ]] --[[ Name: onCloseClicked ]]
                -- upvalues: v51 (copy)
                v51:onCloseClicked();
            end
        });
        return v5.createElement("Frame", {
            Position = UDim2.new(1, -500, 1, -2 * l_FrameHeight_0), 
            Size = UDim2.new(0, 500, 0, 2 * l_FrameHeight_0), 
            BackgroundColor3 = Color3.new(0, 0, 0), 
            Transparency = v8.MainWindowInit.Transparency, 
            Active = true, 
            AutoLocalize = false, 
            Visible = l_isVisible_0, 
            Selectable = true, 
            BorderColor3 = v8.Color.BaseGray, 
            [v5.Ref] = v51.ref
        }, v63);
    else
        v63.TopBar = v5.createElement(v13, {
            LayoutOrder = 1, 
            formFactor = l_formFactor_0, 
            isMinimized = false, 
            onMinimizeClicked = function() --[[ Line: 209 ]] --[[ Name: onMinimizeClicked ]]
                -- upvalues: v51 (copy)
                v51:onMinimizeClicked();
            end, 
            onMaximizeClicked = function() --[[ Line: 212 ]] --[[ Name: onMaximizeClicked ]]
                -- upvalues: v51 (copy)
                v51:onMaximizeClicked();
            end, 
            onCloseClicked = function() --[[ Line: 215 ]] --[[ Name: onCloseClicked ]]
                -- upvalues: v51 (copy)
                v51:onCloseClicked();
            end
        });
        local l_l_l_size_0_0_0 = l_l_size_0_0;
        local v67 = l_FrameHeight_0 + 2 * l_WindowPadding_0;
        l_l_l_size_0_0_0 = l_l_l_size_0_0_0 - UDim2.new(0, 0, 0, v67);
        if v51.ref.current and l_isVisible_0 and l_tabList_0 then
            local v68 = l_tabList_0[l_currTabIndex_0];
            if v68 then
                v63.MainView = v5.createElement(v68.tab, {
                    size = l_l_l_size_0_0_0, 
                    formFactor = l_formFactor_0, 
                    isDeveloperView = l_isDeveloperView_0, 
                    tabList = l_tabList_0
                });
            end;
        end;
        return v5.createElement("Frame", {
            Position = l_position_0, 
            Size = l_size_0, 
            Visible = l_isVisible_0, 
            BackgroundColor3 = Color3.new(0, 0, 0), 
            Transparency = v8.MainWindowInit.Transparency, 
            BorderColor3 = v8.Color.BaseGray, 
            BorderSizePixel = v64, 
            Active = true, 
            AutoLocalize = false, 
            Selectable = false, 
            [v5.Ref] = v51.ref
        }, {
            DevConsoleUI = v5.createElement("Frame", {
                Size = l_l_size_0_0, 
                Position = v62, 
                BackgroundTransparency = 1
            }, v63), 
            ResizeButton = v5.createElement("ImageButton", {
                Position = UDim2.new(1, 0, 1, 0), 
                Size = UDim2.new(0, v64, 0, v64), 
                BackgroundColor3 = Color3.new(0, 0, 0), 
                Modal = true, 
                [v5.Event.InputBegan] = v51.resizeInputBegan
            })
        });
    end;
end;
return v6.UNSTABLE_connect2(function(v69, _) --[[ Line: 270 ]] --[[ Name: mapStateToProps ]]
    return {
        isVisible = v69.DisplayOptions.isVisible, 
        isMinimized = v69.DisplayOptions.isMinimized, 
        position = v69.DisplayOptions.position, 
        size = v69.DisplayOptions.size, 
        isDeveloperView = v69.MainView.isDeveloperView, 
        currTabIndex = v69.MainView.currTabIndex, 
        tabList = v69.MainView.tabList
    };
end, function(v71) --[[ Line: 282 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v15 (copy), v16 (copy), v17 (copy)
    return {
        dispatchChangeDevConsoleSize = function(v72) --[[ Line: 284 ]] --[[ Name: dispatchChangeDevConsoleSize ]]
            -- upvalues: v71 (copy), v15 (ref)
            v71(v15(v72));
        end, 
        dispatchSetDevConsolVisibility = function(v73) --[[ Line: 287 ]] --[[ Name: dispatchSetDevConsolVisibility ]]
            -- upvalues: v71 (copy), v16 (ref)
            v71(v16(v73));
        end, 
        dispatchSetDevConsoleMinimized = function(v74) --[[ Line: 290 ]] --[[ Name: dispatchSetDevConsoleMinimized ]]
            -- upvalues: v71 (copy), v17 (ref)
            v71(v17(v74));
        end
    };
end)(v19);