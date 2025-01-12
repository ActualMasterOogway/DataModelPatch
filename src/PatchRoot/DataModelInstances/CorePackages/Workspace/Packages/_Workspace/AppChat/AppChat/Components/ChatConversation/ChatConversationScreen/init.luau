local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.EnumScreens);
local v3 = require(l_Parent_0.ArgCheck);
local v4 = require(l_Parent_0.Roact);
local v5 = require(l_Parent_0.RoactNavigation);
local v6 = require(l_Parent_0.Cryo);
local v7 = require(l_Parent_0.UIBlox);
local l_Images_0 = v7.App.ImageSet.Images;
local l_IconButton_0 = v7.App.Button.IconButton;
local v10 = require(script.Parent.Utils.readingMessagesIsEnabled);
local v11 = require(script.Parent.ChatConversationContainer);
local v12 = require(script.Parent.Logger);
local l_withChatPlacementContext_0 = require(l_script_FirstAncestor_0.Contexts.ChatPlacementContext).withChatPlacementContext;
local v14 = require(l_script_FirstAncestor_0.LegacyAnalytics.withRoactChatAnalytics);
local v15 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v16 = require(l_Parent_0.Squads);
local l_SquadJoinButton_0 = v16.SquadJoinButton;
local l_SquadButtonSourceEnum_0 = v16.Enums.SquadButtonSourceEnum;
local l_SquadComponentAccessWrapper_0 = v16.SquadComponentAccessWrapper;
local v20 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableConversationTitleWithFacePile);
local v21 = v4.PureComponent:extend("ChatConversationScreen");
v21.defaultProps = {
    navigation = nil
};
v21.navigationOptions = function(v22) --[[ Line: 34 ]]
    -- upvalues: v2 (copy), v4 (copy), l_withChatPlacementContext_0 (copy), l_SquadComponentAccessWrapper_0 (copy), l_SquadJoinButton_0 (copy), l_SquadButtonSourceEnum_0 (copy), v14 (copy), v20 (copy), l_IconButton_0 (copy), l_Images_0 (copy), v12 (copy), v15 (copy)
    local l_navigation_0 = v22.navigation;
    local v24 = nil;
    local v25 = l_navigation_0.getParam("conversationId", nil);
    if v25 then
        v25 = tostring(v25);
    else
        v25 = nil;
    end;
    local function v26() --[[ Line: 40 ]]
        -- upvalues: l_navigation_0 (copy), v2 (ref), v25 (ref)
        l_navigation_0.navigate(v2.SquadLobby, {
            conversationId = v25
        });
    end;
    if v25 then
        v24 = v4.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1
        }, {
            UIListLayout = v4.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Right
            }), 
            GroupUpButton = l_withChatPlacementContext_0(function(v27) --[[ Line: 54 ]]
                -- upvalues: v4 (ref), l_SquadComponentAccessWrapper_0 (ref), v25 (ref), l_SquadJoinButton_0 (ref), v26 (copy), l_SquadButtonSourceEnum_0 (ref)
                return v4.createElement(l_SquadComponentAccessWrapper_0, {
                    parentChannelId = v25
                }, v4.createElement(l_SquadJoinButton_0, {
                    conversationId = v25, 
                    isFullWidth = false, 
                    isInCard = false, 
                    layoutOrder = 0, 
                    onActivated = v26, 
                    shouldAnimate = true, 
                    squadButtonSource = l_SquadButtonSourceEnum_0.ChatConversationScreen, 
                    squadLocation = v27.chatPlacement
                }));
            end)
        });
    end;
    return {
        renderRight = function() --[[ Line: 76 ]] --[[ Name: renderRight ]]
            -- upvalues: v14 (ref), v4 (ref), v24 (ref), v20 (ref), l_IconButton_0 (ref), l_Images_0 (ref), l_navigation_0 (copy), v12 (ref), v2 (ref), v15 (ref)
            return v14(function(v28) --[[ Line: 77 ]]
                -- upvalues: v4 (ref), v24 (ref), v20 (ref), l_IconButton_0 (ref), l_Images_0 (ref), l_navigation_0 (ref), v12 (ref), v2 (ref), v15 (ref)
                return v4.createFragment({
                    groupUp = v24, 
                    chatDetails = if v20() then nil else v4.createElement(l_IconButton_0, {
                        layoutOrder = 2, 
                        size = UDim2.fromOffset(0, 0), 
                        icon = l_Images_0["icons/common/more"], 
                        onActivated = function() --[[ Line: 86 ]] --[[ Name: onActivated ]]
                            -- upvalues: l_navigation_0 (ref), v12 (ref), v2 (ref), v28 (copy), v15 (ref)
                            local v29 = l_navigation_0.getParam("conversationId", nil);
                            v29 = v29 and tostring(v29) or nil;
                            v12:info("Navigate To ChatDetails: {} from {screen}", v29);
                            l_navigation_0.navigate(v2.ChatDetails, {
                                conversationId = v29
                            });
                            if v28 then
                                v28.fireAnalyticsEvent(v15.ConversationInfoBtnClicked, {
                                    conversationId = v29
                                });
                            end;
                        end
                    })
                });
            end);
        end
    };
end;
v21.init = function(v30) --[[ Line: 104 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), v20 (copy), v12 (copy), v2 (copy), v14 (copy), v15 (copy), v3 (copy), v6 (copy), v10 (copy)
    v30.toastProps = nil;
    v30.inputBoxRef = v4.createRef();
    if v20() then
        local l_navigation_1 = v30.props.navigation;
        local v32 = l_navigation_1.getParam and l_navigation_1.getParam("conversationId", nil);
        local function v34() --[[ Line: 112 ]]
            -- upvalues: v12 (ref), v32 (copy), l_navigation_1 (copy), v2 (ref), v14 (ref), v15 (ref)
            v12:info("Navigate To ChatDetails: {} from {screen}", v32);
            l_navigation_1.navigate(v2.ChatDetails, {
                conversationId = v32
            });
            v14(function(v33) --[[ Line: 115 ]]
                -- upvalues: v15 (ref), v32 (ref)
                if v33 then
                    return v33.fireAnalyticsEvent(v15.ConversationInfoBtnClicked, {
                        conversationId = v32
                    });
                else
                    return;
                end;
            end);
        end;
        local v35 = v30.props.navigation.getScreenProps("setScreenTopBar", nil);
        v3.isNotNil(v35, "setScreenTopBar in screenProps");
        v35(v2.ChatConversation, {
            navigateToChatDetails = v34, 
            conversationId = v32
        });
    end;
    v30.queueNavigationToToast = function(v36) --[[ Line: 135 ]]
        -- upvalues: v30 (copy)
        if v30.props.navigation.isFocused() then
            v30.navigateToToast(v36);
            v30.toastProps = nil;
            return;
        else
            v30.toastProps = v36;
            return;
        end;
    end;
    v30.onDidFocus = function() --[[ Line: 145 ]]
        -- upvalues: v30 (copy)
        v30.setInputBarCloseCallback(v30.releaseFocus);
        if v30.toastProps then
            v30.navigateToToast(v30.toastProps);
            v30.toastProps = nil;
        end;
    end;
    v30.releaseFocus = function() --[[ Line: 154 ]]
        -- upvalues: v30 (copy)
        if v30.inputBoxRef and v30.inputBoxRef:getValue() then
            v30.inputBoxRef:getValue():ReleaseFocus();
        end;
    end;
    v30.onWillBlur = function() --[[ Line: 160 ]]
        -- upvalues: v30 (copy)
        v30.releaseFocus();
        v30.setInputBarCloseCallback();
    end;
    v30.navigateToToast = function(v37) --[[ Line: 166 ]]
        -- upvalues: v12 (ref), v30 (copy), v2 (ref)
        v12:info("Navigate To Toast from {screen}");
        v30.props.navigation.navigate(v2.RoactChatToast, v37);
    end;
    v30.openViewProfile = function(v38) --[[ Line: 171 ]]
        -- upvalues: v30 (copy), v2 (ref), v12 (ref)
        local v39 = v30.props.navigation.getScreenProps("navigateToLuaAppPages", {})[v2.ViewUserProfile];
        if v39 then
            v12:info("Navigate To UserProfile from {screen}");
            v39(v38, {});
            return;
        else
            v12:warning("UserProfile page was not set in navigateToLuaAppPages screenProps");
            return;
        end;
    end;
    v30.openGameDetailsPage = function(v40, v41) --[[ Line: 183 ]]
        -- upvalues: v30 (copy), v2 (ref), v12 (ref)
        local v42 = v30.props.navigation.getScreenProps("navigateToLuaAppPages", {})[v2.GameDetail];
        if v42 then
            v12:info("Navigate To GameDetail from " .. tostring(v41));
            v42(v40, v41);
            return;
        else
            v12:warning("GameDetail page was not set in navigateToLuaAppPages screenProps");
            return;
        end;
    end;
    v30.navigateToChatConversation = function(v43) --[[ Line: 196 ]]
        -- upvalues: v12 (ref), v30 (copy), v2 (ref)
        v12:info("Navigate To Conversation: {} from {screen}", v43);
        v30.props.navigation.navigate(v2.ChatConversation, {
            conversationId = v43
        });
    end;
    v30.navigateToScreen = function(v44, v45) --[[ Line: 201 ]]
        -- upvalues: v12 (ref), v30 (copy), v6 (ref)
        v12:info("Navigate To Screen: {} from {screen}", v44);
        local l_navigation_2 = v30.props.navigation;
        local v47 = l_navigation_2 and l_navigation_2.getParam and l_navigation_2.getParam("conversationId", nil);
        if v45 then
            v30.props.navigation.navigate(v44, v6.Dictionary.union({
                conversationId = v47
            }, v45));
            return;
        else
            v30.props.navigation.navigate(v44, {
                conversationId = v47
            });
            return;
        end;
    end;
    v30.navigateBack = function() --[[ Line: 220 ]]
        -- upvalues: v30 (copy)
        if v30.props.navigation.isFocused() then
            v30.props.navigation.goBack();
        end;
    end;
    v30.updateConversationTitle = function(v48) --[[ Line: 226 ]]
        -- upvalues: v30 (copy), v3 (ref), v2 (ref)
        local v49 = v30.props.navigation.getScreenProps("setScreenTopBar", nil);
        v3.isNotNil(v49, "setScreenTopBar in screenProps");
        v49(v2.ChatConversation, {
            headerText = if v48 then {
                raw = v48, 
                shouldLocalize = false
            } else {
                raw = "CommonUI.Features.Label.Chat", 
                shouldLocalize = true
            }
        });
    end;
    v30.setInputBarCloseCallback = function(v50) --[[ Line: 243 ]]
        -- upvalues: v30 (copy), v3 (ref), v2 (ref)
        local v51 = v30.props.navigation.getScreenProps("setScreenTopBar", nil);
        v3.isNotNil(v51, "setScreenTopBar in screenProps");
        v51(v2.ChatLanding, {
            closeInputBar = v50
        });
    end;
    v30.getReadingMessagesIsEnabled = function() --[[ Line: 250 ]]
        -- upvalues: v10 (ref), v30 (copy)
        return v10(v30.props.navigation);
    end;
    v30.updatePrivateConversationTopBar = function(v52) --[[ Line: 254 ]]
        -- upvalues: v30 (copy), v3 (ref), v2 (ref)
        local v53 = v30.props.navigation.getScreenProps("setScreenTopBar", nil);
        v3.isNotNil(v53, "setScreenTopBar in screenProps");
        v53(v2.ChatConversation, {
            isPrivateConversation = v52
        });
    end;
end;
v21.render = function(v54) --[[ Line: 262 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v4 (copy), v5 (copy), v11 (copy)
    local v55 = v3.isNotNil(v54.props.navigation, "navigation in ChatConversationScreen");
    local v56 = v4.createElement(v5.NavigationEvents, {
        onDidFocus = v54.onDidFocus, 
        onWillBlur = v54.onWillBlur
    });
    local v57 = v55.getParam("conversationId", nil);
    local v58 = v57 and tostring(v57) or nil;
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        container = v4.createElement(v11, {
            topBarHeight = v55.getScreenProps("topBarHeight", 0), 
            wideMode = v55.getScreenProps("wideMode", false), 
            openGameDetailsPage = v54.openGameDetailsPage, 
            getReadingMessagesIsEnabled = v54.getReadingMessagesIsEnabled, 
            conversationId = v58, 
            inputBoxRef = v54.inputBoxRef, 
            updateConversationTitle = v54.updateConversationTitle, 
            updatePrivateConversationTopBar = v54.updatePrivateConversationTopBar, 
            navigateBack = v54.navigateBack, 
            navigateToToast = v54.queueNavigationToToast, 
            openViewProfile = v54.openViewProfile, 
            navigateToChatConversation = v54.navigateToChatConversation, 
            navigateToScreen = v54.navigateToScreen
        }), 
        eventsAdapter = v56
    });
end;
v21.didMount = function(_) --[[ Line: 297 ]] --[[ Name: didMount ]]
    -- upvalues: v12 (copy)
    v12:info("{screen} mounted");
end;
return v21;