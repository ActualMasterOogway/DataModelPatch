local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local _ = game:GetService("VRService");
local _ = game:GetService("GamepadService");
local _ = game:GetService("GuiService");
local _ = game:GetService("HttpService");
local v6 = require(l_CorePackages_0.Packages.Roact);
local _ = require(l_CorePackages_0.Packages.RoactRodux);
local v8 = require(l_CorePackages_0.Packages.t);
local v9 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v9.Core.Style.withStyle;
local l_ImageSetLabel_0 = v9.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v9.App.ImageSet.Images;
local _ = require(l_CorePackages_0.Workspace.Packages.VideoProtocol);
local v14 = settings():WaitForChild("Game Options");
local v15 = v6.PureComponent:extend("MenuIcon");
v15.validateProps = v8.strictInterface({
    layoutOrder = v8.integer
});
local v16 = UDim2.fromOffset(77, 28);
local v17 = UDim2.fromOffset(27, 14);
v15.init = function(v18) --[[ Line: 28 ]] --[[ Name: init ]]
    -- upvalues: v14 (copy), l_CoreGui_0 (copy)
    v18.state = {
        recording = false, 
        recordingText = "0:00"
    };
    v18.recordingConnection = v14:GetPropertyChangedSignal("VideoRecording"):Connect(function() --[[ Line: 34 ]]
        -- upvalues: v18 (copy), v14 (ref)
        v18:setState({
            recording = v14.VideoRecording
        });
    end);
    v18.RecordingPillActivated = function() --[[ Line: 40 ]]
        -- upvalues: l_CoreGui_0 (ref)
        l_CoreGui_0:ToggleRecording();
    end;
end;
v15.render = function(v19) --[[ Line: 46 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v6 (copy), v16 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), v17 (copy)
    return l_withStyle_0(function(v20) --[[ Line: 47 ]]
        -- upvalues: v6 (ref), v19 (copy), v16 (ref), l_ImageSetLabel_0 (ref), l_Images_0 (ref), v17 (ref)
        local l_TextEmphasis_0 = v20.Theme.TextEmphasis;
        return v6.createFragment({
            Button = v6.createElement("Frame", {
                Visible = v19.state.recording, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = v19.props.layoutOrder, 
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(0, 1)
            }, {
                ActualButton = v6.createElement("TextButton", {
                    Text = "", 
                    BackgroundTransparency = 0, 
                    BackgroundColor3 = v20.Theme.Alert.Color, 
                    BorderSizePixel = 0, 
                    Size = v16, 
                    Position = UDim2.new(0, 0, 1, -30), 
                    [v6.Event.Activated] = v19.RecordingPillActivated
                }, {
                    UICorner = v6.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 18)
                    }), 
                    Layout = v6.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    Image = v6.createElement(l_ImageSetLabel_0, {
                        BackgroundTransparency = 1, 
                        Image = l_Images_0["icons/controls/screenrecord"], 
                        Size = UDim2.new(0, 28, 0, 28), 
                        Position = UDim2.new(0.4, 0, 0.5, 0), 
                        AnchorPoint = Vector2.new(0.4, 0.5)
                    }), 
                    TextLabel = v6.createElement("TextLabel", {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1, 
                        Size = v17, 
                        Text = v19.state.recordingText, 
                        LayoutOrder = 2, 
                        TextColor3 = l_TextEmphasis_0.Color, 
                        TextWrapped = true, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextYAlignment = Enum.TextYAlignment.Center
                    })
                })
            })
        });
    end);
end;
v15.didUpdate = function(v22, _, _) --[[ Line: 99 ]] --[[ Name: didUpdate ]]
    if v22.state.recording then
        if not v22.startRecording then
            v22.startRecording = true;
            local v25 = tick();
            local function v26() --[[ Line: 104 ]] --[[ Name: loop ]]
                -- upvalues: v22 (copy), v26 (copy), v25 (copy)
                if v22.state.recording then
                    delay(0.2, v26);
                end;
                local v27 = os.date("*t", tick() - v25);
                local v28 = ("%d:%02d"):format(v27.min, v27.sec);
                v22:setState({
                    recordingText = v28
                });
            end;
            delay(0.2, v26);
            return;
        end;
    else
        v22.startRecording = false;
    end;
end;
v15.willUnmount = function(v29) --[[ Line: 121 ]] --[[ Name: willUnmount ]]
    if v29.recordingConnection then
        v29.recordingConnection:Disconnect();
        v29.recordingConnection = nil;
    end;
end;
return v15;