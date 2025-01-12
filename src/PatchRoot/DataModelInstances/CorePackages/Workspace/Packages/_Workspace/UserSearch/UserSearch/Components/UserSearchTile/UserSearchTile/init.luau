local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.UIBlox);
local l_OpenTypeSupport_0 = v4.Utility.OpenTypeSupport;
local l_PlayerTile_0 = v4.App.Tile.PlayerTile;
local l_useStyle_0 = v4.Core.Style.useStyle;
local v8 = require(l_Parent_0.LuaSocialLibrariesDeps);
local l_Enums_0 = require(l_Parent_0.FriendsNetworking).Enums;
local l_getDeepValue_0 = v8.SocialLibraries.config({}).Dictionary.getDeepValue;
local l_AppUserLayers_0 = require(l_Parent_0.ExperimentLayers).AppUserLayers;
local l_useUserExperiment_0 = require(l_Parent_0.RoactAppExperiment).useUserExperiment;
local v13 = nil;
local l_GetFFlagEnableAppCommonInputHooks_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableAppCommonInputHooks;
local l_FFlagAddPresenceIndicatorToUserSearch_0 = require(l_Parent_0.SharedFlags).FFlagAddPresenceIndicatorToUserSearch;
v13 = if l_GetFFlagEnableAppCommonInputHooks_0() then require(l_Parent_0.FocusNavigationUtils).useLastInputMode else require(l_Parent_0.ReactFocusNavigation).useLastInputMode;
local l_SetCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Actions.SetCentralOverlay;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = require(l_Parent_0.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb;
local l_getRbxthumbWithTypeSizeAndOptions_0 = require(l_Parent_0.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions;
local l_Constants_0 = require(l_Parent_0.UserLib).Utils.Constants;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v22 = require(script.Parent.useContextualInfo);
local v23 = require(script.Parent.useSearchTileButtons);
local v24 = require(script.Parent.useProfileNames);
local v25 = require(script.Parent.useRelationshipSelector);
local v26 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local _ = require(l_script_FirstAncestor_0.Common.LocalTypes);
local v28 = require(l_script_FirstAncestor_0.Components.RoundCTAButton);
local v29 = require(l_script_FirstAncestor_0.Common.Constants);
local _ = require(l_Parent_0.GraphQLServer);
local l_GetFFlagLuaAppEnableOpenTypeSupport_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport;
local l_FFlagBlendedSerpUserPresenceExperiment_0 = require(l_Parent_0.SharedFlags).FFlagBlendedSerpUserPresenceExperiment;
local l_FFlagBlendedSerpUserPresenceInLineEnabled_0 = require(l_Parent_0.SharedFlags).FFlagBlendedSerpUserPresenceInLineEnabled;
local l_FFlagBlendedSerpUserPresenceOnTileEnabled_0 = require(l_Parent_0.SharedFlags).FFlagBlendedSerpUserPresenceOnTileEnabled;
local l_RODUX_KEY_0 = v29.RODUX_KEY;
local v36 = require(l_script_FirstAncestor_0.Utils.PresenceHelpers);
local function _(v37, v38) --[[ Line: 83 ]]
    -- upvalues: l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_Constants_0 (copy)
    if v38 then
        return l_getStandardSizeAvatarHeadShotRbxthumb_0((tostring(v37)));
    else
        return l_getRbxthumbWithTypeSizeAndOptions_0(tostring(v37), l_Constants_0.RbxthumbTypes.Avatar, 720);
    end;
end;
return function(v40) --[[ Line: 91 ]]
    -- upvalues: l_useStyle_0 (copy), l_useDispatch_0 (copy), v25 (copy), l_FFlagAddPresenceIndicatorToUserSearch_0 (copy), l_FFlagBlendedSerpUserPresenceExperiment_0 (copy), l_useUserExperiment_0 (copy), l_AppUserLayers_0 (copy), l_FFlagBlendedSerpUserPresenceOnTileEnabled_0 (copy), v2 (copy), v13 (ref), l_useSelector_0 (copy), l_getDeepValue_0 (copy), l_RODUX_KEY_0 (copy), v36 (copy), v22 (copy), v3 (copy), l_SetCentralOverlay_0 (copy), l_Enums_0 (copy), v26 (copy), v23 (copy), v24 (copy), l_PlayerTile_0 (copy), l_FFlagBlendedSerpUserPresenceInLineEnabled_0 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_Constants_0 (copy), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (copy), l_OpenTypeSupport_0 (copy), v28 (copy)
    local v41 = false;
    local l_user_0 = v40.user;
    local v43 = l_useStyle_0();
    local v44 = l_useDispatch_0();
    local v45 = v25(l_user_0.id);
    local v46 = if l_FFlagAddPresenceIndicatorToUserSearch_0 then v40.enablePresenceIndicator and not v40.shouldUseCompactTiles else nil;
    local l_Size_125_0 = v43.Tokens.Global.Size_125;
    local v48 = nil;
    local v49 = nil;
    if l_FFlagBlendedSerpUserPresenceExperiment_0 then
        local v52, v53 = l_useUserExperiment_0({
            l_AppUserLayers_0.OmniSearchResultsPageUXExposureLayer
        }, function(v50) --[[ Line: 105 ]]
            -- upvalues: l_AppUserLayers_0 (ref)
            local v51 = v50[l_AppUserLayers_0.OmniSearchResultsPageUXExposureLayer] or {};
            return v51.userPresenceIndicator == "showPresenceInLine", v51.userPresenceIndicator == "showPresenceOnTile";
        end, false);
        v48 = v52;
        v49 = v53;
    end;
    local v54 = nil;
    if l_FFlagBlendedSerpUserPresenceExperiment_0 or l_FFlagBlendedSerpUserPresenceOnTileEnabled_0 then
        v54 = v2.useMemo(function() --[[ Line: 117 ]]
            -- upvalues: v40 (copy), l_Size_125_0 (copy)
            return (v40.size.X.Offset - l_Size_125_0) / 2 * 1.7071067811865475;
        end, {
            v40.size
        });
    end;
    local v55 = v13();
    local v57 = l_useSelector_0(function(v56) --[[ Line: 125 ]]
        -- upvalues: l_getDeepValue_0 (ref), l_RODUX_KEY_0 (ref), l_user_0 (copy)
        return l_getDeepValue_0(v56, string.format("%s.Presence.byUserId.%s", l_RODUX_KEY_0, l_user_0.id)) or {};
    end);
    local v58, v59;
    if not l_FFlagBlendedSerpUserPresenceExperiment_0 or not v49 then
        v59 = l_FFlagBlendedSerpUserPresenceOnTileEnabled_0;
        v41 = not v59;
    end;
    if not v41 then
        v58 = false;
        if v45.status == Enum.FriendStatus.Friend then
            v58 = v36.isUserInGame(v57);
        end;
        v59 = not v58 and v40.shouldUseCompactTiles;
    end;
    v41 = false;
    v58 = v59 and v36.isUserOnline(v57.userPresenceType);
    local v60, v61 = v22({
        userId = l_user_0.id, 
        previousUsernames = l_user_0.previousUsernames, 
        searchKeyword = v40.searchParameters.searchKeyword, 
        profileInsight = v40.profileInsight, 
        shouldUseCompactTiles = v40.shouldUseCompactTiles, 
        userPresence = v57
    });
    local function v64(v62, v63) --[[ Line: 148 ]]
        -- upvalues: v40 (copy), v3 (ref), l_user_0 (copy), v61 (copy)
        if v40.fireAnalyticsEvent then
            v40.fireAnalyticsEvent(v62, v3.Dictionary.join({
                playerId = l_user_0.id, 
                tilePos = v40.index, 
                contextualInfoType = v61, 
                hasEmphasis = v40.hasEmphasis, 
                rowInSort = v40.rowInSort
            }, v63 or {}));
        end;
    end;
    local function v65() --[[ Line: 163 ]]
        -- upvalues: v55 (copy), v44 (copy), l_SetCentralOverlay_0 (ref), l_user_0 (copy), v45 (copy), l_Enums_0 (ref), v40 (copy), v61 (copy), v60 (copy), v64 (copy), v26 (ref)
        if v55 == "Focus" then
            v44(l_SetCentralOverlay_0("PlayerContextualMenu", {
                subjectUserId = l_user_0.id, 
                robloxFriendshipStatus = v45.status, 
                friendshipOriginSourceType = l_Enums_0.FriendshipOriginSourceType.PlayerSearch.rawValue()
            }));
        else
            v40.luaAppNavigation.navigateToUserInfo({
                userId = l_user_0.id, 
                index = v40.index, 
                hasEmphasis = v40.hasEmphasis, 
                contextualInfoType = v61, 
                contextualInfoDisplay = v60
            });
        end;
        v64(v26.PlayerTileClick);
    end;
    local v66 = v23({
        userId = l_user_0.id, 
        index = v40.index, 
        contextualInfoType = v61, 
        shouldUseCompactTiles = v40.shouldUseCompactTiles, 
        userPresence = v57, 
        subpage = v40.subpage
    }, v64);
    local v67 = v60 and {
        text = v60.text, 
        fontStyle = v43.Font.CaptionBody, 
        icon = if v40.shouldUseCompactTiles then nil else v60.icon, 
        horizontalAlignment = if v40.shouldUseCompactTiles then Enum.HorizontalAlignment.Center else nil
    } or nil;
    local v68 = v24({
        userId = l_user_0.id
    });
    local function v72(v69, v70) --[[ Line: 205 ]]
        -- upvalues: v36 (ref), v43 (copy)
        if not v70 or not v70.combinedName then
            return "";
        elseif not v69 or not v36.isUserOnline(v69.userPresenceType) then
            return v70.combinedName;
        else
            local l_Color_0 = v43.Theme.OnlineStatus.Color;
            return ("<font color=\"rgb(%*,%*,%*)\">\226\151\143 </font>"):format(math.round(l_Color_0.R * 255), math.round(l_Color_0.G * 255), (math.round(l_Color_0.B * 255))) .. v70.combinedName;
        end;
    end;
    local l_createElement_0 = v2.createElement;
    local v74 = "Frame";
    local v75 = {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 0)
    };
    local v76 = {};
    local l_createElement_1 = v2.createElement;
    local v78 = "Frame";
    local v79 = {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 0), 
        ZIndex = 1
    };
    local v80 = {};
    local l_createElement_2 = v2.createElement;
    local l_l_PlayerTile_0_0 = l_PlayerTile_0;
    local v83 = {
        tileSize = v40.size, 
        title = if not not v46 or l_FFlagBlendedSerpUserPresenceExperiment_0 and v48 or l_FFlagBlendedSerpUserPresenceInLineEnabled_0 then v72(v57, v68) else v68 and v68.combinedName, 
        subtitle = v68 and v68.username
    };
    local l_id_0 = l_user_0.id;
    v83.thumbnail = if v40.shouldUseCompactTiles then l_getStandardSizeAvatarHeadShotRbxthumb_0((tostring(l_id_0))) else l_getRbxthumbWithTypeSizeAndOptions_0(tostring(l_id_0), l_Constants_0.RbxthumbTypes.Avatar, 720);
    v83.onActivated = v65;
    v83.buttons = if not not v40.shouldUseCompactTiles or v55 == "Focus" then nil else v66;
    v83.relevancyInfo = v67;
    v83.Selectable = true;
    v83.horizontalAlignment = if v40.shouldUseCompactTiles then Enum.HorizontalAlignment.Center else nil;
    v83.isCircular = v40.shouldUseCompactTiles;
    v83.thumbnailFrameSize = if v40.shouldUseCompactTiles then UDim2.new(1, -l_Size_125_0, 1, -l_Size_125_0) else nil;
    v83.openTypeFeatures = if l_GetFFlagLuaAppEnableOpenTypeSupport_0() then l_OpenTypeSupport_0:getUserNameStylisticAlternative() else nil;
    v80.Tile = l_createElement_2(l_l_PlayerTile_0_0, v83);
    v76.UserTile = l_createElement_1(v78, v79, v80);
    v76.UserTileRoundCTAButton = if v59 then nil else if v40.shouldUseCompactTiles and v66 and #v66 > 0 then v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        ZIndex = 2, 
        Size = UDim2.fromOffset(v43.Tokens.Global.Size_450, v43.Tokens.Global.Size_450), 
        AnchorPoint = Vector2.new(1, 1), 
        Position = UDim2.fromOffset(v40.size.X.Offset - v43.Tokens.Global.Size_125, v40.size.X.Offset - v43.Tokens.Global.Size_125)
    }, {
        RoundCTAButton = v2.createElement(v28, {
            searchTileButtonProps = v66[1], 
            playerTileSize = v40.size
        })
    }) else nil;
    v76.UserTilePresenceIndicator = if v58 then v2.createElement("Frame", {
        Size = UDim2.new(0, v43.Tokens.Global.Size_150, 0, v43.Tokens.Global.Size_150), 
        BackgroundColor3 = v43.Theme.OnlineStatus.Color, 
        AnchorPoint = Vector2.new(0.2, 0.2), 
        Position = UDim2.fromOffset(v54, v54), 
        ZIndex = 3
    }, {
        UICorner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(0.5, 0)
        }), 
        UIStroke = v2.createElement("UIStroke", {
            Thickness = 4, 
            Color = v43.Theme.BackgroundDefault.Color, 
            Transparency = v43.Theme.BackgroundDefault.Transparency
        })
    }) else nil;
    return l_createElement_0(v74, v75, v76);
end;