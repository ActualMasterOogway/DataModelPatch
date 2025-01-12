local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = script.Parent.Parent;
local v2 = require(l_Parent_0.dependencies);
local v3 = require(l_Parent_0.Flags.FFlagSocialLuaAnalyticsRemoveSocialLibraries);
local v4 = if v3 then nil else v2.SocialLibraries;
local _ = require(l_Parent_1.AnalyticsTypes);
local v6 = require(l_Parent_0.Utils.getDeepValue);
return function(v7) --[[ Line: 13 ]]
    -- upvalues: v3 (copy), v6 (copy), v4 (copy)
    local l_keyPath_0 = v7.keyPath;
    return function(v9) --[[ Line: 15 ]]
        -- upvalues: v3 (ref), v6 (ref), l_keyPath_0 (copy), v4 (ref)
        return function(v10) --[[ Line: 16 ]]
            -- upvalues: v3 (ref), v6 (ref), v9 (copy), l_keyPath_0 (ref), v4 (ref)
            if v3 then
                return v6(v9, string.format("%s.bySessionKey.%s", l_keyPath_0, v10));
            else
                return v4.Dictionary.getDeepValue(v9, string.format("%s.bySessionKey.%s", l_keyPath_0, v10));
            end;
        end;
    end;
end;