local l_CoreGui_0 = game:GetService("CoreGui");
local v1 = require(l_CoreGui_0.RobloxGui.Modules.Stats.StatsUtils);
local _ = require(l_CoreGui_0.RobloxGui.Modules.Stats.StatsAggregator);
local v3 = require(l_CoreGui_0.RobloxGui.Modules.Stats.DecoratedValueLabel);
local l_TextPanelTopMarginPix_0 = v1.TextPanelTopMarginPix;
local v5 = UDim2.new(0, v1.TextPanelLeftMarginPix, 0, l_TextPanelTopMarginPix_0);
l_TextPanelTopMarginPix_0 = l_TextPanelTopMarginPix_0 + v1.TextPanelTitleHeightY;
local v6 = UDim2.new(0, v1.TextPanelLeftMarginPix, 0, l_TextPanelTopMarginPix_0);
l_TextPanelTopMarginPix_0 = l_TextPanelTopMarginPix_0 + v1.TextPanelLegendItemHeightY;
local v7 = UDim2.new(0, v1.TextPanelLeftMarginPix, 0, l_TextPanelTopMarginPix_0);
l_TextPanelTopMarginPix_0 = l_TextPanelTopMarginPix_0 + v1.TextPanelLegendItemHeightY;
local v8 = UDim2.new(0, v1.TextPanelLeftMarginPix, 0, l_TextPanelTopMarginPix_0);
local v9 = UDim2.new(1, -v1.TextPanelLeftMarginPix * 2, 0, v1.TextPanelTitleHeightY);
local v10 = UDim2.new(1, -v1.TextPanelLeftMarginPix * 2, 0, v1.TextPanelLegendItemHeightY);
local v11 = {};
v11.__index = v11;
v11.new = function(v12) --[[ Line: 58 ]] --[[ Name: new ]]
    -- upvalues: v11 (copy), v1 (copy), v9 (copy), v5 (copy)
    local v13 = {};
    setmetatable(v13, v11);
    v13._statType = v12;
    v13._frame = Instance.new("Frame");
    v13._frame.BackgroundTransparency = 1;
    v13._frame.ZIndex = v1.TextZIndex;
    v13._titleLabel = Instance.new("TextLabel");
    v1.StyleTextWidget(v13._titleLabel);
    v13._titleLabel.FontSize = v1.PanelTitleFontSize;
    v13._titleLabel.Text = v13:_getTitle();
    v13._titleLabel.Parent = v13._frame;
    v13._titleLabel.Size = v9;
    v13._titleLabel.Position = v5;
    v13._titleLabel.TextXAlignment = Enum.TextXAlignment.Left;
    v13._titleLabel.TextYAlignment = Enum.TextYAlignment.Top;
    v13:_addCurrentValueWidget();
    v13:_addTargetValueWidget();
    v13:_addAverageValueWidget();
    return v13;
end;
v11._getTarget = function(v14) --[[ Line: 91 ]] --[[ Name: _getTarget ]]
    if v14._performanceStats == nil then
        return 0;
    else
        local l_FirstChild_0 = v14._performanceStats:FindFirstChild(v14._statMaxName);
        if l_FirstChild_0 == nil then
            return 0;
        else
            return l_FirstChild_0:GetValue();
        end;
    end;
end;
v11._addCurrentValueWidget = function(v16) --[[ Line: 106 ]] --[[ Name: _addCurrentValueWidget ]]
    -- upvalues: v3 (copy), v10 (copy), v6 (copy), v1 (copy)
    v16._currentValueWidget = v3.new(v16._statType, "Current");
    v16._currentValueWidget:PlaceInParent(v16._frame, v10, v6);
    local l_DecorationFrame_0 = v16._currentValueWidget:GetDecorationFrame();
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.Position = UDim2.new(0.5, -v1.OvalKeySize / 2, 0.5, -v1.OvalKeySize / 2);
    l_ImageLabel_0.Size = UDim2.new(0, v1.OvalKeySize, 0, v1.OvalKeySize);
    l_ImageLabel_0.Parent = l_DecorationFrame_0;
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.Image = "rbxasset://textures/ui/PerformanceStats/OvalKey.png";
    l_ImageLabel_0.BorderSizePixel = 0;
    v16._currentValueDecoration = l_ImageLabel_0;
end;
v11._addTargetValueWidget = function(v19) --[[ Line: 128 ]] --[[ Name: _addTargetValueWidget ]]
    -- upvalues: v3 (copy), v10 (copy), v7 (copy), v1 (copy)
    v19._targetValueWidget = v3.new(v19._statType, "Target");
    v19._targetValueWidget:PlaceInParent(v19._frame, v10, v7);
    local l_DecorationFrame_1 = v19._targetValueWidget:GetDecorationFrame();
    local l_ImageLabel_1 = Instance.new("ImageLabel");
    l_ImageLabel_1.Position = UDim2.new(0.5, -v1.TargetKeyWidth / 2, 0.5, -v1.TargetKeyHeight / 2);
    l_ImageLabel_1.Size = UDim2.new(0, v1.TargetKeyWidth, 0, v1.TargetKeyHeight);
    l_ImageLabel_1.Parent = l_DecorationFrame_1;
    l_ImageLabel_1.BackgroundTransparency = 1;
    l_ImageLabel_1.Image = "rbxasset://textures/ui/PerformanceStats/TargetKey.png";
end;
v11._addAverageValueWidget = function(v22) --[[ Line: 148 ]] --[[ Name: _addAverageValueWidget ]]
    -- upvalues: v3 (copy), v10 (copy), v8 (copy), v1 (copy)
    v22._averageValueWidget = v3.new(v22._statType, "Average");
    v22._averageValueWidget:PlaceInParent(v22._frame, v10, v8);
    local l_DecorationFrame_2 = v22._averageValueWidget:GetDecorationFrame();
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Position = UDim2.new(0, 0, 0.5, -v1.GraphAverageLineTotalThickness / 2);
    l_Frame_0.Size = UDim2.new(1, 0, 0, v1.GraphAverageLineInnerThickness);
    l_Frame_0.Parent = l_DecorationFrame_2;
    v1.StyleAverageLine(l_Frame_0);
end;
v11._getTitle = function(v25) --[[ Line: 166 ]] --[[ Name: _getTitle ]]
    -- upvalues: v1 (copy)
    return v1.TypeToName[v25._statType];
end;
v11.PlaceInParent = function(v26, v27, v28, v29) --[[ Line: 170 ]] --[[ Name: PlaceInParent ]]
    v26._frame.Position = v29;
    v26._frame.Size = v28;
    v26._frame.Parent = v27;
end;
v11.SetStatsAggregator = function(v30, v31) --[[ Line: 177 ]] --[[ Name: SetStatsAggregator ]]
    if v30._aggregator then
        v30._aggregator:RemoveListener(v30._listenerId);
        v30._listenerId = nil;
        v30._aggregator = nil;
    end;
    v30._aggregator = v31;
    v30:_refreshVisibility();
end;
v11.SetVisible = function(v32, v33) --[[ Line: 189 ]] --[[ Name: SetVisible ]]
    v32._frame.Visible = v33;
    v32:_refreshVisibility();
end;
v11._shouldBeVisible = function(v34) --[[ Line: 194 ]] --[[ Name: _shouldBeVisible ]]
    -- upvalues: v1 (copy)
    if v1.PerformanceStatsShouldBeVisible() then
        return v34._frame.Visible;
    else
        return false;
    end;
end;
v11._refreshVisibility = function(v35) --[[ Line: 203 ]] --[[ Name: _refreshVisibility ]]
    if v35:_shouldBeVisible() then
        v35:_startListening();
        v35:_updateFromAggregator();
        return;
    else
        v35:_stopListening();
        return;
    end;
end;
v11._stopListening = function(v36) --[[ Line: 212 ]] --[[ Name: _stopListening ]]
    if v36._aggregator == nil then
        return;
    elseif v36._listenerId == nil then
        return;
    else
        v36._aggregator:RemoveListener(v36._listenerId);
        v36._listenerId = nil;
        return;
    end;
end;
v11._startListening = function(v37) --[[ Line: 225 ]] --[[ Name: _startListening ]]
    if v37._aggregator == nil then
        return;
    elseif v37._listenerId ~= nil then
        return;
    else
        v37._listenerId = v37._aggregator:AddListener(function() --[[ Line: 234 ]]
            -- upvalues: v37 (copy)
            v37:_updateFromAggregator();
        end);
        return;
    end;
end;
v11._updateFromAggregator = function(v38) --[[ Line: 239 ]] --[[ Name: _updateFromAggregator ]]
    -- upvalues: v1 (copy)
    local v39 = 0;
    local v40 = 0;
    local v41 = 0;
    if v38._aggregator ~= nil then
        v39 = v38._aggregator:GetLatestValue();
        v40 = v38._aggregator:GetAverage();
        v41 = v38._aggregator:GetTarget();
    end;
    v38._currentValueWidget:SetValue(v39);
    v38._targetValueWidget:SetValue(v41);
    v38._averageValueWidget:SetValue(v40);
    v38._currentValueDecoration.ImageColor3 = v1.GetColorForValue(v39, v41);
end;
v11.SetZIndex = function(v42, v43) --[[ Line: 258 ]] --[[ Name: SetZIndex ]]
    v42._frame.ZIndex = v43;
    v42._titleLabel.ZIndex = v43;
    v42._currentValueWidget:SetZIndex(v43);
    v42._averageValueWidget:SetZIndex(v43);
end;
return v11;