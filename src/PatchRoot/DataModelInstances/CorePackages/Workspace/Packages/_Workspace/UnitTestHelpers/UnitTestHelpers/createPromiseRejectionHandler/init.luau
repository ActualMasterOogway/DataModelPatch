local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Promise);
local v3 = game:DefineFastFlag("DummyFFlagPromiseRejectionFlagState", false);
local function _(v4) --[[ Line: 35 ]] --[[ Name: isStackFrame ]]
    return v4:match("^[%w%._%-]+:[%d]+.+") ~= nil;
end;
local function v7(v6) --[[ Line: 39 ]] --[[ Name: isRedactedPath ]]
    return (v6:find("CorePackages.Packages.+%.TestEZ%.") or v6:find("CorePackages.Packages.+%.Promise%.") or v6:find("CorePackages.Packages.+%.roblox_rodux%.") or v6:find("CorePackages.Packages.+%.React%.") or v6:find("CorePackages.Packages.+%.ReactReconciler%.") or v6:find("CorePackages.Packages.+%.Scheduler%.") or v6:find("CorePackages.Packages.+%.Shared%.")) ~= nil;
end;
local function v13(v8) --[[ Line: 53 ]] --[[ Name: reduceStacks ]]
    -- upvalues: v7 (copy)
    local v9 = {};
    local v10 = false;
    for _, v12 in ipairs(v8:split("\n")) do
        if v12:match("^[%w%._%-]+:[%d]+.+") ~= nil then
            if not v10 then
                v10 = true;
                table.insert(v9, v12);
                continue;
            end;
        else
            v10 = false;
        end;
        if v7(v12) then
            if v9[#v9] ~= "..." then
                table.insert(v9, "...");
            end;
        else
            table.insert(v9, v12);
        end;
    end;
    return table.concat(v9, "\n");
end;
return function(v14) --[[ Line: 79 ]]
    -- upvalues: v13 (copy), l_RunService_0 (copy), v3 (copy), v2 (copy)
    local v15 = {};
    local function v24(v16, ...) --[[ Line: 82 ]] --[[ Name: onUnhandledRejection ]]
        -- upvalues: v14 (copy), v13 (ref), v15 (copy)
        local v17 = v16._source:split("\n");
        local v18 = nil;
        for v19 = #v17, 1, -1 do
            if v17[v19]:find("%.([%a%d]+%.spec):(%d+)") then
                v18 = v17[v19];
                break;
            end;
        end;
        local v20 = nil;
        local v21 = nil;
        local v22 = nil;
        if select("#", ...) >= 1 then
            v21 = tostring(select(1, ...));
            v22 = if v14 then v21 else v13(v21);
        end;
        local v23 = nil;
        if v21 == nil or v21:find("Promise created at:") == nil then
            v23 = if v14 then v16._source else v13(v16._source);
        end;
        v20 = if v18 then ("%*\nPromise was created in test at:\n%*\n\n"):format("\n~~~ UNHANDLED PROMISE REJECTION ~~~", v18) else ("%*\nNo test file was found in promise creation stack. "):format("\n~~~ UNHANDLED PROMISE REJECTION ~~~");
        if v22 ~= nil then
            v20 = v20 .. ("Error output:\n%*"):format(v22);
        end;
        if v23 ~= nil then
            v20 = v20 .. ("\n\nPromise created at:\n%*"):format(v23);
        end;
        table.insert(v15, v20);
    end;
    local function v36(v25, v26, v27) --[[ Line: 131 ]] --[[ Name: reportRejections ]]
        -- upvalues: l_RunService_0 (ref), v3 (ref), v15 (copy)
        l_RunService_0.Heartbeat:Wait();
        l_RunService_0.Heartbeat:Wait();
        local v28 = v27 or 1;
        local v29 = if v3 then v26 else v25;
        local v30 = nil;
        local v31 = nil;
        if v29 == nil then
            v30 = 0;
            v31 = "0 (default)";
        else
            v30 = math.floor(v29 * v28);
            v31 = tostring(v30);
        end;
        if #v15 > 0 then
            local v32 = {};
            local v33 = v30 < #v15;
            table.insert(v32, "Caught unhandled promise rejections caught during test run. These may indicate\nerrors in tested code, or tests that were not cleaned up properly.\n\nIf you would like to see full stack traces without library internals redacted,\npass `true` as the first argument to `createPromiseRejectionHandler`.\n\nMore information about unhandled promise rejections in tests (and how to clean\nthem up) can be found at https://roblox.atlassian.net/wiki/spaces/HOW/pages/1556186613/Handling+Lua+Promises+in+Tests.\n");
            for _, v35 in ipairs(v15) do
                table.insert(v32, v35);
            end;
            table.insert(v32, string.format("\nPromise rejection report:\n    unhandled rejections: %d", #v15));
            if v33 then
                table.insert(v32, string.format("    allowed rejections threshold: %s\n\nThis test suite run has FAILED due to exceeding the threshold of unhandled\npromise rejections. For any functionality changed, try running the suite with\nrelevant tests focused (new or existing) to find which tests are producing\nunhandled promise rejections", v31));
            end;
            if v30 < #v15 then
                error(table.concat(v32, "\n"), 0);
                return;
            else
                warn(table.concat(v32, "\n"));
            end;
        end;
    end;
    local function v37() --[[ Line: 174 ]] --[[ Name: inject ]]
        -- upvalues: v2 (ref), v24 (copy)
        v2.TEST = true;
        return v2.onUnhandledRejection(v24);
    end;
    return {
        reportRejections = v36, 
        inject = v37
    };
end;