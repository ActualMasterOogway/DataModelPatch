local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_RunService_0 = game:GetService("RunService");
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.Otter);
local v6 = require(l_CorePackages_0.Packages.t);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local v8 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local v9 = {
    frequency = 4, 
    dampingRatio = 1
};
local v10 = v8:FormatByKey("InGame.CommonUI.Label.MicOnRecording");
local v11 = v8:FormatByKey("InGame.CommonUI.Label.MicOff");
local v12 = v4.PureComponent:extend("PermissionsButtons");
v12.validateProps = v6.strictInterface({
    micOn = v6.boolean, 
    isSmallTouchScreen = v6.optional(v6.boolean)
});
v12.init = function(v13) --[[ Line: 29 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy)
    v13:setState({
        lastVoiceRecordingIndicatorTextUpdated = tick(), 
        voiceRecordingIndicatorTextMotor = v5.createSingleMotor(1), 
        textOpacity = 1
    });
end;
v12.didMount = function(v14) --[[ Line: 37 ]] --[[ Name: didMount ]]
    -- upvalues: l_RunService_0 (copy), v5 (copy), v9 (copy)
    task.spawn(function() --[[ Line: 38 ]]
        -- upvalues: v14 (copy), l_RunService_0 (ref), v5 (ref), v9 (ref)
        v14.state.voiceRecordingIndicatorTextMotor:onStep(function(v15) --[[ Line: 39 ]]
            -- upvalues: v14 (ref)
            v14:setState({
                textOpacity = v15
            });
        end);
        l_RunService_0:BindToRenderStep("RoactVoiceRecordingIndicator", Enum.RenderPriority.Last.Value, function() --[[ Line: 44 ]]
            -- upvalues: v14 (ref), v5 (ref), v9 (ref)
            if tick() - v14.state.lastVoiceRecordingIndicatorTextUpdated >= 5 and not v14.props.micOn and v14.state.textOpacity >= 1 then
                v14.state.voiceRecordingIndicatorTextMotor:setGoal(v5.spring(0, v9));
                v14.state.voiceRecordingIndicatorTextMotor:start();
            end;
        end);
    end);
end;
v12.willUnmount = function(v16) --[[ Line: 58 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_RunService_0 (copy)
    v16.state.voiceRecordingIndicatorTextMotor:destroy();
    l_RunService_0:UnbindFromRenderStep("RoactVoiceRecordingIndicator");
end;
v12.shouldUpdate = function(v17, v18, v19) --[[ Line: 63 ]] --[[ Name: shouldUpdate ]]
    -- upvalues: v5 (copy), v9 (copy)
    if v17.props.micOn ~= v18.micOn then
        v17:setState({
            lastVoiceRecordingIndicatorTextUpdated = tick()
        });
        if v18.micOn then
            v17.state.voiceRecordingIndicatorTextMotor:setGoal(v5.spring(1, v9));
            v17.state.voiceRecordingIndicatorTextMotor:start();
        end;
    end;
    local v20 = true;
    if v17.props.micOn == v18.micOn then
        v20 = v17.state.textOpacity ~= v19.textOpacity;
    end;
    return v20;
end;
v12.render = function(v21) --[[ Line: 76 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v10 (copy), v11 (copy), l_AppFonts_0 (copy)
    return v4.createElement("TextLabel", {
        Text = if v21.props.micOn then v10 else v11, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        Visible = v21.props.hasMicPermissions, 
        TextSize = v21.props.isSmallTouchScreen and 10 or 12, 
        Font = l_AppFonts_0.default:getMedium(), 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Center, 
        TextColor3 = Color3.fromRGB(255, 255, 255), 
        TextTransparency = 1 - v21.state.textOpacity, 
        BackgroundTransparency = 1, 
        LayoutOrder = 6, 
        TextWrapped = true
    });
end;
return v12;