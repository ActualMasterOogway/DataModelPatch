local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Workspace_0 = game:GetService("Workspace");
local l_Players_0 = game:GetService("Players");
local l_VRService_0 = game:GetService("VRService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v9 = require(l_CorePackages_0.Packages.Roact);
local v10 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Actions_0 = l_Parent_1.Actions;
local l_Thunks_0 = l_Parent_1.Thunks;
local v15 = require(l_Actions_0.HideMenu);
local v16 = require(l_Actions_0.SetLayout);
local v17 = require(l_Actions_0.ShowError);
local v18 = require(l_Actions_0.HideError);
local v19 = require(l_Thunks_0.OpenMenu);
local v20 = require(l_Parent_0.EmotesWheel);
local v21 = require(l_Parent_0.ErrorMessage);
local v22 = require(l_Parent_1.Constants);
local l_Parent_2 = l_Parent_1.Parent;
local v24 = require(l_Parent_2.RobloxTranslator);
local v25 = require(l_RobloxGui_0.Modules.Flags.GetFFlagFixMissingPlayerGuiCrash);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v27 = nil;
local v28 = v9.PureComponent:extend("EmotesMenu");
v28.init = function(v29) --[[ Line: 42 ]] --[[ Name: init ]]
    v29.savedSelectedCoreObject = nil;
    v29.savedSelectedObject = nil;
end;
v28.displayVisitShopMessage = function(v30) --[[ Line: 47 ]] --[[ Name: displayVisitShopMessage ]]
    -- upvalues: v24 (copy), v22 (copy)
    local l_locale_0 = v30.props.locale;
    local v32 = v24:FormatByKeyForLocale(v22.LocalizationKeys.VisitShopToGetEmotes, l_locale_0);
    v30.props.showError(v32);
    delay(v22.ErrorDisplayTimeSeconds, function() --[[ Line: 51 ]]
        -- upvalues: v30 (copy)
        v30.props.hideError();
    end);
end;
v28.bindActions = function(v33) --[[ Line: 56 ]] --[[ Name: bindActions ]]
    -- upvalues: l_GuiService_0 (copy), l_UserInputService_0 (copy), l_ContextActionService_0 (copy), v22 (copy)
    local function v37(_, v35, _) --[[ Line: 57 ]] --[[ Name: toggleMenuFunc ]]
        -- upvalues: l_GuiService_0 (ref), l_UserInputService_0 (ref), v33 (copy)
        if l_GuiService_0.MenuIsOpen then
            return Enum.ContextActionResult.Pass;
        elseif l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift) then
            return Enum.ContextActionResult.Pass;
        else
            if v35 == Enum.UserInputState.Begin then
                if v33.props.displayOptions.menuVisible then
                    v33.props.hideMenu();
                else
                    v33.props.openMenu();
                end;
            end;
            return nil;
        end;
    end;
    l_ContextActionService_0:BindAction(v22.ToggleMenuAction, v37, false, v22.EmoteMenuOpenKey);
end;
v28.unbindActions = function(_) --[[ Line: 87 ]] --[[ Name: unbindActions ]]
    -- upvalues: l_ContextActionService_0 (copy), v22 (copy)
    l_ContextActionService_0:UnbindAction(v22.ToggleMenuAction);
end;
v28.saveSelectedObject = function(v39) --[[ Line: 91 ]] --[[ Name: saveSelectedObject ]]
    -- upvalues: l_GuiService_0 (copy)
    v39.savedSelectedCoreObject = l_GuiService_0.SelectedCoreObject;
    l_GuiService_0.SelectedCoreObject = nil;
    v39.savedSelectedObject = l_GuiService_0.SelectedObject;
    l_GuiService_0.SelectedObject = nil;
end;
v28.resetSelectedObject = function(v40) --[[ Line: 98 ]] --[[ Name: resetSelectedObject ]]
    -- upvalues: l_GuiService_0 (copy), l_CoreGui_0 (copy), v25 (copy), v27 (ref), l_LocalPlayer_0 (copy)
    if l_GuiService_0.SelectedCoreObject == nil then
        local v41 = true;
        if v40.savedSelectedCoreObject ~= nil then
            v41 = v40.savedSelectedCoreObject:IsDescendantOf(l_CoreGui_0);
        end;
        if v41 then
            l_GuiService_0.SelectedCoreObject = v40.savedSelectedCoreObject;
        end;
    end;
    if l_GuiService_0.SelectedObject == nil then
        if v25() then
            if v27 == nil then
                v27 = l_LocalPlayer_0:FindFirstChildOfClass("PlayerGui");
            end;
        elseif v27 == nil then
            v27 = l_LocalPlayer_0:WaitForChild("PlayerGui");
        end;
        if if v27 then v40.savedSelectedObject == nil or v40.savedSelectedObject:IsDescendantOf(v27) else false then
            l_GuiService_0.SelectedObject = v40.savedSelectedObject;
        end;
    end;
end;
v28.viewPortSizeChanged = function(v42) --[[ Line: 127 ]] --[[ Name: viewPortSizeChanged ]]
    -- upvalues: v22 (copy), l_Workspace_0 (copy)
    if v42.props.layout == v22.Layout.TenFoot then
        return;
    else
        local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
        if not l_CurrentCamera_0 then
            return;
        else
            local l_ViewportSize_0 = l_CurrentCamera_0.ViewportSize;
            if l_ViewportSize_0 == Vector2.new(1, 1) then
                return;
            else
                local l_Large_0 = v22.Layout.Large;
                local v46 = l_ViewportSize_0.X < v22.SmallScreenMaxSize.X;
                local v47 = l_ViewportSize_0.Y < v22.SmallScreenMaxSize.Y;
                if v46 or v47 then
                    l_Large_0 = v22.Layout.Small;
                end;
                v42.props.setLayout(l_Large_0);
                return;
            end;
        end;
    end;
end;
v28.currentCameraChanged = function(v48) --[[ Line: 155 ]] --[[ Name: currentCameraChanged ]]
    -- upvalues: l_Workspace_0 (copy)
    if v48.viewportSizeChangedConn then
        v48.viewportSizeChangedConn:Disconnect();
    end;
    local l_CurrentCamera_1 = l_Workspace_0.CurrentCamera;
    if l_CurrentCamera_1 then
        v48.viewportSizeChangedConn = l_CurrentCamera_1:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 162 ]]
            -- upvalues: v48 (copy)
            v48:viewPortSizeChanged();
        end);
        v48:viewPortSizeChanged();
    end;
end;
v28.didMount = function(v50) --[[ Line: 169 ]] --[[ Name: didMount ]]
    -- upvalues: l_Workspace_0 (copy), l_GuiService_0 (copy), l_VRService_0 (copy), l_UserInputService_0 (copy)
    v50.currentCameraChangedConn = l_Workspace_0:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 170 ]]
        -- upvalues: v50 (copy)
        v50:currentCameraChanged();
    end);
    v50:currentCameraChanged();
    v50.menuOpenedConn = l_GuiService_0.MenuOpened:Connect(function() --[[ Line: 175 ]]
        -- upvalues: v50 (copy), l_VRService_0 (ref)
        if v50.props.displayOptions.menuVisible and not l_VRService_0.VREnabled then
            v50.props.hideMenu();
        end;
    end);
    v50.inputOutsideMenuConn = l_UserInputService_0.InputBegan:Connect(function(v51, v52) --[[ Line: 181 ]]
        -- upvalues: v50 (copy)
        if v52 then
            return;
        elseif not v50.props.displayOptions.menuVisible then
            return;
        else
            local l_UserInputType_0 = v51.UserInputType;
            if l_UserInputType_0 == Enum.UserInputType.MouseButton1 or l_UserInputType_0 == Enum.UserInputType.Touch then
                v50.props.hideMenu();
            end;
            return;
        end;
    end);
    v50:bindActions();
end;
v28.willUnmount = function(v54) --[[ Line: 201 ]] --[[ Name: willUnmount ]]
    v54.currentCameraChangedConn:Disconnect();
    v54.viewportSizeChangedConn:Disconnect();
    v54.menuOpenedConn:Disconnect();
    v54.inputOutsideMenuConn:Disconnect();
    v54.currentCameraChangedConn = nil;
    v54.viewportSizeChangedConn = nil;
    v54.menuOpenedConn = nil;
    v54.inputOutsideMenuConn = nil;
    v54:unbindActions();
end;
v28.didUpdate = function(v55, v56, _) --[[ Line: 215 ]] --[[ Name: didUpdate ]]
    if v55.props.displayOptions.menuVisible ~= v56.displayOptions.menuVisible then
        if v55.props.displayOptions.menuVisible then
            v55:saveSelectedObject();
            return;
        else
            v55:resetSelectedObject();
        end;
    end;
end;
v28.render = function(v58) --[[ Line: 225 ]] --[[ Name: render ]]
    -- upvalues: v22 (copy), v9 (copy), v20 (copy), v21 (copy)
    local v59 = v22.Layouts[v58.props.layout];
    local l_guiInset_0 = v58.props.displayOptions.guiInset;
    return v9.createElement("Frame", {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Position = UDim2.new(0, 0, 0, -l_guiInset_0), 
        Size = UDim2.new(1, 0, 1, l_guiInset_0), 
        ZIndex = v22.EmotesMenuZIndex, 
        AutoLocalize = false
    }, {
        Main = v9.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = v22.ScreenAvailable, 
            BackgroundTransparency = 1
        }, {
            AsspectRatioConstraint = v9.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }), 
            SizeConstraint = v9.createElement("UISizeConstraint", {
                MinSize = v59.EmotesWheelMinSize, 
                MaxSize = v59.EmotesWheelMaxSize
            }), 
            EmotesWheel = v9.createElement(v20)
        }), 
        ErrorMessage = v9.createElement(v21)
    });
end;
return v10.connect(function(v61) --[[ Line: 259 ]] --[[ Name: mapStateToProps ]]
    return {
        displayOptions = v61.displayOptions, 
        emotesInfo = v61.emotesPage.emotesInfo, 
        layout = v61.layout, 
        locale = v61.locale
    };
end, function(v62) --[[ Line: 268 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v19 (copy), v15 (copy), v16 (copy), v17 (copy), v18 (copy)
    return {
        openMenu = function() --[[ Line: 270 ]] --[[ Name: openMenu ]]
            -- upvalues: v62 (copy), v19 (ref)
            return v62(v19());
        end, 
        hideMenu = function() --[[ Line: 274 ]] --[[ Name: hideMenu ]]
            -- upvalues: v62 (copy), v15 (ref)
            return v62(v15());
        end, 
        setLayout = function(v63) --[[ Line: 278 ]] --[[ Name: setLayout ]]
            -- upvalues: v62 (copy), v16 (ref)
            return v62(v16(v63));
        end, 
        showError = function(v64) --[[ Line: 282 ]] --[[ Name: showError ]]
            -- upvalues: v62 (copy), v17 (ref)
            return v62(v17(v64));
        end, 
        hideError = function() --[[ Line: 286 ]] --[[ Name: hideError ]]
            -- upvalues: v62 (copy), v18 (ref)
            return v62(v18());
        end
    };
end)(v28);