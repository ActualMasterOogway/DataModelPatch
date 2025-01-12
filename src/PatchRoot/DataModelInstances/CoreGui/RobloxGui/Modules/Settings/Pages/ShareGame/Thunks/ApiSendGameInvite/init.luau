local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_Requests_0 = require(l_CorePackages_0.Workspace.Packages.Http).Requests;
local l_DEPRECATED_ChatSendMessage_0 = l_Requests_0.DEPRECATED_ChatSendMessage;
local l_DEPRECATED_ChatStartOneToOneConversation_0 = l_Requests_0.DEPRECATED_ChatStartOneToOneConversation;
local l_RobloxGui_0 = game:GetService("CoreGui").RobloxGui;
local v6 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local l_DEPRECATED_ChatSendGameLinkMessage_0 = l_Requests_0.DEPRECATED_ChatSendGameLinkMessage;
return function(v8, v9, v10) --[[ Line: 19 ]]
    -- upvalues: l_Players_0 (copy), v6 (copy), l_DEPRECATED_ChatStartOneToOneConversation_0 (copy), l_DEPRECATED_ChatSendMessage_0 (copy), l_DEPRECATED_ChatSendGameLinkMessage_0 (copy)
    local l_UserId_0 = l_Players_0.LocalPlayer.UserId;
    local v12 = nil;
    v12 = v6:FormatByKey("Feature.SettingsHub.Message.InviteToGameTitle", {
        PLACENAME = v10.name
    });
    return function(_) --[[ Line: 28 ]]
        -- upvalues: l_DEPRECATED_ChatStartOneToOneConversation_0 (ref), v8 (copy), v9 (copy), l_UserId_0 (copy), l_DEPRECATED_ChatSendMessage_0 (ref), v12 (ref), v10 (copy), l_DEPRECATED_ChatSendGameLinkMessage_0 (ref)
        return l_DEPRECATED_ChatStartOneToOneConversation_0(v8, v9, l_UserId_0):andThen(function(v14) --[[ Line: 29 ]]
            -- upvalues: l_DEPRECATED_ChatSendMessage_0 (ref), v8 (ref), v12 (ref), v9 (ref), v10 (ref), l_DEPRECATED_ChatSendGameLinkMessage_0 (ref)
            local l_conversation_0 = v14.responseBody.conversation;
            return l_DEPRECATED_ChatSendMessage_0(v8, l_conversation_0.id, v12, nil, true, v9):andThen(function() --[[ Line: 32 ]]
                -- upvalues: l_conversation_0 (copy), v10 (ref), l_DEPRECATED_ChatSendGameLinkMessage_0 (ref), v8 (ref), v9 (ref)
                local function v17(v16) --[[ Line: 33 ]] --[[ Name: handleResult ]]
                    -- upvalues: l_conversation_0 (ref), v10 (ref)
                    return {
                        resultType = v16.responseBody.resultType, 
                        conversationId = l_conversation_0.id, 
                        placeId = v10.universeRootPlaceId
                    };
                end;
                return l_DEPRECATED_ChatSendGameLinkMessage_0(v8, l_conversation_0.id, v10.universeId, nil, true, v9, v10.universeRootPlaceId):andThen(v17);
            end);
        end);
    end;
end;