local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AppChatNetworking);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.Rodux);
local l_Immutable_0 = require(l_Parent_0.AppCommonLib).Immutable;
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local v7 = require(l_script_FirstAncestor_0.Actions.FetchChatSettingsCompleted);
local v8 = require(l_script_FirstAncestor_0.Conversations.Thunks.FetchChatSettings);
local v9 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatNewSettingsEndpoint);
local v10 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableGroupChatSettings);
local v11 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableChatUserMessagesSettings);
local v12 = {
    retrievalStatus = l_RetrievalStatus_0.NotStarted, 
    chatEnabled = not v9(), 
    groupChatEnabled = not v10(), 
    privacySettingsEnabled = false, 
    globalRulesEnabled = false, 
    chatUserMessagesEnabled = true
};
return v4.createReducer(v12, {
    [v7.name] = not v9() and function(v13, v14) --[[ Line: 38 ]]
        -- upvalues: l_Immutable_0 (copy), l_RetrievalStatus_0 (copy)
        v13 = l_Immutable_0.Set(v13, "retrievalStatus", l_RetrievalStatus_0.Done);
        return l_Immutable_0.JoinDictionaries(v13, v14.settings);
    end or nil, 
    [v8.Succeeded.name] = not v9() and function(v15, v16) --[[ Line: 44 ]]
        -- upvalues: l_Immutable_0 (copy)
        return l_Immutable_0.JoinDictionaries(v15, v16.responseBody);
    end or nil, 
    [v2.rodux.GetMetadata.Succeeded.name] = function(v17, v18) --[[ Line: 48 ]]
        -- upvalues: v9 (copy), v11 (copy), v3 (copy), l_RetrievalStatus_0 (copy), l_Immutable_0 (copy)
        local l_responseBody_0 = v18.responseBody;
        if v9() then
            local v20 = if l_responseBody_0.isChatEnabled then l_responseBody_0.isGroupChatEnabledByPrivacySetting == "enabled" else false;
            local v21 = l_responseBody_0.isChatEnabledByPrivacySetting == "enabled";
            local v22 = l_responseBody_0.isChatEnabledByGlobalRules == "enabled";
            if v11() then
                v17 = v3.Dictionary.union(v17, {
                    chatUserMessagesEnabled = l_responseBody_0.isChatUserMessagesEnabled
                });
            end;
            return v3.Dictionary.union(v17, {
                chatEnabled = l_responseBody_0.isChatEnabled, 
                groupChatEnabled = v20, 
                privacySettingsEnabled = v21, 
                globalRulesEnabled = v22, 
                retrievalStatus = l_RetrievalStatus_0.Done
            });
        else
            return l_Immutable_0.JoinDictionaries(v17, {
                chatEnabled = l_responseBody_0.isChatEnabled, 
                retrievalStatus = l_RetrievalStatus_0.Done
            });
        end;
    end, 
    Debug_GroupChatEnabledToggled = function(v23, _) --[[ Line: 80 ]] --[[ Name: Debug_GroupChatEnabledToggled ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.union(v23, {
            groupChatEnabled = not v23.groupChatEnabled
        });
    end
});