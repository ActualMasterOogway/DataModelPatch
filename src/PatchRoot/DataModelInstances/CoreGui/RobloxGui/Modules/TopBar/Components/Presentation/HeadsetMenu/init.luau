local l_CorePackages_0 = game:GetService("CorePackages");
local _ = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local l_VRService_0 = game:GetService("VRService");
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local v7 = require(l_CorePackages_0.Packages.t);
local l_Parent_0 = script.Parent.Parent.Parent;
local v9 = require(l_Parent_0.Parent.Common.EventConnection);
local l_isSubjectToDesktopPolicies_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).isSubjectToDesktopPolicies;
local v11 = require(script.DisconnectedDialog);
local v12 = v5.PureComponent:extend("HeadsetMenu");
v12.validateProps = v7.strictInterface({
    screenSize = v7.Vector2, 
    vrService = v7.optional(v7.union(v7.instanceOf("VRService"), v7.table)), 
    guiService = v7.optional(v7.union(v7.instanceOf("GuiService"), v7.table))
});
v12.defaultProps = {
    vrService = l_VRService_0, 
    guiService = l_GuiService_0
};
v12.init = function(v13) --[[ Line: 33 ]] --[[ Name: init ]]
    -- upvalues: l_isSubjectToDesktopPolicies_0 (copy), l_RunService_0 (copy)
    v13.state = {
        vrDeviceAvailable = false, 
        shouldShowDisconnectDialog = false
    };
    v13.restartApp = function() --[[ Line: 39 ]]
        -- upvalues: v13 (copy), l_isSubjectToDesktopPolicies_0 (ref), l_RunService_0 (ref)
        local l_NotificationTypeList_0 = v13.props.guiService:GetNotificationTypeList();
        if l_isSubjectToDesktopPolicies_0() then
            if game:GetEngineFeature("EnableLuaControlsRestartApp") then
                v13.props.guiService:BroadcastNotification("", l_NotificationTypeList_0.RESTART_APP);
            else
                v13.props.guiService:BroadcastNotification("", l_NotificationTypeList_0.NATIVE_EXIT);
            end;
        else
            l_RunService_0.Heartbeat:Wait();
            game:Shutdown();
        end;
        v13:setState({
            shouldShowDisconnectDialog = false
        });
    end;
end;
v12.render = function(v15) --[[ Line: 59 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v9 (copy), v11 (copy)
    return v5.createFragment({
        HeadsetConnection = v5.createElement(v9, {
            event = v15.props.vrService:GetPropertyChangedSignal("VRDeviceAvailable"), 
            callback = function() --[[ Line: 63 ]] --[[ Name: callback ]]
                -- upvalues: v15 (copy)
                v15:setState({
                    vrDeviceAvailable = v15.props.vrService.VRDeviceAvailable
                });
            end
        }, {
            HeadsetDisconnectedDialog = v5.createElement(v11, {
                visible = v15.state.shouldShowDisconnectDialog, 
                screenSize = v15.props.screenSize, 
                onConfirm = v15.restartApp, 
                guiService = v15.props.guiService
            })
        })
    });
end;
v12.didMount = function(v16) --[[ Line: 79 ]] --[[ Name: didMount ]]
    v16:setState({
        vrDeviceAvailable = v16.props.vrService.VRDeviceAvailable
    });
end;
v12.didUpdate = function(v17, _, v19) --[[ Line: 85 ]] --[[ Name: didUpdate ]]
    if v17.state.vrDeviceAvailable ~= v19.vrDeviceAvailable and not v17.state.vrDeviceAvailable then
        v17:setState({
            shouldShowDisconnectDialog = true
        });
    end;
end;
return (v6.connect(function(v20) --[[ Line: 95 ]]
    return {
        screenSize = v20.displayOptions.screenSize
    };
end)(v12));