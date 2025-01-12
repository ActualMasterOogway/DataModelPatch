local l_Parent_0 = script.Parent.Parent;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local v2 = require(script.Parent.ReactWorkTags);
local _ = require(script.Parent.ReactInternalTypes);
local l_status_0, l_result_0 = pcall(function() --[[ Line: 29 ]]
    return game:DefineFastInt("ReactMicroprofilerLevel2", 0);
end);
if not l_status_0 then
    l_result_0 = 0;
end;
noop = function(...) --[[ Line: 43 ]] --[[ Name: noop ]]

end;
local v6 = false;
local v7 = nil;
local v8 = 0;
local v9 = 0;
if l_result_0 >= 5 then
    game:GetService("RunService").RenderStepped:Connect(function() --[[ Line: 53 ]]
        -- upvalues: v8 (ref)
        v8 = (v8 + 1) % 10000;
    end);
end;
local v10 = if l_result_0 >= 5 then {
    profilebegin = function(...) --[[ Line: 60 ]] --[[ Name: profilebegin ]]
        -- upvalues: v9 (ref), v8 (ref)
        v9 = v8;
        debug.profilebegin(...);
    end, 
    profileend = function() --[[ Line: 64 ]] --[[ Name: profileend ]]
        -- upvalues: v9 (ref), v8 (ref)
        if v9 == v8 then
            debug.profileend();
        end;
    end
} else {
    profilebegin = noop, 
    profileend = noop
};
startTimerSampling = function(v11) --[[ Line: 75 ]] --[[ Name: startTimerSampling ]]
    -- upvalues: v6 (ref), v7 (ref)
    if v6 then
        warn("RobloxReactProfiling Timer Sampling already running.");
    end;
    v6 = true;
    v7 = v11;
end;
endTimerSampling = function() --[[ Line: 83 ]] --[[ Name: endTimerSampling ]]
    -- upvalues: v6 (ref), v7 (ref)
    v6 = false;
    v7 = nil;
end;
getFirstStringKey = function(v12) --[[ Line: 88 ]] --[[ Name: getFirstStringKey ]]
    for v13, _ in v12 do
        if type(v13) == "string" then
            return v13;
        end;
    end;
    return nil;
end;
startTimer = function(v15) --[[ Line: 97 ]] --[[ Name: startTimer ]]
    -- upvalues: v6 (ref)
    if v6 then
        v15.startTime = os.clock();
    end;
end;
endTimer = function(v16) --[[ Line: 102 ]] --[[ Name: endTimer ]]
    -- upvalues: v6 (ref), v7 (ref)
    if v6 then
        v16.endTime = os.clock();
        if v7 then
            v7(v16);
        end;
    end;
end;
profileRootBeforeUnitOfWork = function(v17) --[[ Line: 111 ]] --[[ Name: profileRootBeforeUnitOfWork ]]
    -- upvalues: v10 (copy)
    local l_current_0 = v17.current;
    local v19 = nil;
    if l_current_0 then
        if l_current_0.memoizedProps then
            v19 = getFirstStringKey(l_current_0.memoizedProps);
        end;
        if v19 == nil and l_current_0.stateNode and l_current_0.stateNode.containerInfo then
            v19 = l_current_0.stateNode.containerInfo.Name;
        end;
    end;
    if v19 == "Folder" and l_current_0.child then
        local l_child_0 = l_current_0.child;
        local v21 = nil;
        if l_child_0.memoizedProps then
            v21 = getFirstStringKey(l_child_0.memoizedProps);
        end;
        if v21 == nil and l_child_0.stateNode and l_child_0.stateNode.containerInfo then
            v21 = l_child_0.stateNode.containerInfo.Name;
        end;
        if v21 ~= nil then
            v19 = v21;
        end;
    end;
    if v19 ~= nil then
        local v22 = {
            id = v19, 
            startTime = 0, 
            endTime = 0
        };
        startTimer(v22);
        v10.profilebegin(v19);
        return v22;
    else
        return nil;
    end;
end;
profileRootAfterYielding = function(v23) --[[ Line: 165 ]] --[[ Name: profileRootAfterYielding ]]
    -- upvalues: v10 (copy)
    if v23 then
        endTimer(v23);
        v10.profileend();
    end;
end;
profileUnitOfWorkBefore = function(v24) --[[ Line: 172 ]] --[[ Name: profileUnitOfWorkBefore ]]
    -- upvalues: l_getComponentName_0 (copy), v2 (copy), v10 (copy)
    local v25 = l_getComponentName_0(v24.type);
    if v24.key then
        v25 = tostring(v24.key) .. "=" .. (v25 or "?");
    end;
    local v26 = nil;
    if v24.stateNode and (v24.tag == v2.HostComponent or v24.tag == v2.HostText) then
        local l_FirstAncestorWhichIsA_0 = v24.stateNode:FindFirstAncestorWhichIsA("LayerCollector");
        if l_FirstAncestorWhichIsA_0 then
            v26 = "[" .. l_FirstAncestorWhichIsA_0:GetFullName() .. "] ";
        end;
    end;
    if v26 then
        v25 = v26 .. " : " .. (v25 or "?");
    end;
    if v25 ~= nil then
        v10.profilebegin(v25);
        return true;
    else
        return false;
    end;
end;
profileUnitOfWorkAfter = function(v28) --[[ Line: 205 ]] --[[ Name: profileUnitOfWorkAfter ]]
    -- upvalues: v10 (copy)
    if v28 then
        v10.profileend();
    end;
end;
profileCommitBefore = function() --[[ Line: 211 ]] --[[ Name: profileCommitBefore ]]
    -- upvalues: v10 (copy)
    v10.profilebegin("Commit");
end;
profileCommitAfter = function() --[[ Line: 214 ]] --[[ Name: profileCommitAfter ]]
    -- upvalues: v10 (copy)
    v10.profileend();
end;
return {
    startTimerSampling = startTimerSampling, 
    endTimerSampling = endTimerSampling, 
    profileRootBeforeUnitOfWork = if l_result_0 >= 1 then profileRootBeforeUnitOfWork else noop, 
    profileRootAfterYielding = if l_result_0 >= 1 then profileRootAfterYielding else noop, 
    profileUnitOfWorkBefore = if l_result_0 >= 10 then profileUnitOfWorkBefore else noop, 
    profileUnitOfWorkAfter = if l_result_0 >= 10 then profileUnitOfWorkAfter else noop, 
    profileCommitBefore = if l_result_0 >= 5 then profileCommitBefore else noop, 
    profileCommitAfter = if l_result_0 >= 5 then profileCommitAfter else noop
};