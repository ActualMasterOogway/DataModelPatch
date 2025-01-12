local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = settings():WaitForChild("Game Options");
local l_Parent_0 = script.Parent.Parent.Parent;
local v3 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v3.Roact;
local l_RoactRodux_0 = v3.RoactRodux;
local v6 = require(l_Parent_0.Actions.SetVideoRecording);
local v7 = require(l_Parent_0.Utility.ExternalEventConnection);
local v8 = l_Roact_0.PureComponent:extend("VideoRecordConnector");
v8.init = function(v9) --[[ Line: 15 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v9.props.setVideoRecording(v1.VideoRecording);
end;
v8.render = function(v10) --[[ Line: 19 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), v7 (copy), v1 (copy)
    return l_Roact_0.createElement(v7, {
        event = v1:GetPropertyChangedSignal("VideoRecording"), 
        callback = function() --[[ Line: 22 ]] --[[ Name: callback ]]
            -- upvalues: v10 (copy), v1 (ref)
            v10.props.setVideoRecording(v1.VideoRecording);
        end
    });
end;
return l_RoactRodux_0.UNSTABLE_connect2(nil, function(v11) --[[ Line: 28 ]]
    -- upvalues: v6 (copy)
    return {
        setVideoRecording = function(v12) --[[ Line: 30 ]] --[[ Name: setVideoRecording ]]
            -- upvalues: v11 (copy), v6 (ref)
            return v11(v6(v12));
        end
    };
end)(v8);