local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatMakeBackgroundTransparent);
local v3 = require(l_Parent_0.Roact);
local l_withStyle_0 = require(l_Parent_0.UIBlox).Style.withStyle;
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local l_default_0 = require(l_Parent_0.SocialCommon).Experiments.NewChatTabExperimentation.default;
local v7 = require(script.Parent.ChatDisabledIndicator);
local l_GetFFlagAppChatRebrandStringUpdates_0 = require(l_Parent_0.SharedFlags).GetFFlagAppChatRebrandStringUpdates;
local v9 = v3.PureComponent:extend("EmptyConversationList");
v9.defaultProps = {
    chatEnabled = false, 
    navigateToPrivacy = function() --[[ Line: 19 ]] --[[ Name: navigateToPrivacy ]]

    end, 
    makeFriendsToChatKey = l_GetFFlagAppChatRebrandStringUpdates_0() and "Feature.Chat.Message.MakeFriendsToParty" or "Feature.Chat.Message.MakeFriendsToChat", 
    privacyButtonKey = "Feature.Chat.Label.PrivacySettings", 
    turnOnChatKey = l_GetFFlagAppChatRebrandStringUpdates_0() and "Feature.Chat.Message.TurnOnParty" or "Feature.Chat.Message.TurnOnChat", 
    privacyButtonEnabled = true
};
v9.didMount = function(v10) --[[ Line: 31 ]] --[[ Name: didMount ]]
    -- upvalues: l_default_0 (copy)
    if l_default_0.isEnabled() and v10.props.fireRenderEvent then
        v10.props.fireRenderEvent();
    end;
end;
v9.render = function(v11) --[[ Line: 37 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), l_withStyle_0 (copy), v3 (copy), v2 (copy), v7 (copy)
    return l_withLocalization_0({
        privacyButtonText = v11.props.privacyButtonKey, 
        chatDisabledText = v11.props.chatEnabled and v11.props.makeFriendsToChatKey or v11.props.turnOnChatKey
    })(function(v12) --[[ Line: 41 ]]
        -- upvalues: l_withStyle_0 (ref), v3 (ref), v2 (ref), v7 (ref), v11 (copy)
        return l_withStyle_0(function(v13) --[[ Line: 42 ]]
            -- upvalues: v3 (ref), v2 (ref), v7 (ref), v11 (ref), v12 (copy)
            return v3.createElement("Frame", {
                BackgroundColor3 = v13.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = if v2() then v13.Tokens.Global.Color.None.Transparency else v13.Theme.BackgroundDefault.Transparency, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                ChatDisabledIndicator = v3.createElement(v7, {
                    chatEnabled = v11.props.chatEnabled, 
                    navigateToPrivacy = v11.props.navigateToPrivacy, 
                    chatDisabledText = v12.chatDisabledText, 
                    privacyButtonText = v12.privacyButtonText, 
                    privacyButtonEnabled = v11.props.privacyButtonEnabled
                })
            });
        end);
    end);
end;
return v9;