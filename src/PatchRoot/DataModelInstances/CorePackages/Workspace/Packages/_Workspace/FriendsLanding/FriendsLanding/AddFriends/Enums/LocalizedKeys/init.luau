local l_script_FirstAncestor_0 = script:FindFirstAncestor("AddFriends");
return require(l_script_FirstAncestor_0.dependencies).enumerate(script.Name, {
    AddFriend = "Feature.Friends.Action.Add", 
    RequestPending = "Feature.Friends.Label.Pending"
});