local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local l_Images_0 = require(l_Parent_0.UIBlox).App.ImageSet.Images;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v7 = require(l_script_FirstAncestor_0.SocialLibraries);
local l_TestStyle_0 = v7.Components.TestStyle;
local l_getConversationDisplayTitle_0 = v7.Conversation.getConversationDisplayTitle;
local v10 = require(l_script_FirstAncestor_0.Hooks.useIsUserPending);
local v11 = require(script.Parent.PresenceBubbleCellStyled);
local v12 = {
    messageUnavailableKey = "Feature.Chat.Message.MessageUnavailable", 
    boldTitle = true, 
    childWidth = 0, 
    isLoading = false, 
    Size = UDim2.new(1, 0, 1, 0), 
    hideLeftPadding = false, 
    style = v2.Dictionary.join(l_TestStyle_0, {
        Tokens = {
            Global = {
                Color = {
                    None = {}
                }
            }
        }
    })
};
return v3.memo(function(v13) --[[ Line: 54 ]] --[[ Name: ConversationCell ]]
    -- upvalues: v2 (copy), v12 (copy), v10 (copy), v3 (copy), l_dependencyArray_0 (copy), l_getConversationDisplayTitle_0 (copy), l_useLocalization_0 (copy), v11 (copy), l_Images_0 (copy)
    local v14 = v2.Dictionary.join(v12, v13);
    local l_conversation_0 = v14.conversation;
    local v16 = v10(l_conversation_0 or {});
    local v17 = v3.useCallback(function() --[[ Line: 60 ]]
        -- upvalues: v14 (copy)
        if v14.onActivated then
            v14.onActivated(v14.conversation);
        end;
    end, l_dependencyArray_0(v14.onActivated));
    local v18 = l_getConversationDisplayTitle_0(l_conversation_0);
    local v19 = v14.subTitleText and v14.subTitleText:split("\n");
    local v20 = v19 and v19[1] or "";
    local v21 = l_useLocalization_0({
        subTitleText = v14.messageUnavailableKey
    });
    if v16 then
        v20 = v21.subTitleText;
    end;
    return v3.createElement(v11, {
        boldTitle = v14.boldTitle, 
        style = v14.style, 
        childWidth = v14.childWidth, 
        onActivated = v17, 
        onCircleActivated = v14.onCircleActivated, 
        subTitleText = v20, 
        subTitleIcon = v16 and l_Images_0["icons/status/private_small"] or nil, 
        secondaryTitleText = v14.secondaryTitleText, 
        Size = v14.Size, 
        isLoading = v14.isLoading, 
        avatarCirclePresenceImage = l_conversation_0.presenceImage, 
        titleText = v18, 
        thumbnails = l_conversation_0.thumbnails, 
        conversationId = l_conversation_0.id, 
        hideLeftPadding = v14.hideLeftPadding
    }, v14.children or {});
end);