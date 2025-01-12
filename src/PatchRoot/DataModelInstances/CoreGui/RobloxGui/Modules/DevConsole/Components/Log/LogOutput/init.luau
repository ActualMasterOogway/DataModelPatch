local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(script.Parent.Parent.Parent.Constants);
local l_MainWindow_0 = v3.DefaultFontSize.MainWindow;
local l_Log_0 = v3.Font.Log;
local l_IconHeight_0 = v3.LogFormatting.IconHeight;
local l_TextFrameHeight_0 = v3.LogFormatting.TextFrameHeight;
local l_TextFramePadding_0 = v3.LogFormatting.TextFramePadding;
local l_MaxStringSize_0 = v3.LogFormatting.MaxStringSize;
local v10 = game:DefineFastFlag("DevConsoleLogTextLabelSizingFix", false);
local v11 = v2.Component:extend("LogOutput");
v11.init = function(v12, v13) --[[ Line: 20 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    local v14 = v13.initLogOutput and v13.initLogOutput();
    v12.onCanvasChange = function() --[[ Line: 23 ]]
        -- upvalues: v12 (copy)
        local l_current_0 = v12.ref.current;
        if l_current_0 then
            local l_CanvasPosition_0 = l_current_0.CanvasPosition;
            local l_AbsoluteSize_0 = l_current_0.AbsoluteSize;
            if v12.state.canvasPos ~= l_CanvasPosition_0 or v12.state.absSize ~= l_AbsoluteSize_0 then
                local v18 = l_current_0.CanvasPosition.Y + l_current_0.AbsoluteSize.Y == l_current_0.CanvasSize.Y.Offset;
                v12:setState({
                    canvasPos = l_CanvasPosition_0, 
                    absSize = l_AbsoluteSize_0, 
                    autoScroll = v18
                });
            end;
        end;
    end;
    v12.ref = v2.createRef();
    v12.state = {
        logData = v14, 
        absSize = Vector2.new(), 
        canvasPos = Vector2.new(), 
        autoScroll = true, 
        wordWrap = true
    };
end;
v11.willUpdate = function(v19, _, _) --[[ Line: 53 ]] --[[ Name: willUpdate ]]
    v19._canvasSignal:Disconnect();
    v19._absSizeSignal:Disconnect();
end;
v11.didUpdate = function(v22) --[[ Line: 58 ]] --[[ Name: didUpdate ]]
    v22._canvasSignal = v22.ref.current:GetPropertyChangedSignal("CanvasPosition"):Connect(v22.onCanvasChange);
    v22._absSizeSignal = v22.ref.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(v22.onCanvasChange);
    if v22.state.autoScroll then
        local l_current_1 = v22.ref.current;
        if l_current_1 then
            l_current_1.CanvasPosition = Vector2.new(l_current_1.CanvasPosition.X, v22.ref.current.CanvasSize.Y.Offset + v22.ref.current.AbsoluteSize.Y);
        end;
    end;
end;
v11.didMount = function(v24) --[[ Line: 74 ]] --[[ Name: didMount ]]
    -- upvalues: l_TextFrameHeight_0 (copy), v10 (copy), l_TextFramePadding_0 (copy)
    v24.logConnector = v24.props.targetSignal:Connect(function(v25) --[[ Line: 75 ]]
        -- upvalues: v24 (copy), l_TextFrameHeight_0 (ref), v10 (ref), l_TextFramePadding_0 (ref)
        if not v24.state.autoScroll and v25:getSize() == v25:getMaxSize() then
            local l_canvasPos_0 = v24.state.canvasPos;
            local l_Y_0 = l_canvasPos_0.Y;
            local v28 = v25:back();
            if v28 then
                local l_Y_1 = v28.Dims.Y;
                local v30 = v24.state.absSize.X - l_TextFrameHeight_0;
                if v24.state.wordWrap and v30 > 0 then
                    l_Y_1 = if v10 then math.ceil(v28.Dims.Y * math.ceil(v28.Dims.X / v30)) else v28.Dims.Y * math.ceil(v28.Dims.X / v30);
                end;
                l_Y_0 = math.max(0, l_Y_0 - l_Y_1 - l_TextFramePadding_0);
            end;
            v24:setState({
                logData = v25, 
                canvasPos = Vector2.new(l_canvasPos_0.X, l_Y_0)
            });
            return;
        else
            v24:setState({
                logData = v25
            });
            return;
        end;
    end);
    v24._canvasSignal = v24.ref.current:GetPropertyChangedSignal("CanvasPosition"):Connect(v24.onCanvasChange);
    v24._absSizeSignal = v24.ref.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(v24.onCanvasChange);
    if v24.ref.current.AbsoluteSize.Magnitude > 0 then
        v24:setState({
            absSize = v24.ref.current.AbsoluteSize
        });
    end;
end;
v11.willUnmount = function(v31) --[[ Line: 123 ]] --[[ Name: willUnmount ]]
    v31.logConnector:Disconnect();
    v31.logConnector = nil;
end;
v11.render = function(v32) --[[ Line: 128 ]] --[[ Name: render ]]
    -- upvalues: l_TextFrameHeight_0 (copy), v10 (copy), v3 (copy), v2 (copy), l_IconHeight_0 (copy), l_MainWindow_0 (copy), l_Log_0 (copy), l_TextFramePadding_0 (copy), l_MaxStringSize_0 (copy), l_TextService_0 (copy)
    local l_layoutOrder_0 = v32.props.layoutOrder;
    local l_size_0 = v32.props.size;
    local l_logData_0 = v32.state.logData;
    local l_absSize_0 = v32.state.absSize;
    local l_canvasPos_1 = v32.state.canvasPos;
    local l_wordWrap_0 = v32.state.wordWrap;
    local v39 = {};
    local v40 = 1;
    local v41 = 0;
    if v32.ref.current and l_logData_0 then
        local v42 = l_absSize_0.X - l_TextFrameHeight_0;
        local v43 = -1;
        local v44 = 0;
        local v45 = l_logData_0:iterator();
        local v46 = v45:next();
        while v46 do
            local l_Message_0 = v46.Message;
            local l_CharCount_0 = v46.CharCount;
            local l_Y_2 = v46.Dims.Y;
            if l_wordWrap_0 and v42 > 0 then
                l_Y_2 = if v10 then math.ceil(v46.Dims.Y * math.ceil(v46.Dims.X / v42)) else v46.Dims.Y * math.ceil(v46.Dims.X / v42);
            end;
            v40 = v40 + 1;
            if v41 + l_Y_2 >= l_canvasPos_1.Y then
                if v44 < l_absSize_0.Y then
                    local l_Text_0 = v3.Color.Text;
                    local v51 = "";
                    if v46.Type == Enum.MessageType.MessageOutput.Value then
                        l_Text_0 = v3.Color.Text;
                    elseif v46.Type == Enum.MessageType.MessageInfo.Value then
                        l_Text_0 = v3.Color.HighlightBlue;
                        v51 = v3.Image.Info;
                    elseif v46.Type == Enum.MessageType.MessageWarning.Value then
                        l_Text_0 = v3.Color.WarningYellow;
                        v51 = v3.Image.Warning;
                    elseif v46.Type == Enum.MessageType.MessageError.Value then
                        l_Text_0 = v3.Color.ErrorRed;
                        v51 = v3.Image.Error;
                    end;
                    v39[v40] = v2.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, l_Y_2), 
                        BackgroundTransparency = 1, 
                        LayoutOrder = v40
                    }, {
                        image = v2.createElement("ImageLabel", {
                            Image = v51, 
                            Size = UDim2.new(0, l_IconHeight_0, 0, l_IconHeight_0), 
                            Position = UDim2.new(0, l_IconHeight_0 / 4, 0.5, -l_IconHeight_0 / 2), 
                            BackgroundTransparency = 1
                        }), 
                        msg = v2.createElement("TextLabel", {
                            Text = l_Message_0, 
                            TextColor3 = l_Text_0, 
                            TextSize = l_MainWindow_0, 
                            Font = l_Log_0, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextWrapped = l_wordWrap_0, 
                            Size = UDim2.new(1, 0, 0, l_Y_2), 
                            Position = UDim2.new(0, l_TextFrameHeight_0, 0, 0), 
                            BackgroundTransparency = 1
                        })
                    });
                end;
                if v43 < 0 then
                    v43 = v41;
                else
                    v44 = v44 + l_Y_2 + l_TextFramePadding_0;
                end;
            end;
            v41 = v41 + l_Y_2 + l_TextFramePadding_0;
            if l_CharCount_0 < l_MaxStringSize_0 then
                v46 = v45:next();
            else
                local v52 = string.format(" -- Could not display entire %d character message because message exceeds max displayable length of %d", l_CharCount_0, l_MaxStringSize_0);
                v46 = {
                    Message = v52, 
                    CharCount = #v52, 
                    Type = v46.Type, 
                    Dims = l_TextService_0:GetTextSize(v52, l_MainWindow_0, l_Log_0, Vector2.new())
                };
            end;
        end;
        v39.UIListLayout = v2.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, l_TextFramePadding_0)
        });
        v39.WindowingPadding = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v43), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        });
    end;
    return v2.createElement("ScrollingFrame", {
        Size = l_size_0, 
        BackgroundTransparency = 1, 
        VerticalScrollBarInset = 1, 
        ScrollBarThickness = 6, 
        CanvasSize = UDim2.new(0, 0, 0, v41), 
        CanvasPosition = l_canvasPos_1, 
        LayoutOrder = l_layoutOrder_0, 
        [v2.Ref] = v32.ref
    }, v39);
end;
return v11;