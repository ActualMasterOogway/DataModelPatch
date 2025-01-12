local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(script.Parent.Parent.Parent.Util.getClientReplicator);
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Actions_0 = script.Parent.Parent.Parent.Actions;
local v5 = require(l_Actions_0.SetRCCProfilerState);
local v6 = v2.Component:extend("RCCProfilerDataCompleteListener");
v6.didMount = function(v7) --[[ Line: 12 ]] --[[ Name: didMount ]]
    -- upvalues: v1 (copy)
    local v8 = v1();
    if v8 then
        v7.completeSignal = v8.RCCProfilerDataComplete:Connect(function(v9, v10) --[[ Line: 15 ]]
            -- upvalues: v7 (copy)
            if v7.props.waitingForRecording then
                if not v9 then
                    warn(v10);
                    v7.props.dispatchSetRCCProfilerState(false);
                    return;
                else
                    v7.props.dispatchSetRCCProfilerState(false, v10);
                end;
            end;
        end);
    end;
end;
v6.willUnmount = function(v11) --[[ Line: 28 ]] --[[ Name: willUnmount ]]
    if v11.completeSignal then
        v11.completeSignal:Disconnect();
        v11.completeSignal = nil;
    end;
end;
v6.render = function(_) --[[ Line: 35 ]] --[[ Name: render ]]
    return nil;
end;
return v3.UNSTABLE_connect2(function(v13, _) --[[ Line: 39 ]] --[[ Name: mapStateToProps ]]
    return {
        waitingForRecording = v13.MicroProfiler.waitingForRecording
    };
end, function(v15) --[[ Line: 45 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v5 (copy)
    return {
        dispatchSetRCCProfilerState = function(v16, v17) --[[ Line: 47 ]] --[[ Name: dispatchSetRCCProfilerState ]]
            -- upvalues: v15 (copy), v5 (ref)
            v15(v5(v16, v17));
        end
    };
end)(v6);