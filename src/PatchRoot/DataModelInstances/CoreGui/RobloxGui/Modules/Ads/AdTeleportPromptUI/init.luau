local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local v6 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_ExternalEventConnection_0 = v5.Utility.ExternalEventConnection;
local l_InteractiveAlert_0 = v5.App.Dialog.Alert.InteractiveAlert;
local l_withStyle_0 = v5.Core.Style.withStyle;
local l_UserInputService_0 = game:GetService("UserInputService");
local v12 = v4.Component:extend("InteractiveAlert");
v12.init = function(v13) --[[ Line: 28 ]] --[[ Name: init ]]
    v13.state = {
        screenSize = game.Workspace.CurrentCamera.ViewportSize
    };
    v13.updateViewport = function() --[[ Line: 33 ]]
        -- upvalues: v13 (copy)
        v13:setState({
            screenSize = game.Workspace.CurrentCamera.ViewportSize
        });
    end;
end;
v12.renderWithStyle = function(v14, _) --[[ Line: 38 ]] --[[ Name: renderWithStyle ]]
    -- upvalues: v4 (copy), l_InteractiveAlert_0 (copy), l_ExternalEventConnection_0 (copy), l_RunService_0 (copy), l_UserInputService_0 (copy)
    assert(game.Workspace.CurrentCamera ~= nil, "Appeasing the type checking");
    return v4.createFragment({
        InteractiveAlert = v4.createElement(l_InteractiveAlert_0, {
            screenSize = v14.state.screenSize, 
            title = v14:generateTitle(), 
            bodyText = v14:shouldGenerateBody(), 
            buttonStackInfo = {
                buttons = v14:generateButtons()
            }, 
            onAbsoluteSizeChanged = v14.props.onAbsoluteSizeChanged
        }), 
        HeartbeatConnection = v4.createElement(l_ExternalEventConnection_0, {
            event = l_RunService_0.Heartbeat, 
            callback = function() --[[ Line: 54 ]] --[[ Name: callback ]]
                -- upvalues: v14 (copy)
                v14.props.handler:onHeartbeat();
            end
        }), 
        GamepadFocusConnection = v4.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.LastInputTypeChanged, 
            callback = function() --[[ Line: 60 ]] --[[ Name: callback ]]
                -- upvalues: v14 (copy)
                v14.props.handler:focusIfGamepad();
            end
        }), 
        viewportSizeListener = v4.createElement(l_ExternalEventConnection_0, {
            event = game.Workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"), 
            callback = v14.updateViewport
        })
    });
end;
v12.render = function(v16) --[[ Line: 71 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy)
    return l_withStyle_0(function(v17) --[[ Line: 72 ]]
        -- upvalues: v16 (copy)
        return v16:renderWithStyle(v17);
    end);
end;
v12.generateButtons = function(v18) --[[ Line: 77 ]] --[[ Name: generateButtons ]]
    -- upvalues: v6 (copy), l_ButtonType_0 (copy)
    local v19 = v6:FormatByKey("CoreScripts.Ads.Action.PortalPromptAccept");
    local v20 = v6:FormatByKey("CoreScripts.Ads.Action.PortalPromptCancel");
    local v21 = {
        buttonType = l_ButtonType_0.PrimarySystem, 
        props = {
            onActivated = function() --[[ Line: 84 ]] --[[ Name: onActivated ]]
                -- upvalues: v18 (copy)
                v18.props.handler:acceptPrompt();
            end, 
            text = v19
        }, 
        isDefaultChild = true
    };
    local v22 = {
        props = {
            onActivated = function() --[[ Line: 94 ]] --[[ Name: onActivated ]]
                -- upvalues: v18 (copy)
                v18.props.handler:rejectButton();
            end, 
            text = v20
        }
    };
    if v18.props.shouldRenderCancelButton then
        return {
            v22, 
            v21
        };
    else
        return {
            v21
        };
    end;
end;
v12.shouldGenerateBody = function(v23) --[[ Line: 107 ]] --[[ Name: shouldGenerateBody ]]
    -- upvalues: v6 (copy)
    if v23.props.shouldRenderCancelButton then
        return nil;
    else
        return v6:FormatByKey("CoreScripts.Ads.Label.PortalPromptDismissWalkAway");
    end;
end;
v12.generateTitle = function(v24) --[[ Line: 114 ]] --[[ Name: generateTitle ]]
    -- upvalues: v6 (copy)
    if v24.props.experienceName then
        return v6:FormatByKey("CoreScripts.Ads.Label.PortalPromptTeleportToWithName", {
            RBX_NAME = v24.props.experienceName
        });
    else
        return v6:FormatByKey("CoreScripts.Ads.Label.PortalPromptTeleportToWithoutName");
    end;
end;
return v12;