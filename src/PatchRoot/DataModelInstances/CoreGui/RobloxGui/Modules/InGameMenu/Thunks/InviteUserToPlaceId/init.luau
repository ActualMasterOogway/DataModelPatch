local l_Players_0 = game:GetService("Players");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_RunService_0 = game:GetService("RunService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Parent_0 = script.Parent.Parent;
local l_Network_0 = l_Parent_0.Network;
local v6 = require(l_CorePackages_0.Workspace.Packages.AppChatNetworking);
local v7 = require(l_Network_0.httpRequest);
local v8 = require(l_Network_0.Requests.DEPRECATED_ChatSendMessage);
local v9 = require(l_Network_0.Requests.DEPRECATED_ChatSendGameLinkMessage);
local v10 = require(l_Network_0.Requests.DEPRECATED_ChatStartOneToOneConversation);
local v11 = require(l_Network_0.Requests.GetPlaceInfos);
local v12 = require(l_Parent_0.Utility.constructGameLinkUrl);
local v13 = v7(l_HttpRbxApiService_0);
local l_InviteStatus_0 = require(l_Parent_0.Resources.Constants).InviteStatus;
local v15 = require(l_Parent_0.Actions.ReceivedUserInviteStatus);
local v16 = game:DefineFastFlag("AppChatMigrateIGMInvite", false);
return function(v17, v18) --[[ Line: 31 ]]
    -- upvalues: l_InviteStatus_0 (copy), v15 (copy), l_RunService_0 (copy), v11 (copy), v13 (copy), l_Players_0 (copy), v16 (copy), v12 (copy), v6 (copy), v10 (copy), v8 (copy), v9 (copy)
    return function(v19) --[[ Line: 32 ]]
        -- upvalues: v17 (copy), l_InviteStatus_0 (ref), v15 (ref), l_RunService_0 (ref), v11 (ref), v13 (ref), v18 (copy), l_Players_0 (ref), v16 (ref), v12 (ref), v6 (ref), v10 (ref), v8 (ref), v9 (ref)
        if v19:getState().invites[tostring(v17)] == l_InviteStatus_0.Pending then
            return;
        else
            v19:dispatch(v15(v17, l_InviteStatus_0.Pending));
            if l_RunService_0:IsStudio() then
                spawn(function() --[[ Line: 42 ]]
                    -- upvalues: v19 (copy), v15 (ref), v17 (ref), l_InviteStatus_0 (ref)
                    v19:dispatch(v15(v17, l_InviteStatus_0.Failed));
                end);
                return;
            else
                return v11(v13, {
                    v18
                }):andThen(function(v20) --[[ Line: 48 ]]
                    local v21 = v20.responseBody[1];
                    assert(v21, "Error fetching placeInfos");
                    v21.placeId = tostring(v21.placeId);
                    v21.universeId = tostring(v21.universeId);
                    return v21;
                end):andThen(function(v22) --[[ Line: 58 ]]
                    -- upvalues: l_Players_0 (ref), v16 (ref), v12 (ref), v6 (ref), v17 (ref), v10 (ref), v13 (ref), v8 (ref), v9 (ref)
                    local l_UserId_0 = l_Players_0.LocalPlayer.UserId;
                    local v24 = string.format("Come join me in %s", v22.name);
                    if v16 then
                        assert(v22.universeRootPlaceId, "Failed to get universe root place id");
                        v24 = v24 .. "\n" .. v12(v22.universeRootPlaceId);
                        return v6.http.CreateConversation(nil, "one_to_one", {
                            v17
                        }):andThen(function(v25) --[[ Line: 65 ]]
                            -- upvalues: v6 (ref), v24 (ref), v22 (copy)
                            local v26 = v25.responseBody.conversations[1];
                            assert(v26, "Failed to create conversation");
                            return v6.http.SendChatTextMessage(nil, v26.id, v24):andThen(function(v27) --[[ Line: 68 ]]
                                -- upvalues: v26 (copy), v22 (ref)
                                local v28 = v27.responseBody.messages[1];
                                assert(v28, "Failed to send message");
                                return {
                                    resultType = v28.status == "success" and "Success" or "Failed", 
                                    conversationId = v26.id, 
                                    placeId = v22.universeRootPlaceId
                                };
                            end);
                        end):catch(function(v29) --[[ Line: 81 ]]
                            warn("Failed to send invite: " .. tostring(v29));
                        end);
                    else
                        return v10(v13, v17, l_UserId_0):andThen(function(v30) --[[ Line: 85 ]]
                            -- upvalues: v8 (ref), v13 (ref), v24 (ref), v9 (ref), v22 (copy)
                            local l_conversation_0 = v30.responseBody.conversation;
                            return v8(v13, l_conversation_0.id, v24):andThen(function() --[[ Line: 87 ]]
                                -- upvalues: v9 (ref), v13 (ref), l_conversation_0 (copy), v22 (ref)
                                return v9(v13, l_conversation_0.id, v22.universeId):andThen(function(v32) --[[ Line: 88 ]]
                                    -- upvalues: l_conversation_0 (ref), v22 (ref)
                                    return {
                                        resultType = v32.responseBody.resultType, 
                                        conversationId = l_conversation_0.id, 
                                        placeId = v22.universeRootPlaceId
                                    };
                                end);
                            end);
                        end);
                    end;
                end):andThen(function(v33) --[[ Line: 102 ]]
                    -- upvalues: v16 (ref), l_InviteStatus_0 (ref), v19 (copy), v15 (ref), v17 (ref)
                    if v16 then
                        local v34, v35 = v33:await();
                        assert(v34, "Failed to unroll promise after friend invitation: " .. tostring(v35));
                        v33 = v35;
                    end;
                    local v36 = l_InviteStatus_0[v33.resultType] or l_InviteStatus_0.Failed;
                    v19:dispatch(v15(v17, v36));
                    return v33;
                end, function(_) --[[ Line: 117 ]]
                    -- upvalues: v19 (copy), v15 (ref), v17 (ref), l_InviteStatus_0 (ref)
                    v19:dispatch(v15(v17, l_InviteStatus_0.Failed));
                end);
            end;
        end;
    end;
end;