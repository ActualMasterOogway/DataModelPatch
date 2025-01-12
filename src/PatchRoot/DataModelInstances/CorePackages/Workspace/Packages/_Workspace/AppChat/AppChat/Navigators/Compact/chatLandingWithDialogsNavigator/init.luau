local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.RoactNavigation);
local v4 = require(l_script_FirstAncestor_0.EnumScreens);
local v5 = require(l_Parent_0.Squads);
local l_ChatDetails_0 = l_script_FirstAncestor_0.Components.ChatDetails;
local v7 = require(l_ChatDetails_0.Dialogs.GenericDialogType);
local v8 = require(l_ChatDetails_0.EditChatGroupNameDialog.EditChatGroupNameDialogScreen);
local v9 = require(l_ChatDetails_0.LeaveGroupDialog.LeaveGroupDialogScreen);
local v10 = require(l_ChatDetails_0.ParticipantDialog.ParticipantDialogScreen);
local v11 = require(l_ChatDetails_0.RemoveUserDialog.RemoveUserDialogScreen);
local v12 = require(l_script_FirstAncestor_0.Components.ChatAbuseReport.AbuseReportScreen);
local v13 = require(l_script_FirstAncestor_0.Components.ChatConversation.MessageInteraction.MessageContextMenuScreen);
local l_ChatConversation_0 = l_script_FirstAncestor_0.Components.ChatConversation;
local v15 = require(l_ChatConversation_0.PartialModal.CreateUnfilteredChatPartialModalScreen);
local v16 = require(l_ChatConversation_0.PartialModal.LearnMorePartialModalScreen);
local v17 = require(l_ChatConversation_0.PartialModal.PhoneVerificationPartialModalScreen);
local v18 = require(l_script_FirstAncestor_0.configureTopBarWithNavigationOptions);
local v19 = require(script.Parent.chatLandingStackNavigator);
local l_SquadVoiceAbuseReportScreen_0 = v5.SquadVoiceAbuseReportScreen;
local l_GetFFlagEnableCrossExpVoice_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableCrossExpVoice;
local l_GetFFlagLuaAppEnableSquadPage_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableSquadPage;
local v23 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableReportAbuse);
local v24 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableRepliesUI);
local v25 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatOverhaulModals);
local v26 = v2.Component:extend("ChatLandingStackNavigatorConnector");
v26.router = v19.router;
v26.render = function(v27) --[[ Line: 38 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v18 (copy), v19 (copy)
    return v2.createFragment({
        layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        topBar = v18(v27.props.navigation), 
        navigatorFrame = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, -v27.props.navigation.getScreenProps("topBarHeight", 0)), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            navigator = v2.createElement(v19, v27.props)
        })
    });
end;
local v28 = {
    {
        [v4.ChatLandingStack] = v26
    }, 
    {
        [v7.EditChatGroupNameDialog] = {
            screen = v8, 
            navigationOptions = {
                backButtonEnabled = true, 
                overlayEnabled = true, 
                renderUnderlyingPage = true
            }
        }
    }, 
    {
        [v7.LeaveGroupDialog] = {
            screen = v9, 
            navigationOptions = {
                backButtonEnabled = true, 
                overlayEnabled = true, 
                renderUnderlyingPage = true
            }
        }
    }, 
    {
        [v7.ParticipantDialog] = {
            screen = v10, 
            navigationOptions = {
                backButtonEnabled = true, 
                overlayEnabled = true, 
                renderUnderlyingPage = true
            }
        }
    }, 
    {
        [v7.RemoveUserDialog] = {
            screen = v11, 
            navigationOptions = {
                backButtonEnabled = true, 
                overlayEnabled = true, 
                renderUnderlyingPage = true
            }
        }
    }, 
    {
        [v4.CreateUnfilteredChatPartialModal] = {
            screen = v15, 
            navigationOptions = {
                backButtonEnabled = true, 
                overlayEnabled = true, 
                renderUnderlyingPage = true
            }
        }
    }, 
    {
        [v4.LearnMorePartialModal] = {
            screen = v16, 
            navigationOptions = {
                backButtonEnabled = true, 
                overlayEnabled = true, 
                renderUnderlyingPage = true
            }
        }
    }
};
if not v25() then
    table.insert(v28, {
        [v4.PhoneVerificationPartialModal] = {
            screen = v17, 
            navigationOptions = {
                backButtonEnabled = true, 
                overlayEnabled = true, 
                renderUnderlyingPage = true
            }
        }
    });
end;
if v23() then
    table.insert(v28, {
        [v4.AppChatReportAbuse] = {
            screen = v12, 
            navigationOptions = {
                backButtonEnabled = true, 
                overlayEnabled = true, 
                renderUnderlyingPage = true
            }
        }
    });
end;
if v24() then
    table.insert(v28, {
        [v4.MessageContextMenu] = {
            screen = v13, 
            navigationOptions = {
                backButtonEnabled = true, 
                overlayEnabled = true, 
                renderUnderlyingPage = true
            }
        }
    });
end;
if l_GetFFlagLuaAppEnableSquadPage_0() and l_GetFFlagEnableCrossExpVoice_0() then
    table.insert(v28, {
        [v4.SquadVoiceReportAbuse] = {
            screen = l_SquadVoiceAbuseReportScreen_0, 
            navigationOptions = {
                backButtonEnabled = true, 
                overlayEnabled = true, 
                renderUnderlyingPage = true
            }
        }
    });
end;
return v3.createRobloxStackNavigator(v28, {
    mode = v3.StackPresentationStyle.Overlay
});