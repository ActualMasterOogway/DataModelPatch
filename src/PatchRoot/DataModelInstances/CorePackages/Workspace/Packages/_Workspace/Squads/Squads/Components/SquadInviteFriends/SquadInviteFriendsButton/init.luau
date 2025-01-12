local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_dependencyArray_0 = v1.Hooks.dependencyArray;
local l_FriendsMenu_0 = v1.FriendsMenu;
local l_React_0 = v1.React;
local l_UIBlox_0 = v1.UIBlox;
local l_useLocalization_0 = v1.Hooks.useLocalization;
local l_Button_0 = l_UIBlox_0.App.Button.Button;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_InviteCallbackContext_0 = l_FriendsMenu_0.InviteCallbackContext;
local l_SelectedUsersContext_0 = l_FriendsMenu_0.SelectedUsersContext;
return function() --[[ Line: 18 ]] --[[ Name: SquadInviteFriendsButton ]]
    -- upvalues: l_React_0 (copy), l_SelectedUsersContext_0 (copy), l_InviteCallbackContext_0 (copy), l_useLocalization_0 (copy), l_dependencyArray_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy)
    local v11 = l_React_0.useContext(l_SelectedUsersContext_0);
    local v12 = l_React_0.useContext(l_InviteCallbackContext_0);
    local l_selectedFriendsSize_0 = v11.selectedFriendsSize;
    local v14 = l_useLocalization_0({
        addFriendsText = "Feature.Chat.Label.AddFriends"
    });
    local v15 = l_React_0.useCallback(function() --[[ Line: 28 ]]
        -- upvalues: v12 (copy), v11 (copy)
        v12.inviteMultiFriends(v11.selectedFriends);
    end, l_dependencyArray_0(v12.inviteMultiFriends, v11.selectedFriends));
    return l_React_0.createElement(l_Button_0, {
        onActivated = v15, 
        buttonTextOverride = {
            TextWrapped = false
        }, 
        buttonType = l_ButtonType_0.PrimarySystem, 
        size = UDim2.new(1, 0, 0, 36), 
        text = v14.addFriendsText, 
        isDisabled = l_selectedFriendsSize_0 == 0
    });
end;