local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
if require(l_script_FirstAncestor_0.Flags.FFlagFriendsLandingPaginatedFriends) then
    return (require(script.FriendsLandingContainer2));
else
    return (require(script.FriendsLandingContainer));
end;