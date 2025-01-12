local l_CorePackages_0 = game:GetService("CorePackages");
local _ = game:GetService("LogService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_GameSettings_0 = UserSettings().GameSettings;
local v4 = require(l_CorePackages_0.Packages.Roact);
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v6 = require(l_Components_0.UtilAndTab);
local v7 = require(script.Parent.ServerProfilerInterface);
local v8 = require(script.Parent.Parent.Parent.Constants);
local l_MainRowPadding_0 = v8.GeneralFormatting.MainRowPadding;
local l_ButtonWidth_0 = v8.MicroProfilerFormatting.ButtonWidth;
local l_ButtonTextSize_0 = v8.MicroProfilerFormatting.ButtonTextSize;
local _ = v8.Font.MainWindow;
local l_MainWindowHeader_0 = v8.Font.MainWindowHeader;
local l_UnselectedGray_0 = v8.Color.UnselectedGray;
local l_SelectedBlue_0 = v8.Color.SelectedBlue;
local l_UnselectedGray_1 = v8.Color.UnselectedGray;
local v17 = v4.Component:extend("MainViewProfiler");
v17.init = function(v18) --[[ Line: 31 ]] --[[ Name: init ]]
    -- upvalues: l_GameSettings_0 (copy), l_RbxAnalyticsService_0 (copy), v4 (copy)
    v18.onUtilTabHeightChanged = function(v19) --[[ Line: 32 ]]
        -- upvalues: v18 (copy)
        v18:setState({
            utilTabHeight = v19
        });
    end;
    v18.changeProfilerState = function(v20) --[[ Line: 38 ]]
        -- upvalues: l_GameSettings_0 (ref), v18 (copy), l_RbxAnalyticsService_0 (ref)
        return function() --[[ Line: 39 ]]
            -- upvalues: l_GameSettings_0 (ref), v20 (copy), v18 (ref), l_RbxAnalyticsService_0 (ref)
            l_GameSettings_0.OnScreenProfilerEnabled = v20;
            v18:setState({
                clientProfilerEnabled = v20
            });
            l_RbxAnalyticsService_0:ReportCounter("MicroprofilerDevConsolePressed");
        end;
    end;
    v18.microProfilerChangedConnection = l_GameSettings_0:GetPropertyChangedSignal("OnScreenProfilerEnabled"):Connect(function() --[[ Line: 50 ]]
        -- upvalues: v18 (copy), l_GameSettings_0 (ref)
        v18:setState({
            clientProfilerEnabled = l_GameSettings_0.OnScreenProfilerEnabled
        });
    end);
    v18.utilRef = v4.createRef();
    v18.state = {
        utilTabHeight = 0
    };
end;
v17.didMount = function(v21) --[[ Line: 63 ]] --[[ Name: didMount ]]
    v21:setState({
        utilTabHeight = v21.utilRef.current.Size.Y.Offset
    });
end;
v17.willUnmount = function(v22) --[[ Line: 71 ]] --[[ Name: willUnmount ]]
    if v22.microProfilerChangedConnection then
        v22.microProfilerChangedConnection:Disconnect();
        v22.microProfilerChangedConnection = nil;
    end;
end;
v17.didUpdate = function(v23) --[[ Line: 78 ]] --[[ Name: didUpdate ]]
    local l_Size_0 = v23.utilRef.current.Size;
    if l_Size_0.Y.Offset ~= v23.state.utilTabHeight then
        v23:setState({
            utilTabHeight = l_Size_0.Y.Offset
        });
    end;
end;
v17.render = function(v25) --[[ Line: 87 ]] --[[ Name: render ]]
    -- upvalues: l_ButtonWidth_0 (copy), v4 (copy), v8 (copy), l_MainRowPadding_0 (copy), v6 (copy), l_MainWindowHeader_0 (copy), l_ButtonTextSize_0 (copy), l_UnselectedGray_1 (copy), l_UnselectedGray_0 (copy), l_SelectedBlue_0 (copy), v7 (copy)
    local l_size_0 = v25.props.size;
    local l_formFactor_0 = v25.props.formFactor;
    local l_tabList_0 = v25.props.tabList;
    local l_utilTabHeight_0 = v25.state.utilTabHeight;
    local _ = v25.state.frameRate;
    local _ = v25.state.timeFrame;
    local _ = v25.state.waitingForData;
    local l_clientProfilerEnabled_0 = v25.state.clientProfilerEnabled;
    local _ = v25.state.outputPath;
    local _ = UDim2.new(0.8, -l_ButtonWidth_0, 0, 30);
    local _ = UDim2.new(0.6, l_ButtonWidth_0, 0, 0);
    return v4.createElement("Frame", {
        Size = l_size_0, 
        BackgroundColor3 = v8.Color.BaseGray, 
        BackgroundTransparency = 1, 
        LayoutOrder = 3
    }, {
        UIListLayout = v4.createElement("UIListLayout", {
            Padding = UDim.new(0, l_MainRowPadding_0), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        UtilAndTab = v4.createElement(v6, {
            windowWidth = l_size_0.X.Offset, 
            formFactor = l_formFactor_0, 
            tabList = l_tabList_0, 
            layoutOrder = 1, 
            refForParent = v25.utilRef, 
            onHeightChanged = v25.onUtilTabHeightChanged
        }), 
        MainFrame = v4.createElement("ScrollingFrame", {
            Size = UDim2.new(1, 0, 1, -l_utilTabHeight_0), 
            CanvasSize = UDim2.new(1, 0, 1, -l_utilTabHeight_0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }, {
            UIListLayout = v4.createElement("UIListLayout", {
                Padding = UDim.new(0, l_MainRowPadding_0 * 2), 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            MicroProfilerRow = v4.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 90), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, {
                Label = v4.createElement("TextLabel", {
                    Size = UDim2.new(0, l_ButtonWidth_0, 0, 30), 
                    Position = UDim2.new(0.1, 0, 0, 0), 
                    Text = "MicroProfiler", 
                    Font = l_MainWindowHeader_0, 
                    TextSize = l_ButtonTextSize_0, 
                    TextColor3 = v8.Color.Text, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    BackgroundColor3 = l_UnselectedGray_1, 
                    BackgroundTransparency = 1
                }), 
                HorizontalLine = v4.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    Position = UDim2.new(0, 0, 0, 30)
                }), 
                ToggleButton = v4.createElement("TextLabel", {
                    Size = UDim2.new(0.8, -l_ButtonWidth_0, 0, 30), 
                    Position = UDim2.new(0.09999999999999998, l_ButtonWidth_0, 0, 37.5), 
                    BackgroundTransparency = 1
                }, {
                    OffButton = v4.createElement("TextButton", {
                        Size = UDim2.new(0.5, 0, 1, 0), 
                        Text = "Off", 
                        Font = l_MainWindowHeader_0, 
                        TextSize = l_ButtonTextSize_0, 
                        TextColor3 = v8.Color.Text, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        BackgroundColor3 = l_clientProfilerEnabled_0 and l_UnselectedGray_0 or l_SelectedBlue_0, 
                        [v4.Event.Activated] = v25.changeProfilerState(false)
                    }), 
                    ClientButton = v4.createElement("TextButton", {
                        Size = UDim2.new(0.5, 0, 1, 0), 
                        Position = UDim2.new(0.5, 0, 0, 0), 
                        Text = "Client", 
                        Font = l_MainWindowHeader_0, 
                        TextSize = l_ButtonTextSize_0, 
                        TextColor3 = v8.Color.Text, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        BackgroundColor3 = l_clientProfilerEnabled_0 and l_SelectedBlue_0 or l_UnselectedGray_0, 
                        [v4.Event.Activated] = v25.changeProfilerState(true)
                    })
                })
            }), 
            HorizontalLine = v4.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_MainRowPadding_0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 3
            }), 
            ServerProfiler = v4.createElement(v7, {
                Size = UDim2.new(1, 0, 0, 135), 
                BackgroundTransparency = 1, 
                LayoutOrder = 4
            })
        })
    });
end;
return v17;