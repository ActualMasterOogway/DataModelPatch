local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactUtils);
local l_useEffectOnMount_0 = v3.Hooks.useEffectOnMount;
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_OpenGameDetails_0 = require(l_Parent_0.GameDetail).OpenGameDetails;
local v9 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v9.Core.Style.useStyle;
local l_Images_0 = v9.App.ImageSet.Images;
local l_IconSize_0 = v9.App.ImageSet.Enum.IconSize;
local l_getIconSize_0 = v9.App.ImageSet.getIconSize;
local l_PlayerContext_0 = v9.App.Indicator.PlayerContext;
local v15 = require(l_script_FirstAncestor_0.Rodux.Presence);
local l_PresenceType_0 = v15.Enums.PresenceType;
local v17 = require(l_script_FirstAncestor_0.Networking.NetworkingPresence);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v20 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v21 = require(l_script_FirstAncestor_0.Common.Enums);
local v22 = require(l_script_FirstAncestor_0.Contexts.useProfileAnalyticsContext);
local v23 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v24 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v25 = require(script.Parent.convertPresenceEnum);
local v26 = {
    [v21.PresenceTypes.Offline] = l_Images_0["component_assets/circle_26_stroke_3"], 
    [v21.PresenceTypes.Online] = l_Images_0["component_assets/circle_16"], 
    [v21.PresenceTypes.InGame] = l_Images_0["icons/menu/games_small"], 
    [v21.PresenceTypes.InStudio] = l_Images_0["icons/logo/studiologo_small"]
};
return function(_) --[[ Line: 45 ]] --[[ Name: contextualPresence ]]
    -- upvalues: l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_useStyle_0 (copy), v22 (copy), v24 (copy), l_useEffectOnMount_0 (copy), v17 (copy), l_useSelector_0 (copy), v15 (copy), l_PresenceType_0 (copy), v25 (copy), v2 (copy), v23 (copy), l_OpenGameDetails_0 (copy), l_dependencyArray_0 (copy), l_useLocalization_0 (copy), v21 (copy), v20 (copy), v26 (copy), l_getIconSize_0 (copy), l_IconSize_0 (copy), l_PlayerContext_0 (copy)
    local v28 = l_useDispatch_0();
    local v29 = l_useNavigation_0();
    local v30 = l_useStyle_0();
    local v31 = v22();
    local l_profileUserId_0 = v24().profileUserId;
    l_useEffectOnMount_0(function() --[[ Line: 54 ]]
        -- upvalues: v28 (copy), v17 (ref), l_profileUserId_0 (copy)
        v28(v17.GetPresencesFromUserIds.API({
            l_profileUserId_0
        })):catch(function(_) --[[ Line: 55 ]]

        end);
    end);
    local v35 = l_useSelector_0(function(v34) --[[ Line: 58 ]]
        -- upvalues: v15 (ref), l_profileUserId_0 (copy), l_PresenceType_0 (ref)
        return v15.Selectors.getUserPresenceByUserId(v34, l_profileUserId_0) or {
            userPresenceType = l_PresenceType_0.Offline, 
            lastLocation = ""
        };
    end);
    local v36 = v25(v35.userPresenceType, v35.universeId);
    local l_lastLocation_0 = v35.lastLocation;
    local l_universeId_0 = v35.universeId;
    local v39 = v2.useCallback(function() --[[ Line: 70 ]]
        -- upvalues: v31 (copy), v23 (ref), v28 (copy), l_OpenGameDetails_0 (ref), l_universeId_0 (copy), v29 (copy)
        v31.fireAnalyticsEvent(v23.GameDetailsButton);
        v28(l_OpenGameDetails_0(l_universeId_0, v29, {
            mountAsFullView = true, 
            showBackButton = true
        }));
    end, l_dependencyArray_0(l_universeId_0, v29, v31));
    local v40 = l_useLocalization_0({
        [v21.PresenceTypes.Online] = v20.Online, 
        [v21.PresenceTypes.Offline] = v20.Offline, 
        [v21.PresenceTypes.InStudio] = v20.InStudio
    });
    local v41 = nil;
    local v42 = nil;
    local v43 = nil;
    local v44 = nil;
    local v45 = nil;
    local v46 = nil;
    local v47 = nil;
    if v35 then
        if v36 == v21.PresenceTypes.Online then
            v41 = v26[v21.PresenceTypes.Online];
            v42 = v30.Theme.OnlineStatus.Color;
            v43 = v30.Theme.OnlineStatus.Transparency;
            v44 = v40.Online;
            v45 = v30.Theme.TextMuted;
            v46 = 12;
        elseif v36 == v21.PresenceTypes.InGame then
            v41 = v26[v21.PresenceTypes.InGame];
            v42 = v30.Theme.IconEmphasis.Color;
            v43 = v30.Theme.IconEmphasis.Transparency;
            v44 = l_lastLocation_0;
            v45 = v30.Theme.TextEmphasis;
            v46 = l_getIconSize_0(l_IconSize_0.Small);
            v47 = v39;
        elseif v36 == v21.PresenceTypes.InStudio then
            v41 = v26[v21.PresenceTypes.InStudio];
            v42 = v30.Theme.TextDefault.Color;
            v43 = v30.Theme.TextDefault.Transparency;
            v44 = v40.InStudio;
            v45 = v30.Theme.TextMuted;
            v46 = l_getIconSize_0(l_IconSize_0.Small);
        else
            v41 = v26[v21.PresenceTypes.Offline];
            v42 = v30.Theme.OfflineStatus.Color;
            v43 = v30.Theme.OfflineStatus.Transparency;
            v46 = 12;
            v44 = v40.Offline;
            v45 = v30.Theme.TextMuted;
        end;
    end;
    return v2.createElement(l_PlayerContext_0, {
        fontStyle = v30.Font.CaptionBody, 
        icon = v41, 
        iconColor = v42, 
        iconSize = UDim2.fromOffset(v46, v46), 
        iconTransparency = v43, 
        layoutOrder = 2, 
        text = v44, 
        textColorStyle = v45, 
        onActivated = v47
    });
end;