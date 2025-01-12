local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.ReactRoblox);
local v5 = require(l_CorePackages_0.Packages.Rodux);
local l_ChatEntryPointNames_0 = require(l_CorePackages_0.Workspace.Packages.SocialCommon).Enums.ChatEntryPointNames;
local v7 = require(l_CoreGui_0.RobloxGui.Modules.ApolloClient);
if require(l_RobloxGui_0.Modules.Flags.GetFFlagFixSettingshubImportOrder)() then
    l_CoreGui_0:WaitForChild("TopBarApp");
end;
local v8 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
local v9 = require(l_CorePackages_0.Workspace.Packages.AppChat);
local l_InExperienceAppChat_0 = v9.App.InExperienceAppChat;
local l_AppChatReducer_0 = v9.App.AppChatReducer;
local l_InExperienceAppChatProviders_0 = v9.App.InExperienceAppChatProviders;
local l_InExperienceAppChatExperimentation_0 = v9.App.InExperienceAppChatExperimentation;
local l_InExperienceAppChatModal_0 = v9.App.InExperienceAppChatModal;
local v15 = require(l_RobloxGui_0.Modules.Chrome.ChromeShared.Service.ViewportUtil);
local l_getFFlagAppChatCoreUIConflictFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).getFFlagAppChatCoreUIConflictFix;
local v17 = if l_getFFlagAppChatCoreUIConflictFix_0() then require(l_RobloxGui_0.Modules.ChatSelector) else nil;
local v18 = if l_getFFlagAppChatCoreUIConflictFix_0() then require(l_RobloxGui_0.Modules.PlayerList.PlayerListManager) else nil;
local v19 = require(l_RobloxGui_0.Modules.Chrome.Flags.GetFFlagAppChatInExpConnectIconEnableSquadIndicator);
local l_TopBarTopMargin_0 = require(l_RobloxGui_0.Modules.TopBar.Constants).TopBarTopMargin;
local l_getFFlagAppChatMoveApolloProvider_0 = v9.Flags.getFFlagAppChatMoveApolloProvider;
local l_FFlagUpdateSquadInDefaultAppChatContainer_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUpdateSquadInDefaultAppChatContainer;
local l_Folder_0 = Instance.new("Folder");
l_Folder_0.Name = "AppChat";
l_Folder_0.Parent = l_CoreGui_0;
local v24 = v4.createRoot(l_Folder_0);
local v25 = v5.Store.new(l_AppChatReducer_0, nil, {
    v5.thunkMiddleware
});
local v26 = if l_FFlagUpdateSquadInDefaultAppChatContainer_0 then l_InExperienceAppChatExperimentation_0.default:shouldUseIndependentAppChatContainer() else l_InExperienceAppChatExperimentation_0.default.getShowPlatformChatInChrome();
local l_UpdateAppChatUnreadMessagesCount_0 = v8.Instance.PlayersPage.UpdateAppChatUnreadMessagesCount;
local v30 = {
    getParentContainer = function() --[[ Line: 52 ]] --[[ Name: getParentContainer ]]
        -- upvalues: v8 (copy)
        return v8.Instance.MenuContainer;
    end, 
    visibilitySignal = v8.CurrentPageSignal, 
    getShouldSetAppChatVisible = function(v28) --[[ Line: 56 ]] --[[ Name: getShouldSetAppChatVisible ]]
        return v28 == "AppChatPage";
    end, 
    entryPoint = l_ChatEntryPointNames_0.SettingsHub, 
    hideParentContainer = function() --[[ Line: 61 ]] --[[ Name: hideParentContainer ]]
        -- upvalues: v8 (copy)
        if v8:GetVisibility() then
            v8.Instance:PopMenu(false, true);
        end;
    end, 
    showParentContainer = function() --[[ Line: 66 ]] --[[ Name: showParentContainer ]]
        -- upvalues: v8 (copy)
        v8.Instance:SetVisibility(true, false);
        v8:SwitchToPage(v8.Instance.AppChatPage);
    end, 
    updateCurrentSquadId = function(v29) --[[ Line: 70 ]] --[[ Name: updateCurrentSquadId ]]
        -- upvalues: l_FFlagUpdateSquadInDefaultAppChatContainer_0 (copy), v8 (copy)
        if l_FFlagUpdateSquadInDefaultAppChatContainer_0 then
            v8.Instance.AppChatPage.SetCurrentSquadId(v29);
        end;
    end
};
if v26 then
    l_InExperienceAppChatModal_0.default:initialize(l_TopBarTopMargin_0, v8, v15, v17, v18);
    l_UpdateAppChatUnreadMessagesCount_0 = function(v31) --[[ Line: 80 ]]
        -- upvalues: l_InExperienceAppChatModal_0 (copy)
        l_InExperienceAppChatModal_0:setUnreadCount(v31);
    end;
    v30 = {
        getParentContainer = function() --[[ Line: 85 ]] --[[ Name: getParentContainer ]]
            -- upvalues: l_InExperienceAppChatModal_0 (copy)
            return l_InExperienceAppChatModal_0.default.frame;
        end, 
        visibilitySignal = l_InExperienceAppChatModal_0.default.visibilitySignal.Event, 
        getShouldSetAppChatVisible = function(...) --[[ Line: 89 ]] --[[ Name: getShouldSetAppChatVisible ]]
            -- upvalues: l_InExperienceAppChatModal_0 (copy)
            return l_InExperienceAppChatModal_0:getVisible();
        end, 
        entryPoint = if l_InExperienceAppChatExperimentation_0.default.variant.ShowPlatformChatChromeUnibarEntryPoint then l_ChatEntryPointNames_0.ChromeUnibar else l_ChatEntryPointNames_0.ChromeDropdown, 
        hideParentContainer = function() --[[ Line: 96 ]] --[[ Name: hideParentContainer ]]
            -- upvalues: l_InExperienceAppChatModal_0 (copy)
            l_InExperienceAppChatModal_0.default:setVisible(false);
        end, 
        showParentContainer = function() --[[ Line: 99 ]] --[[ Name: showParentContainer ]]
            -- upvalues: l_InExperienceAppChatModal_0 (copy)
            l_InExperienceAppChatModal_0.default:setVisible(true);
        end, 
        updateCurrentSquadId = function(v32) --[[ Line: 102 ]] --[[ Name: updateCurrentSquadId ]]
            -- upvalues: v19 (copy), l_InExperienceAppChatModal_0 (copy)
            if v19() then
                l_InExperienceAppChatModal_0:setCurrentSquadId(v32);
            end;
        end
    };
end;
v24:render((v3.createElement(l_InExperienceAppChatProviders_0, {
    store = v25, 
    updateAppChatUnreadMessagesCount = l_UpdateAppChatUnreadMessagesCount_0, 
    parentContainerContext = v30, 
    apolloClient = if l_getFFlagAppChatMoveApolloProvider_0() then v7 else nil
}, {
    appChat = v3.createElement(l_InExperienceAppChat_0, {
        apolloClient = if l_getFFlagAppChatMoveApolloProvider_0() then nil else v7
    })
})));