local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(script.Parent.ButtonClickEvents);
local v3 = require(l_script_FirstAncestor_0.EnumScreens);
local v4 = require(l_script_FirstAncestor_0.dependencies);
local l_Contexts_0 = v4.SocialLuaAnalytics.Analytics.Enums.Contexts;
local l_FormFactor_0 = v4.FormFactor;
if require(l_Parent_0.SharedFlags).FFlagAddFriendsMigrateAnalytics then
    return nil;
else
    return function(v7, v8) --[[ Line: 17 ]]
        -- upvalues: v3 (copy), v2 (copy), l_Contexts_0 (copy), l_FormFactor_0 (copy)
        local v9 = v8 and v8.formFactor;
        v7:navigate(v3.SearchFriends);
        v7:buttonClick(v2.PeopleSearchBar, {
            contextOverride = l_Contexts_0.PeopleSearchFromAddFriends, 
            formFactor = v9 or l_FormFactor_0.UNKNOWN
        });
    end;
end;