local l_CorePackages_0 = game:GetService("CorePackages");
local l_Cryo_0 = require(l_CorePackages_0.Packages.InGameMenuDependencies).Cryo;
local l_Parent_0 = script.Parent;
local v3 = require(l_Parent_0.Actions.SetMenuOpen);
local v4 = require(l_Parent_0.Actions.SetMainPageMoreMenuOpen);
local v5 = require(l_Parent_0.Actions.SetCurrentPage);
local v6 = require(l_Parent_0.Actions.SetScreenSize);
local v7 = require(l_Parent_0.Actions.StartLeavingGame);
local v8 = require(l_Parent_0.Actions.CancelLeavingGame);
local v9 = require(l_Parent_0.Actions.SetControlLayout);
local v10 = require(l_Parent_0.Actions.SetVideoRecording);
local v11 = require(l_Parent_0.Actions.SetRespawning);
local v12 = require(l_Parent_0.Actions.SetCurrentZone);
local v13 = require(l_Parent_0.Actions.SetControllerBarHeight);
local v14 = require(l_Parent_0.Actions.DecrementControllerBar);
local v15 = require(l_Parent_0.Actions.IncrementControllerBar);
local v16 = require(script.navigationReducer);
local v17 = require(script.respawn);
local v18 = require(script.invites);
local v19 = require(script.gameInfo);
local v20 = require(script.report);
local v21 = require(script.friends);
local v22 = require(script.displayOptions);
local v23 = require(script.nativeClosePrompt);
local v24 = require(l_Parent_0.Parent.VoiceChat.Reducers.voiceState);
local v25 = require(l_Parent_0.Flags.FFlagRecordRecording);
local v26 = require(l_Parent_0.Resources.Constants);
local v27 = require(l_Parent_0.Resources.Controls);
local v57 = {
    [v3.name] = function(v28, v29) --[[ Line: 39 ]]
        -- upvalues: l_Cryo_0 (copy)
        local v30 = nil;
        if not v29.isMenuOpen then
            v30 = false;
        end;
        return l_Cryo_0.Dictionary.join(v28, {
            isMenuOpen = v29.isMenuOpen, 
            isMainPageMoreMenuOpen = v30, 
            currentZone = v28.isMenuOpen ~= v29.isMenuOpen and 1 or nil
        });
    end, 
    [v4.name] = function(v31, v32) --[[ Line: 52 ]]
        -- upvalues: l_Cryo_0 (copy)
        return l_Cryo_0.Dictionary.join(v31, {
            isMainPageMoreMenuOpen = v32.isMainPageMoreMenuOpen
        });
    end, 
    [v7.name] = function(v33, _) --[[ Line: 57 ]]
        -- upvalues: l_Cryo_0 (copy)
        return l_Cryo_0.Dictionary.join(v33, {
            leavingGame = true
        });
    end, 
    [v8.name] = function(v35, _) --[[ Line: 62 ]]
        -- upvalues: l_Cryo_0 (copy)
        return l_Cryo_0.Dictionary.join(v35, {
            leavingGame = false
        });
    end, 
    [v5.name] = function(v37, v38) --[[ Line: 67 ]]
        -- upvalues: l_Cryo_0 (copy), v26 (copy)
        return l_Cryo_0.Dictionary.join(v37, {
            menuPage = v38.newPage, 
            isMainPageMoreMenuOpen = false, 
            currentZone = v38.newPage == v26.InitalPageKey and 0 or 1
        });
    end, 
    [v9.name] = function(v39, v40) --[[ Line: 75 ]]
        -- upvalues: l_Cryo_0 (copy)
        local l_controlLayout_0 = v40.controlLayout;
        return l_Cryo_0.Dictionary.join(v39, {
            controlLayout = l_controlLayout_0
        });
    end, 
    [v6.name] = function(v42, v43) --[[ Line: 82 ]]
        -- upvalues: l_Cryo_0 (copy)
        return l_Cryo_0.Dictionary.join(v42, {
            screenSize = v43.newScreenSize
        });
    end, 
    [v10.name] = v25 and function(v44, v45) --[[ Line: 87 ]]
        -- upvalues: l_Cryo_0 (copy)
        return l_Cryo_0.Dictionary.join(v44, {
            recording = v45.recording
        });
    end or nil, 
    [v11.name] = function(v46, v47) --[[ Line: 92 ]]
        -- upvalues: l_Cryo_0 (copy)
        local v48 = nil;
        v48 = not v47.respawning and v46.isMainPageMoreMenuOpen;
        return l_Cryo_0.Dictionary.join(v46, {
            isMainPageMoreMenuOpen = v48
        });
    end, 
    [v12.name] = function(v49, v50) --[[ Line: 104 ]]
        -- upvalues: l_Cryo_0 (copy)
        return l_Cryo_0.Dictionary.join(v49, {
            currentZone = v50.zone
        });
    end, 
    [v13.name] = function(v51, v52) --[[ Line: 109 ]]
        -- upvalues: l_Cryo_0 (copy)
        return l_Cryo_0.Dictionary.join(v51, {
            controllerBarHeight = v52.controllerBarHeight
        });
    end, 
    [v15.name] = function(v53, _) --[[ Line: 114 ]]
        -- upvalues: l_Cryo_0 (copy)
        return l_Cryo_0.Dictionary.join(v53, {
            controllerBarCount = v53.controllerBarCount + 1
        });
    end, 
    [v14.name] = function(v55, _) --[[ Line: 119 ]]
        -- upvalues: l_Cryo_0 (copy)
        return l_Cryo_0.Dictionary.join(v55, {
            controllerBarCount = v55.controllerBarCount - 1
        });
    end
};
return function(v58, v59) --[[ Line: 126 ]] --[[ Name: reducer ]]
    -- upvalues: v27 (copy), v26 (copy), v18 (copy), v17 (copy), v19 (copy), v21 (copy), v22 (copy), v23 (copy), v57 (copy), v16 (copy), v24 (copy), v20 (copy)
    if v58 == nil then
        v58 = {
            controlLayout = v27.ControlLayouts.KEYBOARD, 
            isMenuOpen = false, 
            leavingGame = false, 
            currentZone = nil, 
            menuPage = v26.defaultPageKey, 
            voiceState = nil, 
            invites = v18(nil, v59), 
            respawn = v17(nil, v59), 
            gameInfo = v19(nil, v59), 
            friends = v21(nil, v59), 
            displayOptions = v22(nil, v59), 
            screenSize = Vector2.new(0, 0), 
            recording = false, 
            isMainPageMoreMenuOpen = false, 
            nativeClosePrompt = v23(nil, v59), 
            controllerBarHeight = 0, 
            controllerBarCount = 0
        };
    end;
    local v60 = v57[v59.type];
    if v60 ~= nil then
        v58 = v60(v58, v59);
    end;
    v58 = v16(v58, v59);
    v58.respawn = v17(v58.respawn, v59);
    v58.invites = v18(v58.invites, v59);
    v58.voiceState = v24(v58.voiceState, v59);
    v58.gameInfo = v19(v58.gameInfo, v59);
    v58.report = v20(v58.report, v59);
    v58.friends = v21(v58.friends, v59);
    v58.displayOptions = v22(v58.displayOptions, v59);
    v58.nativeClosePrompt = v23(v58.nativeClosePrompt, v59);
    return v58;
end;