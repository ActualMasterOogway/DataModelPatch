local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v3 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v4 = require(l_script_FirstAncestor_0.Common.Constants);
local v5 = require(l_script_FirstAncestor_0.Common.Enums);
local v6 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
return function() --[[ Line: 36 ]]
    -- upvalues: v6 (copy), l_useSelector_0 (copy), v3 (copy), v4 (copy), v5 (copy)
    local l_profileUserId_0 = v6().profileUserId;
    return l_useSelector_0(function(v8) --[[ Line: 40 ]]
        -- upvalues: v3 (ref), v4 (ref), l_profileUserId_0 (copy), v5 (ref)
        return v3(v8, (("%*.Users.%*.components.%*"):format(v4.RODUX_KEY, l_profileUserId_0, v5.Components.UserProfileHeader))) or {};
    end);
end;