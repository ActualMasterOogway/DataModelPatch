local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Common.ModelTypes);
local l_getDeepValue_0 = require(l_Parent_0.dependencies).SocialLibraries.Dictionary.getDeepValue;
return function(v3, v4, _) --[[ Line: 7 ]]
    -- upvalues: l_getDeepValue_0 (copy)
    return function(v6) --[[ Line: 8 ]]
        -- upvalues: l_getDeepValue_0 (ref), v3 (copy), v4 (copy)
        local v7 = l_getDeepValue_0(v3, string.format("%s.Users.byUserId.%s", v4, v6));
        if not v7 then
            return nil;
        else
            return v7;
        end;
    end;
end;