local v0 = {};
local l_initializeReporter_0 = require(script.Parent.Reporter).initializeReporter;
local v2 = require(script.Parent.Parent.heartbeatModule);
v0.initializeHeartbeatReporter = function(v3, v4) --[[ Line: 26 ]] --[[ Name: initializeHeartbeatReporter ]]
    -- upvalues: l_initializeReporter_0 (copy), v2 (copy)
    local v5 = l_initializeReporter_0(v3, v4);
    local v6 = false;
    local v7 = nil;
    local v8 = 0;
    local function v11(v9) --[[ Line: 32 ]] --[[ Name: start ]]
        -- upvalues: v5 (copy), v8 (ref), v6 (ref), v7 (ref), v2 (ref)
        v5.start(v9);
        v8 = v8 + 1;
        if not v6 then
            v6 = true;
            v7 = v2:Connect(function(v10) --[[ Line: 37 ]]
                -- upvalues: v8 (ref), v5 (ref)
                if v8 > 0 then
                    v5.report(v10);
                end;
            end);
        end;
    end;
    local function v12() --[[ Line: 45 ]] --[[ Name: stop ]]
        -- upvalues: v8 (ref), v5 (copy)
        v8 = v8 - 1;
        v5.stop();
    end;
    local function v13() --[[ Line: 50 ]] --[[ Name: finish ]]
        -- upvalues: v7 (ref), v5 (copy)
        if v7 then
            v7:Disconnect();
        end;
        return v5.finish();
    end;
    return {
        start = v11, 
        stop = v12, 
        finish = v13, 
        report = function(_) --[[ Line: 62 ]] --[[ Name: report ]]
            -- upvalues: v3 (copy)
            error((("Attempted to call %*Reporter.report. This reporter handles reporting internally."):format(v3)));
        end
    };
end;
return v0;