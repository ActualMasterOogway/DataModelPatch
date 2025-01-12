local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_VRService_0 = game:GetService("VRService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local _ = game:GetService("GamepadService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local l_Modules_0 = l_RobloxGui_0:WaitForChild("Modules");
local l_Panel3D_0 = require(l_CorePackages_0.Workspace.Packages.VrCommon).Panel3D;
local v10 = require(l_RobloxGui_0.Modules.VR.VRHub);
local v11 = require(l_RobloxGui_0.Modules.VR.VirtualKeyboard);
local v12 = require(l_RobloxGui_0.Modules.InGameMenuConstants);
local l_CorePackages_1 = game:GetService("CorePackages");
local l_VRConstants_0 = require(l_CorePackages_1.Workspace.Packages.VrCompatibility).VRConstants;
local _ = game:GetService("UserInputService");
local _ = game:GetService("RunService");
local l_UIManager_0 = l_Modules_0:WaitForChild("UIManager");
local l_PanelType_0 = require(l_UIManager_0.Constants).PanelType;
local v19 = require(l_UIManager_0.UIManager);
local _ = require(l_UIManager_0.Constants);
local v21 = require(l_RobloxGui_0.Modules.Flags.FFlagEnableSpatialRobloxGui);
local v22 = (require(l_RobloxGui_0.Modules.Flags.GetFIntVRScaleGuiDistance) or 100)() * 0.01;
if not l_VRService_0.VREnabled then
    warn("UserGui should not be required while not in VR");
    return nil;
else
    if game:GetEngineFeature("ExposeOpenXrAPI1") then
        l_VRService_0.QuestDisplayRefreshRate = 90;
    end;
    local v23 = {
        ModuleName = "UserGui", 
        KeepVRTopbarOpen = false, 
        VRIsExclusive = false, 
        VRClosesNonExclusive = false, 
        SetVisible = nil
    };
    v10:RegisterModule(v23);
    local _ = Vector2.new(4, 3);
    local v25 = Vector2.new(2.66 * v22, 2 * v22);
    local v26 = false;
    local v27 = l_Panel3D_0.Get(v23.ModuleName);
    v27:SetType(l_Panel3D_0.Type.NewStandard);
    v27:GetPart().CanQuery = false;
    local v28 = Vector2.new(2.7978, 2.09835);
    v27:ResizeStuds(v28.x, v28.y, 128);
    v27:SetVisible(false);
    local v29 = nil;
    if v21 then
        v29 = l_Panel3D_0.Get(l_VRConstants_0.PositionLockedPanelName);
        config = {};
        local v30 = {
            panelType = l_PanelType_0.RobloxGui
        };
        config.uiManagerPanelPart = v19:createUI(v30).panelObject;
        v29:SetType(l_Panel3D_0.Type.UIManagerManaged, config);
    else
        v29 = l_Panel3D_0.Get(l_VRConstants_0.PositionLockedPanelName);
        v29:SetType(l_Panel3D_0.Type.PositionLocked);
    end;
    v29:GetPart().CanQuery = false;
    v29:ResizeStuds(v25.x, v25.y, 128);
    v29:SetVisible(false);
    v29.showCursor = true;
    v10.ModuleOpened.Event:connect(function(v31) --[[ Line: 96 ]]
        -- upvalues: v23 (copy), v10 (copy), v27 (copy)
        if v31 ~= v23.ModuleName and v10:GetModule(v31).VRClosesNonExclusive and v27:IsVisible() then
            v23:SetVisible(false, nil);
        end;
    end);
    local v32 = false;
    local v33 = false;
    v23.SetVisible = function(_, v35, v36) --[[ Line: 108 ]] --[[ Name: SetVisible ]]
        -- upvalues: v33 (ref), v10 (copy), v23 (copy), v32 (ref), v21 (copy), l_CoreGui_0 (copy)
        v33 = v35;
        if v36 then
            v36:SetVisible(v33);
        end;
        if v33 then
            v10:FireModuleOpened(v23.ModuleName);
        else
            v10:FireModuleClosed(v23.ModuleName);
        end;
        local v37 = v33 and not v32;
        if v21 then
            l_CoreGui_0:SetUserGuiRendering(true, v37 and v36 and v36:GetPart() or nil, Enum.NormalId.Back);
            return;
        else
            l_CoreGui_0:SetUserGuiRendering(true, v37 and v36 and v36:GetPart() or nil, Enum.NormalId.Front);
            return;
        end;
    end;
    v23.IsVisible = function(_) --[[ Line: 130 ]] --[[ Name: IsVisible ]]
        -- upvalues: v33 (ref)
        return v33;
    end;
    v23.Update = function(v39) --[[ Line: 134 ]] --[[ Name: Update ]]
        -- upvalues: v33 (ref)
        v39:SetVisible(v33);
    end;
    local function v40() --[[ Line: 139 ]] --[[ Name: onGuiSelection ]]
        -- upvalues: v10 (copy), v23 (copy), v29 (ref), v22 (copy), v26 (ref), v25 (copy), l_GuiService_0 (copy)
        v10.LaserPointer:updateInputUserCFrame();
        if v10.ShowTopBar then
            v23:SetVisible(true, v29);
            v29.initialCFLerp = 1;
            v29:ForcePositionUpdate(true);
            v29.distance = 2.5 * v22;
            if not v26 then
                v29:StartLerp(v25);
                v26 = true;
                return;
            end;
        else
            v29:StartLerp(v25 * 0.25);
            v23:SetVisible(false, v29);
            l_GuiService_0.SelectedObject = nil;
            v26 = false;
        end;
    end;
    v10.ShowTopBarChanged.Event:connect(v40);
    l_GuiService_0:GetPropertyChangedSignal("MenuIsOpen"):Connect(v40);
    l_VRService_0.UserCFrameEnabled:Connect(v40);
    l_GuiService_0.PurchasePromptShown:Connect(function() --[[ Line: 166 ]]
        -- upvalues: v10 (copy)
        if not v10.ShowTopBar then
            v10:SetShowTopBar(true);
        end;
    end);
    local function v42(_) --[[ Line: 173 ]] --[[ Name: onGuiSelectedObjectChanged ]]
        -- upvalues: l_GuiService_0 (copy), v10 (copy)
        if (l_GuiService_0.SelectedObject or l_GuiService_0.SelectedCoreObject) and not v10.ShowTopBar then
            v10:SetShowTopBar(true);
        end;
        l_GuiService_0.SelectedObject = nil;
        l_GuiService_0.SelectedCoreObject = nil;
    end;
    l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(v42);
    l_GuiService_0:GetPropertyChangedSignal("SelectedObject"):Connect(v42);
    local v43 = require(l_RobloxGui_0.Modules.InGameMenu);
    local function v47(v44, v45, _) --[[ Line: 185 ]] --[[ Name: handleAction ]]
        -- upvalues: v10 (copy), l_RbxAnalyticsService_0 (copy), v43 (copy), v12 (copy)
        if v44 == "OpenVRMenu" and v45 == Enum.UserInputState.Begin then
            if not v10.ShowTopBar then
                v10:SetShowTopBar(true);
                l_RbxAnalyticsService_0:ReportCounter("VR-BindAction-ToggleGui-On");
            else
                v10:SetShowTopBar(false);
                v43.closeInGameMenu();
                l_RbxAnalyticsService_0:ReportCounter("VR-BindAction-ToggleGui-Off");
            end;
        end;
        if v44 == "OpenIGMenu" and v45 == Enum.UserInputState.Begin then
            if not v10.ShowTopBar then
                v10:SetShowTopBar(true);
            end;
            if not v43.getOpen() then
                v43.openInGameMenu(v12.MainPagePageKey);
            end;
        end;
    end;
    l_ContextActionService_0:BindAction("OpenVRMenu", v47, false, Enum.KeyCode.ButtonSelect);
    l_ContextActionService_0:BindAction("OpenIGMenu", v47, false, Enum.KeyCode.ButtonStart);
    local function v48() --[[ Line: 212 ]] --[[ Name: OnVREnabledChanged ]]
        -- upvalues: l_VRService_0 (copy), v27 (copy), l_CoreGui_0 (copy), v23 (copy), v29 (ref), v10 (copy)
        if not l_VRService_0.VREnabled then
            v27:SetVisible(false);
            l_CoreGui_0:SetUserGuiRendering(false, nil, Enum.NormalId.Front);
            return;
        else
            v23:SetVisible(false, v27);
            v23:SetVisible(true, v29);
            v10:SetShowTopBar(true);
            return;
        end;
    end;
    l_VRService_0:GetPropertyChangedSignal("VREnabled"):connect(v48);
    v48();
    v11.OpenedEvent:connect(function() --[[ Line: 225 ]]
        -- upvalues: v32 (ref), v23 (copy)
        v32 = true;
        v23:Update();
    end);
    v11.ClosedEvent:connect(function() --[[ Line: 230 ]]
        -- upvalues: v32 (ref), v23 (copy)
        v32 = false;
        v23:Update();
    end);
    v10:SetShowTopBar(true);
    v40();
    v23.getPanel = function(_) --[[ Line: 238 ]] --[[ Name: getPanel ]]
        -- upvalues: v29 (ref)
        return v29;
    end;
    return v23;
end;