local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.TenFootInterface);
local v4 = require(l_Parent_0.Chrome.Enabled);
local v5 = require(l_Parent_0.isNewTiltIconEnabled);
local v6 = require(script.Parent.Flags.GetFFlagChangeTopbarHeightCalculation);
local l_GetFFlagPostLaunchUnibarDesignTweaks_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagPostLaunchUnibarDesignTweaks;
local function _() --[[ Line: 18 ]] --[[ Name: getChromeTopbarHeight ]]
    -- upvalues: l_UserInputService_0 (copy)
    local v8 = nil;
    pcall(function() --[[ Line: 20 ]]
        -- upvalues: v8 (ref), l_UserInputService_0 (ref)
        v8 = l_UserInputService_0:GetPlatform();
    end);
    if v8 == Enum.Platform.IOS or v8 == Enum.Platform.Android then
        return 52;
    else
        return 58;
    end;
end;
local function _() --[[ Line: 30 ]] --[[ Name: getTopbarHeight ]]
    -- upvalues: v5 (copy), v4 (copy), l_GetFFlagPostLaunchUnibarDesignTweaks_0 (copy), l_UserInputService_0 (copy)
    if not v5() then
        return 36;
    elseif v4() then
        if l_GetFFlagPostLaunchUnibarDesignTweaks_0() then
            return 58;
        else
            local v10 = nil;
            pcall(function() --[[ Line: 20 ]]
                -- upvalues: v10 (ref), l_UserInputService_0 (ref)
                v10 = l_UserInputService_0:GetPlatform();
            end);
            if v10 == Enum.Platform.IOS or v10 == Enum.Platform.Android then
                return 52;
            else
                return 58;
            end;
        end;
    else
        return 36;
    end;
end;
local v12 = v4() and 48 or 36;
local v13 = v4() and 44 or 32;
if v6() then
    if not v5() then
        v12 = 36;
    elseif v4() then
        if l_GetFFlagPostLaunchUnibarDesignTweaks_0() then
            v12 = 58;
        else
            local v14 = nil;
            pcall(function() --[[ Line: 20 ]]
                -- upvalues: v14 (ref), l_UserInputService_0 (copy)
                v14 = l_UserInputService_0:GetPlatform();
            end);
            if v14 == Enum.Platform.IOS or v14 == Enum.Platform.Android then
                v12 = 52;
                --[[ close >= 12 ]]
            else
                v12 = 58;
                --[[ close >= 12 ]]
            end;
        end;
    else
        v12 = 36;
    end;
end;
return {
    TopBarHeight = v12, 
    TopBarHeightTenFoot = 72, 
    TopBarButtonHeight = v13, 
    TopBarButtonPadding = 2, 
    TopBarTopMargin = v12 - v13 - 4, 
    MenuIconKeepOutAreaId = "roblox-menu-icon", 
    HealthBarKeepOutAreaId = "health-bar", 
    MoreMenuKeepOutAreaId = "more-menu", 
    ChatIconKeepOutAreaId = "chat-icon", 
    ConnectIconKeepOutAreaId = "connect-icon", 
    BackIconKeepOutAreaId = "back-icon", 
    BadgeOver13KeepOutAreaId = "badge-13", 
    VoiceBetaBadgeKeepOutAreaId = "badge-voice-beta", 
    ScreenSideOffset = 16, 
    ScreenSideOffsetTenFoot = 48, 
    Padding = l_GetFFlagPostLaunchUnibarDesignTweaks_0() and v4() and 8 or 12, 
    HealthPercentForOverlay = 0.05, 
    HealthRedColor = Color3.fromRGB(255, 28, 0), 
    HealthYellowColor = Color3.fromRGB(250, 235, 0), 
    HealthGreenColor = Color3.fromRGB(27, 252, 107), 
    InputType = {
        MouseAndKeyBoard = "MouseAndKeyboard", 
        Touch = "Touch", 
        Gamepad = "Gamepad"
    }, 
    Analytics = {
        ShowGamepadNavigationDialog = "show-gamepad-navigation-dialog", 
        DismissGamepadNavigationDialog = "dismiss-gamepad-navigation-dialog", 
        EventNameTopBarButtonActivated = "topbar-button-activated", 
        ChatButtonName = "chat", 
        MoreMenuButtonName = "more-menu", 
        InventoryButtonName = "inventory", 
        LeaderboardButtonName = "leaderboard", 
        EmotesButtonName = "emotes", 
        StatusActive = "active", 
        StatusInactive = "inactive"
    }
};