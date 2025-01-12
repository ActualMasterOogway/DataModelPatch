local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_BlockedStatusChangedEvent_0 = require(l_RobloxGui_0.Modules.BlockingUtility):GetBlockedStatusChangedEvent();
local l_Parent_0 = script.Parent.Parent.Parent;
local v9 = require(l_Parent_0.Actions.SetPerformanceStatsVisible);
local v10 = require(l_Parent_0.Actions.SetPlayerIsBlocked);
local v11 = require(script.Parent.EventConnection);
local v12 = v3.PureComponent:extend("CoreGuiConnector");
v12.didMount = function(v13) --[[ Line: 24 ]] --[[ Name: didMount ]]
    -- upvalues: l_UserGameSettings_0 (copy)
    v13.props.setPerformanceStatsVisible(l_UserGameSettings_0.PerformanceStatsVisible);
end;
v12.render = function(v14) --[[ Line: 28 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v11 (copy), l_UserGameSettings_0 (copy), l_BlockedStatusChangedEvent_0 (copy), l_Players_0 (copy)
    return v3.createFragment({
        PerformanceStatsChangedConnection = v3.createElement(v11, {
            event = l_UserGameSettings_0.PerformanceStatsVisibleChanged, 
            callback = function(v15) --[[ Line: 32 ]] --[[ Name: callback ]]
                -- upvalues: v14 (copy)
                v14.props.setPerformanceStatsVisible(v15);
            end
        }), 
        BlockedStatusChangedConnection = v3.createElement(v11, {
            event = l_BlockedStatusChangedEvent_0, 
            callback = function(v16, v17) --[[ Line: 39 ]] --[[ Name: callback ]]
                -- upvalues: l_Players_0 (ref), v14 (copy)
                local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v16);
                if l_l_Players_0_PlayerByUserId_0 then
                    v14.props.setPlayerIsBlocked(l_l_Players_0_PlayerByUserId_0, v17);
                end;
            end
        })
    });
end;
return v4.connect(nil, function(v19) --[[ Line: 49 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v9 (copy), v10 (copy)
    return {
        setPerformanceStatsVisible = function(v20) --[[ Line: 51 ]] --[[ Name: setPerformanceStatsVisible ]]
            -- upvalues: v19 (copy), v9 (ref)
            return v19(v9(v20));
        end, 
        setPlayerIsBlocked = function(v21, v22) --[[ Line: 55 ]] --[[ Name: setPlayerIsBlocked ]]
            -- upvalues: v19 (copy), v10 (ref)
            return v19(v10(v21, v22));
        end
    };
end)(v12);