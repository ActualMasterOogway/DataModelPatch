local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useEffectOnce_0 = require(l_Parent_0.RoactUtils).Hooks.useEffectOnce;
local v6 = require(l_Parent_0.Cryo);
local v7 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v8 = require(l_script_FirstAncestor_0.Components.UserProfileHeader.SocialIdentity);
return function(v9) --[[ Line: 34 ]] --[[ Name: SocialIdentityContainer ]]
    -- upvalues: v7 (copy), l_useLocalUserId_0 (copy), l_AppStorageService_0 (copy), v3 (copy), l_useEffectOnce_0 (copy), v8 (copy), v6 (copy)
    local v10 = v7().profileUserId == l_useLocalUserId_0();
    local v11 = v10 and "NamesDisplayNameTooltipImpressionCount" or "NamesProfileTooltip";
    local v12 = tonumber(l_AppStorageService_0:GetItem(v11)) or 0;
    local v13 = v3.useRef(v12);
    local v15 = v3.useCallback(function(v14) --[[ Line: 47 ]]
        -- upvalues: l_AppStorageService_0 (ref), v11 (copy)
        l_AppStorageService_0:SetItem(v11, (tostring(v14 or 0)));
        l_AppStorageService_0:Flush();
    end);
    local v16 = v3.useCallback(function() --[[ Line: 52 ]]
        -- upvalues: v13 (copy), v15 (copy)
        v13.current = 3;
        v15(3);
    end);
    l_useEffectOnce_0(function() --[[ Line: 57 ]]
        -- upvalues: v13 (copy), v15 (copy)
        if v13.current then
            v15(v13.current + 1);
        end;
    end, false);
    return v3.createElement(v8, (v6.Dictionary.union(v9, {
        isLocalUser = v10, 
        isTooltipActive = false, 
        dismissTooltip = v16
    })));
end;