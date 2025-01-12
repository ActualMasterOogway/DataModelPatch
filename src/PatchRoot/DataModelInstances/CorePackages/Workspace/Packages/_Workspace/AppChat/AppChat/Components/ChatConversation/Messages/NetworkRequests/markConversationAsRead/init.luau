local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Parent.AppChatNetworking);
local v2 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v3 = require(l_script_FirstAncestor_0.Logger);
local v4 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatMoveUnreadCountCall);
return function(v5) --[[ Line: 10 ]] --[[ Name: markConversationAsRead ]]
    -- upvalues: v2 (copy), v3 (copy), v1 (copy), v4 (copy)
    return function(v6) --[[ Line: 11 ]]
        -- upvalues: v2 (ref), v5 (copy), v3 (ref), v1 (ref), v4 (ref)
        local v7 = v2(v6:getState(), string.format("ChatAppReducer.Conversations.%s", v5 or ""));
        if v7 and v7.hasUnreadMessages then
            v3:info("Marking conversation {} as read", v5);
            v6:dispatch(v1.rodux.MarkConversation.API(v5)):andThen(function() --[[ Line: 18 ]]
                -- upvalues: v4 (ref), v6 (copy), v1 (ref), v3 (ref)
                if not v4() then
                    v6:dispatch(v1.rodux.GetConversationMetadata.API()):catch(function(v8) --[[ Line: 20 ]]
                        -- upvalues: v3 (ref)
                        v3:error((("AppChatNetworking failure in markConversationAsRead, Status: %*"):format((tostring(v8)))));
                    end);
                end;
            end):catch(function(v9) --[[ Line: 27 ]]
                -- upvalues: v3 (ref)
                v3:error((("AppChatNetworking failure in markConversationAsRead, Status: %*"):format((tostring(v9)))));
            end);
        end;
    end;
end;