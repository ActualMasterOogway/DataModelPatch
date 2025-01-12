local l_Players_0 = game:GetService("Players");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v5 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v5.Roact;
local l_UIBlox_0 = v5.UIBlox;
local l_Cryo_0 = v5.Cryo;
local l_RoactRodux_0 = v5.RoactRodux;
local l_t_0 = v5.t;
local l_withSelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_Parent_0 = script.Parent.Parent.Parent;
local v16 = require(l_Parent_0.Localization.withLocalization);
local l_Flags_0 = l_Parent_0.Flags;
local v18 = require(l_Flags_0.GetFFlagIGMGamepadSelectionHistory);
local v19 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableVoiceChatSpeakerIcons);
local v20 = require(script.Parent.Parent.Connection.FocusHandler);
local v21 = require(l_RobloxGui_0.Modules.VoiceChat.Components.VoiceIndicator);
local v22 = require(l_RobloxGui_0.Modules.VoiceChat.Constants);
local v23 = require(l_Parent_0.Components.PlayerLabelV2);
local v24 = require(l_Parent_0.Components.PlayerContextualMenu);
local v25 = require(l_Parent_0.Flags.FFlagLuaMenuPerfImprovements);
local v26 = require(l_Parent_0.Components.PageNavigationWatcher);
local v27 = require(l_Parent_0.Components.Divider);
local v28 = require(l_Parent_0.Components.BarOnTopScrollingFrame);
local v29 = require(l_Parent_0.Components.Page);
local v30 = require(l_Parent_0.Thunks.CloseMenu);
local v31 = require(l_Parent_0.Resources.Assets);
local v32 = require(l_Parent_0.Resources.Constants);
local v33 = require(l_Parent_0.Utility.SendAnalytics);
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v35 = require(l_RobloxGui_0.Modules.BlockingUtility);
local v36 = require(l_RobloxGui_0.Modules.PlayerList.Thunks.BlockPlayer);
local v37 = require(l_RobloxGui_0.Modules.PlayerList.Thunks.UnblockPlayer);
local v38 = require(l_RobloxGui_0.Modules.TrustAndSafety);
local v39 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name);
local v40 = settings():GetFVariable("InGameGlobalGuiInset") + 24;
local v41 = l_Roact_0.PureComponent:extend("PlayersPage");
v41.validateProps = l_t_0.strictInterface({
    isMenuOpen = l_t_0.boolean, 
    voiceEnabled = l_t_0.optional(l_t_0.boolean), 
    inspectMenuEnabled = l_t_0.boolean, 
    friends = l_t_0.map(l_t_0.integer, l_t_0.enum(Enum.FriendStatus)), 
    closeMenu = l_t_0.callback, 
    blockPlayer = l_t_0.callback, 
    unblockPlayer = l_t_0.callback, 
    pageTitle = l_t_0.string, 
    screenSize = l_t_0.Vector2, 
    currentPage = l_t_0.optional(l_t_0.string), 
    isRespawnDialogOpen = l_t_0.optional(l_t_0.boolean), 
    isReportDialogOpen = l_t_0.optional(l_t_0.boolean), 
    isGamepadLastInput = l_t_0.optional(l_t_0.boolean), 
    isCurrentZoneActive = l_t_0.optional(l_t_0.boolean)
});
v41.init = function(v42) --[[ Line: 91 ]] --[[ Name: init ]]
    -- upvalues: l_Players_0 (copy), v18 (copy), l_Roact_0 (copy), v25 (copy)
    v42:setState({
        players = l_Players_0:GetPlayers(), 
        selectedPlayer = nil, 
        selectedPlayerPosition = Vector2.new(0, 0), 
        pageSizeY = 0, 
        voiceChatEnabled = false, 
        allMuted = false, 
        selectedPlayerRef = nil, 
        firstPlayerRef = nil
    });
    v42.setSelectedPlayerRef = function(v43) --[[ Line: 103 ]]
        -- upvalues: v18 (ref), v42 (copy), l_Roact_0 (ref)
        if v18() then
            v42:setState({
                selectedPlayerRef = v43
            });
            return;
        else
            v42:setState({
                selectedPlayerRef = v43, 
                firstPlayerRef = l_Roact_0.None
            });
            return;
        end;
    end;
    v42.setFirstPlayerRef = function(v44) --[[ Line: 116 ]]
        -- upvalues: v42 (copy)
        v42:setState({
            firstPlayerRef = v44
        });
    end;
    if v25 then
        v42.positionChanged = function(v45) --[[ Line: 123 ]]
            -- upvalues: v42 (copy)
            v42:setState({
                selectedPlayerPosition = v45.AbsolutePosition
            });
        end;
        v42.toggleMoreActions = function(v46) --[[ Line: 128 ]]
            -- upvalues: l_Players_0 (ref), v42 (copy), l_Roact_0 (ref)
            local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v46);
            if v42.state.selectedPlayer == l_l_Players_0_PlayerByUserId_0 then
                v42:setState({
                    selectedPlayer = l_Roact_0.None
                });
                return;
            else
                v42:setState({
                    selectedPlayer = l_l_Players_0_PlayerByUserId_0
                });
                return;
            end;
        end;
    end;
end;
local function v50(v48, v49) --[[ Line: 143 ]] --[[ Name: sortPlayers ]]
    return v48.Name:lower() < v49.Name:lower();
end;
v41.renderListEntries = function(v51, v52) --[[ Line: 147 ]] --[[ Name: renderListEntries ]]
    -- upvalues: l_Cryo_0 (copy), v50 (copy), l_Roact_0 (copy), v25 (copy), v19 (copy), l_Players_0 (copy), v23 (copy), v21 (copy), v27 (copy)
    local v53 = l_Cryo_0.List.sort(v52, v50);
    local v54 = 0;
    local v55 = {
        ListLayout = l_Roact_0.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right
        })
    };
    for v56, v57 in pairs(v53) do
        local v58 = v25 and v57.UserId or v56;
        local v60 = v25 and v51.positionChanged or function(v59) --[[ Line: 162 ]]
            -- upvalues: v51 (copy)
            v51:setState({
                selectedPlayerPosition = v59.AbsolutePosition
            });
        end;
        local v61 = v25 and v51.toggleMoreActions or function() --[[ Line: 169 ]]
            -- upvalues: v51 (copy), v57 (copy), l_Roact_0 (ref)
            if v51.state.selectedPlayer == v57 then
                v51:setState({
                    selectedPlayer = l_Roact_0.None
                });
                return;
            else
                v51:setState({
                    selectedPlayer = v57
                });
                return;
            end;
        end;
        local v62 = nil;
        if v56 == 1 and not v51.state.selectedPlayer then
            v62 = v51.setFirstPlayerRef;
        elseif v51.state.selectedPlayer == v57 then
            v62 = v51.setSelectedPlayerRef;
        end;
        local v63 = "MicLight";
        if v19() then
            v63 = v57 ~= l_Players_0.LocalPlayer and "SpeakerLight" or "MicLight";
        end;
        v55["player_" .. v58] = l_Roact_0.createElement(v23, {
            username = v57.Name, 
            displayName = v57.DisplayName, 
            userId = v57.UserId, 
            isOnline = true, 
            isSelected = v51.state.selectedPlayer == v57, 
            LayoutOrder = v54, 
            onActivated = v61, 
            [l_Roact_0.Change.AbsolutePosition] = v51.state.selectedPlayer == v57 and v60 or nil, 
            [l_Roact_0.Ref] = v62
        }, {
            Icon = v51.props.voiceEnabled and v57 ~= l_Players_0.LocalPlayer and l_Roact_0.createElement(v21, {
                userId = tostring(v57.UserId), 
                hideOnError = true, 
                iconStyle = v63, 
                onClicked = v61
            })
        });
        v54 = v54 + 1;
        if v56 < #v53 then
            v55["divider_" .. v58] = l_Roact_0.createElement(v27, {
                LayoutOrder = v54, 
                Size = UDim2.new(1, -104, 0, 1)
            });
            v54 = v54 + 1;
        end;
    end;
    return v55;
end;
v41.getMoreActions = function(v64, v65) --[[ Line: 230 ]] --[[ Name: getMoreActions ]]
    -- upvalues: l_Players_0 (copy), l_Images_0 (copy), l_RbxAnalyticsService_0 (copy), v33 (copy), v32 (copy), l_Roact_0 (copy), v31 (copy), l_GuiService_0 (copy), v38 (copy), l_default_0 (copy), v19 (copy), v39 (copy), v22 (copy), v35 (copy)
    local v66 = {};
    if v64.state.selectedPlayer ~= nil then
        if v64.state.selectedPlayer ~= l_Players_0.LocalPlayer then
            local l_Unknown_0 = Enum.FriendStatus.Unknown;
            if v64.props.friends[v64.state.selectedPlayer.UserId] then
                l_Unknown_0 = v64.props.friends[v64.state.selectedPlayer.UserId];
            end;
            local l_addFriend_0 = v65.addFriend;
            local v69 = l_Images_0["icons/actions/friends/friendAdd"];
            if l_Unknown_0 == Enum.FriendStatus.Friend then
                l_addFriend_0 = v65.unfriend;
                v69 = l_Images_0["icons/actions/friends/friendRemove"];
            elseif l_Unknown_0 == Enum.FriendStatus.FriendRequestSent then
                l_addFriend_0 = v65.cancelFriend;
                v69 = l_Images_0["icons/actions/friends/friendRemove"];
            elseif l_Unknown_0 == Enum.FriendStatus.FriendRequestReceived then
                l_addFriend_0 = v65.acceptFriend;
            end;
            do
                local l_l_Unknown_0_0 = l_Unknown_0;
                table.insert(v66, {
                    text = l_addFriend_0, 
                    icon = v69, 
                    onActivated = function() --[[ Line: 255 ]] --[[ Name: onActivated ]]
                        -- upvalues: v64 (copy), l_l_Unknown_0_0 (ref), l_Players_0 (ref), l_RbxAnalyticsService_0 (ref), v33 (ref), v32 (ref), l_Roact_0 (ref)
                        local l_selectedPlayer_0 = v64.state.selectedPlayer;
                        if l_l_Unknown_0_0 == Enum.FriendStatus.Friend or l_l_Unknown_0_0 == Enum.FriendStatus.FriendRequestSent then
                            l_Players_0.LocalPlayer:RevokeFriendship(l_selectedPlayer_0);
                        else
                            l_Players_0.LocalPlayer:RequestFriendship(l_selectedPlayer_0);
                            l_RbxAnalyticsService_0:ReportCounter("PlayersMenu-RequestFriendship");
                            v33(v32.AnalyticsMenuActionName, v32.AnalyticsRequestFriendName, {});
                        end;
                        v64:setState({
                            selectedPlayer = l_Roact_0.None
                        });
                    end
                });
            end;
        end;
        table.insert(v66, {
            text = v65.viewAvatar, 
            icon = v31.Images.ViewAvatar, 
            onActivated = function() --[[ Line: 277 ]] --[[ Name: onActivated ]]
                -- upvalues: l_GuiService_0 (ref), v64 (copy), l_Roact_0 (ref), v33 (ref), v32 (ref)
                l_GuiService_0:InspectPlayerFromUserIdWithCtx(v64.state.selectedPlayer.UserId, "escapeMenu");
                v64:setState({
                    selectedPlayer = l_Roact_0.None
                });
                v64.props.closeMenu();
                v33(v32.AnalyticsMenuActionName, v32.AnalyticsExamineAvatarName, {});
            end
        });
        if v64.state.selectedPlayer ~= l_Players_0.LocalPlayer then
            table.insert(v66, {
                text = v65.reportAbuse, 
                icon = l_Images_0["icons/actions/feedback"], 
                onActivated = function() --[[ Line: 291 ]] --[[ Name: onActivated ]]
                    -- upvalues: v64 (copy), v38 (ref), v32 (ref), l_Roact_0 (ref)
                    local l_selectedPlayer_1 = v64.state.selectedPlayer;
                    v38.openReportDialogForPlayer(l_selectedPlayer_1, v32.AnalyticsMenuActionName);
                    v64:setState({
                        selectedPlayer = l_Roact_0.None
                    });
                end
            });
            if v64.props.voiceEnabled then
                local v73 = l_default_0.participants[tostring(v64.state.selectedPlayer.UserId)];
                if v73 then
                    local l_isMutedLocally_0 = v73.isMutedLocally;
                    table.insert(v66, {
                        text = l_isMutedLocally_0 and "Unmute Player" or "Mute Player", 
                        icon = v19() and l_default_0:GetIcon(l_isMutedLocally_0 and "Unmute" or "Mute", "Misc") or l_default_0:GetIcon(l_isMutedLocally_0 and "Blank" or "Muted"), 
                        onActivated = function() --[[ Line: 309 ]] --[[ Name: onActivated ]]
                            -- upvalues: v64 (copy), v39 (ref), l_default_0 (ref), v22 (ref), l_Roact_0 (ref)
                            local l_selectedPlayer_2 = v64.state.selectedPlayer;
                            v39:debug("Muting Player {}", l_selectedPlayer_2.UserId);
                            l_default_0:ToggleMutePlayer(l_selectedPlayer_2.UserId, v22.VOICE_CONTEXT_TYPE.IN_GAME_MENU);
                            v64:setState({
                                selectedPlayer = l_Roact_0.None
                            });
                        end
                    });
                end;
            end;
            local l_selectedPlayer_3 = v64.state.selectedPlayer;
            local v77 = v35:IsPlayerBlockedByUserId(l_selectedPlayer_3.UserId);
            table.insert(v66, {
                text = v77 and v65.unblockPlayer or v65.blockPlayer, 
                icon = l_Images_0["icons/actions/block"], 
                onActivated = function() --[[ Line: 329 ]] --[[ Name: onActivated ]]
                    -- upvalues: v77 (copy), v64 (copy), l_selectedPlayer_3 (copy), l_Roact_0 (ref)
                    if v77 then
                        v64.props.unblockPlayer(l_selectedPlayer_3);
                    else
                        v64.props.blockPlayer(l_selectedPlayer_3);
                    end;
                    v64:setState({
                        selectedPlayer = l_Roact_0.None
                    });
                end
            });
        end;
    end;
    return v66;
end;
v41.renderFocusHandler = function(v78, v79) --[[ Line: 347 ]] --[[ Name: renderFocusHandler ]]
    -- upvalues: v18 (copy), v32 (copy), l_Roact_0 (copy), v20 (copy), l_GuiService_0 (copy)
    local v80 = nil;
    if v18() then
        local v81 = true;
        if v78.props.currentPage ~= v32.MainPagePageKey then
            v81 = not v78.props.isCurrentZoneActive;
        end;
        v80 = v81;
    end;
    return l_Roact_0.createElement(v20, {
        isFocused = v79 and v78.props.currentPage == "Players" and v78.props.isMenuOpen and not v78.props.isReportDialogOpen and not v78.state.selectedPlayer and (v78.state.selectedPlayerRef or v78.state.firstPlayerRef) ~= nil, 
        shouldForgetPreviousSelection = v80, 
        didFocus = v18() and function(v82) --[[ Line: 363 ]]
            -- upvalues: l_GuiService_0 (ref), v78 (copy)
            l_GuiService_0.SelectedCoreObject = v82 or v78.state.firstPlayerRef;
        end or function() --[[ Line: 367 ]]
            -- upvalues: l_GuiService_0 (ref), v78 (copy)
            l_GuiService_0.SelectedCoreObject = v78.state.selectedPlayerRef or v78.state.firstPlayerRef;
        end
    });
end;
v41.renderWithLocalizedAndSelectionCursor = function(v83, v84, v85) --[[ Line: 374 ]] --[[ Name: renderWithLocalizedAndSelectionCursor ]]
    -- upvalues: v40 (copy), l_Roact_0 (copy), v24 (copy), v29 (copy), l_default_0 (copy), v22 (copy), l_CursorKind_0 (copy), l_withStyle_0 (copy), v28 (copy), v26 (copy), l_Players_0 (copy)
    local v86 = 0;
    local v87 = 0;
    local v88 = {};
    if v83.state.selectedPlayer ~= nil then
        v88 = v83:getMoreActions(v84);
        local v89 = #v88 * 56;
        local l_X_0 = v83.props.screenSize.X;
        local l_Y_0 = v83.props.screenSize.Y;
        v86 = if v83.state.selectedPlayerPosition.Y + v89 + v40 < l_Y_0 then v83.state.selectedPlayerPosition.Y else l_Y_0 - v89 - v40;
        v87 = if v83.state.selectedPlayerPosition.X + 400 + 20 + 352 + 24 <= l_X_0 then v83.state.selectedPlayerPosition.X + 400 + 20 else l_X_0 - 352 - 24;
    end;
    local v92 = nil;
    local v93 = v83.props.isGamepadLastInput and not v83.props.isRespawnDialogOpen and v83.props.isCurrentZoneActive;
    v92 = v83.state.selectedPlayer and l_Roact_0.createElement(v24, {
        moreActions = v88, 
        actionWidth = 352, 
        xOffset = v87, 
        yOffset = v86, 
        canCaptureFocus = v93, 
        onClose = function() --[[ Line: 418 ]] --[[ Name: onClose ]]
            -- upvalues: v83 (copy), l_Roact_0 (ref)
            v83:setState({
                selectedPlayer = l_Roact_0.None
            });
        end
    }) or nil;
    return l_Roact_0.createElement(v29, {
        pageTitle = v83.props.pageTitle, 
        titleChildren = v83.props.voiceEnabled and l_Roact_0.createElement("ImageButton", {
            Size = UDim2.fromOffset(36, 36), 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(1, 0.5), 
            BorderSizePixel = 0, 
            Position = UDim2.new(1, 4, 0.5, 0), 
            Image = l_default_0:GetIcon(v83.state.allMuted and "UnmuteAll" or "MuteAll", "Misc"), 
            [l_Roact_0.Event.Activated] = function() --[[ Line: 433 ]]
                -- upvalues: l_default_0 (ref), v83 (copy), v22 (ref)
                l_default_0:MuteAll(not v83.state.allMuted, v22.VOICE_CONTEXT_TYPE.IN_GAME_MENU);
                v83:setState({
                    allMuted = not v83.state.allMuted
                });
            end, 
            SelectionImageObject = v85(l_CursorKind_0.RoundedRect)
        })
    }, {
        PlayerListContent = l_withStyle_0(function(_) --[[ Line: 442 ]]
            -- upvalues: l_Roact_0 (ref), v83 (copy), v28 (ref), v92 (ref)
            return l_Roact_0.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                [l_Roact_0.Change.AbsoluteSize] = function(v95) --[[ Line: 447 ]]
                    -- upvalues: v83 (ref)
                    v83:setState({
                        pageSizeY = v95.AbsoluteSize.Y
                    });
                end
            }, {
                PlayerList = l_Roact_0.createElement(v28, {
                    Position = UDim2.new(0, 0, 0, 0), 
                    Size = UDim2.new(1, 0, 1, 0), 
                    CanvasSize = UDim2.new(1, 0, 0, #v83.state.players * 72), 
                    ScrollingEnabled = v83.state.selectedPlayer == nil
                }, v83:renderListEntries(v83.state.players)), 
                MoreActionsMenu = v92
            });
        end), 
        FocusHandler = v83:renderFocusHandler(v93), 
        Watcher = l_Roact_0.createElement(v26, {
            desiredPage = "Players", 
            onNavigateTo = function() --[[ Line: 466 ]] --[[ Name: onNavigateTo ]]
                -- upvalues: v83 (copy), l_Players_0 (ref)
                v83:setState({
                    players = l_Players_0:GetPlayers()
                });
            end, 
            onNavigateAway = function() --[[ Line: 471 ]] --[[ Name: onNavigateAway ]]
                -- upvalues: v83 (copy), l_Roact_0 (ref)
                v83:setState({
                    selectedPlayer = l_Roact_0.None
                });
            end
        })
    });
end;
v41.renderWithLocalized = function(v96, v97) --[[ Line: 480 ]] --[[ Name: renderWithLocalized ]]
    -- upvalues: l_withSelectionCursorProvider_0 (copy)
    return l_withSelectionCursorProvider_0(function(v98) --[[ Line: 481 ]]
        -- upvalues: v96 (copy), v97 (copy)
        return v96:renderWithLocalizedAndSelectionCursor(v97, v98);
    end);
end;
v41.render = function(v99) --[[ Line: 486 ]] --[[ Name: render ]]
    -- upvalues: v16 (copy)
    return v16({
        addFriend = "CoreScripts.InGameMenu.Actions.AddFriend", 
        acceptFriend = "CoreScripts.InGameMenu.Actions.AcceptFriend", 
        unfriend = "CoreScripts.InGameMenu.Actions.Unfriend", 
        cancelFriend = "CoreScripts.InGameMenu.Actions.CancelFriend", 
        viewAvatar = "CoreScripts.InGameMenu.Actions.ViewAvatar", 
        reportAbuse = "CoreScripts.InGameMenu.Actions.ReportAbuse", 
        blockPlayer = "CoreScripts.InGameMenu.Actions.BlockPlayer", 
        unblockPlayer = "CoreScripts.InGameMenu.Actions.UnblockPlayer"
    })(function(v100) --[[ Line: 496 ]]
        -- upvalues: v99 (copy)
        return v99:renderWithLocalized(v100);
    end);
end;
v41.didUpdate = function(v101, v102, _) --[[ Line: 501 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_Players_0 (copy), l_Roact_0 (copy)
    if v101.props.isMenuOpen and not v102.isMenuOpen then
        v101:setState({
            players = l_Players_0:GetPlayers(), 
            selectedPlayer = l_Roact_0.None
        });
    end;
    local l_selectedPlayerRef_0 = v101.state.selectedPlayerRef;
    if l_selectedPlayerRef_0 and v101.state.selectedPlayerPosition ~= l_selectedPlayerRef_0.AbsolutePosition then
        v101:setState({
            selectedPlayerPosition = l_selectedPlayerRef_0.AbsolutePosition
        });
    end;
end;
return l_RoactRodux_0.UNSTABLE_connect2(function(v105, _) --[[ Line: 519 ]]
    -- upvalues: v32 (copy)
    return {
        isMenuOpen = v105.isMenuOpen, 
        voiceEnabled = v105.voiceState.voiceEnabled, 
        friends = v105.friends, 
        inspectMenuEnabled = v105.displayOptions.inspectMenuEnabled, 
        screenSize = v105.screenSize, 
        currentPage = v105.menuPage, 
        isRespawnDialogOpen = v105.respawn.dialogOpen, 
        isReportDialogOpen = v105.report.dialogOpen or v105.report.reportSentOpen, 
        isGamepadLastInput = v105.displayOptions.inputType == v32.InputType.Gamepad, 
        isCurrentZoneActive = v105.currentZone == 1
    };
end, function(v107) --[[ Line: 532 ]]
    -- upvalues: v30 (copy), v36 (copy), v37 (copy)
    return {
        closeMenu = function() --[[ Line: 534 ]] --[[ Name: closeMenu ]]
            -- upvalues: v107 (copy), v30 (ref)
            v107(v30);
        end, 
        blockPlayer = function(v108) --[[ Line: 538 ]] --[[ Name: blockPlayer ]]
            -- upvalues: v107 (copy), v36 (ref)
            return v107(v36(v108));
        end, 
        unblockPlayer = function(v109) --[[ Line: 542 ]] --[[ Name: unblockPlayer ]]
            -- upvalues: v107 (copy), v37 (ref)
            return v107(v37(v109));
        end
    };
end)(v41);