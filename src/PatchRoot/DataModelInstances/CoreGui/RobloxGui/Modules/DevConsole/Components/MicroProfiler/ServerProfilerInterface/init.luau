local l_CorePackages_0 = game:GetService("CorePackages");
local l_GameSettings_0 = UserSettings().GameSettings;
local v2 = require(script.Parent.Parent.Parent.Util.getClientReplicator);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local _ = script.Parent.Parent.Parent.Components;
local l_Actions_0 = script.Parent.Parent.Parent.Actions;
local v7 = require(l_Actions_0.SetRCCProfilerState);
local v8 = require(script.Parent.Parent.Parent.Constants);
local _ = v8.GeneralFormatting.MainRowPadding;
local l_ButtonWidth_0 = v8.MicroProfilerFormatting.ButtonWidth;
local l_ButtonTextSize_0 = v8.MicroProfilerFormatting.ButtonTextSize;
local l_MainWindow_0 = v8.Font.MainWindow;
local l_MainWindowHeader_0 = v8.Font.MainWindowHeader;
local l_UnselectedGray_0 = v8.Color.UnselectedGray;
local l_SelectedBlue_0 = v8.Color.SelectedBlue;
local l_UnselectedGray_1 = v8.Color.UnselectedGray;
local v17 = v3.Component:extend("ServerProfilerInteraface");
v17.init = function(v18) --[[ Line: 32 ]] --[[ Name: init ]]
    -- upvalues: l_GameSettings_0 (copy), v2 (copy)
    v18.onUtilTabHeightChanged = function(v19) --[[ Line: 33 ]]
        -- upvalues: v18 (copy)
        v18:setState({
            utilTabHeight = v19
        });
    end;
    v18.onFocusLostFrameRate = function(v20, _, _) --[[ Line: 39 ]]
        -- upvalues: l_GameSettings_0 (ref)
        l_GameSettings_0.RCCProfilerRecordFrameRate = v20.Text;
        v20.Text = l_GameSettings_0.RCCProfilerRecordFrameRate;
    end;
    v18.onFocusLostTimeFrame = function(v23, _, _) --[[ Line: 47 ]]
        -- upvalues: l_GameSettings_0 (ref)
        l_GameSettings_0.RCCProfilerRecordTimeFrame = v23.Text;
        v23.Text = l_GameSettings_0.RCCProfilerRecordTimeFrame;
    end;
    v18.requestRCCProfilerData = function(_) --[[ Line: 55 ]]
        -- upvalues: v2 (ref), l_GameSettings_0 (ref), v18 (copy)
        local v27 = v2();
        if v27 then
            v27:RequestRCCProfilerData(l_GameSettings_0.RCCProfilerRecordFrameRate, l_GameSettings_0.RCCProfilerRecordTimeFrame);
            v18.props.dispatchSetRCCProfilerState(true);
        end;
    end;
    v18.changeProfilerState = function(v28) --[[ Line: 68 ]]
        -- upvalues: l_GameSettings_0 (ref), v18 (copy)
        return function() --[[ Line: 69 ]]
            -- upvalues: l_GameSettings_0 (ref), v28 (copy), v18 (ref)
            l_GameSettings_0.OnScreenProfilerEnabled = v28;
            v18:setState({
                clientProfilerEnabled = v28
            });
        end;
    end;
    v18.state = {
        frameRate = l_GameSettings_0.RCCProfilerRecordFrameRate, 
        timeFrame = l_GameSettings_0.RCCProfilerRecordTimeFrame
    };
end;
v17.render = function(v29) --[[ Line: 83 ]] --[[ Name: render ]]
    -- upvalues: l_ButtonWidth_0 (copy), v3 (copy), l_MainWindowHeader_0 (copy), l_ButtonTextSize_0 (copy), v8 (copy), l_UnselectedGray_1 (copy), l_MainWindow_0 (copy), l_UnselectedGray_0 (copy), l_SelectedBlue_0 (copy)
    local _ = v29.props.size;
    local _ = v29.props.formFactor;
    local _ = v29.props.tabList;
    local l_waitingForRecording_0 = v29.props.waitingForRecording;
    local l_lastFileOutputLocation_0 = v29.props.lastFileOutputLocation;
    local _ = v29.state.utilTabHeight;
    local l_frameRate_0 = v29.state.frameRate;
    local l_timeFrame_0 = v29.state.timeFrame;
    local _ = v29.state.clientProfilerEnabled;
    local v39 = not l_waitingForRecording_0 and #l_lastFileOutputLocation_0 > 0;
    local v40 = UDim2.new(0.8, -l_ButtonWidth_0, 0, 30);
    local _ = UDim2.new(0.6, l_ButtonWidth_0, 0, 0);
    return v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 135), 
        BackgroundTransparency = 1, 
        LayoutOrder = 4
    }, {
        Label = v3.createElement("TextLabel", {
            Size = UDim2.new(0, l_ButtonWidth_0, 0, 30), 
            Position = UDim2.new(0.1, 0, 0, 0), 
            Text = "ServerProfiler", 
            Font = l_MainWindowHeader_0, 
            TextSize = l_ButtonTextSize_0, 
            TextColor3 = v8.Color.Text, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            BackgroundColor3 = l_UnselectedGray_1, 
            BackgroundTransparency = 1
        }), 
        HorizontalLine = v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 1), 
            Position = UDim2.new(0, 0, 0, 30)
        }), 
        LabelFPS = v3.createElement("TextLabel", {
            Size = UDim2.new(0, l_ButtonWidth_0, 0, 30), 
            Position = UDim2.new(0.1, 0, 0, 37.5), 
            Text = "Frames Per Second", 
            Font = l_MainWindow_0, 
            TextSize = l_ButtonTextSize_0, 
            TextColor3 = v8.Color.Text, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            BackgroundColor3 = l_UnselectedGray_1, 
            BackgroundTransparency = 1
        }), 
        FPSTextBox = v3.createElement("TextBox", {
            Size = v40, 
            Position = UDim2.new(0.09999999999999998, l_ButtonWidth_0, 0, 37.5), 
            Text = l_frameRate_0, 
            Font = l_MainWindow_0, 
            TextSize = l_ButtonTextSize_0, 
            TextColor3 = v8.Color.Text, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            BackgroundColor3 = l_UnselectedGray_1, 
            BackgroundTransparency = 0, 
            [v3.Event.FocusLost] = v29.onFocusLostFrameRate
        }), 
        LabelTimeFrame = v3.createElement("TextLabel", {
            Size = UDim2.new(0, l_ButtonWidth_0, 0, 30), 
            Position = UDim2.new(0.1, 0, 0, 67.5), 
            Text = "Seconds to Record", 
            Font = l_MainWindow_0, 
            TextSize = l_ButtonTextSize_0, 
            TextColor3 = v8.Color.Text, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            BackgroundTransparency = 1
        }), 
        TimeFrameTextBox = v3.createElement("TextBox", {
            Size = v40, 
            Position = UDim2.new(0.09999999999999998, l_ButtonWidth_0, 0, 67.5), 
            Text = l_timeFrame_0, 
            Font = l_MainWindow_0, 
            TextSize = l_ButtonTextSize_0, 
            TextColor3 = v8.Color.Text, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            BackgroundColor3 = l_UnselectedGray_1, 
            BackgroundTransparency = 0, 
            [v3.Event.FocusLost] = v29.onFocusLostTimeFrame
        }, {
            GetDumpButton = v3.createElement("TextButton", {
                Size = UDim2.new(0, l_ButtonWidth_0 * 0.7, 0, 30), 
                Position = UDim2.new(1, -l_ButtonWidth_0 * 0.7, 1, 30), 
                Text = l_waitingForRecording_0 and "Recording" or "Start Recording", 
                Font = l_MainWindow_0, 
                TextSize = l_ButtonTextSize_0, 
                TextColor3 = v8.Color.Text, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                BackgroundColor3 = l_waitingForRecording_0 and l_UnselectedGray_0 or l_SelectedBlue_0, 
                BackgroundTransparency = l_waitingForRecording_0 and 0.3 or 0, 
                AutoButtonColor = not l_waitingForRecording_0, 
                Active = not l_waitingForRecording_0, 
                [v3.Event.Activated] = v29.requestRCCProfilerData
            })
        }), 
        OutputPath = v39 and v3.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, 30), 
            Position = UDim2.new(0, 0, 0, 97.5), 
            Text = l_lastFileOutputLocation_0, 
            Font = l_MainWindow_0, 
            TextSize = l_ButtonTextSize_0, 
            TextColor3 = v8.Color.Text, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center
        })
    });
end;
return v4.UNSTABLE_connect2(function(v42, _) --[[ Line: 210 ]] --[[ Name: mapStateToProps ]]
    return {
        waitingForRecording = v42.MicroProfiler.waitingForRecording, 
        lastFileOutputLocation = v42.MicroProfiler.lastFileOutputLocation
    };
end, function(v44) --[[ Line: 217 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v7 (copy)
    return {
        dispatchSetRCCProfilerState = function(v45, v46) --[[ Line: 219 ]] --[[ Name: dispatchSetRCCProfilerState ]]
            -- upvalues: v44 (copy), v7 (ref)
            v44(v7(v45, v46));
        end
    };
end)(v17);