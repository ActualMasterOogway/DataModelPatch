local v0 = require(script.Parent.GetFFlagEnableCommonFriendsMenu);
game:DefineFastFlag("EnableFriendMenuMultiSelectDev", false);
return function() --[[ Line: 5 ]]
    -- upvalues: v0 (copy)
    return game:GetFastFlag("EnableFriendMenuMultiSelectDev") and v0();
end;