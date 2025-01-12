local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_sortFriendsByCorrectedPresenceAndRank_0 = require(l_CorePackages_0.Packages.LuaSocialLibrariesDeps).SocialLibraries.config({}).User.sortFriendsByCorrectedPresenceAndRank;
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Players_0 = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local v8 = require(l_CorePackages_0.Packages.Roact);
local v9 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_ShareGame_0 = l_RobloxGui_0.Modules.Settings.Pages.ShareGame;
local v12 = require(l_Modules_0.Settings.Theme);
local v13 = require(l_ShareGame_0.Constants);
local l_GameInviteEvents_0 = require(l_CorePackages_0.Workspace.Packages.GameInvite).GameInviteEvents;
local v15 = require(l_ShareGame_0.Components.ConversationEntry);
local v16 = require(l_ShareGame_0.Components.InviteListEntry);
local v17 = require(l_ShareGame_0.Components.FriendsErrorPage);
local v18 = require(l_ShareGame_0.Thunks.InviteUserIdToPlaceId);
local v19 = require(l_ShareGame_0.Thunks.InviteUserIdToPlaceIdCustomized);
local v20 = require(l_ShareGame_0.NewInviteMenuExperimentManager);
local v21 = require(l_ShareGame_0.Components.LoadingFriendsPage);
local v22 = require(l_ShareGame_0.Components.NoFriendsPage);
local v23 = require(l_CoreGui_0.RobloxGui.Modules.InGameMenu.Utility.PlayerSearchPredicate);
local v24 = require(l_Modules_0.Settings.Flags.GetFFlagAbuseReportAnalyticsHasLaunchData);
local v25 = require(l_Modules_0.Flags.GetFFlagEnableNewInviteMenu);
local v26 = require(l_Modules_0.Flags.GetFFlagEnableNewInviteSendEndpoint);
local l_UserModel_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Models.UserModel;
local v28 = require(l_Modules_0.Common.httpRequest);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local l_GetFFlagInviteListRerank_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagInviteListRerank;
local v32 = require(l_ShareGame_0.getTranslator)();
local v33 = v12.UIBloxThemeEnabled and 16 or 18;
local v34 = v12.font(Enum.Font.SourceSans);
local l_GRAY3_0 = v13.Color.GRAY3;
local v36 = v12.textSize(19);
local v37 = {
    [l_UserModel_0.PresenceType.ONLINE] = 3, 
    [l_UserModel_0.PresenceType.IN_GAME] = 2, 
    [l_UserModel_0.PresenceType.IN_STUDIO] = 1, 
    [l_UserModel_0.PresenceType.OFFLINE] = 0
};
local v38 = {
    SORT_BY_FREQUENCY = 1, 
    SORT_BY_PRESENCE_AND_FREQUENCY = 2
};
local v39 = v8.PureComponent:extend("ConversationList");
v39.defaultProps = {
    entryHeight = 62, 
    entryPadding = v33
};
v39.init = function(v40) --[[ Line: 76 ]] --[[ Name: init ]]
    -- upvalues: v8 (copy)
    v40.scrollingRef = v8.createRef();
    v40.inviteUser = function(v41) --[[ Line: 78 ]]
        -- upvalues: v40 (copy)
        return v40.props.inviteUser(v41, v40.props.analytics, v40.props.trigger, v40.props.inviteMessageId, v40.props.launchData);
    end;
end;
v39.render = function(v42) --[[ Line: 89 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), v26 (copy), v25 (copy), v23 (copy), v16 (copy), l_UserInputService_0 (copy), v15 (copy), l_RetrievalStatus_0 (copy), v21 (copy), v22 (copy), v17 (copy), v34 (copy), v32 (copy), l_GRAY3_0 (copy), v36 (copy)
    local l_analytics_0 = v42.props.analytics;
    local v44 = v42.props[v8.Children] or {};
    local l_entryHeight_0 = v42.props.entryHeight;
    local l_entryPadding_0 = v42.props.entryPadding;
    local l_friends_0 = v42.props.friends;
    local l_friendsRetrievalStatus_0 = v42.props.friendsRetrievalStatus;
    local l_layoutOrder_0 = v42.props.layoutOrder;
    local l_size_0 = v42.props.size;
    local l_zIndex_0 = v42.props.zIndex;
    local l_topPadding_0 = v42.props.topPadding;
    local l_invites_0 = v42.props.invites;
    local l_inviteUser_0 = v42.props.inviteUser;
    local l_searchText_0 = v42.props.searchText;
    if v26() then
        l_inviteUser_0 = v42.inviteUser;
    end;
    local v56 = v25();
    v44.RowListLayout = v8.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        Padding = UDim.new(0, l_entryPadding_0)
    });
    local v57 = 0;
    for v58, v59 in ipairs(l_friends_0) do
        local v60 = v23(l_searchText_0, v59.name, v59.displayName);
        if v56 then
            v44["User-" .. tostring(v58)] = v8.createElement(v16, {
                analytics = l_analytics_0, 
                user = v59, 
                visible = v60, 
                layoutOrder = v58, 
                inviteUser = l_inviteUser_0, 
                inviteStatus = l_invites_0[v59.id], 
                isFullRowActivatable = l_UserInputService_0.GamepadEnabled, 
                trigger = v42.props.trigger, 
                inviteMessageId = v42.props.inviteMessageId, 
                launchData = v42.props.launchData
            });
        else
            v44["User-" .. tostring(v58)] = v8.createElement(v15, {
                analytics = l_analytics_0, 
                visible = v60, 
                size = UDim2.new(1, 0, 0, l_entryHeight_0), 
                layoutOrder = v58, 
                zIndex = l_zIndex_0, 
                title = v59.displayName, 
                subtitle = "@" .. v59.name, 
                presence = v59.presence, 
                users = {
                    v59
                }, 
                inviteUser = l_inviteUser_0, 
                inviteStatus = l_invites_0[v59.id]
            });
        end;
        if v60 then
            v57 = v57 + 1;
        end;
    end;
    if #l_friends_0 == 0 or l_friendsRetrievalStatus_0 == l_RetrievalStatus_0.Fetching then
        local l_v21_0 = v21;
        if l_friendsRetrievalStatus_0 == l_RetrievalStatus_0.Done then
            l_v21_0 = v22;
        elseif l_friendsRetrievalStatus_0 == l_RetrievalStatus_0.Failed then
            l_v21_0 = v17;
        end;
        return v8.createElement(l_v21_0, {
            BorderSizePixel = 0, 
            LayoutOrder = l_layoutOrder_0, 
            Position = UDim2.new(0, 0, 0, l_topPadding_0), 
            ZIndex = l_zIndex_0
        });
    elseif v57 == 0 then
        return v8.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            LayoutOrder = l_layoutOrder_0, 
            Font = v34, 
            Size = UDim2.new(1, 0, 0, l_entryHeight_0), 
            Text = v32:FormatByKey("Feature.SettingsHub.Label.InviteSearchNoResults"), 
            TextColor3 = l_GRAY3_0, 
            TextSize = v36, 
            TextTransparency = 0.22, 
            ZIndex = l_zIndex_0, 
            Position = UDim2.new(0, 0, 0, l_topPadding_0)
        });
    else
        return v8.createElement("ScrollingFrame", {
            BackgroundTransparency = 1, 
            LayoutOrder = l_layoutOrder_0, 
            Size = l_size_0, 
            BorderSizePixel = 0, 
            Position = UDim2.new(0, 0, 0, l_topPadding_0), 
            CanvasSize = if v56 then UDim2.new() else UDim2.new(0, 0, 0, v57 * (l_entryHeight_0 + l_entryPadding_0)), 
            AutomaticCanvasSize = if v56 then Enum.AutomaticSize.Y else nil, 
            ScrollBarThickness = 0, 
            ZIndex = l_zIndex_0, 
            Selectable = false, 
            [v8.Ref] = v42.scrollingRef
        }, v44);
    end;
end;
local function v66(v62) --[[ Line: 211 ]] --[[ Name: handleBinding ]]
    -- upvalues: v25 (copy), l_UserInputService_0 (copy), l_GuiService_0 (copy)
    if v25() and not l_UserInputService_0.GamepadEnabled then
        return;
    else
        local v63 = v62.scrollingRef:getValue();
        if v63 and v63:FindFirstAncestorOfClass("ScreenGui").Enabled and l_GuiService_0.SelectedCoreObject == nil then
            l_GuiService_0:AddSelectionParent("invitePrompt", v63);
            for _, v65 in ipairs(v63:GetChildren()) do
                if v65:IsA("GuiObject") and v65.LayoutOrder == 1 then
                    l_GuiService_0.SelectedCoreObject = v65;
                    return;
                end;
            end;
        end;
        return;
    end;
end;
v39.didUpdate = v66;
if v26() then
    v39.didMount = function(v67) --[[ Line: 237 ]] --[[ Name: didMount ]]
        -- upvalues: v13 (copy), l_GameInviteEvents_0 (copy), v24 (copy), v66 (copy)
        if v67.props.analytics and v67.props.trigger == v13.Triggers.GameMenu then
            local v68 = false;
            if v67.props.launchData ~= nil then
                v68 = v67.props.launchData ~= "";
            end;
            v67.props.analytics:sendEvent(v67.props.trigger, l_GameInviteEvents_0.ModalOpened, if v24() then {
                isLaunchDataProvided = v68
            } else nil);
        end;
        v66(v67);
    end;
else
    v39.didMount = v66;
end;
local v78 = l_memoize_0(function(v69) --[[ Line: 256 ]]
    -- upvalues: v37 (copy)
    local v70 = {};
    local function v75(v71, v72) --[[ Line: 258 ]] --[[ Name: friendPreference ]]
        -- upvalues: v37 (ref)
        local v73 = v37[v71.presence];
        local v74 = v37[v72.presence];
        if v73 == v74 then
            return v71.name:lower() < v72.name:lower();
        else
            return v74 < v73;
        end;
    end;
    for _, v77 in pairs(v69) do
        if v77.isFriend then
            v70[#v70 + 1] = v77;
        end;
    end;
    table.sort(v70, v75);
    return v70;
end);
local v83 = l_memoize_0(function(v79) --[[ Line: 280 ]]
    -- upvalues: l_sortFriendsByCorrectedPresenceAndRank_0 (copy)
    local v80 = {};
    for _, v82 in pairs(v79) do
        if v82.isFriend then
            v80[#v80 + 1] = v82;
        end;
    end;
    table.sort(v80, l_sortFriendsByCorrectedPresenceAndRank_0);
    return v80;
end);
local v93 = l_memoize_0(function(v84) --[[ Line: 293 ]]
    local v85 = {};
    local function v90(v86, v87) --[[ Line: 295 ]] --[[ Name: friendPreference ]]
        local v88 = tonumber(v86.friendFrequentRank) or 0;
        local v89 = tonumber(v87.friendFrequentRank) or 0;
        if v88 == v89 then
            return v86.name:lower() < v87.name:lower();
        else
            return v88 < v89;
        end;
    end;
    for _, v92 in pairs(v84) do
        if v92.isFriend then
            v85[#v85 + 1] = v92;
        end;
    end;
    table.sort(v85, v90);
    return v85;
end);
local function _() --[[ Line: 317 ]]
    -- upvalues: v20 (copy), v38 (copy), v93 (copy), v83 (copy), v78 (copy)
    local v94 = v20.default:getInviteListSortOrder() or 0;
    if v94 == v38.SORT_BY_FREQUENCY then
        return v93;
    elseif v94 == v38.SORT_BY_PRESENCE_AND_FREQUENCY then
        return v83;
    else
        return v78;
    end;
end;
return v9.UNSTABLE_connect2(function(v96, _) --[[ Line: 329 ]]
    -- upvalues: v78 (copy), l_GetFFlagInviteListRerank_0 (copy), v20 (copy), v38 (copy), v93 (copy), v83 (copy), l_Players_0 (copy)
    local l_v78_0 = v78;
    if l_GetFFlagInviteListRerank_0() then
        local v99 = v20.default:getInviteListSortOrder() or 0;
        l_v78_0 = if v99 == v38.SORT_BY_FREQUENCY then v93 else if v99 == v38.SORT_BY_PRESENCE_AND_FREQUENCY then v83 else v78;
    end;
    return {
        friends = l_v78_0(v96.Users), 
        friendsRetrievalStatus = v96.Friends.retrievalStatus[tostring(l_Players_0.LocalPlayer.UserId)], 
        invites = v96.Invites
    };
end, function(v100) --[[ Line: 341 ]]
    -- upvalues: v28 (copy), l_HttpRbxApiService_0 (copy), v26 (copy), v19 (copy), v18 (copy)
    return {
        inviteUser = function(v101, v102, v103, v104, v105) --[[ Line: 343 ]] --[[ Name: inviteUser ]]
            -- upvalues: v28 (ref), l_HttpRbxApiService_0 (ref), v26 (ref), v100 (copy), v19 (ref), v18 (ref)
            local v106 = v28(l_HttpRbxApiService_0);
            local v107 = tostring(game.PlaceId);
            if v26() then
                return v100(v19(v106, v101, v107, v102, v103, v104, v105));
            else
                return v100(v18(v106, v101, v107));
            end;
        end
    };
end)(v39);