local l_Parent_0 = script:FindFirstAncestor("QueryRefetch").Parent;
local v1 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_LoginStatus_0 = require(l_Parent_0.RobloxAppEnums).LoginStatus;
local v4 = require(l_Parent_0.UserProfiles);
local function v6(v5) --[[ Line: 8 ]] --[[ Name: selectAuthenticationStatus ]]
    return {
        authenticationStatus = v5.AuthenticationStatus.status
    };
end;
return function(v7) --[[ Line: 16 ]] --[[ Name: usePlatformNameQueryRefetch ]]
    -- upvalues: l_useSelector_0 (copy), v6 (copy), l_LoginStatus_0 (copy), v1 (copy), v4 (copy)
    local v8 = l_useSelector_0(v6).authenticationStatus == l_LoginStatus_0.LOGGED_IN;
    local v9, v10 = v1.useState({});
    local v11 = v4.Hooks.useUserProfilesFetch({
        userIds = v9, 
        query = v4.Queries.userProfilesDisplayUserPlatformNamesByUserIds
    });
    local v12 = v4.Hooks.useUserProfilesFetch({
        userIds = v9, 
        query = v4.Queries.userProfilesCombinedAndPlatformByUserIds
    });
    v1.useEffect(function() --[[ Line: 33 ]]
        -- upvalues: v8 (copy), v7 (copy), v10 (copy)
        local v13 = nil;
        if v8 and v7 then
            v13 = v7:observeEvent("UserProfileNotifications", function(v14) --[[ Line: 36 ]]
                -- upvalues: v10 (ref)
                if v14.Type == "PlatformName" then
                    v10({
                        (tostring(v14.VieweeUserId))
                    });
                end;
            end);
        end;
        return function() --[[ Line: 43 ]]
            -- upvalues: v13 (ref)
            if v13 and v13.disconnect then
                v13:disconnect();
            end;
        end;
    end, {
        v8, 
        v7
    });
    v1.useEffect(function() --[[ Line: 51 ]]
        -- upvalues: v11 (copy), v9 (copy), v12 (copy)
        v11.refetch({
            userIds = v9
        });
        if v12 then
            v12.refetch({
                userIds = v9
            });
        end;
    end, {
        v9, 
        v11.refetch, 
        if v12 then v12.refetch else nil
    });
end;