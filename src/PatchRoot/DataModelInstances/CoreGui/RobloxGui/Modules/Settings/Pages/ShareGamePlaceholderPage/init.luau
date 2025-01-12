local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_ShareGame_0 = l_RobloxGui_0.Modules.Settings.Pages.ShareGame;
local v3 = require(l_ShareGame_0.Constants);
local l_ClearShareInviteLink_0 = require(l_CorePackages_0.Workspace.Packages.NotificationsCommon).ReducerDependencies.RoduxShareLinks.Actions.ClearShareInviteLink;
local v5 = require(l_ShareGame_0.Actions.OpenPage);
local v6 = require(l_ShareGame_0.Actions.ClosePage);
local l_NewPage_0 = require(l_RobloxGui_0.Modules.Settings.SettingsPageFactory):CreateNewPage();
l_NewPage_0.TabHeader = nil;
l_NewPage_0.PageListLayout.Parent = nil;
l_NewPage_0.ShouldShowBottomBar = false;
l_NewPage_0.ShouldShowHubBar = false;
l_NewPage_0.IsPageClipped = false;
l_NewPage_0.Page.Name = "ShareGameDummy";
l_NewPage_0.Page.Size = UDim2.new(1, 0, 0, 0);
l_NewPage_0.ConnectHubToApp = function(_, v9, v10) --[[ Line: 32 ]] --[[ Name: ConnectHubToApp ]]
    -- upvalues: l_NewPage_0 (copy), v3 (copy), v5 (copy), v6 (copy)
    l_NewPage_0:SetHub(v9);
    v10.store.changed:connect(function(v11, v12) --[[ Line: 35 ]]
        -- upvalues: v3 (ref), l_NewPage_0 (ref)
        local l_Page_0 = v11.Page;
        local l_IsOpen_0 = v12.Page.IsOpen;
        if l_Page_0.Route == v3.PageRoute.SHARE_GAME and l_IsOpen_0 and not l_Page_0.IsOpen then
            l_NewPage_0.HubRef:PopMenu(nil, true);
        end;
    end);
    l_NewPage_0.Displayed.Event:Connect(function() --[[ Line: 47 ]]
        -- upvalues: v10 (copy), v5 (ref), v3 (ref)
        if not v10.store:getState().Page.IsOpen then
            v10.store:dispatch(v5(v3.PageRoute.SETTINGS_HUB));
        end;
    end);
    l_NewPage_0.Hidden.Event:Connect(function() --[[ Line: 55 ]]
        -- upvalues: v10 (copy), v6 (ref), v3 (ref)
        if v10.store:getState().Page.IsOpen then
            v10.store:dispatch(v6(v3.PageRoute.SETTINGS_HUB));
        end;
    end);
    v10.store:dispatch(v6(v3.PageRoute.SETTINGS_HUB));
end;
l_NewPage_0.ClearShareInviteLink = function(_, v16) --[[ Line: 68 ]] --[[ Name: ClearShareInviteLink ]]
    -- upvalues: l_ClearShareInviteLink_0 (copy)
    if v16.store:getState().ShareLinks.Invites.ShareInviteLink ~= nil then
        v16.store:dispatch(l_ClearShareInviteLink_0());
    end;
end;
return l_NewPage_0;