local _ = require(script.Parent.Constants);
local l_Parent_0 = script:FindFirstAncestor("UserLib").Parent;
local l_GetFFlagAXEnableAvatarHeadShotSidebarRefresh_0 = require(l_Parent_0.SharedFlags).GetFFlagAXEnableAvatarHeadShotSidebarRefresh;
return function(v3, v4, v5, v6, v7) --[[ Line: 9 ]]
    -- upvalues: l_GetFFlagAXEnableAvatarHeadShotSidebarRefresh_0 (copy)
    local v8 = string.format("rbxthumb://type=%s&id=%s&w=%d&h=%d", v4, tostring(v3), v5, v5);
    if v6 then
        v8 = v8 .. "&filters=circular";
    end;
    if l_GetFFlagAXEnableAvatarHeadShotSidebarRefresh_0() and v7 then
        v8 = v8 .. "&timestamp=" .. os.time();
    end;
    return v8;
end;