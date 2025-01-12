local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.RoactServiceTags);
local v3 = require(l_Parent_0.Cryo);
local l_AppNotificationService_0 = v2.AppNotificationService;
local v5 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v6 = require(l_script_FirstAncestor_0.Networking.refreshProfilePlatformUserInfo);
local v7 = require(l_script_FirstAncestor_0.Networking.refreshProfilePlatformActionInfo);
local l_RobloxEventReceiver_0 = require(l_Parent_0.RealtimeDelivery).RobloxEventReceiver;
local v9 = require(l_Parent_0.React);
local v10 = require(l_Parent_0.RobloxAppHooks);
local v11 = require(l_Parent_0.RoactUtils);
local l_dependencyArray_0 = v11.Hooks.dependencyArray;
local l_useLocalUserId_0 = v10.useLocalUserId;
local l_useDispatch_0 = v11.Hooks.RoactRodux.useDispatch;
local l_useRoactService_0 = v10.useRoactService;
local v16 = require(l_script_FirstAncestor_0.Common.Enums);
return function() --[[ Line: 26 ]]
    -- upvalues: v5 (copy), l_useRoactService_0 (copy), l_AppNotificationService_0 (copy), v9 (copy), l_RobloxEventReceiver_0 (copy), l_useDispatch_0 (copy), l_useLocalUserId_0 (copy), v16 (copy), v6 (copy), l_dependencyArray_0 (copy), v3 (copy), v7 (copy)
    local v17 = v5();
    local v18 = l_useRoactService_0(l_AppNotificationService_0);
    local v19 = v9.useMemo(function() --[[ Line: 29 ]]
        -- upvalues: l_RobloxEventReceiver_0 (ref), v18 (copy)
        return l_RobloxEventReceiver_0.new(v18);
    end, {
        v18
    });
    local v20 = l_useDispatch_0();
    local v21 = l_useLocalUserId_0();
    v9.useEffect(function() --[[ Line: 35 ]]
        -- upvalues: v19 (copy), v17 (copy), v16 (ref), v20 (copy), v6 (ref)
        local v25 = v19:observeEvent("UserProfileNotifications", function(v22) --[[ Line: 36 ]]
            -- upvalues: v17 (ref), v16 (ref), v20 (ref), v6 (ref)
            local v23 = tostring(v22.VieweeUserId);
            local l_Type_0 = v22.Type;
            if v17.profileUserId == v23 and (l_Type_0 == v16.NameTypes.DisplayName or l_Type_0 == v16.NameTypes.Alias or l_Type_0 == v16.NameTypes.Username) then
                v20(v6(v23));
            end;
        end);
        return function() --[[ Line: 51 ]]
            -- upvalues: v25 (copy)
            v25:disconnect();
        end;
    end, l_dependencyArray_0(v19, v20, v17.profileUserId));
    v9.useEffect(function() --[[ Line: 56 ]]
        -- upvalues: v19 (copy), v3 (ref), v17 (copy), v20 (copy), v7 (ref)
        local v28 = v19:observeEvent("PresenceBulkNotifications", function(v26) --[[ Line: 57 ]]
            -- upvalues: v3 (ref), v17 (ref), v20 (ref), v7 (ref)
            if v3.List.filter(v26, function(v27) --[[ Line: 58 ]]
                -- upvalues: v17 (ref)
                return tostring(v27.UserId) == v17.profileUserId;
            end) then
                v20(v7(v17.profileUserId));
            end;
        end);
        return function() --[[ Line: 67 ]]
            -- upvalues: v28 (copy)
            v28:disconnect();
        end;
    end, l_dependencyArray_0(v19, v20, v17.profileUserId));
    v9.useEffect(function() --[[ Line: 72 ]]
        -- upvalues: v19 (copy), v21 (copy), v17 (copy), v20 (copy), v7 (ref)
        local v30 = v19:observeEvent("FriendshipNotifications", function(v29) --[[ Line: 73 ]]
            -- upvalues: v21 (ref), v17 (ref), v20 (ref), v7 (ref)
            if (if tostring(v21) == tostring(v29.EventArgs.UserId1) then tostring(v29.EventArgs.UserId2) else tostring(v29.EventArgs.UserId1)) == v17.profileUserId then
                v20(v7(v17.profileUserId));
            end;
        end);
        return function() --[[ Line: 83 ]]
            -- upvalues: v30 (copy)
            v30:disconnect();
        end;
    end, l_dependencyArray_0(v19, v20, v17.profileUserId, v21));
end;