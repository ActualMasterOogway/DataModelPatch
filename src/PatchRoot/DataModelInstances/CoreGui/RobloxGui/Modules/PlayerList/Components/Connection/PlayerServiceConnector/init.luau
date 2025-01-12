local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Parent_0 = script.Parent.Parent.Parent;
local v5 = require(l_Parent_0.Actions.AddPlayer);
local v6 = require(l_Parent_0.Actions.RemovePlayer);
local v7 = require(l_Parent_0.Thunks.MakePlayerInfoRequests);
local v8 = require(script.Parent.EventConnection);
local v9 = v2.PureComponent:extend("PlayerServiceConnector");
v9.didMount = function(v10) --[[ Line: 19 ]] --[[ Name: didMount ]]
    -- upvalues: l_Players_0 (copy)
    local l_l_Players_0_Players_0 = l_Players_0:GetPlayers();
    for _, v13 in ipairs(l_l_Players_0_Players_0) do
        v10.props.addPlayer(v13);
        v10.props.makePlayerInfoRequests(v13);
    end;
end;
v9.render = function(v14) --[[ Line: 27 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v8 (copy), l_Players_0 (copy)
    return v2.createFragment({
        PlayerAddedConnection = v2.createElement(v8, {
            event = l_Players_0.PlayerAdded, 
            callback = function(v15) --[[ Line: 31 ]] --[[ Name: callback ]]
                -- upvalues: v14 (copy)
                v14.props.addPlayer(v15);
                v14.props.makePlayerInfoRequests(v15);
            end
        }), 
        PlayerRemovingConnection = v2.createElement(v8, {
            event = l_Players_0.PlayerRemoving, 
            callback = function(v16) --[[ Line: 39 ]] --[[ Name: callback ]]
                -- upvalues: v14 (copy)
                v14.props.removePlayer(v16);
            end
        })
    });
end;
v9.willUnmount = function(v17) --[[ Line: 46 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_Players_0 (copy)
    local l_l_Players_0_Players_1 = l_Players_0:GetPlayers();
    for _, v20 in ipairs(l_l_Players_0_Players_1) do
        v17.props.removePlayer(v20);
    end;
end;
return v3.connect(nil, function(v21) --[[ Line: 53 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v5 (copy), v7 (copy), v6 (copy)
    return {
        addPlayer = function(v22) --[[ Line: 55 ]] --[[ Name: addPlayer ]]
            -- upvalues: v21 (copy), v5 (ref)
            return v21(v5(v22));
        end, 
        makePlayerInfoRequests = function(v23) --[[ Line: 59 ]] --[[ Name: makePlayerInfoRequests ]]
            -- upvalues: v21 (copy), v7 (ref)
            return v21(v7(v23));
        end, 
        removePlayer = function(v24) --[[ Line: 63 ]] --[[ Name: removePlayer ]]
            -- upvalues: v21 (copy), v6 (ref)
            return v21(v6(v24));
        end
    };
end)(v9);