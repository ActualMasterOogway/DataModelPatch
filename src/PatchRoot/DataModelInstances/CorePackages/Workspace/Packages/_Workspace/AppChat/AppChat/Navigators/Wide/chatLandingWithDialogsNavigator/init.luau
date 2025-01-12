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
local l_SquadVoiceAbuseReportScreen_0 = v5.SquadVoiceAbuseReportScreen;
local l_GetFFlagEnableCrossExpVoice_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableCrossExpVoice;
local l_GetFFlagLuaAppEnableSquadPage_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableSquadPage;
local v21 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableReportAbuse);
local v22 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableRepliesUI);
local v23 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatOverhaulModals);
local v24 = require(script.Parent.chatLandingStackNavigator);
local v25 = v2.Component:extend("ChatLandingStackNavigatorConnector");
v25.router = v24.router;
v25.render = function(v26) --[[ Line: 37 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v24 (copy)
    return v2.createElement(v24, v26.props);
end;
local v27 = {
    {
        [v4.ChatLandingStack] = v25
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
if not v23() then
    table.insert(v27, {
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
if v21() then
    table.insert(v27, {
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
if v22() then
    table.insert(v27, {
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
    table.insert(v27, {
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
return v3.createRobloxStackNavigator(v27, {
    mode = v3.StackPresentationStyle.Overlay
});