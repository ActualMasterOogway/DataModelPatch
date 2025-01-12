local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_fetchChatMetadata_0 = v1.AppChat.Conversations.Thunks.fetchChatMetadata;
local l_NavigateIntoChat_0 = v1.AppChat.Actions.NavigateIntoChat;
local l_getFFlagAppChatNewSettingsEndpoint_0 = v1.AppChat.Flags.getFFlagAppChatNewSettingsEndpoint;
return function(v5) --[[ Line: 9 ]]
    -- upvalues: l_fetchChatMetadata_0 (copy), l_getFFlagAppChatNewSettingsEndpoint_0 (copy), l_NavigateIntoChat_0 (copy)
    return {
        fetchChatSettings = function(v6) --[[ Line: 11 ]] --[[ Name: fetchChatSettings ]]
            -- upvalues: v5 (copy), l_fetchChatMetadata_0 (ref), l_getFFlagAppChatNewSettingsEndpoint_0 (ref)
            return v5(l_fetchChatMetadata_0()):andThen(function(_) --[[ Line: 12 ]]
                -- upvalues: l_getFFlagAppChatNewSettingsEndpoint_0 (ref), v5 (ref), v6 (copy)
                if not l_getFFlagAppChatNewSettingsEndpoint_0() then
                    v5(v6(true));
                end;
            end);
        end, 
        navigateIntoChat = function(v8) --[[ Line: 18 ]] --[[ Name: navigateIntoChat ]]
            -- upvalues: v5 (copy), l_NavigateIntoChat_0 (ref)
            v5(l_NavigateIntoChat_0(v8));
        end
    };
end;