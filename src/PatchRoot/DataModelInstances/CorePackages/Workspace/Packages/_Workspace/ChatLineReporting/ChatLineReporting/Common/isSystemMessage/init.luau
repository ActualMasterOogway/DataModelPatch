local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChatLineReporting");
local v1 = require(l_script_FirstAncestor_0.Common.Constants);
isSystemMessage = function(v2) --[[ Line: 9 ]] --[[ Name: isSystemMessage ]]
    -- upvalues: v1 (copy)
    if v2.textChannel.Name == v1.ChannelTypes.System then
        return true;
    else
        return v2.userId == "0";
    end;
end;
return isSystemMessage;