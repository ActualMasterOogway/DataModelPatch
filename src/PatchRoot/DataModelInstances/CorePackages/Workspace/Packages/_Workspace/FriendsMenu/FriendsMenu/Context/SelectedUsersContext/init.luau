local l_Parent_0 = script.Parent.Parent.Parent;
return (require(l_Parent_0.React).createContext({
    selectedFriendsSize = 0, 
    selectedFriends = {}, 
    addFriend = function() --[[ Line: 19 ]] --[[ Name: addFriend ]]

    end, 
    removeFriend = function() --[[ Line: 20 ]] --[[ Name: removeFriend ]]

    end, 
    isFriendSelected = function() --[[ Line: 21 ]] --[[ Name: isFriendSelected ]]
        return false;
    end
}));