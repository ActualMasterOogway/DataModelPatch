local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_CurrentCamera_0 = game:GetService("Workspace").CurrentCamera;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_CorePackages_0.Workspace.Packages.CallProtocol);
local l_Sounds_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).Sounds;
local l_SoundGroups_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).SoundGroups;
local l_SoundManager_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).SoundManager;
local v9 = require(l_CorePackages_0.Packages.ReactOtter);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_GetFFlagFixChromeReferences_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagFixChromeReferences;
local l_Chrome_0 = l_RobloxGui_0.Modules.Chrome;
local v13 = if l_GetFFlagFixChromeReferences_0() then require(l_Chrome_0.Enabled) else require(l_RobloxGui_0.Modules.Chrome.Enabled);
local v14 = if l_GetFFlagFixChromeReferences_0() then if v13() then require(l_Chrome_0.Service) else nil else require(l_Chrome_0.Service);
local v15 = require(l_Chrome_0.ChromeShared.Unibar.Constants);
local l_TopBar_0 = l_RobloxGui_0.Modules.TopBar;
local v17 = require(l_TopBar_0.Constants);
local l_ContactList_0 = l_RobloxGui_0.Modules.ContactList;
local v19 = require(l_ContactList_0.dependencies);
local l_RoduxCall_0 = v19.RoduxCall;
local l_useSelector_0 = v19.Hooks.useSelector;
local l_useDispatch_0 = v19.Hooks.useDispatch;
local l_CallAction_0 = l_RoduxCall_0.Enums.CallAction;
local l_Parent_0 = script.Parent;
local v25 = require(l_Parent_0.CallBar);
local v26 = Vector2.new(200, 44);
local v27 = {
    callProtocol = v5.CallProtocol.default
};
local v28 = {
    On = "On", 
    Off = "Off"
};
return function(v29) --[[ Line: 62 ]] --[[ Name: CallBarContainer ]]
    -- upvalues: v4 (copy), v27 (copy), l_useDispatch_0 (copy), v3 (copy), v9 (copy), l_CurrentCamera_0 (copy), v26 (copy), v28 (copy), v13 (copy), v17 (copy), v14 (copy), v15 (copy), l_useSelector_0 (copy), l_SoundManager_0 (copy), l_Sounds_0 (copy), l_SoundGroups_0 (copy), l_RoduxCall_0 (copy), l_CallAction_0 (copy), v25 (copy)
    local v30 = v4.Dictionary.join(v27, v29);
    local v31 = l_useDispatch_0();
    local v32, v33 = v3.useState(false);
    local v34 = nil;
    local v35 = nil;
    local v37, v38 = v9.useAnimatedBinding({
        X = l_CurrentCamera_0.ViewportSize.X / 2 - v26.X / 2, 
        Y = -v26.Y
    }, function(v36) --[[ Line: 73 ]]
        -- upvalues: v26 (ref), v32 (copy), v33 (copy)
        if v36.Y == -v26.Y and v32 then
            v33(false);
        end;
    end);
    v34 = v37;
    v35 = v38;
    v37 = v3.useCallback(function(v39) --[[ Line: 88 ]]
        -- upvalues: l_CurrentCamera_0 (ref), v26 (ref), v28 (ref), v13 (ref), v17 (ref), v14 (ref), v35 (ref), v9 (ref), v15 (ref)
        local v40 = l_CurrentCamera_0.ViewportSize.X / 2 - v26.X / 2;
        local v41 = nil;
        v41 = if v39 == v28.On then if v13() then v17.TopBarTopMargin + v17.TopBarButtonPadding else 4 else -v26.Y;
        if v13() and v14 then
            local v42 = v14:status():get();
            local l_Max_0 = v14:layout():get()[v42].Max;
            if l_Max_0.X + 12 > l_CurrentCamera_0.ViewportSize.X / 2 - v26.X / 2 then
                if l_Max_0.X + 24 + v26.X > l_CurrentCamera_0.ViewportSize.X then
                    if v39 == v28.On then
                        v41 = v17.TopBarHeight + 10;
                    end;
                else
                    v40 = l_Max_0.X + 12;
                end;
            end;
        end;
        v35({
            X = v9.spring(v40, v15.MENU_ANIMATION_SPRING), 
            Y = v9.spring(v41, v15.MENU_ANIMATION_SPRING)
        });
    end, {});
    v38 = v3.useCallback(function(v44) --[[ Line: 129 ]]
        if v44.Call.currentCall ~= nil then
            return v44.Call.currentCall.status;
        else
            return nil;
        end;
    end, {});
    local v45 = l_useSelector_0(v38);
    local v48 = v3.useCallback(function(v46) --[[ Line: 134 ]]
        local v47 = 0;
        if v46.Call.currentCall and v46.Call.currentCall.activeUtc then
            v47 = v46.Call.currentCall.activeUtc;
        end;
        return v47;
    end);
    local v49 = l_useSelector_0(v48);
    local v51 = v3.useCallback(function(v50) --[[ Line: 143 ]]
        if v50.Call.currentCall ~= nil then
            return v50.Call.currentCall.instanceId;
        else
            return nil;
        end;
    end);
    local v52 = l_useSelector_0(v51);
    v3.useEffect(function() --[[ Line: 148 ]]
        -- upvalues: v30 (copy), l_SoundManager_0 (ref), l_Sounds_0 (ref), l_SoundGroups_0 (ref), v31 (copy), l_RoduxCall_0 (ref)
        local v54 = v30.callProtocol:listenToHandleConnectingCall(function(v53) --[[ Line: 151 ]]
            -- upvalues: l_SoundManager_0 (ref), l_Sounds_0 (ref), l_SoundGroups_0 (ref), v31 (ref), l_RoduxCall_0 (ref)
            l_SoundManager_0:PlaySound(l_Sounds_0.Ringtone.Name, {
                Volume = 0.5, 
                Looped = true
            }, l_SoundGroups_0.Iris);
            v31(l_RoduxCall_0.Actions.UpdateCall(v53));
        end);
        local v56 = v30.callProtocol:listenToHandleTeleportingCall(function(v55) --[[ Line: 157 ]]
            -- upvalues: l_SoundManager_0 (ref), l_Sounds_0 (ref), l_SoundGroups_0 (ref), v31 (ref), l_RoduxCall_0 (ref)
            l_SoundManager_0:StopSound(l_Sounds_0.Ringtone.Name);
            l_SoundManager_0:PlaySound(l_Sounds_0.CallAccept.Name, {
                Volume = 0.5
            }, l_SoundGroups_0.Iris);
            v31(l_RoduxCall_0.Actions.UpdateCall(v55));
        end);
        local v58 = v30.callProtocol:listenToHandleActiveCall(function(v57) --[[ Line: 163 ]]
            -- upvalues: v31 (ref), l_RoduxCall_0 (ref)
            v31(l_RoduxCall_0.Actions.UpdateCall(v57));
        end);
        local v60 = v30.callProtocol:listenToHandleTransferCallTeleportJoin(function() --[[ Line: 167 ]]
            -- upvalues: v30 (ref), v31 (ref), l_RoduxCall_0 (ref)
            v30.callProtocol:getCallState():andThen(function(v59) --[[ Line: 170 ]]
                -- upvalues: v31 (ref), l_RoduxCall_0 (ref)
                v31(l_RoduxCall_0.Actions.UpdateCall(v59));
            end);
        end);
        v30.callProtocol:getCallState():andThen(function(v61) --[[ Line: 175 ]]
            -- upvalues: v31 (ref), l_RoduxCall_0 (ref)
            v31(l_RoduxCall_0.Actions.UpdateCall(v61));
        end);
        return function() --[[ Line: 179 ]]
            -- upvalues: v54 (copy), v56 (copy), v58 (copy), v60 (copy)
            v54:Disconnect();
            v56:Disconnect();
            v58:Disconnect();
            v60:Disconnect();
        end;
    end, {
        v30.callProtocol
    });
    local v62, v63 = v3.useState(false);
    if v13() and v14 then
        v3.useEffect(function() --[[ Line: 189 ]]
            -- upvalues: v14 (ref), v63 (copy)
            local v64 = v14:layout():connect(function() --[[ Line: 191 ]]
                -- upvalues: v63 (ref)
                v63(true);
            end);
            return function() --[[ Line: 195 ]]
                -- upvalues: v64 (copy)
                v64.disconnect();
            end;
        end, {});
    end;
    v3.useEffect(function() --[[ Line: 201 ]]
        -- upvalues: v45 (copy), l_RoduxCall_0 (ref), v52 (copy), v33 (copy), v37 (copy), v28 (ref), v13 (ref), v14 (ref), l_CurrentCamera_0 (ref)
        local v65 = true;
        if v45 ~= l_RoduxCall_0.Enums.Status.Connecting then
            v65 = true;
            if v45 ~= l_RoduxCall_0.Enums.Status.Teleporting then
                v65 = true;
                if v45 ~= l_RoduxCall_0.Enums.Status.Active then
                    v65 = false;
                    if v45 == l_RoduxCall_0.Enums.Status.Idle then
                        v65 = game.JobId == v52;
                    end;
                end;
            end;
        end;
        if v65 then
            v33(true);
        end;
        v37(if v65 then v28.On else v28.Off);
        local v66 = nil;
        if v13() and v14 then
            v66 = v14:status():connect(function() --[[ Line: 215 ]]
                -- upvalues: v37 (ref), v65 (copy), v28 (ref)
                v37(if v65 then v28.On else v28.Off);
            end);
        end;
        local v67 = l_CurrentCamera_0:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 221 ]]
            -- upvalues: v37 (ref), v65 (copy), v28 (ref)
            v37(if v65 then v28.On else v28.Off);
        end);
        return function() --[[ Line: 225 ]]
            -- upvalues: v13 (ref), v66 (ref), v67 (copy)
            if v13() then
                v66:disconnect();
            end;
            v67:Disconnect();
        end;
    end, {
        v45, 
        v52, 
        v62
    });
    v3.useEffect(function() --[[ Line: 234 ]]
        -- upvalues: v30 (copy), l_CallAction_0 (ref), l_SoundManager_0 (ref), l_Sounds_0 (ref), l_SoundGroups_0 (ref), v31 (copy), l_RoduxCall_0 (ref)
        local v69 = v30.callProtocol:listenToHandleEndCall(function(v68) --[[ Line: 235 ]]
            -- upvalues: l_CallAction_0 (ref), l_SoundManager_0 (ref), l_Sounds_0 (ref), l_SoundGroups_0 (ref), v31 (ref), l_RoduxCall_0 (ref)
            if v68.callAction == l_CallAction_0.Cancel then
                l_SoundManager_0:StopSound(l_Sounds_0.Ringtone.Name);
                l_SoundManager_0:PlaySound(l_Sounds_0.HangUp.Name, {
                    Volume = 0.5
                }, l_SoundGroups_0.Iris);
            elseif v68.callAction == l_CallAction_0.Decline then
                l_SoundManager_0:StopSound(l_Sounds_0.Ringtone.Name);
                l_SoundManager_0:PlaySound(l_Sounds_0.CallDecline.Name, {
                    Volume = 0.5
                }, l_SoundGroups_0.Iris);
            elseif v68.callAction == l_CallAction_0.Finish then
                l_SoundManager_0:PlaySound(l_Sounds_0.HangUp.Name, {
                    Volume = 0.5
                }, l_SoundGroups_0.Iris);
            end;
            v31(l_RoduxCall_0.Actions.UpdateCall(v68));
        end);
        return function() --[[ Line: 249 ]]
            -- upvalues: v69 (copy)
            v69:Disconnect();
        end;
    end, {
        v30.callProtocol
    });
    return if v32 then v3.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        CallBar = v3.createElement(v25, {
            size = v26, 
            activeUtc = v49, 
            position = v34:map(function(v70) --[[ Line: 263 ]]
                return UDim2.fromOffset(math.round(v70.X), (math.round(v70.Y)));
            end)
        })
    }) else nil;
end;