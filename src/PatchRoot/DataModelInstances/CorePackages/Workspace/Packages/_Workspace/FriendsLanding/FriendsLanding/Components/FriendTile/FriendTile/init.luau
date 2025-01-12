local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v2.Roact;
local l_UIBlox_0 = v2.UIBlox;
local l_t_0 = v2.t;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_OpenTypeSupport_0 = l_UIBlox_0.Utility.OpenTypeSupport;
local l_PlayerTile_0 = l_UIBlox_0.App.Tile.PlayerTile;
local l_withLocalization_0 = v2.withLocalization;
local v10 = require(l_Parent_0.UserProfiles);
local v11 = require(l_script_FirstAncestor_0.Friends.userPresenceText);
local v12 = require(l_script_FirstAncestor_0.Friends.userPresenceIcon);
local v13 = require(l_script_FirstAncestor_0.Friends.getCorrectUserPresence);
local l_memoize_0 = v2.memoize;
local v15 = require(script.Parent.createRelevancyInfo);
local v16 = l_Roact_0.PureComponent:extend("FriendTile");
local v17 = require(l_script_FirstAncestor_0.Flags.FFlagFriendsLandingPaginatedFriends);
local v18 = require(l_script_FirstAncestor_0.Flags.FFlagFriendsLandingIsVerifiedFromUserProfile);
local l_GetFFlagLuaAppEnableOpenTypeSupport_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport;
local function v20() --[[ Line: 27 ]]
    return function() --[[ Line: 28 ]]

    end;
end;
v16.validateProps = l_t_0.strictInterface({
    user = l_t_0.table, 
    index = l_t_0.number, 
    openPlayerProfile = l_t_0.optional(l_t_0.callback), 
    isLuobu = l_t_0.optional(l_t_0.boolean), 
    pageLoadingTimeReport = l_t_0.optional(l_t_0.callback), 
    buttons = l_t_0.optional(l_t_0.array(l_t_0.strictInterface({
        icon = l_t_0.optional(l_t_0.string), 
        onActivated = l_t_0.optional(l_t_0.callback), 
        isSecondary = l_t_0.optional(l_t_0.boolean), 
        isDisabled = l_t_0.optional(l_t_0.boolean)
    }))), 
    userProfile = l_t_0.optional(l_t_0.table), 
    isPlayerContextualMenuEnabled = l_t_0.optional(l_t_0.boolean), 
    selected = l_t_0.optional(l_t_0.boolean), 
    focusGuiObject = l_t_0.optional(l_t_0.callback)
});
v16.defaultProps = {
    user = {
        username = ""
    }, 
    openPlayerProfile = v20, 
    isLuobu = false, 
    index = 1, 
    buttons = nil, 
    isPlayerContextualMenuEnabled = false
};
v16.init = function(v21) --[[ Line: 60 ]] --[[ Name: init ]]
    -- upvalues: l_memoize_0 (copy), v15 (copy), l_Roact_0 (copy)
    v21.state = {
        isFirstRender = true
    };
    v21.makeRelevancyInfo = l_memoize_0(v15);
    v21.playerTileRef = l_Roact_0.createRef();
    v21.openPlayerProfile = v21.props.isPlayerContextualMenuEnabled and function(_, _) --[[ Line: 65 ]]
        -- upvalues: v21 (copy)
        local l_user_0 = v21.props.user;
        return v21.props.openPlayerProfile(l_user_0);
    end or function(v25, v26) --[[ Line: 69 ]]
        -- upvalues: v21 (copy)
        local l_user_1 = v21.props.user;
        if v25 and v26 then
            return v21.props.openPlayerProfile(l_user_1.id, v21.props.index, l_user_1, v25, v26);
        else
            return v21.props.openPlayerProfile(l_user_1.id, v21.props.index, l_user_1);
        end;
    end;
    v21.openPlayerProfileForRelevancyInfo = function(v28, v29) --[[ Line: 78 ]]
        -- upvalues: v21 (copy)
        return function() --[[ Line: 79 ]]
            -- upvalues: v21 (ref), v28 (copy), v29 (copy)
            return v21.openPlayerProfile(v28, v29);
        end;
    end;
    v21.checkAndSetSelected = function() --[[ Line: 84 ]]
        -- upvalues: v21 (copy)
        if v21.props.selected and v21.props.focusGuiObject then
            local v30 = v21.playerTileRef:getValue();
            if v30 then
                v21.props.focusGuiObject(v30);
            end;
        end;
    end;
end;
v16.didMount = function(v31) --[[ Line: 94 ]] --[[ Name: didMount ]]
    if v31.props.pageLoadingTimeReport then
        v31.props.pageLoadingTimeReport();
    end;
    v31.checkAndSetSelected();
end;
v16.render = function(v32) --[[ Line: 102 ]] --[[ Name: render ]]
    -- upvalues: v13 (copy), v11 (copy), v12 (copy), l_withStyle_0 (copy), l_withLocalization_0 (copy), v10 (copy), v18 (copy), l_Roact_0 (copy), l_PlayerTile_0 (copy), v17 (copy), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (copy), l_OpenTypeSupport_0 (copy)
    local l_user_2 = v32.props.user;
    local v34 = v13(l_user_2);
    local v35 = v11[v34];
    local v36 = v12[v34];
    local v37 = nil;
    local v38 = nil;
    local v39 = v32.playerTileRef:getValue();
    if v39 then
        v37 = v39.AbsoluteSize;
        v38 = v39.AbsolutePosition;
    else
        v32:setState({
            isFirstRender = false
        });
    end;
    return l_withStyle_0(function(v40) --[[ Line: 120 ]]
        -- upvalues: l_withLocalization_0 (ref), v35 (copy), v32 (copy), v10 (ref), v18 (ref), l_user_2 (copy), v36 (copy), v37 (ref), v38 (ref), l_Roact_0 (ref), l_PlayerTile_0 (ref), v17 (ref), v39 (copy), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (ref), l_OpenTypeSupport_0 (ref)
        return l_withLocalization_0({
            presenceText = v35, 
            accountDeletedText = "Feature.Friends.Action.AccountDeleted"
        })(function(v41) --[[ Line: 124 ]]
            -- upvalues: v32 (ref), v10 (ref), v18 (ref), l_user_2 (ref), v36 (ref), v37 (ref), v38 (ref), v40 (copy), l_Roact_0 (ref), l_PlayerTile_0 (ref), v17 (ref), v39 (ref), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (ref), l_OpenTypeSupport_0 (ref)
            local v42 = v41.presenceText or nil;
            local l_accountDeletedText_0 = v41.accountDeletedText;
            local v44 = nil;
            local v45 = nil;
            if v32.props.userProfile then
                v44 = v32.props.userProfile.names.combinedName;
                v45 = v10.Formatters.formatUsername(v32.props.userProfile.names.username);
                if v18 then
                    l_user_2.isDeleted = v32.props.userProfile.isDeleted;
                end;
            end;
            local v46 = if v44 then v44 else l_user_2.displayName;
            local v47 = if v45 then v45 else "@" .. l_user_2.username;
            local v48 = if not v44 then nil else v32.makeRelevancyInfo(l_user_2, v42, v36, v32.openPlayerProfileForRelevancyInfo(v37, v38), v40.Theme, v32.props.index, v32.props.isLuobu, v40.Font, l_accountDeletedText_0, true);
            local v49 = false;
            v49 = if v18 then v32.props.userProfile and v32.props.userProfile.isVerified else l_user_2.hasVerifiedBadge;
            return l_Roact_0.createElement(l_PlayerTile_0, {
                tileSize = if v17 then UDim2.fromScale(1, 1) else if v39 then UDim2.new(0, v37.X, 0, v37.Y) else UDim2.fromScale(1, 1), 
                thumbnail = l_user_2.thumbnail, 
                title = v46, 
                subtitle = v47, 
                hasVerifiedBadge = v49, 
                onActivated = v32.openPlayerProfile(v37, v38, v46, v47, v48), 
                forwardedRef = v32.playerTileRef, 
                buttons = v32.props.buttons, 
                Selectable = true, 
                openTypeFeatures = if l_GetFFlagLuaAppEnableOpenTypeSupport_0() then l_OpenTypeSupport_0:getUserNameStylisticAlternative() else nil, 
                relevancyInfo = v48
            });
        end);
    end);
end;
return v16;