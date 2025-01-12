local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Parent_0 = script.Parent.Parent.Parent;
local v8 = require(l_Parent_0.Actions.ClosePlayerDropDown);
local v9 = require(l_Parent_0.Actions.SetPlayerListVisibility);
local v10 = require(l_CoreGui_0.RobloxGui.Modules.isNewInGameMenuEnabled);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v12 = v5.PureComponent:extend("TenFootSideBar");
local v13 = game:DefineFastFlag("RemoveGamerCardFromSideBar", false);
local function _(v14) --[[ Line: 24 ]] --[[ Name: openPlatformProfileUI ]]
    pcall(function() --[[ Line: 25 ]]
        -- upvalues: v14 (copy)
        local l_PlatformService_0 = game:GetService("PlatformService");
        if v14 and #v14 > 0 then
            l_PlatformService_0:PopupProfileUI(Enum.UserInputType.Gamepad1, v14);
        end;
    end);
end;
v12.init = function(v17) --[[ Line: 33 ]] --[[ Name: init ]]
    v17.sideBar = nil;
end;
v12.render = function(_) --[[ Line: 37 ]] --[[ Name: render ]]
    return nil;
end;
v12.shouldShowSidebar = function(_, v20, v21) --[[ Line: 41 ]] --[[ Name: shouldShowSidebar ]]
    -- upvalues: l_RunService_0 (copy), l_Players_0 (copy)
    if l_RunService_0:IsStudio() then
        return false, false;
    else
        local v22 = false;
        if v20 ~= l_Players_0.LocalPlayer then
            v22 = true;
        end;
        local v23 = false;
        if v21 and #v21 > 0 then
            v23 = true;
        end;
        return v22, v23;
    end;
end;
v12.openSidebar = function(v24, v25) --[[ Line: 58 ]] --[[ Name: openSidebar ]]
    -- upvalues: v13 (copy), l_RunService_0 (copy), l_Players_0 (copy), l_GuiService_0 (copy), l_RobloxGui_0 (copy), v10 (copy)
    local v26 = nil;
    local v27 = false;
    local v28 = nil;
    if v13 then
        v26 = not l_RunService_0:IsStudio() and v25 ~= l_Players_0.LocalPlayer;
    else
        pcall(function() --[[ Line: 66 ]]
            -- upvalues: v28 (ref), v25 (copy)
            v28 = game:GetService("PlatformService"):GetPlatformId(v25.UserId);
        end);
        local v29, v30 = v24:shouldShowSidebar(v25, v28);
        v26 = v29;
        v27 = v30;
    end;
    if not v26 and not v27 then
        v24.props.closeSideBar();
        return;
    else
        local l_SelectedCoreObject_0 = l_GuiService_0.SelectedCoreObject;
        local v32 = l_RobloxGui_0.Modules:FindFirstChild("ScreenManager") or l_RobloxGui_0.Modules.Shell.ScreenManager;
        local v33 = require(v32);
        local v34 = l_RobloxGui_0.Modules:FindFirstChild("LocalizedStrings") or l_RobloxGui_0.Modules.Shell.LocalizedStrings;
        local v35 = require(v34);
        if not v24.sideBar then
            local v36 = l_RobloxGui_0.Modules:FindFirstChild("SideBar") or l_RobloxGui_0.Modules.Shell.SideBar;
            v24.sideBar = require(v36)();
        end;
        v24.sideBar:RemoveAllItems();
        if not v13 and v27 then
            v24.sideBar:AddItem(v35:LocalizedString("ViewGamerCardWord"), function() --[[ Line: 96 ]]
                -- upvalues: v28 (ref)
                local l_v28_0 = v28;
                pcall(function() --[[ Line: 25 ]]
                    -- upvalues: l_v28_0 (copy)
                    local l_PlatformService_1 = game:GetService("PlatformService");
                    if l_v28_0 and #l_v28_0 > 0 then
                        l_PlatformService_1:PopupProfileUI(Enum.UserInputType.Gamepad1, l_v28_0);
                    end;
                end);
            end);
        end;
        if v26 then
            local v39 = v35:LocalizedString("ReportPlayer");
            v24.sideBar:AddItem(v39, function() --[[ Line: 105 ]]
                -- upvalues: v24 (copy), l_GuiService_0 (ref), v10 (ref), l_RobloxGui_0 (ref), v25 (copy)
                v24.props.closePlayerList();
                l_GuiService_0.SelectedCoreObject = nil;
                if v10() then
                    require(l_RobloxGui_0.Modules.InGameMenuInit).openReportDialog(v25, v24.__componentName);
                    return;
                else
                    require(l_RobloxGui_0.Modules.Settings.Pages.ReportAbuseMenuNewContainerPage):ReportPlayer(v25, v24.__componentName);
                    return;
                end;
            end);
        end;
        local v40 = nil;
        v40 = v24.sideBar.Closed:connect(function() --[[ Line: 122 ]]
            -- upvalues: v40 (ref), v24 (copy), l_SelectedCoreObject_0 (copy), l_GuiService_0 (ref)
            v40:disconnect();
            v24.props.closeSideBar();
            if v24.props.playerListVisible then
                if l_SelectedCoreObject_0 and l_SelectedCoreObject_0.Parent then
                    l_GuiService_0.SelectedCoreObject = l_SelectedCoreObject_0;
                    return;
                else
                    v24.props.closePlayerList();
                    v24.props.openPlayerList();
                end;
            end;
        end);
        v33:OpenScreen(v24.sideBar, false);
        return;
    end;
end;
v12.didMount = function(v41) --[[ Line: 139 ]] --[[ Name: didMount ]]
    if v41.props.sideBarVisible then
        v41:openSidebar(v41.props.selectedPlayer);
    end;
end;
v12.didUpdate = function(v42, v43) --[[ Line: 145 ]] --[[ Name: didUpdate ]]
    if v42.props.sideBarVisible and v42.props.sideBarVisible ~= v43.sideBarVisible then
        v42:openSidebar(v42.props.selectedPlayer);
    end;
end;
return v6.connect(function(v44) --[[ Line: 151 ]] --[[ Name: mapStateToProps ]]
    return {
        selectedPlayer = v44.playerDropDown.selectedPlayer, 
        sideBarVisible = v44.displayOptions.isTenFootInterface and v44.playerDropDown.isVisible, 
        playerListVisible = v44.displayOptions.isVisible
    };
end, function(v45) --[[ Line: 159 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v8 (copy), v9 (copy)
    return {
        closeSideBar = function() --[[ Line: 161 ]] --[[ Name: closeSideBar ]]
            -- upvalues: v45 (copy), v8 (ref)
            return v45(v8());
        end, 
        closePlayerList = function() --[[ Line: 165 ]] --[[ Name: closePlayerList ]]
            -- upvalues: v45 (copy), v9 (ref)
            return v45(v9(false));
        end, 
        openPlayerList = function() --[[ Line: 169 ]] --[[ Name: openPlayerList ]]
            -- upvalues: v45 (copy), v9 (ref)
            return v45(v9(true));
        end
    };
end)(v12);