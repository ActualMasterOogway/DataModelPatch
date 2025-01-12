local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local v1 = require(script.Parent.AppSquadTopBannerEventReceiver);
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_ExperienceService_0 = v2.ExperienceService.ExperienceService;
local l_React_0 = v2.React;
local l_RoduxSquads_0 = v2.RoduxSquads;
local l_SquadEventReceiver_0 = v2.SquadsCore.SquadEventReceiver;
local l_useDispatch_0 = v2.Hooks.useDispatch;
local l_useSelector_0 = v2.Hooks.useSelector;
return function(_) --[[ Line: 14 ]]
    -- upvalues: l_useDispatch_0 (copy), l_React_0 (copy), l_useSelector_0 (copy), l_ExperienceService_0 (copy), l_RoduxSquads_0 (copy), v1 (copy), l_SquadEventReceiver_0 (copy)
    local v10 = l_useDispatch_0();
    local v12 = l_React_0.useCallback(function(v11) --[[ Line: 17 ]]
        if v11.Squad and v11.Squad.Squad then
            return v11.Squad.Squad.currentExperienceInvite;
        else
            return nil;
        end;
    end, {});
    local v13 = l_useSelector_0(v12);
    local v15 = l_React_0.useCallback(function(v14) --[[ Line: 22 ]]
        if v14.Squad and v14.Squad.Squad and v14.Squad.Squad.currentSquadPersist then
            return v14.Squad.Squad.currentSquadPersist.isPaused;
        else
            return false;
        end;
    end, {});
    local v16 = l_useSelector_0(v15);
    l_React_0.useEffect(function() --[[ Line: 32 ]]
        -- upvalues: l_ExperienceService_0 (ref), l_RoduxSquads_0 (ref), v10 (copy)
        l_ExperienceService_0:RegisterForExperienceJoin(function() --[[ Line: 33 ]]
            -- upvalues: l_RoduxSquads_0 (ref), v10 (ref)
            l_RoduxSquads_0.PersistManagers.currentSquadPersistManager.pause(v10);
        end);
        l_ExperienceService_0:RegisterForExperienceLeave(function() --[[ Line: 38 ]]
            -- upvalues: l_RoduxSquads_0 (ref), v10 (ref)
            l_RoduxSquads_0.PersistManagers.currentSquadPersistManager.persistAndUpdateState(v10);
        end);
    end, {
        v10
    });
    l_React_0.useEffect(function() --[[ Line: 44 ]]
        -- upvalues: v13 (copy), v16 (copy), v10 (copy), l_RoduxSquads_0 (ref)
        if v13 and v16 then
            v10(l_RoduxSquads_0.Actions.CurrentExperienceInviteDismissed(v13.notification.notificationId));
        end;
    end, {
        v13, 
        v16
    });
    return l_React_0.createElement(l_React_0.Fragment, nil, {
        appSquadTopBannerEventReceiver = l_React_0.createElement(v1), 
        squadEventReceiver = if not v16 then l_React_0.createElement(l_SquadEventReceiver_0) else nil
    });
end;