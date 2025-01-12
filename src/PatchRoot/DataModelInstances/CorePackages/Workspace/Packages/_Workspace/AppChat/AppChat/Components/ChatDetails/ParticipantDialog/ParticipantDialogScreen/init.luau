local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.EnumScreens);
local v3 = require(l_Parent_0.Roact);
local v4 = require(script.Parent.Parent.Dialogs.GenericDialogType);
local v5 = require(script.Parent.Logger);
local v6 = require(script.Parent.ParticipantDialogContainer);
local v7 = require(l_script_FirstAncestor_0.LegacyAnalytics.connectAnalytics);
local v8 = require(l_script_FirstAncestor_0.LegacyAnalytics.RoactChatAnalytics);
local v9 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableReportAbuse);
local v10 = v3.PureComponent:extend("ParticipantDialogScreen");
v10.defaultProps = {
    navigation = nil
};
v10.init = function(v11) --[[ Line: 21 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), v4 (copy), v2 (copy), v8 (copy), v9 (copy)
    v11.onDismiss = function() --[[ Line: 22 ]]
        -- upvalues: v11 (copy)
        v11.props.navigation.goBack();
    end;
    v11.openRemoveUserDialog = function(v12, v13) --[[ Line: 25 ]]
        -- upvalues: v5 (ref), v11 (copy), v4 (ref)
        v5:info("User activated removeFromGroup | userId: {}, conversationId: {}", v12, v13);
        v11.props.navigation.replace(v4.RemoveUserDialog, {
            conversationId = v13, 
            participantId = v12
        });
    end;
    v11.openViewProfile = function(v14) --[[ Line: 33 ]]
        -- upvalues: v11 (copy), v2 (ref), v5 (ref), v8 (ref)
        local v15 = v11.props.navigation.getScreenProps("navigateToLuaAppPages", {})[v2.ViewUserProfile];
        if v15 then
            v5:info("Navigate To UserProfile from {screen}");
            v11.props.analytics:navigate(v8.NavigationEvents.ChatDetailsProfile);
            v15(v14, {});
            return;
        else
            v5:warning("UserProfile page was not set in navigateToLuaAppPages screenProps");
            return;
        end;
    end;
    v11.openReportUser = function(v16, v17) --[[ Line: 46 ]]
        -- upvalues: v9 (ref), v11 (copy), v2 (ref), v5 (ref)
        if v9() then
            v11.props.navigation.replace(v2.AppChatReportAbuse, {
                participantId = v16, 
                conversationId = v17
            });
            return;
        else
            local v18 = v11.props.navigation.getScreenProps("navigateToLuaAppPages", {})[v2.ReportAbuse];
            if v18 then
                v5:info("Navigate To ReportAbuse from {screen}");
                v18(v16, v17);
                return;
            else
                v5:warning("ReportAbuse page was not set in navigateToLuaAppPages screenProps");
                return;
            end;
        end;
    end;
end;
v10.render = function(v19) --[[ Line: 65 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v3 (copy), v6 (copy)
    local l_navigation_0 = v19.props.navigation;
    assert(type(l_navigation_0) ~= "nil", "ParticipantDialogScreen should be wrapped with Roact Navigation");
    local v21 = l_navigation_0.getParam("conversationId", nil);
    local v22 = l_navigation_0.getParam("participantId", nil);
    local v23 = l_navigation_0.getParam("showRemoveUserButton", false);
    if v21 == nil or v22 == nil then
        v5:warning("ConversationId and participantId are required to open {screen}");
        return nil;
    else
        return v3.createElement(v6, {
            conversationId = v21, 
            participantId = v22, 
            showRemoveUserButton = v23, 
            onDismiss = v19.onDismiss, 
            openRemoveUserDialog = v19.openRemoveUserDialog, 
            openReportUser = v19.openReportUser, 
            openViewProfile = v19.openViewProfile
        });
    end;
end;
v10.didMount = function(_) --[[ Line: 90 ]] --[[ Name: didMount ]]
    -- upvalues: v5 (copy)
    v5:info("{screen} mounted");
end;
return (v7(function(v25) --[[ Line: 94 ]]
    return {
        analytics = v25
    };
end)(v10));