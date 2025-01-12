local l_script_FirstAncestor_0 = script:FindFirstAncestor("GamePlayButton");
local _ = require(l_script_FirstAncestor_0.PlayButtonTypes);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local v5 = require(l_Parent_0.RoactServiceTags);
local l_RoactAnalytics_0 = v5.RoactAnalytics;
local l_AppEventIngestService_0 = v5.AppEventIngestService;
local l_AppGame_0 = v5.AppGame;
local v9 = require(l_Parent_0.RoactUtils);
local l_useSelector_0 = v9.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v9.Hooks.RoactRodux.useDispatch;
local v12 = require(l_Parent_0.DiscoveryAnalytics);
local l_gamePlayIntent_0 = v12.Events.gamePlayIntent;
local l_joinGamePlayButton_0 = v12.Points.joinGamePlayButton;
local v15 = require(l_Parent_0.GameVotesRodux);
local l_ReasonForNotVoteable_0 = v15.Enums.ReasonForNotVoteable;
local l_ClearUserGameVotes_0 = v15.UserGameVotes.ClearUserGameVotes;
local l_IsVRAppBuild_0 = require(l_Parent_0.AppCommonLib).IsVRAppBuild;
local l_SplashScreenManager_0 = require(l_Parent_0.SplashScreenManager).SplashScreenManager;
local l_LaunchGame_0 = require(l_Parent_0.GameLaunch).LaunchGame;
local l_FFlagAXPassGameJoinContext_0 = require(l_Parent_0.SharedFlags).FFlagAXPassGameJoinContext;
local l_GetFFlagLuaAppEnableVirtualEventPlaceId_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableVirtualEventPlaceId;
return function(v23, v24, v25, v26, v27, v28, v29) --[[ Line: 28 ]]
    -- upvalues: l_useRoactService_0 (copy), l_RoactAnalytics_0 (copy), l_AppEventIngestService_0 (copy), l_AppGame_0 (copy), l_useSelector_0 (copy), l_useDispatch_0 (copy), v3 (copy), l_GetFFlagLuaAppEnableVirtualEventPlaceId_0 (copy), l_gamePlayIntent_0 (copy), l_joinGamePlayButton_0 (copy), l_IsVRAppBuild_0 (copy), l_SplashScreenManager_0 (copy), l_FFlagAXPassGameJoinContext_0 (copy), l_LaunchGame_0 (copy), l_ReasonForNotVoteable_0 (copy), l_ClearUserGameVotes_0 (copy)
    local v30 = l_useRoactService_0(l_RoactAnalytics_0);
    local v31 = l_useRoactService_0(l_AppEventIngestService_0);
    local v32 = l_useRoactService_0(l_AppGame_0);
    local v34 = l_useSelector_0(function(v33) --[[ Line: 41 ]]
        -- upvalues: v23 (copy)
        return v33.UserGameVotes[v23];
    end);
    local v35 = l_useDispatch_0();
    return (v3.useCallback(function(v36) --[[ Line: 46 ]]
        -- upvalues: l_GetFFlagLuaAppEnableVirtualEventPlaceId_0 (ref), v24 (copy), v25 (copy), l_gamePlayIntent_0 (ref), v31 (copy), v26 (copy), l_joinGamePlayButton_0 (ref), v30 (copy), v27 (copy), l_IsVRAppBuild_0 (ref), l_SplashScreenManager_0 (ref), l_FFlagAXPassGameJoinContext_0 (ref), l_LaunchGame_0 (ref), v28 (copy), v29 (copy), v32 (copy), v34 (copy), l_ReasonForNotVoteable_0 (ref), v35 (copy), l_ClearUserGameVotes_0 (ref), v23 (copy)
        if l_GetFFlagLuaAppEnableVirtualEventPlaceId_0() and (not v24 or not v25) or not l_GetFFlagLuaAppEnableVirtualEventPlaceId_0() and not v25 then
            return;
        else
            if v36 ~= nil then
                v36();
            else
                l_gamePlayIntent_0(v31, "PlayButton", {
                    placeId = if l_GetFFlagLuaAppEnableVirtualEventPlaceId_0() then v24 else v25, 
                    rootPlaceId = tonumber(v25), 
                    referralSource = v26
                });
            end;
            l_joinGamePlayButton_0(v30.InfluxDb, "gamePlayIntent", {
                isUniversalApp = true, 
                referralSource = v26, 
                placeId = if l_GetFFlagLuaAppEnableVirtualEventPlaceId_0() then v24 else v25, 
                ctx = v27
            });
            if l_IsVRAppBuild_0() then
                l_SplashScreenManager_0.initialize(36);
                wait(0.3);
            end;
            if l_FFlagAXPassGameJoinContext_0 then
                l_LaunchGame_0(if l_GetFFlagLuaAppEnableVirtualEventPlaceId_0() then v24 else v25, v28, v29, v32);
            else
                l_LaunchGame_0(if l_GetFFlagLuaAppEnableVirtualEventPlaceId_0() then v24 else v25, v28, nil, v32);
            end;
            if v34 and v34.reasonForNotVoteable == l_ReasonForNotVoteable_0.PlayGame then
                v35(l_ClearUserGameVotes_0(v23));
            end;
            return;
        end;
    end, {
        v31, 
        v30, 
        v32, 
        v34, 
        v23, 
        if l_GetFFlagLuaAppEnableVirtualEventPlaceId_0() then v24 else nil, 
        v25, 
        v26, 
        v27
    }));
end;