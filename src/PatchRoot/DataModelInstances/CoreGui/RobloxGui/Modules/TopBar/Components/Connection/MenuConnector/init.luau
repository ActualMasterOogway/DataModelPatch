local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v3 = require(l_RobloxGui_0.Modules.Common.PerfUtils);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.t);
local l_Parent_0 = script.Parent.Parent.Parent;
local v8 = require(l_Parent_0.Actions.SetMenuOpen);
local v9 = require(l_Parent_0.Actions.SetRespawnBehaviour);
local v10 = require(l_Parent_0.Parent.Common.EventConnection);
local l_RobloxGui_1 = l_CoreGui_0:WaitForChild("RobloxGui");
local v12 = require(l_RobloxGui_1.Modules.isNewInGameMenuEnabled);
local v13 = require(l_RobloxGui_1.Modules.Common.Flags.GetFFlagEnableInGameMenuDurationLogger);
local v14 = v4.PureComponent:extend("MenuConnector");
v14.validateProps = v6.strictInterface({
    setMenuOpen = v6.callback, 
    setRespawnBehaviour = v6.callback
});
v14.didMount = function(v15) --[[ Line: 32 ]] --[[ Name: didMount ]]
    -- upvalues: v12 (copy), l_RobloxGui_1 (copy)
    if v12() then
        local v16 = require(l_RobloxGui_1.Modules.InGameMenuInit);
        v15.props.setMenuOpen(v16.getOpen());
        local v17, v18 = v16.getRespawnBehaviour();
        v15.props.setRespawnBehaviour(v17, v18);
        return;
    else
        local v19 = require(l_RobloxGui_1.Modules.Settings.SettingsHub);
        v15.props.setMenuOpen(v19:GetVisibility());
        local l_v19_RespawnBehaviour_0, v21 = v19:GetRespawnBehaviour();
        v15.props.setRespawnBehaviour(l_v19_RespawnBehaviour_0, v21);
        return;
    end;
end;
v14.render = function(v22) --[[ Line: 48 ]] --[[ Name: render ]]
    -- upvalues: v12 (copy), l_RobloxGui_1 (copy), v4 (copy), v10 (copy), v13 (copy), v3 (copy)
    if v12() then
        local v23 = require(l_RobloxGui_1.Modules.InGameMenuInit);
        local v24 = v23.getOpenChangedEvent();
        local v25 = nil;
        v25 = v23.getRespawnBehaviourChangedEvent();
        return v4.createFragment({
            MenuOpenChangedConnection = v4.createElement(v10, {
                event = v24.Event, 
                callback = function(v26) --[[ Line: 60 ]] --[[ Name: callback ]]
                    -- upvalues: v22 (copy)
                    v22.props.setMenuOpen(v26);
                end
            }), 
            RespawnBehaviourConnection = v4.createElement(v10, {
                event = v25.Event, 
                callback = function(v27, v28) --[[ Line: 67 ]] --[[ Name: callback ]]
                    -- upvalues: v22 (copy)
                    v22.props.setRespawnBehaviour(v27, v28);
                end
            })
        });
    else
        local v29 = require(l_RobloxGui_1.Modules.Settings.SettingsHub);
        local l_SettingsShowEvent_0 = v29.SettingsShowEvent;
        local l_RespawnBehaviourChangedEvent_0 = v29.RespawnBehaviourChangedEvent;
        return v4.createFragment({
            MenuOpenChangedConnection = v4.createElement(v10, {
                event = l_SettingsShowEvent_0.Event, 
                callback = function(v32) --[[ Line: 81 ]] --[[ Name: callback ]]
                    -- upvalues: v13 (ref), v3 (ref), v22 (copy)
                    if v13() and v32 then
                        v3.menuOpenBegin();
                    end;
                    v22.props.setMenuOpen(v32);
                end
            }), 
            RespawnBehaviourConnection = v4.createElement(v10, {
                event = l_RespawnBehaviourChangedEvent_0.Event, 
                callback = function(v33, v34) --[[ Line: 91 ]] --[[ Name: callback ]]
                    -- upvalues: v22 (copy)
                    v22.props.setRespawnBehaviour(v33, v34);
                end
            })
        });
    end;
end;
return v5.UNSTABLE_connect2(nil, function(v35) --[[ Line: 99 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v8 (copy), v9 (copy)
    return {
        setMenuOpen = function(v36) --[[ Line: 101 ]] --[[ Name: setMenuOpen ]]
            -- upvalues: v35 (copy), v8 (ref)
            return v35(v8(v36));
        end, 
        setRespawnBehaviour = function(v37, v38) --[[ Line: 105 ]]
            -- upvalues: v35 (copy), v9 (ref)
            return v35(v9(v37, v38));
        end or nil
    };
end)(v14);