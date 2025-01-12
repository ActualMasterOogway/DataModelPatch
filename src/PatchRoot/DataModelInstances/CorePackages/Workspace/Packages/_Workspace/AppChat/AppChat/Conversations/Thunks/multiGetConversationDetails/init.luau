local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AppChatNetworking);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.Promise);
local v5 = require(script.Parent.processConversations);
local v6 = require(l_script_FirstAncestor_0.Flags.getFFlagMultifetchUseProcessConversations);
return function(v7) --[[ Line: 17 ]]
    -- upvalues: v4 (copy), v2 (copy), v3 (copy), v6 (copy), v5 (copy)
    return function(v8) --[[ Line: 18 ]]
        -- upvalues: v7 (copy), v4 (ref), v2 (ref), v3 (ref), v6 (ref), v5 (ref)
        if not v7 or #v7 == 0 then
            return v4.resolve({});
        else
            local v9 = {};
            local l_GET_CONVERSATIONS_0 = v2.Constants.PageSize.GET_CONVERSATIONS;
            for v11 = 1, #v7, l_GET_CONVERSATIONS_0 do
                local v12 = v3.List.getRange(v7, v11, v11 + l_GET_CONVERSATIONS_0 - 1);
                table.insert(v9, v8:dispatch(v2.rodux.MultiGetConversationDetails.API(v12)));
            end;
            local v17 = v4.all(v9):andThen(function(v13) --[[ Line: 28 ]]
                -- upvalues: v3 (ref)
                return v3.List.foldLeft(v13, function(v14, v15) --[[ Line: 29 ]]
                    -- upvalues: v3 (ref)
                    local v16 = v15 and v15.responseBody and v15.responseBody.conversations;
                    if not v16 then
                        return v14;
                    else
                        return v3.List.join(v14, v16);
                    end;
                end, {});
            end);
            if v6() then
                return v17:tap(function(v18) --[[ Line: 38 ]]
                    -- upvalues: v8 (copy), v5 (ref)
                    v8:dispatch(v5(v18));
                end);
            else
                return v17;
            end;
        end;
    end;
end;