local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AppChatNetworking);
local v3 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_UnfilteredThreadsConversationBanner_0 = v2.Constants.UnfilteredThreadsConversationBanner;
local v6 = require(l_script_FirstAncestor_0.Hooks.useIsInExperience);
return function(v7) --[[ Line: 12 ]]
    -- upvalues: v6 (copy), l_useSelector_0 (copy), v3 (copy), l_UnfilteredThreadsConversationBanner_0 (copy)
    local v8 = v6();
    return l_useSelector_0(function(v9) --[[ Line: 15 ]]
        -- upvalues: v7 (copy), v3 (ref), v8 (copy), l_UnfilteredThreadsConversationBanner_0 (ref)
        if not v7 then
            return nil;
        else
            local v10 = v3(v9, "ChatAppReducer.UnfilteredThreads.conversationBannerVariants") or {};
            if v8 then
                local v11 = v10[v7];
                if v11 == l_UnfilteredThreadsConversationBanner_0.PHONE_VERIFICATION_GROUP or v11 == l_UnfilteredThreadsConversationBanner_0.PHONE_VERIFICATION_ONE_TO_ONE then
                    return l_UnfilteredThreadsConversationBanner_0.LEARN_MORE;
                end;
            end;
            return v10[v7];
        end;
    end);
end;