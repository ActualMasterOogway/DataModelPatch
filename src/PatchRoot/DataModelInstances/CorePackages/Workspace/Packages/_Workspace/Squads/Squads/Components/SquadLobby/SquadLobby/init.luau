local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local v2 = require(l_script_FirstAncestor_0.Common.Constants);
local v3 = require(l_script_FirstAncestor_0.Logger);
local _ = require(l_script_FirstAncestor_0.Common.ModelTypes);
local v5 = require(script.Parent.SquadLobbyActionBar);
local v6 = require(script.Parent.SquadLobbyUserGrid);
local v7 = require(script.Parent.SquadLobbyVoiceChatMenu);
local v8 = require(script.Parent.SquadLobbyBanners);
local v9 = require(script.Parent.SquadLobbyUserDropdownMenu);
local v10 = require(l_script_FirstAncestor_0.Enums.SquadPartySheetActionEnum);
local v11 = require(l_script_FirstAncestor_0.dependencies);
local v12 = require(l_script_FirstAncestor_0.Hooks.useSquadState);
local l_Foundation_0 = v11.Foundation;
local l_NetworkingPresence_0 = v11.NetworkingPresence;
local l_NetworkingSquads_0 = v11.NetworkingSquads;
local l_React_0 = v11.React;
local l_Roact_0 = v11.Roact;
local l_RoactNavigation_0 = v11.RoactNavigation;
local l_SharedFlags_0 = v11.SharedFlags;
local l_EventNames_0 = v11.SquadsCore.Analytics.EventNames;
local l_SquadExternalContractContext_0 = v11.SquadsCore.SquadExternalContractProvider.SquadExternalContractContext;
local l_SquadPromptType_0 = v11.SquadsCore.Enums.SquadPromptType;
local l_SquadViewFlags_0 = v11.SquadsCore.SquadExternalContractProvider.SquadViewFlags;
local l_UIBlox_0 = v11.UIBlox;
local l_UserBlockingNetworking_0 = v11.UserBlockingNetworking;
local l_dependencyArray_0 = v11.Hooks.dependencyArray;
local l_useCurrentSquadSelector_0 = v11.Hooks.useCurrentSquadSelector;
local l_useDispatch_0 = v11.Hooks.useDispatch;
local l_useEffectOnce_0 = v11.Hooks.useEffectOnce;
local l_useLocalUserId_0 = v11.Hooks.useLocalUserId;
local l_useNavigation_0 = v11.useNavigation;
local l_usePrevious_0 = v11.Hooks.usePrevious;
local l_useSelector_0 = v11.Hooks.useSelector;
local l_useStore_0 = v11.Hooks.useStore;
local l_StateLayerAffordance_0 = l_Foundation_0.Enums.StateLayerAffordance;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_useTokens_0 = l_Foundation_0.Hooks.useTokens;
local v38 = game:DefineFastFlag("EnableSquadLobbyBanners", false);
local l_FFlagEnableSquadTopBannerWideMode_0 = l_SharedFlags_0.FFlagEnableSquadTopBannerWideMode;
return function(v40) --[[ Line: 65 ]] --[[ Name: SquadLobby ]]
    -- upvalues: l_useTokens_0 (copy), l_useDispatch_0 (copy), l_useLocalUserId_0 (copy), l_useStyle_0 (copy), v12 (copy), l_useNavigation_0 (copy), l_React_0 (copy), l_SquadExternalContractContext_0 (copy), l_FFlagEnableSquadTopBannerWideMode_0 (copy), l_HttpService_0 (copy), l_RoactNavigation_0 (copy), l_SquadViewFlags_0 (copy), l_useCurrentSquadSelector_0 (copy), l_useSelector_0 (copy), l_useStore_0 (copy), l_SquadPromptType_0 (copy), l_dependencyArray_0 (copy), l_NetworkingSquads_0 (copy), l_useEffectOnce_0 (copy), v3 (copy), l_usePrevious_0 (copy), l_UserBlockingNetworking_0 (copy), l_NetworkingPresence_0 (copy), v2 (copy), v38 (copy), v8 (copy), v6 (copy), l_EventNames_0 (copy), v10 (copy), v5 (copy), l_Foundation_0 (copy), l_StateLayerAffordance_0 (copy), v7 (copy), v9 (copy), l_Roact_0 (copy)
    local v41 = l_useTokens_0();
    local v42 = l_useDispatch_0();
    local v43 = tonumber(l_useLocalUserId_0()) or 0;
    local v44 = l_useStyle_0();
    local v45 = v12();
    local v46 = l_useNavigation_0();
    local l_isWideMode_0 = v40.isWideMode;
    local v48 = l_React_0.useContext(l_SquadExternalContractContext_0);
    local v49, v50 = l_React_0.useState(0);
    if l_FFlagEnableSquadTopBannerWideMode_0 then
        local v51 = l_React_0.useRef(l_HttpService_0:GenerateGUID());
        local l_v51_0 = v51 --[[ copy: 11 -> 42 ]];
        l_React_0.useEffect(function() --[[ Line: 78 ]]
            -- upvalues: l_isWideMode_0 (copy), l_v51_0 (copy), v48 (copy), v46 (copy), l_RoactNavigation_0 (ref)
            if not l_isWideMode_0 then
                local l_current_0 = l_v51_0.current;
                v48.disableSquadTopBanner(l_current_0, true);
                local v55 = v46 and v46.addListener(l_RoactNavigation_0.Events.WillBlur, function(v54) --[[ Line: 83 ]]
                    -- upvalues: v48 (ref), l_current_0 (copy)
                    if v54.state.routeName ~= "SquadInviteFriends" and v54.state.routeName ~= "SquadLobby" then
                        v48.disableSquadTopBanner(l_current_0, false);
                        return;
                    else
                        v48.disableSquadTopBanner(l_current_0, true);
                        return;
                    end;
                end);
                return function() --[[ Line: 94 ]]
                    -- upvalues: v55 (ref), v48 (ref), l_current_0 (copy)
                    if v55 then
                        v55.remove();
                        v55 = nil;
                    end;
                    v48.disableSquadTopBanner(l_current_0, false);
                end;
            else
                return function() --[[ Line: 104 ]]

                end;
            end;
        end, {
            v48.disableSquadTopBanner, 
            v46, 
            l_isWideMode_0
        });
        l_React_0.useEffect(function() --[[ Line: 107 ]]
            -- upvalues: v48 (copy), l_SquadViewFlags_0 (ref)
            v48.updateSquadViewFlags(l_SquadViewFlags_0.SquadLobby, true);
            return function() --[[ Line: 109 ]]
                -- upvalues: v48 (ref), l_SquadViewFlags_0 (ref)
                v48.updateSquadViewFlags(l_SquadViewFlags_0.SquadLobby, false);
            end;
        end, {
            v48.updateSquadViewFlags
        });
    else
        l_React_0.useEffect(function() --[[ Line: 117 ]]
            -- upvalues: v48 (copy), l_SquadViewFlags_0 (ref), v46 (copy), l_RoactNavigation_0 (ref)
            v48.updateSquadViewFlags(l_SquadViewFlags_0.SquadLobby, true);
            local v57 = v46 and v46.addListener(l_RoactNavigation_0.Events.WillBlur, function(v56) --[[ Line: 120 ]]
                -- upvalues: v48 (ref), l_SquadViewFlags_0 (ref)
                if v56.state.routeName ~= "SquadInviteFriends" and v56.state.routeName ~= "SquadLobby" then
                    v48.updateSquadViewFlags(l_SquadViewFlags_0.SquadLobby, false);
                    return;
                else
                    v48.updateSquadViewFlags(l_SquadViewFlags_0.SquadLobby, true);
                    return;
                end;
            end);
            return function() --[[ Line: 127 ]]
                -- upvalues: v57 (ref), v48 (ref), l_SquadViewFlags_0 (ref)
                if v57 then
                    v57.remove();
                    v57 = nil;
                end;
                v48.updateSquadViewFlags(l_SquadViewFlags_0.SquadLobby, false);
            end;
        end, {
            v48.updateSquadViewFlags, 
            v46
        });
    end;
    local v58, v59 = l_React_0.useState(false);
    local v60, v61 = l_React_0.useState(Vector2.zero);
    local v63 = l_React_0.useCallback(function(v62) --[[ Line: 139 ]]
        -- upvalues: v61 (copy)
        v61(v62.AbsoluteSize);
    end, {
        v61
    });
    local v64 = l_useCurrentSquadSelector_0();
    local v65 = if v64 then v64.squadId else "";
    local v66 = if v64 and v64.members then v64.members else {};
    local v68 = l_React_0.useCallback(function(v67) --[[ Line: 147 ]]
        if v67.Squad and v67.Squad.Squad and v67.Squad.Squad.currentSquad then
            return v67.Squad.Squad.currentSquad.parentChannelId or "";
        else
            return "";
        end;
    end, {});
    local v69 = l_useSelector_0(v68);
    local v70 = l_useStore_0();
    local v71 = v46.getParam("conversationId") or "";
    local v72 = v48.useGetConversationFromId(v71);
    local v73 = l_React_0.useCallback(function() --[[ Line: 160 ]]
        -- upvalues: v48 (copy), v70 (copy), l_SquadPromptType_0 (ref), v40 (copy)
        v48.setSquadPrompt(v70, {
            hideCancelButton = true, 
            promptType = l_SquadPromptType_0.Error, 
            onConfirm = function() --[[ Line: 164 ]] --[[ Name: onConfirm ]]
                -- upvalues: v40 (ref)
                v40.navigateAwayFromSquad();
            end
        });
    end, l_dependencyArray_0(v40.navigateAwayFromSquad, v70, v48.setSquadPrompt));
    local v76 = l_React_0.useCallback(function(v74) --[[ Line: 170 ]]
        -- upvalues: v42 (copy), l_NetworkingSquads_0 (ref), v73 (copy)
        v42(l_NetworkingSquads_0.CreateOrJoinSquad.API({
            parentChannelId = v74, 
            leaveExisting = true
        })):catch(function(_) --[[ Line: 175 ]]
            -- upvalues: v73 (ref)
            v73();
        end);
    end, l_dependencyArray_0(v42, v73));
    l_useEffectOnce_0(function() --[[ Line: 182 ]]
        -- upvalues: v65 (copy), v72 (copy), v3 (ref), v71 (copy), v42 (copy), v48 (copy), v76 (copy), v73 (copy)
        if v65 == "" then
            if v72 and v72.source == "friends" then
                v3:debug("Channel does not exist for: {}. Creating a friend conversation.", v71);
                v42(v48.createFriendConversation(v71)):andThen(function(v77) --[[ Line: 193 ]]
                    -- upvalues: v76 (ref)
                    if v77 and v77.id then
                        v76(v77.id);
                    end;
                end):catch(function(v78) --[[ Line: 198 ]]
                    -- upvalues: v3 (ref), v73 (ref)
                    v3:debug("Error while trying to create a friend conversation: {}", v78);
                    v73();
                end);
                return;
            else
                v76(v71);
            end;
        end;
    end, l_dependencyArray_0(v42, v48.createFriendConversation, v71, v72, v76, v73));
    local v79 = l_usePrevious_0(v65) or "";
    l_React_0.useEffect(function() --[[ Line: 220 ]]
        -- upvalues: v79 (copy), v65 (copy), v40 (copy), v71 (copy), v69 (copy), l_RoactNavigation_0 (ref), l_isWideMode_0 (copy), v46 (copy)
        if v79 ~= "" and v65 == "" then
            v40.navigateAwayFromSquad();
            return;
        else
            if v65 ~= "" and v71 ~= "" and v69 ~= "" and v69 ~= v71 then
                local v80 = {
                    l_RoactNavigation_0.Actions.navigate({
                        routeName = "ChatConversation", 
                        params = {
                            conversationId = v69
                        }
                    }), 
                    l_RoactNavigation_0.Actions.navigate({
                        routeName = "SquadLobby", 
                        params = {
                            conversationId = v69
                        }
                    })
                };
                if l_isWideMode_0 then
                    v46.navigate("ChatLanding", {
                        conversationId = v69
                    }, l_RoactNavigation_0.StackActions.reset({
                        index = 2, 
                        actions = v80
                    }));
                    return;
                else
                    table.insert(v80, 1, l_RoactNavigation_0.Actions.navigate({
                        routeName = "ChatLanding"
                    }));
                    v46.navigate("ChatLandingStack", {
                        conversationId = v69
                    }, l_RoactNavigation_0.StackActions.reset({
                        index = 3, 
                        actions = v80
                    }));
                end;
            end;
            return;
        end;
    end, {
        v46, 
        v69, 
        v71, 
        v65, 
        v40.navigateAwayFromSquad
    });
    local v81 = l_usePrevious_0(v66);
    l_React_0.useEffect(function() --[[ Line: 284 ]]
        -- upvalues: v66 (copy), v81 (copy), v43 (copy), v42 (copy), l_UserBlockingNetworking_0 (ref), l_NetworkingPresence_0 (ref)
        local v82 = {};
        for _, v84 in pairs(v66) do
            local v85 = false;
            if v81 then
                for _, v87 in pairs(v81) do
                    if v87.userId == v84.userId then
                        v85 = true;
                        break;
                    end;
                end;
            end;
            if not v85 then
                table.insert(v82, v84.userId);
                if v43 ~= v84.userId then
                    v42(l_UserBlockingNetworking_0.IsBlockedById.API({
                        userId = v84.userId, 
                        currentUserId = v43
                    }));
                end;
            end;
        end;
        v42(l_NetworkingPresence_0.GetPresencesFromUserIds.API(v82));
    end, l_dependencyArray_0(v66, v43, v81));
    local v88 = l_React_0.useCallback(function() --[[ Line: 312 ]]
        -- upvalues: v59 (copy), v58 (copy)
        v59(not v58);
    end, l_dependencyArray_0(v58, v59));
    local v89 = v2.SQUAD_LOBBY_ACTION_BAR_HEIGHT + 26 + 20;
    local v90 = v2.SQUAD_LOBBY_ACTION_BAR_HEIGHT + 20;
    local v91, v92 = l_React_0.useState(nil);
    local v93, v94 = l_React_0.useState(false);
    local v96 = l_React_0.useCallback(function(v95) --[[ Line: 324 ]]
        -- upvalues: v50 (copy), v41 (copy)
        if v95.Y > 0 then
            v50(v95.Y + v41.Gap.Medium);
            return;
        else
            v50(0);
            return;
        end;
    end, l_dependencyArray_0(v50, v41));
    local v97 = l_React_0.useMemo(function() --[[ Line: 332 ]]
        -- upvalues: v38 (ref), l_React_0 (ref), v8 (ref), v96 (copy)
        if v38 then
            return (l_React_0.createElement(v8, {
                onAbsoluteSizeChanged = v96
            }));
        else
            return nil;
        end;
    end, l_dependencyArray_0(v96));
    local v98 = l_React_0.useCallback(function() --[[ Line: 340 ]]
        -- upvalues: v40 (copy), v69 (copy)
        v40.navigateToSquadInviteFriends(v69);
    end, l_dependencyArray_0(v69, v40.navigateToSquadInviteFriends));
    local v100 = l_React_0.useMemo(function() --[[ Line: 345 ]]
        -- upvalues: l_React_0 (ref), v49 (copy), v44 (copy), v63 (copy), v6 (ref), v60 (copy), v89 (copy), v66 (copy), v40 (copy), v48 (copy), l_EventNames_0 (ref), v69 (copy), v10 (ref), v92 (copy), v94 (copy), v98 (copy)
        return l_React_0.createElement("ScrollingFrame", {
            Position = UDim2.fromOffset(0, v49), 
            Size = UDim2.new(1, 0, 1, -v49), 
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            CanvasSize = UDim2.new(), 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            ScrollBarImageColor3 = v44.Theme.UIEmphasis.Color, 
            ScrollBarImageTransparency = v44.Theme.UIEmphasis.Transparency, 
            ScrollBarThickness = 4, 
            ZIndex = 0, 
            [l_React_0.Change.AbsoluteSize] = v63
        }, {
            SquadLobbyUserGrid = l_React_0.createElement(v6, {
                containerSize = v60 - Vector2.new(0, v89), 
                paddingBottom = UDim.new(0, v89), 
                users = v66, 
                isInExperience = v40.isInExperience, 
                onUserCardActivated = function(v99) --[[ Line: 365 ]] --[[ Name: onUserCardActivated ]]
                    -- upvalues: v48 (ref), l_EventNames_0 (ref), v69 (ref), v10 (ref), v92 (ref), v94 (ref)
                    v48.fireSquadAnalytics(l_EventNames_0.PartySheetAction, {
                        parentChannelId = v69, 
                        actionType = v10.UserCardClicked
                    });
                    v92(v99);
                    v94(true);
                end, 
                navigateToHomePage = v40.navigateToHomePage, 
                navigateToSquadInviteFriends = v98
            })
        });
    end, l_dependencyArray_0(v92, v94, v60, v66, v98, v63, v40.navigateToHomePage, v89, v49));
    local v101 = l_React_0.useMemo(function() --[[ Line: 392 ]]
        -- upvalues: l_React_0 (ref), v5 (ref), v45 (copy), v40 (copy), v88 (copy), v65 (copy)
        return l_React_0.createElement(v5, {
            squadState = v45, 
            anchorPoint = Vector2.new(0.5, 1), 
            navigateAwayFromSquad = v40.navigateAwayFromSquad, 
            navigateToHomePage = v40.navigateToHomePage, 
            toggleVoiceChatMenu = v88, 
            position = UDim2.new(0.5, 0, 1, -20), 
            squadId = v65, 
            isInExperience = v40.isInExperience
        });
    end, l_dependencyArray_0(v65, v40.isInExperience, v40.navigateToHomePage, v45, v88));
    local v102 = l_React_0.useMemo(function() --[[ Line: 407 ]]
        -- upvalues: v58 (copy), l_React_0 (ref), l_Foundation_0 (ref), l_StateLayerAffordance_0 (ref), v59 (copy), v90 (copy), v41 (copy), v7 (ref)
        if v58 then
            return (l_React_0.createElement(l_Foundation_0.View, {
                Size = UDim2.new(1, 0, 1, 0), 
                stateLayer = {
                    affordance = l_StateLayerAffordance_0.None
                }, 
                onActivated = function() --[[ Line: 413 ]] --[[ Name: onActivated ]]
                    -- upvalues: v59 (ref)
                    v59(false);
                end
            }, {
                l_React_0.createElement(l_Foundation_0.ScrollView, {
                    Size = UDim2.new(1, 0, 1, 0), 
                    Position = UDim2.new(0.5, 0, 0, 0), 
                    AnchorPoint = Vector2.new(0.5, 0), 
                    sizeConstraint = {
                        MaxSize = Vector2.new(350, 1e999)
                    }, 
                    scroll = {
                        AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                        CanvasSize = UDim2.new(1, 0, 1, 0), 
                        ScrollingDirection = Enum.ScrollingDirection.Y
                    }, 
                    layout = {
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }
                }, {
                    FlexibleSpace = l_React_0.createElement(l_Foundation_0.View, {
                        Size = UDim2.new(1, 0, 0, v90), 
                        flexItem = {
                            FlexMode = Enum.UIFlexMode.Fill
                        }, 
                        LayoutOrder = 1, 
                        stateLayer = {
                            affordance = l_StateLayerAffordance_0.None
                        }, 
                        onActivated = function() --[[ Line: 437 ]] --[[ Name: onActivated ]]
                            -- upvalues: v59 (ref)
                            v59(false);
                        end
                    }), 
                    Menu = l_React_0.createElement(l_Foundation_0.View, {
                        Size = UDim2.new(1, 0, 1, 0), 
                        flexItem = {
                            ItemLineAlignment = Enum.ItemLineAlignment.Center
                        }, 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        LayoutOrder = 2, 
                        padding = Vector2.new(v41.Padding.XLarge, v41.Padding.Medium), 
                        stateLayer = {
                            affordance = l_StateLayerAffordance_0.None
                        }, 
                        onActivated = function() --[[ Line: 450 ]] --[[ Name: onActivated ]]

                        end, 
                        ZIndex = 3
                    }, {
                        SquadLobbyVoiceChatMenu = l_React_0.createElement(v7, {})
                    }), 
                    BottomPadding = l_React_0.createElement(l_Foundation_0.View, {
                        Size = UDim2.new(1, 0, 0, v90), 
                        LayoutOrder = 3, 
                        stateLayer = {
                            affordance = l_StateLayerAffordance_0.None
                        }, 
                        onActivated = function() --[[ Line: 459 ]] --[[ Name: onActivated ]]
                            -- upvalues: v59 (ref)
                            v59(false);
                        end
                    })
                })
            }));
        else
            return nil;
        end;
    end, l_dependencyArray_0(v90, v58, v59, v41));
    local v103 = l_React_0.useMemo(function() --[[ Line: 469 ]]
        -- upvalues: v93 (copy), v91 (copy), l_React_0 (ref), v9 (ref), v40 (copy), v92 (copy), v94 (copy), v69 (copy)
        if v93 and v91 then
            return (l_React_0.createElement(v9, {
                userId = v91, 
                isInExperience = v40.isInExperience, 
                onDismiss = function() --[[ Line: 474 ]] --[[ Name: onDismiss ]]
                    -- upvalues: v92 (ref), v94 (ref)
                    v92(nil);
                    v94(false);
                end, 
                openViewProfile = function() --[[ Line: 478 ]] --[[ Name: openViewProfile ]]
                    -- upvalues: v40 (ref), v91 (ref)
                    v40.openViewProfile(v91);
                end, 
                openSquadVoiceAbuseReport = v40.openSquadVoiceAbuseReport, 
                parentChannelId = v69
            }));
        else
            return nil;
        end;
    end, l_dependencyArray_0(v69, v40.isInExperience, v93, v94, v40.openViewProfile, v91, v92));
    return l_Roact_0.createFragment({
        SquadLobbyBanners = v97, 
        SquadLobbyUsersScrollingFrame = v100, 
        SquadLobbyActionBar = v101, 
        SquadLobbyVoiceChatMenu = v102, 
        UserDropdownMenu = v103
    });
end;