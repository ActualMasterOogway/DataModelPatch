local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsCarousel");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Roact_0 = v1.Roact;
local l_React_0 = v1.React;
local l_useLocalization_0 = v1.Hooks.useLocalization;
local v6 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v7 = require(l_script_FirstAncestor_0.Analytics);
local l_EventNames_0 = v7.EventNames;
local l_useAnalytics_0 = v7.useAnalytics;
local l_useEffectOnce_0 = v1.Hooks.useEffectOnce;
local l_Images_0 = require(l_Parent_0.UIBlox).App.ImageSet.Images;
local v12 = l_Images_0["icons/menu/friends_large"];
local v13 = l_Images_0["icons/menu/friends"];
local l_FFlagEnableNewFriendRequestsBadge_0 = require(l_Parent_0.SharedFlags).FFlagEnableNewFriendRequestsBadge;
local v15 = require(l_script_FirstAncestor_0.Components.ButtonTileCircular);
local v16 = require(l_script_FirstAncestor_0.Hooks.useNewFriendRequestsCount);
local v17 = require(l_script_FirstAncestor_0.Hooks.useNewFriendRequestsText);
local l_useUserExperiment_0 = require(l_Parent_0.RoactAppExperiment).useUserExperiment;
local v19 = require(l_Parent_0.Foundation);
local l_IconSize_0 = v19.Enums.IconSize;
local l_useTokens_0 = v19.Hooks.useTokens;
local v22 = require(l_script_FirstAncestor_0.Flags.FFlagFriendsCarouselSmallerUIExperiment);
local v23 = require(l_script_FirstAncestor_0.Flags.FFlagFriendsCarouselSmallerUIEnabledForAll);
local v24 = require(l_script_FirstAncestor_0.Flags.FFlagFriendsCarouselFriendRequestTextEnabledForAll);
local v25 = require(l_script_FirstAncestor_0.Flags.FFlagFriendsCarouselFriendRequestCountEnabledForAll);
local l_FFlagRefactorButtonTileCircular_0 = require(l_Parent_0.SharedFlags).FFlagRefactorButtonTileCircular;
local v27 = game:DefineFastString("NewAddFriendsTileIXPLayer", "Social.Friends");
local l_FFlagEnableNewAddFriendsTileExperiment_0 = require(l_Parent_0.SharedFlags).FFlagEnableNewAddFriendsTileExperiment;
local l_FFlagEnableNewAddFriendsTileForAll_0 = require(l_Parent_0.SharedFlags).FFlagEnableNewAddFriendsTileForAll;
local function _(v30) --[[ Line: 63 ]]
    local v31 = false;
    local v32;
    if type(v30) == "number" then
        if v30 > 0 then
            v32 = v30;
            v31 = v32;
        end;
        if not v31 then
            return nil;
        end;
    elseif type(v30) == "string" then
        if v30 ~= "" then
            v32 = v30;
            v31 = v32;
        end;
        if not v31 then
            return nil;
        end;
    else
        v32 = nil;
    end;
    v31 = false;
    return v32;
end;
return function(v34) --[[ Line: 70 ]]
    -- upvalues: l_FFlagEnableNewAddFriendsTileExperiment_0 (copy), l_useUserExperiment_0 (copy), v27 (copy), l_FFlagEnableNewAddFriendsTileForAll_0 (copy), l_React_0 (copy), l_useAnalytics_0 (copy), l_EventNames_0 (copy), l_FFlagEnableNewFriendRequestsBadge_0 (copy), v24 (copy), v16 (copy), v25 (copy), v17 (copy), l_useEffectOnce_0 (copy), l_useLocalization_0 (copy), v6 (copy), l_FFlagRefactorButtonTileCircular_0 (copy), l_useTokens_0 (copy), v15 (copy), v22 (copy), v23 (copy), l_IconSize_0 (copy), l_Roact_0 (copy), v13 (copy), v12 (copy)
    local v36 = if l_FFlagEnableNewAddFriendsTileExperiment_0 then l_useUserExperiment_0({
        v27
    }, function(v35) --[[ Line: 74 ]]
        -- upvalues: v27 (ref)
        return (v35[v27] or {}).useNewAddFriendsTile;
    end) else nil;
    if l_FFlagEnableNewAddFriendsTileForAll_0 then
        v36 = true;
    end;
    l_React_0.useEffect(function() --[[ Line: 84 ]]
        -- upvalues: v34 (copy)
        if v34.onDidMount then
            v34.onDidMount();
        end;
    end, {});
    local v37 = nil;
    local v38 = nil;
    local v39 = l_useAnalytics_0();
    local function v40() --[[ Line: 93 ]]
        -- upvalues: v39 (copy), l_EventNames_0 (ref)
        v39.fireEvent(l_EventNames_0.ContactImporterOnAddFriends);
    end;
    if l_FFlagEnableNewFriendRequestsBadge_0 then
        v37 = if v24 then nil else v16();
        v38 = if v25 then nil else v17();
    else
        v37 = l_React_0.useMemo(function() --[[ Line: 104 ]]
            -- upvalues: v34 (copy)
            local v41 = false;
            local l_badgeValue_0 = v34.badgeValue;
            local v43;
            if type(l_badgeValue_0) == "number" then
                if l_badgeValue_0 > 0 then
                    v43 = l_badgeValue_0;
                    v41 = v43;
                end;
                if not v41 then
                    return nil;
                end;
            elseif type(l_badgeValue_0) == "string" then
                if l_badgeValue_0 ~= "" then
                    v43 = l_badgeValue_0;
                    v41 = v43;
                end;
                if not v41 then
                    return nil;
                end;
            else
                v43 = nil;
            end;
            v41 = false;
            return v43;
        end, {
            v34.badgeValue
        });
    end;
    if not v24 then
        l_useEffectOnce_0(v40, v37);
    end;
    local v44 = l_useLocalization_0({
        addFriendText = v6.UpdatedFindFriendsText, 
        findFriendsText = v6.FindFriendsText
    });
    if l_FFlagRefactorButtonTileCircular_0 then
        local v45 = l_useTokens_0();
        return l_React_0.createElement(v15, {
            backgroundColor = if v36 then v45.Color.Shift.Shift_300.Color3 else nil, 
            backgroundTransparency = if v36 then v45.Color.Shift.Shift_300.Transparency else nil, 
            badgeValue = v37, 
            subLabelText = if not l_FFlagEnableNewFriendRequestsBadge_0 or v25 then nil else v38, 
            icon = v36 and "icons/common/plus_heavy" or "icons/menu/friends_large", 
            iconSize = if v22 and v34.friendsCarouselSmallerUI or v23 then l_IconSize_0.Medium else l_IconSize_0.Large, 
            noBorder = v36 and true or nil, 
            onActivated = v34.onActivated, 
            tileSize = v34.tileSize, 
            title = v44.addFriendText
        });
    else
        return l_Roact_0.createElement(v15, {
            onActivated = v34.onActivated, 
            title = v44.addFriendText, 
            badgeValue = v37, 
            tileSize = v34.tileSize, 
            backgroundColor = v34.backgroundColor, 
            noBorder = v34.noBorder, 
            icon = v34.icon or if v22 and v34.friendsCarouselSmallerUI or v23 then v13 else v12, 
            iconColor = v34.iconColor
        });
    end;
end;