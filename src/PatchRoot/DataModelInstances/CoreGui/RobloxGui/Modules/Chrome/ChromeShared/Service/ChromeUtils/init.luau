local l_CorePackages_0 = game:GetService("CorePackages");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v4 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local l_GetFFlagRemoveChromeRobloxGuiReferences_0 = v4.GetFFlagRemoveChromeRobloxGuiReferences;
local v7 = {
    Unavailable = 0, 
    Loading = 1, 
    Available = 2, 
    Pinned = 3
};
local v8 = {};
v8.__index = v8;
v8.new = function(v9) --[[ Line: 34 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy), l_Signal_0 (copy), v8 (copy)
    return (setmetatable({
        _state = v9 or v7.Unavailable, 
        _changeSignal = l_Signal_0.new()
    }, v8));
end;
v8.connect = function(v10, v11) --[[ Line: 42 ]] --[[ Name: connect ]]
    return v10._changeSignal:connect(v11);
end;
v8.set = function(v12, v13) --[[ Line: 46 ]] --[[ Name: set ]]
    if v12._state ~= v13 then
        v12._state = v13;
        v12._changeSignal:fire(v13);
    end;
end;
v8.get = function(v14) --[[ Line: 53 ]] --[[ Name: get ]]
    return v14._state;
end;
v8.available = function(v15) --[[ Line: 57 ]] --[[ Name: available ]]
    -- upvalues: v7 (copy)
    v15:set(v7.Available);
end;
v8.loading = function(v16) --[[ Line: 61 ]] --[[ Name: loading ]]
    -- upvalues: v7 (copy)
    v16:set(v7.Loading);
end;
v8.unavailable = function(v17) --[[ Line: 65 ]] --[[ Name: unavailable ]]
    -- upvalues: v7 (copy)
    v17:set(v7.Unavailable);
end;
v8.pinned = function(v18) --[[ Line: 69 ]] --[[ Name: pinned ]]
    -- upvalues: v7 (copy)
    v18:set(v7.Pinned);
end;
local v19 = {};
v19.__index = v19;
v19.new = function(v20) --[[ Line: 89 ]] --[[ Name: new ]]
    -- upvalues: l_Signal_0 (copy), v19 (copy)
    return (setmetatable({
        _value = {
            type = "empty", 
            value = nil
        }, 
        _changeSignal = l_Signal_0.new(), 
        _excludeFromTotalCounts = v20 or false
    }, v19));
end;
v19.setExcludeFromTotalCounts = function(v21, v22) --[[ Line: 98 ]] --[[ Name: setExcludeFromTotalCounts ]]
    v21._excludeFromTotalCounts = v22;
end;
v19.excludeFromTotalCounts = function(v23) --[[ Line: 102 ]] --[[ Name: excludeFromTotalCounts ]]
    return v23._excludeFromTotalCounts;
end;
v19.connect = function(v24, v25) --[[ Line: 106 ]] --[[ Name: connect ]]
    return v24._changeSignal:connect(v25);
end;
v19.get = function(v26) --[[ Line: 110 ]] --[[ Name: get ]]
    return v26._value;
end;
v19.clear = function(v27) --[[ Line: 114 ]] --[[ Name: clear ]]
    if v27._value and v27._value.type ~= "empty" then
        v27._value = {
            type = "empty", 
            value = nil
        };
        v27._changeSignal:fire(v27._value);
    end;
end;
v19.fireCount = function(v28, v29) --[[ Line: 121 ]] --[[ Name: fireCount ]]
    local v30 = {
        type = "count", 
        value = v29
    };
    if v28._value ~= v30 then
        v28._value = v30;
        v28._changeSignal:fire(v28._value);
    end;
end;
local v31 = {};
v31.__index = v31;
v31.new = function(v32) --[[ Line: 143 ]] --[[ Name: new ]]
    -- upvalues: l_Signal_0 (copy), v31 (copy)
    return (setmetatable({
        _value = v32, 
        _changeSignal = l_Signal_0.new()
    }, v31));
end;
v31.get = function(v33) --[[ Line: 150 ]] --[[ Name: get ]]
    return v33._value;
end;
v31.setMomentary = function(v34, v35, v36, v37) --[[ Line: 154 ]] --[[ Name: setMomentary ]]
    if v34._value ~= v35 then
        v34._value = v35;
        v34._changeSignal:fire(v35);
    end;
    local l__momentaryClearThread_0 = v34._momentaryClearThread;
    if l__momentaryClearThread_0 then
        task.cancel(l__momentaryClearThread_0);
    end;
    v34._momentaryClearThread = task.delay(v36, function() --[[ Line: 166 ]]
        -- upvalues: v34 (copy), v37 (copy)
        v34._momentaryClearThread = nil;
        v34.set(v34, v37);
    end);
end;
v31.set = function(v39, v40) --[[ Line: 173 ]] --[[ Name: set ]]
    local l__momentaryClearThread_1 = v39._momentaryClearThread;
    if l__momentaryClearThread_1 then
        task.cancel(l__momentaryClearThread_1);
        v39._momentaryClearThread = nil;
    end;
    if v39._value ~= v40 then
        v39._value = v40;
        v39._changeSignal:fire(v40);
    end;
end;
v31.signal = function(v42) --[[ Line: 186 ]] --[[ Name: signal ]]
    return v42._changeSignal;
end;
v31.connect = function(v43, v44, v45) --[[ Line: 190 ]] --[[ Name: connect ]]
    local v46 = v43._changeSignal:connect(v44);
    if v45 == true then
        v44(v43._value);
    end;
    return v46;
end;
local v47 = {};
v47.__index = v47;
v47.new = function(v48, v49, v50) --[[ Line: 222 ]] --[[ Name: new ]]
    -- upvalues: v47 (copy)
    if not v48 then
        error("No signal provided to MappedSignal");
    end;
    if not v49 then
        error("No fetchMapFunction provided to MappedSignal");
    end;
    return (setmetatable({
        _signal = v48, 
        _fetchMapFunction = v49, 
        _eventReceiver = v50
    }, v47));
end;
v47.connect = function(v51, v52) --[[ Line: 236 ]] --[[ Name: connect ]]
    if not v51._signal then
        warn("MappedSignal: Missing signal");
        return function() --[[ Line: 239 ]]

        end;
    else
        return v51._signal:connect(function(...) --[[ Line: 241 ]]
            -- upvalues: v51 (copy), v52 (copy)
            if v51._eventReceiver then
                v51._eventReceiver(...);
            end;
            v52(v51._fetchMapFunction());
        end);
    end;
end;
v47.get = function(v53) --[[ Line: 249 ]] --[[ Name: get ]]
    return v53._fetchMapFunction();
end;
setCoreGuiAvailability = function(v54, v55, v56) --[[ Line: 253 ]] --[[ Name: setCoreGuiAvailability ]]
    -- upvalues: l_StarterGui_0 (copy)
    local function v58() --[[ Line: 258 ]] --[[ Name: updateAvailable ]]
        -- upvalues: l_StarterGui_0 (ref), v55 (copy), v56 (copy), v54 (copy)
        local l_l_StarterGui_0_CoreGuiEnabled_0 = l_StarterGui_0:GetCoreGuiEnabled(v55);
        if v56 then
            v56(l_l_StarterGui_0_CoreGuiEnabled_0);
            return;
        elseif l_l_StarterGui_0_CoreGuiEnabled_0 then
            v54.availability:available();
            return;
        else
            v54.availability:unavailable();
            return;
        end;
    end;
    local v59 = l_StarterGui_0.CoreGuiChangedSignal:Connect(v58);
    local l_l_StarterGui_0_CoreGuiEnabled_1 = l_StarterGui_0:GetCoreGuiEnabled(v55);
    if v56 then
        v56(l_l_StarterGui_0_CoreGuiEnabled_1);
        return v59;
    elseif l_l_StarterGui_0_CoreGuiEnabled_1 then
        v54.availability:available();
        return v59;
    else
        v54.availability:unavailable();
        return v59;
    end;
end;
dismissRobloxMenuAndRun = function(v61) --[[ Line: 276 ]] --[[ Name: dismissRobloxMenuAndRun ]]
    -- upvalues: l_GetFFlagRemoveChromeRobloxGuiReferences_0 (copy), l_RobloxGui_0 (copy), l_GuiService_0 (copy)
    if l_GetFFlagRemoveChromeRobloxGuiReferences_0() then
        return;
    else
        local v62 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
        if l_GuiService_0.MenuIsOpen then
            local v63 = tick() + 3;
            local v64 = nil;
            v64 = l_GuiService_0.MenuClosed:Connect(function() --[[ Line: 285 ]]
                -- upvalues: v64 (ref), v63 (copy), v61 (copy)
                if v64 then
                    v64:Disconnect();
                    v64 = nil;
                end;
                if tick() < v63 then
                    v61(true);
                end;
            end);
            v62:SetVisibility(false);
            return;
        else
            v61(false);
            return;
        end;
    end;
end;
return {
    MappedSignal = v47, 
    AvailabilitySignal = v8, 
    AvailabilitySignalState = v7, 
    NotifySignal = v19, 
    ObservableValue = v31, 
    setCoreGuiAvailability = setCoreGuiAvailability, 
    dismissRobloxMenuAndRun = dismissRobloxMenuAndRun
};