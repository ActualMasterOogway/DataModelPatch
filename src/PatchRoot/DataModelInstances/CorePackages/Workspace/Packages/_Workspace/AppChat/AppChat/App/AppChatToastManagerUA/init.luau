local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Components.EventReceivers.AppChatToastEventReceiver);
local v3 = require(l_script_FirstAncestor_0.Actions.EnteredChatFromEntryPoint);
local v4 = require(l_script_FirstAncestor_0.Conversations.Thunks.NavigateIntoChat);
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.RoactUtils);
local v7 = require(l_Parent_0.SocialCommon);
local l_useDispatch_0 = v6.Hooks.RoactRodux.useDispatch;
AppChatToastManagerUA = function() --[[ Line: 14 ]] --[[ Name: AppChatToastManagerUA ]]
    -- upvalues: l_useDispatch_0 (copy), v5 (copy), v4 (copy), v3 (copy), v7 (copy), v2 (copy)
    local v9 = l_useDispatch_0();
    local v11 = v5.useCallback(function(v10) --[[ Line: 17 ]]
        -- upvalues: v9 (copy), v4 (ref), v3 (ref), v7 (ref)
        v9(v4({
            conversationId = v10
        }, true));
        v9(v3(v7.Enums.ChatEntryPointNames.ToastUniversalApp));
    end, {
        v9
    });
    return v5.createElement(v2, {
        navigateToChat = v11
    });
end;
return AppChatToastManagerUA;