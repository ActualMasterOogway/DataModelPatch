local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Components_0 = script.Parent.Parent.Components;
local v4 = require(l_Components_0.Log.LogData);
local v5 = require(l_Components_0.Memory.ClientMemoryData);
local v6 = require(l_Components_0.Memory.ServerMemoryData);
local v7 = require(l_Components_0.Network.NetworkData);
local v8 = require(l_Components_0.Scripts.ServerScriptsData);
local v9 = require(l_Components_0.DataStores.DataStoresData);
local v10 = require(l_Components_0.ServerStats.ServerStatsData);
local v11 = require(l_Components_0.ActionBindings.ActionBindingsData);
local v12 = require(l_Components_0.ServerJobs.ServerJobsData);
local v13 = require(l_Components_0.DebugVisualizations.DebugVisualizationsData);
local v14 = require(l_Components_0.LuauHeap.LuauHeapData);
local v15 = require(l_Components_0.DataContext);
local v16 = v1.Component:extend("DataProvider");
v16.init = function(v17) --[[ Line: 22 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy), v10 (copy), v11 (copy), v12 (copy), v13 (copy), v14 (copy)
    v17:setState({
        DevConsoleData = {
            ClientLogData = v4.new(true), 
            ServerLogData = v4.new(false), 
            ClientMemoryData = v5.new(), 
            ServerMemoryData = v6.new(), 
            ClientNetworkData = v7.new(true), 
            ServerNetworkData = v7.new(false), 
            ServerScriptsData = v8.new(), 
            DataStoresData = v9.new(), 
            ServerStatsData = v10.new(), 
            ActionBindingsData = v11.new(), 
            ServerJobsData = v12.new(), 
            DebugVisualizationsData = v13.new(), 
            LuauHeapData = v14.new()
        }
    });
end;
v16.didMount = function(v18) --[[ Line: 42 ]] --[[ Name: didMount ]]
    v18.state.DevConsoleData.ClientLogData:start();
    v18.state.DevConsoleData.ClientMemoryData:start();
end;
v16.willUpdate = function(v19, v20, _) --[[ Line: 47 ]] --[[ Name: willUpdate ]]
    if v20.isDeveloperView and not v19.props.isDeveloperView then
        for _, v23 in pairs(v19.state.DevConsoleData) do
            if not v23:isRunning() then
                v23:start();
            end;
        end;
    end;
end;
v16.render = function(v24) --[[ Line: 57 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v15 (copy)
    return v1.createElement(v15.Provider, {
        value = v24.state.DevConsoleData
    }, v1.oneChild(v24.props[v1.Children]));
end;
return v2.UNSTABLE_connect2(function(v25, _) --[[ Line: 63 ]] --[[ Name: mapStateToProps ]]
    return {
        isDeveloperView = v25.MainView.isDeveloperView
    };
end, nil)(v16);