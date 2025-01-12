local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.Friends.filterStates);
local v2 = require(l_script_FirstAncestor_0.Flags.FFlagFriendsLandingPaginatedFriends);
return function(v3, v4) --[[ Line: 5 ]]
    -- upvalues: v2 (copy), v1 (copy)
    if v2 then
        return {
            {
                text = v3.all, 
                id = v1.All
            }, 
            {
                text = v3.online, 
                id = v1.Online
            }, 
            {
                text = v3.inExperience, 
                id = v1.InExperience
            }
        };
    elseif v4 then
        return {
            {
                text = v3.all, 
                id = v1.All
            }, 
            {
                text = v3.online, 
                id = v1.Online
            }, 
            {
                text = v3.inExperience, 
                id = v1.InExperience
            }, 
            {
                text = v3.offline, 
                id = v1.Offline
            }, 
            {
                text = v3.inactive, 
                id = v1.Inactive
            }
        };
    else
        return {
            {
                text = v3.all, 
                id = v1.All
            }, 
            {
                text = v3.online, 
                id = v1.Online
            }, 
            {
                text = v3.inExperience, 
                id = v1.InExperience
            }, 
            {
                text = v3.offline, 
                id = v1.Offline
            }
        };
    end;
end;