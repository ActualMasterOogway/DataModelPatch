local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local _ = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local v2 = require(l_script_FirstAncestor_0.Models.Conversation);
local function _(v3, v4, v5) --[[ Line: 10 ]] --[[ Name: set ]]
    if v3[v4] == v5 then
        return v3;
    else
        local v6 = table.clone(v3);
        v6[v4] = v5;
        return v6;
    end;
end;
return function(v8, v9) --[[ Line: 22 ]] --[[ Name: updateConversationToState ]]
    -- upvalues: v2 (copy)
    if v9.conversationType == v2.Type.ONE_TO_ONE_CONVERSATION then
        local v10 = v2.IdForFakeOneOnOne(v9.participants);
        if v8[v10] ~= nil and v8[v10] ~= v9 then
            local l_v8_0 = v8;
            if l_v8_0[v10] == nil then
                v8 = l_v8_0;
            else
                local v12 = table.clone(l_v8_0);
                v12[v10] = nil;
                v8 = v12;
            end;
        end;
    end;
    local l_v8_1 = v8;
    local l_id_0 = v9.id;
    local v15;
    if l_v8_1[l_id_0] == v9 then
        v15 = l_v8_1;
    else
        local v16 = table.clone(l_v8_1);
        v16[l_id_0] = v9;
        v15 = v16;
    end;
    l_v8_1 = v8[v9.id];
    l_id_0 = v15[v9.id];
    if l_id_0 and l_v8_1 then
        local v17 = {};
        for v18, v19 in l_v8_1.messages:CreateIterator() do
            if not l_id_0.messages:Get(v18) then
                table.insert(v17, v19);
            end;
        end;
        if #v17 > 0 then
            l_id_0.messages = l_id_0.messages:Insert(table.unpack(v17));
        end;
    end;
    return v15;
end;