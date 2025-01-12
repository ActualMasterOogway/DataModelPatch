local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Enums.PostCreationNotificationType);
local v2 = require(script.Parent.EventConstants);
return function(v3) --[[ Line: 7 ]]
    -- upvalues: v1 (copy), v2 (copy)
    if v3 == v1.Success then
        return v2.action.PostSuccessfulToastViewed;
    elseif v3 == v1.Fail then
        return v2.action.PostUnsuccessfulToastViewed;
    elseif v3 == v1.Moderated then
        return v2.action.PostModeratedToastViewed;
    else
        return nil;
    end;
end;