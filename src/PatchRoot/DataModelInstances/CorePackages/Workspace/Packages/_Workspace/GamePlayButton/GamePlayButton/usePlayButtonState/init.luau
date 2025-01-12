local l_script_FirstAncestor_0 = script:FindFirstAncestor("GamePlayButton");
local v1 = require(l_script_FirstAncestor_0.PlayButtonStates);
local v2 = require(l_script_FirstAncestor_0.FetchGamePlayButtonData);
local v3 = require(l_script_FirstAncestor_0.ApiPostPreparePurchase);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_GetFFlagLuaAppEnableSquadPage_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableSquadPage;
local v6 = require(l_Parent_0.React);
local l_PlayabilityStatusEnum_0 = require(l_Parent_0.PlayabilityRodux).Enums.PlayabilityStatusEnum;
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local v9 = require(l_Parent_0.RoactUtils);
local l_useDispatch_0 = v9.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v9.Hooks.RoactRodux.useSelector;
local l_FetchGamePlayabilityAndProductInfo_0 = require(l_Parent_0.GameDetailRodux).FetchGamePlayabilityAndProductInfo;
local l_GamesProductInfoReducer_0 = require(l_Parent_0.GameProductInfoRodux).GamesProductInfoReducer;
local l_useCurrentSquadSelector_0 = require(l_Parent_0.RoduxSquads).Hooks.useCurrentSquadSelector;
local l_useIsExperienceInvitePending_0 = require(l_Parent_0.Squads).Hooks.useIsExperienceInvitePending;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_FFlagLuaAppPlayButtonUpdates_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppPlayButtonUpdates;
local l_GetFFlagLuaAppPlayButtonUpdatesIxp_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppPlayButtonUpdatesIxp;
local l_FFlagLuaAppVpcUpsell_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppVpcUpsell;
local l_FFlagLuaAppParentUpsellPolicy_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppParentUpsellPolicy;
local l_FFlagLuaAppFiatPaidAccess_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFiatPaidAccess;
local l_FFlagLuaAppVpcControlUpdate_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppVpcControlUpdate;
local l_FFlagLuaAppEnablePlayableStateWhenLoading_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnablePlayableStateWhenLoading;
local function v34(v24, v25, v26, v27, v28, v29, v30, v31) --[[ Line: 35 ]] --[[ Name: selectPlayButtonState ]]
    -- upvalues: l_FFlagLuaAppPlayButtonUpdates_0 (copy), l_GetFFlagLuaAppPlayButtonUpdatesIxp_0 (copy), l_RetrievalStatus_0 (copy), v1 (copy), l_PlayabilityStatusEnum_0 (copy), l_FFlagLuaAppFiatPaidAccess_0 (copy), l_FFlagLuaAppVpcUpsell_0 (copy), l_FFlagLuaAppParentUpsellPolicy_0 (copy), l_FFlagLuaAppVpcControlUpdate_0 (copy), l_GetFFlagLuaAppEnableSquadPage_0 (copy)
    local v32 = l_FFlagLuaAppPlayButtonUpdates_0 and (not l_GetFFlagLuaAppPlayButtonUpdatesIxp_0() or v28);
    local v33 = nil;
    v33 = if v24 == l_RetrievalStatus_0.Done and v25 ~= nil then if v25.isPlayable == true then v1.Playable else if not v32 and v25.playabilityStatus == l_PlayabilityStatusEnum_0.UniverseRootPlaceIsPrivate then v1.Private else if v25.playabilityStatus == l_PlayabilityStatusEnum_0.PurchaseRequired and v26 ~= nil and v26.isForSale == true then v1.PaidAccess else if l_FFlagLuaAppFiatPaidAccess_0 and v25.playabilityStatus == l_PlayabilityStatusEnum_0.FiatPurchaseRequired and v26 ~= nil and v26.isForSale == true then v1.FiatPaidAccess else if v25.playabilityStatus == l_PlayabilityStatusEnum_0.ContextualPlayabilityUnverifiedSeventeenPlusUser then if v32 then v1.ActionNeeded else v1.Playable else if l_FFlagLuaAppVpcUpsell_0 and (not l_FFlagLuaAppParentUpsellPolicy_0 or v31) and v25.playabilityStatus == l_PlayabilityStatusEnum_0.ContextualPlayabilityAgeRecommendationParentalControls then if v32 then v1.ActionNeeded else if l_FFlagLuaAppVpcControlUpdate_0 then v1.UnplayableOther else v1.Playable else v1.UnplayableOther else v1.Playable;
    if l_GetFFlagLuaAppEnableSquadPage_0() and v33 == v1.Playable and v27 and #v27.members > 1 and (not v30 or not v30.maxPlayers or v30.maxPlayers > 1) then
        if v29 then
            return v1.WaitingForParty;
        else
            v33 = v1.PlayableWithParty;
        end;
    end;
    return v33;
end;
return function(v35, v36, v37, v38, v39) --[[ Line: 116 ]]
    -- upvalues: l_useDispatch_0 (copy), v6 (copy), v2 (copy), l_FFlagLuaAppParentUpsellPolicy_0 (copy), l_useAppPolicy_0 (copy), l_GetFFlagLuaAppEnableSquadPage_0 (copy), l_useCurrentSquadSelector_0 (copy), l_useIsExperienceInvitePending_0 (copy), l_useSelector_0 (copy), l_FFlagLuaAppEnablePlayableStateWhenLoading_0 (copy), v1 (copy), l_FFlagLuaAppFiatPaidAccess_0 (copy), v3 (copy), l_RetrievalStatus_0 (copy), l_FetchGamePlayabilityAndProductInfo_0 (copy), l_GamesProductInfoReducer_0 (copy), v34 (copy), l_GetFFlagLuaAppPlayButtonUpdatesIxp_0 (copy)
    local v40 = l_useDispatch_0();
    v6.useEffect(function() --[[ Line: 125 ]]
        -- upvalues: v37 (copy), v40 (copy), v2 (ref), v35 (copy), v36 (copy)
        local v41 = nil;
        if v37 ~= nil and v37 > 0 then
            v41 = task.delay(v37, function() --[[ Line: 128 ]]
                -- upvalues: v41 (ref), v40 (ref), v2 (ref), v35 (ref), v36 (ref)
                v41 = nil;
                v40(v2.Fetch(v35, v36));
            end);
        else
            v40(v2.Fetch(v35, v36));
        end;
        return function() --[[ Line: 136 ]]
            -- upvalues: v41 (ref)
            if v41 ~= nil then
                task.cancel(v41);
            end;
        end;
    end, {
        v36, 
        v37
    });
    local v42 = nil;
    if l_FFlagLuaAppParentUpsellPolicy_0 then
        v42 = l_useAppPolicy_0(function(v43) --[[ Line: 145 ]]
            return v43.getShouldShowVpcPlayButtonUpsells();
        end);
    end;
    local v44 = if l_GetFFlagLuaAppEnableSquadPage_0() then l_useCurrentSquadSelector_0() else nil;
    local v45 = if l_GetFFlagLuaAppEnableSquadPage_0() then l_useIsExperienceInvitePending_0() else nil;
    local v47 = l_useSelector_0(function(v46) --[[ Line: 152 ]]
        -- upvalues: v36 (copy)
        return v46.PlayabilityStatus and v46.PlayabilityStatus[v36] or nil;
    end);
    return {
        playButtonState = l_useSelector_0(function(v48) --[[ Line: 155 ]]
            -- upvalues: v2 (ref), v36 (copy), l_FFlagLuaAppEnablePlayableStateWhenLoading_0 (ref), v39 (copy), l_GetFFlagLuaAppEnableSquadPage_0 (ref), v44 (copy), v45 (copy), v1 (ref), l_FFlagLuaAppFiatPaidAccess_0 (ref), v3 (ref), l_RetrievalStatus_0 (ref), l_FetchGamePlayabilityAndProductInfo_0 (ref), l_GamesProductInfoReducer_0 (ref), v34 (ref), v47 (copy), l_GetFFlagLuaAppPlayButtonUpdatesIxp_0 (ref), v38 (copy), l_FFlagLuaAppParentUpsellPolicy_0 (ref), v42 (ref)
            if v2.IsLoading(v48, v36) then
                if l_FFlagLuaAppEnablePlayableStateWhenLoading_0 then
                    if v39 then
                        if l_GetFFlagLuaAppEnableSquadPage_0() and v44 and #v44.members > 1 then
                            if v45 then
                                return v1.WaitingForParty;
                            else
                                return v1.PlayableWithParty;
                            end;
                        else
                            return v1.Playable;
                        end;
                    else
                        return v1.Loading;
                    end;
                else
                    return v1.Loading;
                end;
            elseif l_FFlagLuaAppFiatPaidAccess_0 and v3.GetFetchingStatus(v48, v36) == l_RetrievalStatus_0.Fetching then
                return v1.Loading;
            else
                local v49 = l_FetchGamePlayabilityAndProductInfo_0.GetFetchingStatus(v48, v36);
                local v50 = v48[l_GamesProductInfoReducer_0.key] and v48[l_GamesProductInfoReducer_0.key][v36] or nil;
                if l_GetFFlagLuaAppEnableSquadPage_0() then
                    local v51 = v48.GameDetails[v36];
                    return (v34(v49, v47, v50, v44, if l_GetFFlagLuaAppPlayButtonUpdatesIxp_0() then v38 else nil, v45, v51, if l_FFlagLuaAppParentUpsellPolicy_0 then v42 else nil));
                else
                    return (v34(v49, v47, v50, nil, if l_GetFFlagLuaAppPlayButtonUpdatesIxp_0() then v38 else nil, nil, nil, if l_FFlagLuaAppParentUpsellPolicy_0 then v42 else nil));
                end;
            end;
        end), 
        playabilityStatus = v47
    };
end;