local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsMenu");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Context_0 = l_script_FirstAncestor_0.Context;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UIBlox);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local _ = require(l_script_FirstAncestor_0.friendsMenuModalType);
local v7 = require(l_Context_0.SelectedUsersContext);
local l_Checkbox_0 = v4.App.InputButton.Checkbox;
local v9 = require(l_script_FirstAncestor_0.Flags.FFlagFixFriendsListFirstLoadUI);
return function(v10) --[[ Line: 24 ]]
    -- upvalues: v3 (copy), v7 (copy), l_dependencyArray_0 (copy), v9 (copy), l_Checkbox_0 (copy)
    local v11 = v3.useContext(v7);
    local v12 = v3.useCallback(function() --[[ Line: 28 ]]
        -- upvalues: v11 (copy), v10 (copy)
        if v11.isFriendSelected(v10.friend.id) then
            v11.removeFriend(v10.friend.id);
            return;
        else
            v11.addFriend(v10.friend.id, v10.friend.displayName);
            return;
        end;
    end, l_dependencyArray_0(v11.isFriendSelected(v10.friend.id), v11.removeFriend, v11.addFriend, v10.friend.id));
    return v3.createElement("Frame", {
        AutomaticSize = if v9 then Enum.AutomaticSize.XY else nil, 
        Size = if v9 then nil else v10.size, 
        AnchorPoint = v10.anchorPoint, 
        Position = v10.position, 
        BackgroundTransparency = 1
    }, {
        CheckboxAlignment = v3.createElement("UIListLayout", {
            HorizontalAlignment = if v9 then nil else Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        Button = v3.createElement(l_Checkbox_0, {
            onActivated = v12, 
            isSelected = v11.isFriendSelected(v10.friend.id), 
            text = "", 
            isDisabled = v10.isDisabled
        })
    });
end;