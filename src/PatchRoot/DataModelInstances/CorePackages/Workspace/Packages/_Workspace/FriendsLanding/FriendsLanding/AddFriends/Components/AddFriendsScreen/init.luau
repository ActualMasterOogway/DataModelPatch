local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_Dash_0 = v1.Dash;
local l_withLocalization_0 = v1.withLocalization;
local v5 = require(l_script_FirstAncestor_0.FriendsLandingContext);
local v6 = require(script.Parent.AddFriendsContainer);
local v7 = require(script.Parent.AddFriendsLayerExposure);
local v8 = l_Roact_0.PureComponent:extend("AddFriendsScreen");
v8.render = function(v9) --[[ Line: 11 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), v5 (copy), l_Roact_0 (copy), v7 (copy), v6 (copy), l_Dash_0 (copy)
    return l_withLocalization_0({
        networkErrorText = "Feature.Toast.NetworkingError.SomethingIsWrong", 
        friendAddedText = "Feature.AddFriends.Action.FriendAdded", 
        requestIgnoredText = "Feature.AddFriends.Action.RequestIgnored", 
        allRequestsIgnoredText = "Feature.Profile.Action.AllRequestsIgnored", 
        allRequestsIgnoredBackgroundedText = "Feature.AddFriends.Label.DeclineAllBackgrounded", 
        requestSentText = "Feature.Friends.Action.FriendRequestSent"
    })(function(v10) --[[ Line: 19 ]]
        -- upvalues: v5 (ref), l_Roact_0 (ref), v7 (ref), v6 (ref), l_Dash_0 (ref), v9 (copy)
        return v5.with(function(v11) --[[ Line: 20 ]]
            -- upvalues: l_Roact_0 (ref), v7 (ref), v6 (ref), l_Dash_0 (ref), v9 (ref), v10 (copy)
            return l_Roact_0.createElement(v7, {
                renderChild = function(v12) --[[ Line: 22 ]] --[[ Name: renderChild ]]
                    -- upvalues: l_Roact_0 (ref), v6 (ref), l_Dash_0 (ref), v9 (ref), v11 (copy), v10 (ref)
                    return l_Roact_0.createElement(v6, l_Dash_0.join(v12 or {}, {
                        navigation = v9.props.navigation, 
                        navigateToLuaAppPages = v11.navigateToLuaAppPages, 
                        localized = v10, 
                        wideMode = v11.wideMode, 
                        contactImporterAndPYMKEnabled = v11.contactImporterAndPYMKEnabled, 
                        contactImporterExperimentVariant = v11.contactImporterExperimentVariant, 
                        diagService = v11.diagService, 
                        eventIngestService = v11.eventIngestService, 
                        openProfilePeekView = v11.openProfilePeekView
                    }));
                end
            });
        end);
    end);
end;
return v8;