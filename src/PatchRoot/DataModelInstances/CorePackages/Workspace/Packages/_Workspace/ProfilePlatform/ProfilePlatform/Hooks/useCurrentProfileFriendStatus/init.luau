local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Common.Enums);
local v3 = require(l_script_FirstAncestor_0.Common.Constants);
local v4 = require(l_script_FirstAncestor_0.Hooks.convertPrimaryActionToFriendStatus);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v6 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v7 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
return function() --[[ Line: 15 ]]
    -- upvalues: v6 (copy), l_useSelector_0 (copy), v7 (copy), v3 (copy), v2 (copy), v4 (copy)
    local l_profileUserId_0 = v6().profileUserId;
    local v10 = l_useSelector_0(function(v9) --[[ Line: 19 ]]
        -- upvalues: v7 (ref), v3 (ref), l_profileUserId_0 (copy), v2 (ref)
        return v7(v9, (("%*.Users.%*.components.%*.primary"):format(v3.RODUX_KEY, l_profileUserId_0, v2.Components.Actions))) or {};
    end);
    return v4(v10);
end;