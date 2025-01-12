local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.RoactNavigation);
local v3 = require(l_script_FirstAncestor_0.EnumScreens);
local v4 = require(l_script_FirstAncestor_0.Components.ChatLanding.ChatLandingScreen);
local v5 = require(l_script_FirstAncestor_0.Components.ChatConversation.ChatConversationScreen);
local v6 = require(l_script_FirstAncestor_0.Components.ChatDetails.ChatDetailsScreen);
local v7 = require(l_script_FirstAncestor_0.Components.CreateNewChat.CreateNewChatScreen);
local v8 = require(l_script_FirstAncestor_0.Components.EditChatMembers.EditChatMembersScreen);
local v9 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatReplaceWithCloseButton);
local v10 = require(l_script_FirstAncestor_0.Components.Squads.SquadInviteFriendsScreen);
local v11 = require(l_script_FirstAncestor_0.Components.Squads.SquadLobbyScreen);
local l_default_0 = require(l_Parent_0.SocialCommon).Experiments.NewChatTabExperimentation.default;
local v13 = require(l_script_FirstAncestor_0.Flags.getFFlagDisableAppChatConversationAbsorbInputLayerAndroid);
local l_GetFFlagLuaAppEnableSquadPage_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableSquadPage;
local v15 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatRemoveDynamicRequires);
local v16 = {
    {
        [v3.ChatLanding] = {
            screen = v4, 
            navigationOptions = v15() and function() --[[ Line: 27 ]]
                -- upvalues: l_default_0 (copy)
                if l_default_0.isEnabled() and l_default_0:getConnectTabLeadsToChatTab() then
                    return {
                        isRoot = true, 
                        backButtonEnabled = false, 
                        tabBarVisible = true
                    };
                else
                    return {
                        isRoot = true
                    };
                end;
            end or if l_default_0.isEnabled() and l_default_0:getConnectTabLeadsToChatTab() then {
                isRoot = true, 
                backButtonEnabled = false, 
                tabBarVisible = true
            } else {
                isRoot = true
            }
        }
    }, 
    {
        [v3.ChatConversation] = {
            screen = v5, 
            navigationOptions = if v13() then {
                backButtonEnabled = true, 
                tabBarVisible = false, 
                lockIconEnabled = true, 
                absorbInput = false
            } else {
                backButtonEnabled = true, 
                tabBarVisible = false, 
                lockIconEnabled = true
            }
        }
    }, 
    {
        [v3.ChatDetails] = {
            screen = v6, 
            navigationOptions = {
                backButtonEnabled = not v9() or false, 
                closeButtonEnabled = v9() and true or nil, 
                tabBarVisible = false
            }
        }
    }, 
    {
        [v3.CreateNewChat] = {
            screen = v7, 
            navigationOptions = {
                backButtonEnabled = true, 
                tabBarVisible = false
            }
        }
    }, 
    {
        [v3.EditChatMembers] = {
            screen = v8, 
            navigationOptions = {
                backButtonEnabled = true, 
                tabBarVisible = false
            }
        }
    }
};
if l_GetFFlagLuaAppEnableSquadPage_0() then
    table.insert(v16, {
        [v3.SquadLobby] = {
            screen = v11.CompactSquadLobbyScreen, 
            navigationOptions = {
                backButtonEnabled = true, 
                tabBarVisible = false
            }
        }
    });
    table.insert(v16, {
        [v3.SquadInviteFriends] = {
            screen = v10, 
            navigationOptions = {
                backButtonEnabled = true, 
                tabBarVisible = false
            }
        }
    });
end;
return (v2.createRobloxStackNavigator(v16));