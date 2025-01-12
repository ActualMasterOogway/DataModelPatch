local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_AppTopBannerType_0 = v1.AppTopBanner.Enums.AppTopBannerType;
local l_React_0 = v1.React;
local l_SetAppTopBanner_0 = v1.AppTopBanner.Actions.SetAppTopBanner;
local l_SharedFlags_0 = v1.SharedFlags;
local l_SquadExternalContractContext_0 = v1.SquadsCore.SquadExternalContractProvider.SquadExternalContractContext;
local l_SquadViewFlags_0 = v1.SquadsCore.SquadExternalContractProvider.SquadViewFlags;
local l_SquadRootViewType_0 = v1.SquadsCore.Enums.SquadRootViewType;
local l_dependencyArray_0 = v1.Hooks.dependencyArray;
local l_useCurrentSquadId_0 = v1.SquadsCore.Hooks.useCurrentSquadId;
local l_useCurrentSquadParentChannelId_0 = v1.SquadsCore.Hooks.useCurrentSquadParentChannelId;
local l_useDispatch_0 = v1.Hooks.useDispatch;
local l_FFlagEnableSquadTopBannerWideMode_0 = l_SharedFlags_0.FFlagEnableSquadTopBannerWideMode;
local l_FFlagMoveSquadTitleFetchIntoTopBanner_0 = l_SharedFlags_0.FFlagMoveSquadTitleFetchIntoTopBanner;
return function() --[[ Line: 19 ]]
    -- upvalues: l_useDispatch_0 (copy), l_React_0 (copy), l_SquadExternalContractContext_0 (copy), l_useCurrentSquadId_0 (copy), l_useCurrentSquadParentChannelId_0 (copy), l_dependencyArray_0 (copy), l_FFlagMoveSquadTitleFetchIntoTopBanner_0 (copy), l_FFlagEnableSquadTopBannerWideMode_0 (copy), l_SquadRootViewType_0 (copy), l_SetAppTopBanner_0 (copy), l_AppTopBannerType_0 (copy), l_SquadViewFlags_0 (copy)
    local v15 = l_useDispatch_0();
    local v16 = l_React_0.useContext(l_SquadExternalContractContext_0);
    local v17 = l_useCurrentSquadId_0();
    local v18 = l_useCurrentSquadParentChannelId_0();
    local v19 = l_React_0.useCallback(function() --[[ Line: 27 ]]
        -- upvalues: v16 (copy), v18 (copy), v15 (copy)
        if v16.navigateIntoSquadLobby and v18 then
            v15(v16.navigateIntoSquadLobby({
                conversationId = v18
            }, true));
        end;
    end, l_dependencyArray_0(v18, v15, v16.navigateIntoSquadLobby));
    local v20 = v16.useSquadRootView();
    local v21 = if l_FFlagMoveSquadTitleFetchIntoTopBanner_0 then nil else v16.useParentChannelTitleSelector(v18 or "");
    if l_FFlagEnableSquadTopBannerWideMode_0 then
        local v22 = v16.useSquadTopBannerDisabled();
        l_React_0.useEffect(function() --[[ Line: 43 ]]
            -- upvalues: v17 (copy), v22 (copy), v20 (copy), l_SquadRootViewType_0 (ref), v15 (copy), l_SetAppTopBanner_0 (ref), l_AppTopBannerType_0 (ref), l_FFlagMoveSquadTitleFetchIntoTopBanner_0 (ref), v21 (copy), v19 (copy)
            if v17 and (not v22 or v20 == l_SquadRootViewType_0.None) then
                v15(l_SetAppTopBanner_0(true, l_AppTopBannerType_0.ActiveSquad, if l_FFlagMoveSquadTitleFetchIntoTopBanner_0 then nil else {
                    title = if v21 then v21 else ""
                }, v19));
                return;
            else
                v15(l_SetAppTopBanner_0(false, l_AppTopBannerType_0.None, nil));
                return;
            end;
        end, l_dependencyArray_0(v17, v21, v15, v19, v22, v20));
    else
        local v23 = v16.useSquadViewFlags();
        l_React_0.useEffect(function() --[[ Line: 79 ]]
            -- upvalues: v17 (copy), v23 (copy), l_SquadViewFlags_0 (ref), v20 (copy), l_SquadRootViewType_0 (ref), v15 (copy), l_SetAppTopBanner_0 (ref), l_AppTopBannerType_0 (ref), l_FFlagMoveSquadTitleFetchIntoTopBanner_0 (ref), v21 (copy), v19 (copy)
            if v17 and (bit32.band(v23, l_SquadViewFlags_0.SquadLobby) == 0 or v20 == l_SquadRootViewType_0.None) then
                v15(l_SetAppTopBanner_0(true, l_AppTopBannerType_0.ActiveSquad, if l_FFlagMoveSquadTitleFetchIntoTopBanner_0 then nil else {
                    title = if v21 then v21 else ""
                }, v19));
                return;
            else
                v15(l_SetAppTopBanner_0(false, l_AppTopBannerType_0.None, nil));
                return;
            end;
        end, l_dependencyArray_0(v17, v21, v15, v19, v23, v20));
    end;
    return nil;
end;