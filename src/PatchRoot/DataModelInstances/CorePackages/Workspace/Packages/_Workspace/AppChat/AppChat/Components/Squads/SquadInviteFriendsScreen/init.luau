local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.RoactRodux);
local l_SquadInviteFriends_0 = require(l_Parent_0.Squads).SquadInviteFriends;
local v4 = v1.PureComponent:extend("SquadInviteFriendsScreen");
v4.navigationOptions = function(_) --[[ Line: 13 ]]
    return {
        headerText = {
            raw = "Feature.Squads.Label.InviteToSquad", 
            shouldLocalize = true
        }
    };
end;
v4.render = function(v6) --[[ Line: 22 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_SquadInviteFriends_0 (copy)
    return v1.createElement(l_SquadInviteFriends_0, {
        participants = v6.props.participants
    });
end;
return (v2.connect(function(v7, v8) --[[ Line: 28 ]]
    local v9 = v8.navigation.getParam("conversationId");
    local v10 = v7.ChatAppReducer.Conversations[v9];
    return {
        participants = v10 and v10.participants or nil
    };
end)(v4));