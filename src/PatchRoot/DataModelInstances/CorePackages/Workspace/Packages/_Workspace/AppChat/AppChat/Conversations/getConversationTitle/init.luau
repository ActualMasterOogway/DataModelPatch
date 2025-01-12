local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local l_getConversationDisplayTitle_0 = require(l_script_FirstAncestor_0.SocialLibraries).Conversation.getConversationDisplayTitle;
return function(v4, v5, v6) --[[ Line: 9 ]]
    -- upvalues: v2 (copy), l_getConversationDisplayTitle_0 (copy)
    if v4 and v4.isDefaultTitle then
        if not v5 then
            return "";
        elseif v2.isEmpty(v5) then
            return v6;
        else
            local v9 = v2.List.sort(v5, function(v7, v8) --[[ Line: 23 ]]
                return string.lower(v7.names.combinedName) < string.lower(v8.names.combinedName);
            end);
            local v11 = v2.List.map(v9, function(v10) --[[ Line: 27 ]]
                return v10.names.combinedName;
            end);
            return table.concat(v11, ", ");
        end;
    else
        return l_getConversationDisplayTitle_0(v4);
    end;
end;