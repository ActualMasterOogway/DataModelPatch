local l_TextChatService_0 = game:GetService("TextChatService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_List_0 = require(l_Parent_0.llama).List;
local v4 = require(l_script_FirstAncestor_0.Flags.getTextChatServiceTextChatCommandAutocompleteVisible);
local function v9() --[[ Line: 9 ]] --[[ Name: getCommandKeys ]]
    -- upvalues: l_TextChatService_0 (copy), v4 (copy)
    local v5 = {};
    local l_l_TextChatService_0_Descendants_0 = l_TextChatService_0:GetDescendants();
    for _, v8 in ipairs(l_l_TextChatService_0_Descendants_0) do
        if v4() then
            if v8.ClassName == "TextChatCommand" and v8.AutocompleteVisible and string.sub(v8.PrimaryAlias, 1, 1) == "/" then
                table.insert(v5, v8.PrimaryAlias);
            end;
        elseif v8.ClassName == "TextChatCommand" and string.sub(v8.PrimaryAlias, 1, 1) == "/" then
            table.insert(v5, v8.PrimaryAlias);
        end;
    end;
    return v5;
end;
return function(v10) --[[ Line: 32 ]]
    -- upvalues: v9 (copy), l_List_0 (copy)
    local v11 = v9();
    l_List_0.map(v11, function(v12) --[[ Line: 34 ]]
        -- upvalues: v10 (copy)
        v10.trie:insert(v12);
    end);
    return v10.trie;
end;