local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.RoactNavigation);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_script_FirstAncestor_0.EnumScreens);
local v5 = require(l_script_FirstAncestor_0.Components.ChatConversation.ChatConversationScreen);
local v6 = require(l_script_FirstAncestor_0.Components.ChatDetails.ChatDetailsScreen);
local v7 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatReplaceWithCloseButton);
local v8 = require(l_script_FirstAncestor_0.Components.Squads.SquadInviteFriendsScreen);
local v9 = require(l_script_FirstAncestor_0.Components.Squads.SquadLobbyScreen);
local l_GetFFlagLuaAppEnableSquadPage_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableSquadPage;
local l_default_0 = require(l_Parent_0.SocialCommon).Experiments.NewChatTabExperimentation.default;
local v12 = game:DefineFastFlag("AppChatTabDeepLinkNavbarVisibilityFix", false);
return function(v13) --[[ Line: 18 ]]
    -- upvalues: v4 (copy), v5 (copy), v3 (copy), v6 (copy), v7 (copy), l_GetFFlagLuaAppEnableSquadPage_0 (copy), v9 (copy), v8 (copy), v12 (copy), l_default_0 (copy), v2 (copy)
    local v14 = {
        {
            [v4.ChatConversation] = {
                screen = v5, 
                navigationOptions = v3.Dictionary.join({
                    backButtonEnabled = false, 
                    isRoot = true, 
                    lockIconEnabled = true
                }, v13 or {})
            }
        }, 
        {
            [v4.ChatDetails] = {
                screen = v6, 
                navigationOptions = v3.Dictionary.join({
                    backButtonEnabled = not v7() or false, 
                    closeButtonEnabled = v7() and true or nil
                }, v13 or {})
            }
        }
    };
    if l_GetFFlagLuaAppEnableSquadPage_0() then
        table.insert(v14, {
            [v4.SquadLobby] = {
                screen = v9.WideSquadLobbyScreen, 
                navigationOptions = v3.Dictionary.join({
                    backButtonEnabled = true
                }, v13 or {})
            }
        });
        table.insert(v14, {
            [v4.SquadInviteFriends] = {
                screen = v8, 
                navigationOptions = v3.Dictionary.join({
                    backButtonEnabled = true
                }, v13 or {})
            }
        });
    end;
    if v12 and l_default_0.isEnabled() then
        return v2.createRobloxStackNavigator(v14, {
            defaultNavigationOptions = {
                tabBarVisible = l_default_0:getConnectTabLeadsToChatTab() and true or nil
            }
        });
    else
        return v2.createRobloxStackNavigator(v14);
    end;
end;