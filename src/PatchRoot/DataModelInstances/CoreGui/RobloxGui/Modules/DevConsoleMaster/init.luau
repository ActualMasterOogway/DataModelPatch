local l_CoreGui_0 = game:GetService("CoreGui");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RunService_0 = game:GetService("RunService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local v6 = require(l_CorePackages_0.Packages.Roact);
local v7 = require(l_CorePackages_0.Packages.Rodux);
local v8 = require(l_CorePackages_0.Packages.RoactRodux);
local l_DevConsole_0 = script.Parent.DevConsole;
local v10 = require(l_DevConsole_0.Constants);
local l_Components_0 = l_DevConsole_0.Components;
local v12 = require(l_Components_0.DevConsoleWindow);
local v13 = require(l_Components_0.DataProvider);
local v14 = require(l_Components_0.Log.MainViewLog);
local v15 = require(l_Components_0.Memory.MainViewMemory);
local v16 = require(l_Components_0.Network.MainViewNetwork);
local v17 = require(l_Components_0.Scripts.MainViewScripts);
local v18 = require(l_Components_0.DataStores.MainViewDataStores);
local v19 = require(l_Components_0.ServerStats.MainViewServerStats);
local v20 = require(l_Components_0.ActionBindings.MainViewActionBindings);
local v21 = require(l_Components_0.ServerJobs.MainViewServerJobs);
local v22 = require(l_Components_0.MicroProfiler.MainViewMicroProfiler);
local v23 = require(l_Components_0.ScriptProfiler.MainViewScriptProfiler);
local v24 = require(l_Components_0.DebugVisualizations.MainViewDebugVisualizations);
local v25 = require(l_Components_0.LuauHeap.MainViewLuauHeap);
local v26 = require(l_Components_0.MicroProfiler.RCCProfilerDataCompleteListener);
local v27 = require(l_DevConsole_0.Util.getClientReplicator);
local v28 = require(l_DevConsole_0.Reducers.MainView);
local v29 = require(l_DevConsole_0.Reducers.DevConsoleReducer);
local l_Actions_0 = l_DevConsole_0.Actions;
local v31 = require(l_Actions_0.SetDevConsoleVisibility);
local v32 = require(l_Actions_0.SetTabList);
local l_MiddleWare_0 = l_DevConsole_0.MiddleWare;
local v34 = require(l_MiddleWare_0.DevConsoleAnalytics);
local v35 = require(l_CoreGui_0.RobloxGui.Modules.PlayerPermissionsModule);
local l_game_EngineFeature_0 = game:GetEngineFeature("ScriptProfiler");
local v37 = require(l_CoreGui_0.RobloxGui.Modules.Flags.GetFFlagRequestServerStatsFix);
local v38 = {
    Log = {
        tab = v14, 
        layoutOrder = 1, 
        hasClientServer = true
    }, 
    Memory = {
        tab = v15, 
        layoutOrder = 2, 
        hasClientServer = true
    }, 
    Network = {
        tab = v16, 
        layoutOrder = 3, 
        hasClientServer = true
    }, 
    Scripts = {
        tab = v17, 
        layoutOrder = 4
    }, 
    DataStores = {
        tab = v18, 
        layoutOrder = 5
    }, 
    ServerStats = {
        tab = v19, 
        layoutOrder = 6
    }, 
    ActionBindings = {
        tab = v20, 
        layoutOrder = 7
    }, 
    ServerJobs = {
        tab = v21, 
        layoutOrder = 8
    }, 
    MicroProfiler = {
        tab = v22, 
        layoutOrder = 9
    }, 
    DebugVisualizations = {
        tab = v24, 
        layoutOrder = 10
    }, 
    ScriptProfiler = if l_game_EngineFeature_0 then {
        tab = v23, 
        layoutOrder = 11
    } else nil, 
    LuauHeap = {
        tab = v25, 
        layoutOrder = 12
    }
};
local v39 = {
    Log = {
        tab = v14, 
        layoutOrder = 1
    }, 
    Memory = {
        tab = v15, 
        layoutOrder = 2
    }, 
    ScriptProfiler = if l_game_EngineFeature_0 then {
        tab = v23, 
        layoutOrder = 3
    } else nil, 
    LuauHeap = {
        tab = v25, 
        layoutOrder = 4
    }
};
local v40 = {
    Log = {
        tab = v14, 
        layoutOrder = 1
    }, 
    Memory = {
        tab = v15, 
        layoutOrder = 2
    }
};
local v41 = {};
v41.__index = v41;
local v42 = {
    [Enum.Platform.Windows] = v10.FormFactor.Large, 
    [Enum.Platform.OSX] = v10.FormFactor.Large, 
    [Enum.Platform.IOS] = v10.FormFactor.Small, 
    [Enum.Platform.Android] = v10.FormFactor.Small, 
    [Enum.Platform.XBoxOne] = v10.FormFactor.Console, 
    [Enum.Platform.PS4] = v10.FormFactor.Console, 
    [Enum.Platform.PS3] = v10.FormFactor.Console, 
    [Enum.Platform.XBox360] = v10.FormFactor.Console, 
    [Enum.Platform.WiiU] = v10.FormFactor.Console, 
    [Enum.Platform.NX] = v10.FormFactor.Console, 
    [Enum.Platform.Ouya] = v10.FormFactor.Console, 
    [Enum.Platform.AndroidTV] = v10.FormFactor.Console, 
    [Enum.Platform.Chromecast] = v10.FormFactor.Console, 
    [Enum.Platform.Linux] = v10.FormFactor.Large, 
    [Enum.Platform.SteamOS] = v10.FormFactor.Console, 
    [Enum.Platform.WebOS] = v10.FormFactor.Large, 
    [Enum.Platform.DOS] = v10.FormFactor.Large, 
    [Enum.Platform.BeOS] = v10.FormFactor.Large, 
    [Enum.Platform.UWP] = v10.FormFactor.Large, 
    [Enum.Platform.None] = v10.FormFactor.Large
};
local function _() --[[ Line: 165 ]] --[[ Name: isAdminAsync ]]
    -- upvalues: v35 (copy), l_Players_0 (copy)
    return v35.IsPlayerAdminAsync(l_Players_0.LocalPlayer);
end;
local function _() --[[ Line: 169 ]] --[[ Name: isDeveloper ]]
    -- upvalues: l_RunService_0 (copy), v35 (copy), l_Players_0 (copy)
    if l_RunService_0:IsStudio() then
        return true;
    elseif v35.CanPlayerManagePlaceAsync(l_Players_0.LocalPlayer) then
        return true;
    else
        return false;
    end;
end;
v41.new = function() --[[ Line: 180 ]] --[[ Name: new ]]
    -- upvalues: v41 (copy)
    local v45 = {};
    setmetatable(v45, v41);
    v45.init = false;
    v45.isDeveloperTabListActive = false;
    v45.waitForStart = true;
    v45.waitForStartBindable = Instance.new("BindableEvent");
    coroutine.wrap(function() --[[ Line: 190 ]]
        -- upvalues: v45 (copy)
        v45:SetupDevConsole();
    end)();
    return v45;
end;
v41.SetupDevConsole = function(v46) --[[ Line: 197 ]] --[[ Name: SetupDevConsole ]]
    -- upvalues: l_UserInputService_0 (copy), v42 (copy), v28 (copy), v32 (copy), v40 (copy), v34 (copy), v7 (copy), v29 (copy), v6 (copy), v8 (copy), v13 (copy), v12 (copy), v10 (copy), v26 (copy)
    local v47 = v42[l_UserInputService_0:GetPlatform()];
    local v48 = {
        MainView = v28(nil, v32(v40, "Log"))
    };
    local v49 = {
        v34
    };
    v46.store = v7.Store.new(v29, v48, v49);
    local l_isVisible_0 = v46.store:getState().DisplayOptions.isVisible;
    v46.root = v6.createElement(v8.StoreProvider, {
        store = v46.store
    }, {
        DataProvider = v6.createElement(v13, {
            isDeveloperView = false
        }, {
            App = v6.createElement("ScreenGui", {
                OnTopOfCoreBlur = true, 
                DisplayOrder = 10
            }, {
                DevConsoleWindow = v6.createElement(v12, {
                    formFactor = v47, 
                    isDeveloperView = false, 
                    isVisible = l_isVisible_0, 
                    isMinimized = false, 
                    position = v10.MainWindowInit.Position, 
                    size = v10.MainWindowInit.Size, 
                    tabList = v40, 
                    onCloseCallback = function(v51) --[[ Line: 232 ]] --[[ Name: onCloseCallback ]]
                        -- upvalues: v46 (copy)
                        v46:SetServerStatsConnection(v51);
                    end
                }), 
                RCCProfilerDataCompleteListener = v6.createElement(v26)
            })
        })
    });
    v46.waitForStart = false;
    v46.waitForStartBindable:Fire();
end;
local v52 = v41.new();
v41.Start = function(v53) --[[ Line: 248 ]] --[[ Name: Start ]]
    -- upvalues: v6 (copy), l_CoreGui_0 (copy), v27 (copy), v35 (copy), l_Players_0 (copy), v32 (copy), v39 (copy), v38 (copy), v37 (copy)
    if not v53.init then
        if v53.waitForStart then
            v53.waitForStartBindable.Event:Wait();
        end;
        v53.init = true;
        v53.element = v6.mount(v53.root, l_CoreGui_0, "DevConsoleMaster");
        local v54 = v27();
        task.spawn(function() --[[ Line: 258 ]]
            -- upvalues: v35 (ref), l_Players_0 (ref), v53 (copy), v32 (ref), v39 (ref)
            if v35.IsPlayerAdminAsync(l_Players_0.LocalPlayer) and not v53.isDeveloperTabListActive then
                v53.store:dispatch(v32(v39, "Log", false));
            end;
        end);
        if v54 then
            v53._statsConnector = v54.StatsReceived:connect(function(_) --[[ Line: 266 ]]
                -- upvalues: v53 (copy), v32 (ref), v38 (ref)
                if not v53._statsConnector then
                    return;
                else
                    v53._statsConnector:Disconnect();
                    v53._statsConnector = nil;
                    v53.isDeveloperTabListActive = true;
                    v53.store:dispatch(v32(v38, "Log", true));
                    return;
                end;
            end);
            if v37() then
                v53:SetServerStatsConnection(true);
                return;
            else
                v54:RequestServerStats(true);
            end;
        end;
    end;
end;
v41.ToggleVisibility = function(v56) --[[ Line: 286 ]] --[[ Name: ToggleVisibility ]]
    -- upvalues: v52 (copy), v37 (copy), v31 (copy)
    if not v56.init then
        v52:Start();
    end;
    local v57 = not v56.store:getState().DisplayOptions.isVisible;
    if v37() then
        v56:SetVisibility(v57);
        return;
    else
        v56.store:dispatch(v31(v57));
        return;
    end;
end;
v41.GetVisibility = function(v58) --[[ Line: 299 ]] --[[ Name: GetVisibility ]]
    if not v58.init then
        return false;
    else
        local v59 = v58.store:getState();
        if v59 and v59.DisplayOptions then
            return v59.DisplayOptions.isVisible and not v59.DisplayOptions.isMinimized;
        else
            return false;
        end;
    end;
end;
v41.SetServerStatsConnection = function(_, v61) --[[ Line: 314 ]] --[[ Name: SetServerStatsConnection ]]
    -- upvalues: v27 (copy)
    local v62 = v27();
    if v62 then
        v62:RequestServerStats(v61);
    end;
end;
v41.SetVisibility = function(v63, v64) --[[ Line: 321 ]] --[[ Name: SetVisibility ]]
    -- upvalues: v52 (copy), v37 (copy), v31 (copy)
    if type(v64) == "boolean" then
        if not v63.init and v64 then
            v52:Start();
        end;
        if v37() then
            v63:SetServerStatsConnection(v64);
        end;
        v63.store:dispatch(v31(v64));
    end;
end;
l_StarterGui_0:RegisterGetCore("DevConsoleVisible", function() --[[ Line: 335 ]]
    -- upvalues: v52 (copy)
    return v52:GetVisibility();
end);
l_StarterGui_0:RegisterSetCore("DevConsoleVisible", function(v65) --[[ Line: 339 ]]
    -- upvalues: v52 (copy)
    if type(v65) ~= "boolean" then
        error("DevConsoleVisible must be given a boolean value.");
    end;
    v52:SetVisibility(v65);
end);
return v52;