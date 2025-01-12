local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
if not l_LocalPlayer_0 then
    l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v9 = require(l_CorePackages_0.Packages.Roact);
local v10 = require(l_CorePackages_0.Packages.Rodux);
local v11 = require(l_CorePackages_0.Packages.RoactRodux);
local v12 = require(l_CorePackages_0.Packages.UIBlox);
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Actions_0 = l_Parent_0.Actions;
local l_Components_0 = l_Parent_0.Components;
local l_Reducers_0 = l_Parent_0.Reducers;
local l_Thunks_0 = l_Parent_0.Thunks;
local l_Utility_0 = l_Parent_0.Utility;
local v20 = require(l_Parent_1.BackpackScript);
local v21 = require(l_Parent_1.ChatSelector);
local v22 = require(l_Parent_1.TenFootInterface);
local v23 = require(l_Parent_1.TopBar.Constants);
local l_InExperienceAppChatModal_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).App.InExperienceAppChatModal;
local l_getFFlagAppChatCoreUIConflictFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).getFFlagAppChatCoreUIConflictFix;
local l_Constants_0 = v12.App.Style.Constants;
local l_UiModeStyleProvider_0 = require(l_CorePackages_0.Workspace.Packages.Style).UiModeStyleProvider;
local v28 = require(l_Utility_0.CanPlayEmotes);
local v29 = require(l_Parent_0.Constants);
local v30 = require(l_Components_0.EmotesMenu);
local v31 = require(l_Reducers_0.EmotesMenuReducer);
local v32 = require(l_Thunks_0.OpenMenu);
local v33 = require(l_Actions_0.HideMenu);
local v34 = require(l_Actions_0.EmotesChanged);
local v35 = require(l_Actions_0.EquippedEmotesChanged);
local v36 = require(l_Actions_0.NumberEmotesLoadedChanged);
local v37 = require(l_Actions_0.SetGuiInset);
local v38 = require(l_Actions_0.SetLayout);
local v39 = require(l_Actions_0.SetLocale);
local v40 = {};
v40.__index = v40;
local function _() --[[ Line: 63 ]] --[[ Name: isClient ]]
    -- upvalues: l_RunService_0 (copy)
    return l_RunService_0:IsClient() and not l_RunService_0:IsEdit() and not l_RunService_0:IsRunMode();
end;
v40.isOpen = function(v42) --[[ Line: 67 ]] --[[ Name: isOpen ]]
    return v42.store:getState().displayOptions.menuVisible;
end;
v40.isEmotesLoaded = function(v43) --[[ Line: 71 ]] --[[ Name: isEmotesLoaded ]]
    return v43.store:getState().emotesPage.numberEmotesLoaded > 0;
end;
v40.open = function(v44) --[[ Line: 75 ]] --[[ Name: open ]]
    -- upvalues: v32 (copy)
    v44.store:dispatch(v32());
end;
v40.close = function(v45) --[[ Line: 79 ]] --[[ Name: close ]]
    -- upvalues: v33 (copy)
    v45.store:dispatch(v33());
end;
v40.setTopBarEnabled = function(v46, v47) --[[ Line: 83 ]] --[[ Name: setTopBarEnabled ]]
    -- upvalues: l_StarterGui_0 (copy)
    v46.topBarEnabled = v47;
    local l_l_StarterGui_0_CoreGuiEnabled_0 = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu);
    if v47 and l_l_StarterGui_0_CoreGuiEnabled_0 and v46.canPlayEmotes then
        v46:_mount();
        return;
    else
        v46:_unmount();
        return;
    end;
end;
v40._connectCoreGuiListeners = function(v49) --[[ Line: 94 ]] --[[ Name: _connectCoreGuiListeners ]]
    -- upvalues: v20 (copy), v21 (copy), l_getFFlagAppChatCoreUIConflictFix_0 (copy), l_InExperienceAppChatModal_0 (copy)
    v20.StateChanged.Event:Connect(function(v50) --[[ Line: 95 ]]
        -- upvalues: v49 (copy)
        if not v50 then
            return;
        else
            if v49:isOpen() then
                v49:close();
            end;
            return;
        end;
    end);
    v21.VisibilityStateChanged:connect(function(v51) --[[ Line: 105 ]]
        -- upvalues: v49 (copy)
        if not v51 then
            return;
        else
            if v49:isOpen() then
                v49:close();
            end;
            return;
        end;
    end);
    if l_getFFlagAppChatCoreUIConflictFix_0() then
        l_InExperienceAppChatModal_0.default.visibilitySignal.Event:Connect(function(v52) --[[ Line: 116 ]]
            -- upvalues: v49 (copy)
            if v52 and v49:isOpen() then
                v49:close();
            end;
        end);
    end;
end;
v40._connectApiListeners = function(v53) --[[ Line: 124 ]] --[[ Name: _connectApiListeners ]]
    -- upvalues: l_StarterGui_0 (copy), l_GuiService_0 (copy)
    l_StarterGui_0.CoreGuiChangedSignal:connect(function(v54, v55) --[[ Line: 125 ]]
        -- upvalues: v53 (copy)
        if not v53.topBarEnabled then
            return;
        elseif not v53.canPlayEmotes then
            return;
        else
            if v54 == Enum.CoreGuiType.EmotesMenu or v54 == Enum.CoreGuiType.All then
                if v55 then
                    v53:_mount();
                    return;
                else
                    v53:_unmount();
                end;
            end;
            return;
        end;
    end);
    l_GuiService_0.EmotesMenuOpenChanged:Connect(function(v56) --[[ Line: 143 ]]
        -- upvalues: v53 (copy)
        if v56 then
            if not v53:isOpen() then
                v53:open();
                return;
            end;
        elseif v53:isOpen() then
            v53:close();
        end;
    end);
end;
v40._onEquippedEmotesChanged = function(v57, v58) --[[ Line: 156 ]] --[[ Name: _onEquippedEmotesChanged ]]
    -- upvalues: v35 (copy)
    v57.store:dispatch(v35(v58));
end;
v40._onEmotesChanged = function(v59, v60) --[[ Line: 160 ]] --[[ Name: _onEmotesChanged ]]
    -- upvalues: v34 (copy)
    v59.store:dispatch(v34(v60));
end;
v40._onNumberEmotesLoadedChanged = function(v61, v62) --[[ Line: 164 ]] --[[ Name: _onNumberEmotesLoadedChanged ]]
    -- upvalues: v36 (copy)
    v61.store:dispatch(v36(v62));
    v61.EmotesLoaded:Fire(v62 > 0);
end;
v40._onHumanoidDescriptionChanged = function(v63, v64) --[[ Line: 169 ]] --[[ Name: _onHumanoidDescriptionChanged ]]
    if v63.equippedEmotesChangedConn then
        v63.equippedEmotesChangedConn:Disconnect();
        v63.equippedEmotesChangedConn = nil;
    end;
    if v63.emotesChangedConn then
        v63.emotesChangedConn:Disconnect();
        v63.emotesChangedConn = nil;
    end;
    if v63.numberEmotesLoadedChangedConn then
        v63.numberEmotesLoadedChangedConn:Disconnect();
        v63.numberEmotesLoadedChangedConn = nil;
    end;
    if v63.humanoidDescriptionAncestryConn then
        v63.humanoidDescriptionAncestryConn:Disconnect();
        v63.humanoidDescriptionAncestryConn = nil;
    end;
    if v64 then
        v63.equippedEmotesChangedConn = v64.EquippedEmotesChanged:Connect(function(v65) --[[ Line: 191 ]]
            -- upvalues: v63 (copy)
            v63:_onEquippedEmotesChanged(v65);
        end);
        v63:_onEquippedEmotesChanged(v64:GetEquippedEmotes());
        v63.emotesChangedConn = v64.EmotesChanged:Connect(function(v66) --[[ Line: 196 ]]
            -- upvalues: v63 (copy)
            v63:_onEmotesChanged(v66);
        end);
        v63:_onEmotesChanged(v64:GetEmotes());
        v63.numberEmotesLoadedChangedConn = v64:GetPropertyChangedSignal("NumberEmotesLoaded"):Connect(function(v67) --[[ Line: 203 ]]
            -- upvalues: v63 (copy)
            v63:_onNumberEmotesLoadedChanged(v67);
        end);
        v63:_onNumberEmotesLoadedChanged(v64.NumberEmotesLoaded);
        v63.humanoidDescriptionAncestryConn = v64.AncestryChanged:Connect(function(v68, v69) --[[ Line: 208 ]]
            -- upvalues: v64 (copy), v63 (copy)
            if v68 == v64 and v69 == nil then
                v63:_onHumanoidDescriptionChanged(nil);
            end;
        end);
        return;
    else
        v63:_onEquippedEmotesChanged({});
        v63:_onEmotesChanged({});
        v63:_onNumberEmotesLoadedChanged(-1);
        return;
    end;
end;
v40._onHumanoidChanged = function(v70, v71) --[[ Line: 220 ]] --[[ Name: _onHumanoidChanged ]]
    if v70.humanoidChildAddedConn then
        v70.humanoidChildAddedConn:Disconnect();
        v70.humanoidChildAddedConn = nil;
    end;
    if v70.humanoidAncestryChangedConn then
        v70.humanoidAncestryChangedConn:Disconnect();
        v70.humanoidAncestryChangedConn = nil;
    end;
    if v71 then
        v70.humanoidChildAddedConn = v71.ChildAdded:Connect(function(v72) --[[ Line: 232 ]]
            -- upvalues: v70 (copy)
            if v72:IsA("HumanoidDescription") then
                v70:_onHumanoidDescriptionChanged(v72);
            end;
        end);
        local l_HumanoidDescription_0 = v71:FindFirstChildOfClass("HumanoidDescription");
        if l_HumanoidDescription_0 then
            v70:_onHumanoidDescriptionChanged(l_HumanoidDescription_0);
        end;
        v70.humanoidAncestryChangedConn = v71.AncestryChanged:Connect(function(v74, v75) --[[ Line: 243 ]]
            -- upvalues: v71 (copy), v70 (copy)
            if v74 == v71 and v75 == nil then
                v70:_onHumanoidChanged(nil);
            end;
        end);
        return;
    else
        v70:_onHumanoidDescriptionChanged(nil);
        return;
    end;
end;
v40._onCharacterAdded = function(v76, v77) --[[ Line: 253 ]] --[[ Name: _onCharacterAdded ]]
    if v76.characterChildAddedConn then
        v76.characterChildAddedConn:Disconnect();
        v76.characterChildAddedConn = nil;
    end;
    v76.characterChildAddedConn = v77.ChildAdded:Connect(function(v78) --[[ Line: 259 ]]
        -- upvalues: v76 (copy)
        if v78:IsA("Humanoid") then
            v76:_onHumanoidChanged(v78);
        end;
    end);
    local l_Humanoid_0 = v77:FindFirstChildWhichIsA("Humanoid");
    if l_Humanoid_0 then
        v76:_onHumanoidChanged(l_Humanoid_0);
    end;
end;
v40._connectListeners = function(v80) --[[ Line: 271 ]] --[[ Name: _connectListeners ]]
    -- upvalues: l_LocalPlayer_0 (ref), l_LocalizationService_0 (copy), v39 (copy), v28 (copy), l_StarterGui_0 (copy)
    v80:_connectCoreGuiListeners();
    v80:_connectApiListeners();
    l_LocalPlayer_0.CharacterAdded:Connect(function(v81) --[[ Line: 275 ]]
        -- upvalues: v80 (copy)
        v80:_onCharacterAdded(v81);
    end);
    if l_LocalPlayer_0.Character then
        v80:_onCharacterAdded(l_LocalPlayer_0.Character);
    end;
    l_LocalizationService_0:GetPropertyChangedSignal("RobloxLocaleId"):Connect(function() --[[ Line: 283 ]]
        -- upvalues: v80 (copy), v39 (ref), l_LocalizationService_0 (ref)
        v80.store:dispatch(v39(l_LocalizationService_0.RobloxLocaleId));
    end);
    v28.ChangedEvent.Event:connect(function(v82) --[[ Line: 287 ]]
        -- upvalues: v80 (copy), l_StarterGui_0 (ref)
        v80.canPlayEmotes = v82;
        local l_l_StarterGui_0_CoreGuiEnabled_1 = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu);
        if v82 and v80.topBarEnabled and l_l_StarterGui_0_CoreGuiEnabled_1 then
            v80:_mount();
            return;
        else
            v80:_unmount();
            return;
        end;
    end);
end;
v40._onStateChanged = function(v84, v85, v86) --[[ Line: 299 ]] --[[ Name: _onStateChanged ]]
    -- upvalues: l_GuiService_0 (copy)
    if v86.displayOptions.menuVisible ~= v85.displayOptions.menuVisible then
        v84.EmotesMenuToggled:Fire(v85.displayOptions.menuVisible);
        l_GuiService_0:SetEmotesMenuOpen(v85.displayOptions.menuVisible);
    end;
end;
v40._mount = function(v87) --[[ Line: 307 ]] --[[ Name: _mount ]]
    -- upvalues: l_Constants_0 (copy), v9 (copy), v11 (copy), l_UiModeStyleProvider_0 (copy), v30 (copy), l_RobloxGui_0 (copy)
    local v88 = {
        themeName = l_Constants_0.ThemeName.Dark, 
        fontName = l_Constants_0.FontName.Gotham
    };
    if not v87.instance then
        local v89 = v9.createElement(v11.StoreProvider, {
            store = v87.store
        }, {
            StyleProvider = v9.createElement(l_UiModeStyleProvider_0, {
                style = v88
            }, {
                EmotesMenu = v9.createElement(v30)
            })
        });
        v87.instance = v9.mount(v89, l_RobloxGui_0, "EmotesMenu");
        v87.MenuIsVisible = true;
        v87.MenuVisibilityChanged:Fire(true);
    end;
end;
v40._unmount = function(v90) --[[ Line: 331 ]] --[[ Name: _unmount ]]
    -- upvalues: v9 (copy)
    if v90.instance then
        v9.unmount(v90.instance);
        v90.instance = nil;
        v90.MenuIsVisible = false;
        v90.MenuVisibilityChanged:Fire(false);
    end;
end;
v40.new = function() --[[ Line: 341 ]] --[[ Name: new ]]
    -- upvalues: v40 (copy), v28 (copy), v10 (copy), v31 (copy), l_RunService_0 (copy), v39 (copy), l_LocalizationService_0 (copy), v22 (copy), v38 (copy), v29 (copy), v23 (copy), l_RobloxGui_0 (copy), v37 (copy)
    local v91 = setmetatable({}, v40);
    v91.canPlayEmotes = v28.Value;
    v91.topBarEnabled = true;
    v91.EmotesMenuToggled = Instance.new("BindableEvent");
    v91.MenuIsVisible = false;
    v91.MenuVisibilityChanged = Instance.new("BindableEvent");
    v91.EmotesLoaded = Instance.new("BindableEvent");
    v91.store = v10.Store.new(v31, {}, {
        v10.thunkMiddleware
    });
    if not (l_RunService_0:IsClient() and not l_RunService_0:IsEdit() and not l_RunService_0:IsRunMode()) then
        return v91;
    else
        v91.store.changed:connect(function(v92, v93) --[[ Line: 371 ]]
            -- upvalues: v91 (copy)
            v91:_onStateChanged(v92, v93);
        end);
        v91.store:dispatch(v39(l_LocalizationService_0.RobloxLocaleId));
        if v22:IsEnabled() then
            v91.store:dispatch(v38(v29.Layout.TenFoot));
        end;
        local l_TopBarHeight_0 = v23.TopBarHeight;
        if not l_RobloxGui_0.IgnoreGuiInset then
            v91.store:dispatch(v37(l_TopBarHeight_0));
        end;
        v91:_mount();
        v91:_connectListeners();
        return v91;
    end;
end;
return v40.new();