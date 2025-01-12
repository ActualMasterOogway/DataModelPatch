local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local v7 = require(script.Parent.DropDownButtonAnimator);
local l_Images_0 = v6.App.ImageSet.Images;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v10 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v12 = v4.PureComponent:extend("FriendDropDownButton");
v12.validateProps = v5.strictInterface({
    layoutOrder = v5.integer, 
    playerRelationship = v5.strictInterface({
        isBlocked = v5.boolean, 
        friendStatus = v5.enum(Enum.FriendStatus), 
        isFollowing = v5.boolean, 
        isFollower = v5.boolean
    }), 
    selectedPlayer = v5.optional(v5.instanceIsA("Player")), 
    dropDownOpen = v5.boolean, 
    requestFriendship = v5.callback, 
    contentVisible = v5.boolean
});
local function v16(v13) --[[ Line: 36 ]] --[[ Name: getFriendTextAndIcon ]]
    -- upvalues: l_Images_0 (copy), v10 (copy)
    local v14 = l_Images_0["icons/actions/friends/friendAdd"];
    local v15 = l_Images_0["icons/actions/friends/friendRemove"];
    if v13 == Enum.FriendStatus.Friend then
        return v10:FormatByKey("PlayerDropDown.Unfriend"), v15;
    elseif v13 == Enum.FriendStatus.Unknown or v13 == Enum.FriendStatus.NotFriend then
        return v10:FormatByKey("PlayerDropDown.FriendRequest"), v14;
    elseif v13 == Enum.FriendStatus.FriendRequestSent then
        return v10:FormatByKey("PlayerDropDown.CancelRequest"), v14;
    elseif v13 == Enum.FriendStatus.FriendRequestReceived then
        return v10:FormatByKey("PlayerDropDown.Accept"), v14;
    else
        return v10:FormatByKey("PlayerDropDown.Friend Request"), v14;
    end;
end;
v12.init = function(v17) --[[ Line: 52 ]] --[[ Name: init ]]
    v17.state = {
        unfriendConfirm = false
    };
end;
v12.render = function(v18) --[[ Line: 58 ]] --[[ Name: render ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_RbxAnalyticsService_0 (copy), v16 (copy), v4 (copy), v7 (copy)
    local l_playerRelationship_0 = v18.props.playerRelationship;
    local l_selectedPlayer_0 = v18.props.selectedPlayer;
    local v21 = nil;
    v21 = (not (l_playerRelationship_0.friendStatus == Enum.FriendStatus.Friend) or v18.state.unfriendConfirm) and function() --[[ Line: 70 ]]
        -- upvalues: l_playerRelationship_0 (copy), l_LocalPlayer_0 (ref), l_selectedPlayer_0 (copy), v18 (copy), l_RbxAnalyticsService_0 (ref)
        if l_playerRelationship_0.friendStatus == Enum.FriendStatus.Friend then
            l_LocalPlayer_0:RevokeFriendship(l_selectedPlayer_0);
            return;
        elseif l_playerRelationship_0.friendStatus == Enum.FriendStatus.Unknown or l_playerRelationship_0.friendStatus == Enum.FriendStatus.NotFriend then
            v18.props.requestFriendship(l_selectedPlayer_0, false);
            return;
        elseif l_playerRelationship_0.friendStatus == Enum.FriendStatus.FriendRequestSent then
            l_RbxAnalyticsService_0:ReportCounter("PlayerDropDown-RevokeFriendship");
            l_RbxAnalyticsService_0:TrackEvent("Game", "RevokeFriendship", "PlayerDropDown");
            l_LocalPlayer_0:RevokeFriendship(l_selectedPlayer_0);
            return;
        else
            if l_playerRelationship_0.friendStatus == Enum.FriendStatus.FriendRequestReceived then
                l_RbxAnalyticsService_0:ReportCounter("PlayerDropDown-RequestFriendship");
                l_RbxAnalyticsService_0:TrackEvent("Game", "RequestFriendship", "PlayerDropDown");
                v18.props.requestFriendship(l_selectedPlayer_0, true);
            end;
            return;
        end;
    end or function() --[[ Line: 64 ]]
        -- upvalues: v18 (copy)
        v18:setState({
            unfriendConfirm = true
        });
    end;
    local v22 = nil;
    if l_playerRelationship_0.friendStatus == Enum.FriendStatus.FriendRequestReceived then
        v22 = function() --[[ Line: 92 ]]
            -- upvalues: l_LocalPlayer_0 (ref), l_selectedPlayer_0 (copy)
            l_LocalPlayer_0:RevokeFriendship(l_selectedPlayer_0);
        end;
    end;
    local v23 = nil;
    if v18.state.unfriendConfirm then
        v23 = function() --[[ Line: 98 ]]
            -- upvalues: v18 (copy)
            v18:setState({
                unfriendConfirm = false
            });
        end;
    end;
    local v24, v25 = v16(l_playerRelationship_0.friendStatus);
    return v4.createElement(v7, {
        layoutOrder = v18.props.layoutOrder, 
        text = v24, 
        icon = v25, 
        lastButton = false, 
        onActivated = v21, 
        forceShowOptions = v18.state.unfriendConfirm, 
        selectedPlayer = l_selectedPlayer_0, 
        onDecline = v22, 
        onDismiss = v23, 
        contentVisible = v18.props.contentVisible
    });
end;
v12.didUpdate = function(v26, v27, _) --[[ Line: 120 ]] --[[ Name: didUpdate ]]
    if v27.playerRelationship.friendStatus ~= v26.props.playerRelationship.friendStatus then
        v26:setState({
            unfriendConfirm = false
        });
    end;
    if v27.selectedPlayer ~= v26.props.selectedPlayer or v27.dropDownOpen ~= v26.props.dropDownOpen then
        v26:setState({
            unfriendConfirm = false
        });
    end;
end;
return v12;