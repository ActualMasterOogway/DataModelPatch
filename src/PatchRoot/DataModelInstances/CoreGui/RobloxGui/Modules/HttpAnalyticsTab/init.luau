local v0 = Color3.new(1, 1, 1);
local v1 = Color3.new(0.25, 0.75, 0.75);
local v2 = Color3.new(0.25, 0.25, 0.75);
local v3 = Color3.new(1, 1, 1);
local v4 = Color3.new(1, 0, 1);
local v5 = {
    50, 
    50, 
    50, 
    65, 
    120, 
    -335
};
local v6 = {
    "Method", 
    "Status", 
    "Time", 
    "RequestType", 
    "URL"
};
local v7 = {
    "No.", 
    "Method", 
    "Status", 
    "Time(ms)", 
    "RequestType", 
    "URL"
};
local v8 = 256;
pcall(function() --[[ Line: 17 ]]
    -- upvalues: v8 (ref)
    v8 = tonumber(settings():GetFVariable("HttpAnalyticsMaxHistory"));
end);
local v9 = {};
v9.__index = v9;
v9.new = function(v10, v11, v12, v13) --[[ Line: 31 ]] --[[ Name: new ]]
    -- upvalues: v9 (copy), v0 (copy), v3 (copy)
    local v14 = {};
    setmetatable(v14, v9);
    v14._parent = v10;
    v14._frame = Instance.new("Frame");
    v14._frame.Position = v11;
    v14._frame.Size = v12;
    v14._frame.BorderColor3 = v0;
    v14._frame.BorderSizePixel = 1;
    v14._frame.BackgroundTransparency = 0.9;
    v14._frame.ZIndex = v14._parent.ZIndex + 1;
    v14._frame.BackgroundColor3 = v13;
    v14._frame.Parent = v14._parent;
    v14._label = Instance.new("TextLabel");
    v14._label.TextColor3 = v3;
    v14._label.Position = UDim2.new(0, 5, 0, 0);
    v14._label.Size = UDim2.new(1, -10, 1, 0);
    v14._label.BackgroundTransparency = 1;
    v14._label.TextXAlignment = Enum.TextXAlignment.Left;
    v14._label.ZIndex = v14._parent.ZIndex + 1;
    v14._label.Parent = v14._frame;
    return v14;
end;
v9.setValue = function(v15, v16) --[[ Line: 59 ]] --[[ Name: setValue ]]
    if v15._label == nil then
        return;
    else
        local v17 = type(v16);
        local v18 = nil;
        v18 = if v17 == "string" then v16 else if v17 == "number" then if v16 - math.floor(v16) > 0 then string.format("%.02f", v16) else tostring(v16) else tostring(v16);
        v15._label.Text = v18;
        return;
    end;
end;
v9.getFrame = function(v19) --[[ Line: 81 ]] --[[ Name: getFrame ]]
    return v19._frame;
end;
local v20 = {};
v20.__index = v20;
v20.new = function(v21, v22) --[[ Line: 96 ]] --[[ Name: new ]]
    -- upvalues: v20 (copy)
    local v23 = {};
    setmetatable(v23, v20);
    v23._parent = v21;
    v23._frame = Instance.new("Frame");
    v23._frame.Name = "UIListClass";
    v23._frame.Position = UDim2.new(0, 1, 0, 1);
    v23._frame.Size = UDim2.new(1, 0, 0, 0);
    v23._frame.ZIndex = v23._parent.ZIndex;
    v23._frame.BorderSizePixel = 0;
    v23._frame.Parent = v23._parent;
    v23._columnWidths = {
        100
    };
    v23._rowHeight = 20;
    v23._rows = {};
    v23._callbackClicked = v22;
    return v23;
end;
v20.setColumns = function(v24, v25, v26) --[[ Line: 118 ]] --[[ Name: setColumns ]]
    v24:setColumnWidths(v26);
    v24:setRow(1, v25);
end;
v20.setColumnWidths = function(v27, v28) --[[ Line: 123 ]] --[[ Name: setColumnWidths ]]
    v27._columnWidths = v28;
end;
v20.setRow = function(v29, v30, v31) --[[ Line: 127 ]] --[[ Name: setRow ]]
    if #v29._rows + 1 < v30 then
        return;
    elseif #v29._rows < v30 then
        v29:addRow(v31);
        return;
    else
        local v32 = v29._rows[v30];
        for v33, v34 in ipairs(v32) do
            v34:setValue(v31[v33]);
        end;
        return;
    end;
end;
v20.addRow = function(v35, v36) --[[ Line: 140 ]] --[[ Name: addRow ]]
    -- upvalues: v1 (copy), v2 (copy), v9 (copy)
    local v37 = #v35._rows + 1;
    local v38 = {};
    for v39 = 1, #v36 do
        if #v35._columnWidths >= v39 then
            local v40 = v35:getItemPosition(v37, v39);
            local v41 = v35:getItemSize(v37, v39);
            local v42 = nil;
            v42 = if v37 % 2 == 1 then v1 else v2;
            local v43 = v9.new(v35._frame, v40, v41, v42);
            local v44 = v43:getFrame();
            v44.InputBegan:connect(function(v45) --[[ Line: 160 ]]
                -- upvalues: v35 (copy), v37 (copy), v39 (copy), v44 (copy)
                if v45.UserInputType == Enum.UserInputType.MouseButton1 and v35._callbackClicked ~= nil then
                    v35._callbackClicked(v37, v39, v44);
                end;
            end);
            v43:setValue(v36[v39]);
            table.insert(v38, v43);
        else
            break;
        end;
    end;
    table.insert(v35._rows, v38);
end;
v20.getItemPosition = function(v46, v47, v48) --[[ Line: 176 ]] --[[ Name: getItemPosition ]]
    local v49 = 0;
    local v50 = 0;
    for v51 = 1, v48 - 1 do
        v49 = v49 + v46._columnWidths[v51];
    end;
    for _ = 1, v47 - 1 do
        v50 = v50 + v46._rowHeight;
    end;
    return UDim2.new(0, v49, 0, v50);
end;
v20.getItemSize = function(v53, _, v55) --[[ Line: 189 ]] --[[ Name: getItemSize ]]
    if v53._columnWidths[v55] < 0 then
        return UDim2.new(1, -v53._columnWidths[v55], 0, v53._rowHeight);
    else
        return UDim2.new(0, v53._columnWidths[v55], 0, v53._rowHeight);
    end;
end;
v20.getHeightInPix = function(v56) --[[ Line: 197 ]] --[[ Name: getHeightInPix ]]
    return v56._rowHeight * #v56._rows;
end;
v20.getFrame = function(v57) --[[ Line: 201 ]] --[[ Name: getFrame ]]
    return v57._frame;
end;
local v58 = {};
v58.__index = v58;
v58.new = function(v59, v60, v61) --[[ Line: 215 ]] --[[ Name: new ]]
    -- upvalues: v58 (copy), v20 (copy)
    local v62 = {};
    setmetatable(v62, v58);
    v62._sortedColumn = 1;
    v62._list = v20.new(v59, v61);
    v62._heightChangedCallback = v60;
    v62._rowValues = {};
    v62._counter = 0;
    v62._sortedTitleLastColor = nil;
    v62._sortedTitleFrame = nil;
    return v62;
end;
v58.sort = function(v63, v64, v65) --[[ Line: 230 ]] --[[ Name: sort ]]
    -- upvalues: v4 (copy)
    if v64 == v63._sortedColumn then
        return;
    elseif v64 < 1 or #v63._rowValues < 2 or #v63._rowValues[1] < v64 then
        return;
    else
        v63._sortedColumn = v64;
        v63._sortedTitleLastColor = v65.BackgroundColor3;
        if v63._sortedTitleFrame ~= nil then
            v63._sortedTitleFrame.BackgroundColor3 = v63._sortedTitleLastColor;
        end;
        v63._sortedTitleFrame = v65;
        v63._sortedTitleFrame.BackgroundColor3 = v4;
        table.sort(v63._rowValues, function(v66, v67) --[[ Line: 246 ]]
            -- upvalues: v63 (copy)
            return v66[v63._sortedColumn] < v67[v63._sortedColumn];
        end);
        for v68, v69 in ipairs(v63._rowValues) do
            v63._list:setRow(v68 + 1, v69);
        end;
        return;
    end;
end;
v58.insert = function(v70, v71) --[[ Line: 255 ]] --[[ Name: insert ]]
    if v70._sortedColumn == 0 or #v70._rowValues == 0 then
        table.insert(v70._rowValues, v71);
        return;
    else
        local v72 = #v70._rowValues + 1;
        for v73 = 1, #v70._rowValues do
            if v70._rowValues[v73][v70._sortedColumn] > v71[v70._sortedColumn] then
                v72 = v73;
                break;
            end;
        end;
        table.insert(v70._rowValues, v72, v71);
        return;
    end;
end;
v58.remove = function(v74) --[[ Line: 278 ]] --[[ Name: remove ]]
    -- upvalues: v8 (ref)
    local v75 = 1;
    if v74._sortedColumn > 1 then
        local v76 = v74._counter - v8 + 1;
        for v77, v78 in ipairs(v74._rowValues) do
            if v78[1] == v76 then
                v75 = v77;
                break;
            end;
        end;
    end;
    table.remove(v74._rowValues, v75);
end;
v58.addRow = function(v79, v80) --[[ Line: 292 ]] --[[ Name: addRow ]]
    -- upvalues: v8 (ref)
    local v81 = false;
    if #v79._rowValues < v8 then
        v79:insert(v80);
        v81 = true;
    else
        v79:remove();
        v79:insert(v80);
    end;
    for v82, v83 in ipairs(v79._rowValues) do
        v79._list:setRow(v82 + 1, v83);
    end;
    if v81 and v79._heightChangedCallback ~= nil then
        v79._heightChangedCallback(v79._list:getHeightInPix());
    end;
end;
v58.addHttpResult = function(v84, v85) --[[ Line: 310 ]] --[[ Name: addHttpResult ]]
    -- upvalues: v7 (copy), v5 (copy), v6 (copy)
    if v85.Hiden == true then
        return;
    else
        if #v84._rowValues == 0 then
            v84._list:setColumns(v7, v5);
        end;
        local v86 = {
            v84._counter + 1
        };
        for _, v88 in ipairs(v6) do
            table.insert(v86, v85[v88]);
        end;
        table.insert(v86, v85.Response);
        v84:addRow(v86);
        v84._counter = v84._counter + 1;
        return;
    end;
end;
v58.getHeightInPix = function(v89) --[[ Line: 327 ]] --[[ Name: getHeightInPix ]]
    return v89._list:getHeightInPix();
end;
v58.getFrame = function(v90) --[[ Line: 331 ]] --[[ Name: getFrame ]]
    return v90._list:getFrame();
end;
v58.getValues = function(v91, v92) --[[ Line: 335 ]] --[[ Name: getValues ]]
    return v91._rowValues[v92];
end;
local v93 = {};
v93.__index = v93;
local v94 = {
    "RequestType", 
    "RequestCount", 
    "FailedCount", 
    "AverageTime(ms)", 
    "MinTime(ms)", 
    "MaxTime(ms)"
};
local v95 = {
    "RequestType", 
    "RequestCount", 
    "FailedCount", 
    "AverageTime", 
    "MinTime", 
    "MaxTime"
};
local v96 = {
    120, 
    90, 
    90, 
    110, 
    90, 
    90
};
v93.new = function(v97, v98) --[[ Line: 354 ]] --[[ Name: new ]]
    -- upvalues: v93 (copy), v20 (copy)
    local v99 = {};
    setmetatable(v99, v93);
    v99._list = v20.new(v97);
    v99._tableData = {};
    v99._tableData.size = 0;
    v99._heightChangedCallback = v98;
    return v99;
end;
v93.addHttpResult = function(v100, v101) --[[ Line: 368 ]] --[[ Name: addHttpResult ]]
    -- upvalues: v94 (copy), v96 (copy), v95 (copy)
    if v100._tableData.size == 0 then
        v100._list:setColumns(v94, v96);
    end;
    local v102 = v100._tableData[v101.RequestType];
    local v103 = false;
    if v102 == nil then
        v100._tableData[v101.RequestType] = {
            RequestType = v101.RequestType, 
            RequestCount = 1, 
            FailedCount = 0, 
            AverageTime = v101.Time, 
            MinTime = v101.Time, 
            MaxTime = v101.Time, 
            index = v100._tableData.size + 1
        };
        v100._tableData.size = v100._tableData.size + 1;
        if v101.Status >= 400 then
            v100._tableData[v101.RequestType].FailedCount = 1;
        end;
        v102 = v100._tableData[v101.RequestType];
        v103 = true;
    else
        v102.RequestCount = v102.RequestCount + 1;
        if v101.Status >= 400 then
            v102.FailedCount = v102.FailedCount + 1;
        end;
        v102.AverageTime = (v102.AverageTime * v102.RequestCount + v101.Time - v102.AverageTime) / v102.RequestCount;
        if v101.Time < v102.MinTime then
            v102.MinTime = v101.Time;
        end;
        if v101.Time > v102.MaxTime then
            v102.MaxTime = v101.Time;
        end;
    end;
    local v104 = {};
    for _, v106 in ipairs(v95) do
        table.insert(v104, v102[v106]);
    end;
    v100._list:setRow(v102.index + 1, v104);
    if v103 and v100._heightChangedCallback ~= nil then
        v100._heightChangedCallback(v100:getHeightInPix());
    end;
end;
v93.getHeightInPix = function(v107) --[[ Line: 417 ]] --[[ Name: getHeightInPix ]]
    return v107._list:getHeightInPix();
end;
v93.getFrame = function(v108) --[[ Line: 421 ]] --[[ Name: getFrame ]]
    return v108._list:getFrame();
end;
local v109 = Color3.new(0.8, 0.8, 1);
local v110 = {};
v110.__index = v110;
v110.new = function(v111, v112) --[[ Line: 440 ]] --[[ Name: new ]]
    -- upvalues: v110 (copy), v109 (copy), v3 (copy)
    local v113 = {};
    setmetatable(v113, v110);
    v113._frame = Instance.new("Frame");
    v113._frame.Position = UDim2.new(0, 2, 0, 2);
    v113._frame.Size = UDim2.new(1, -4, 10, 0);
    v113._frame.BackgroundTransparency = 1;
    v113._frame.ZIndex = v111.ZIndex + 1;
    v113._frame.Visible = false;
    v113._frame.InputBegan:connect(function(v114) --[[ Line: 450 ]]
        -- upvalues: v113 (copy), v112 (copy)
        if v114.UserInputType == Enum.UserInputType.MouseButton1 then
            v113._bodyTitle.Visible = false;
            v113._bodyLabel.Visible = false;
            v113._frame.Visible = false;
            v112(false);
        end;
    end);
    v113._frame.Parent = v111;
    v113._bodyTitle = Instance.new("TextLabel");
    v113._bodyTitle.Name = "self._bodyTitle";
    v113._bodyTitle.Position = UDim2.new(0, 4, 0, 4);
    v113._bodyTitle.Size = UDim2.new(1, 0, 0, 50);
    v113._bodyTitle.TextSize = 12;
    v113._bodyTitle.TextColor3 = v109;
    v113._bodyTitle.TextXAlignment = Enum.TextXAlignment.Left;
    v113._bodyTitle.TextYAlignment = Enum.TextYAlignment.Top;
    v113._bodyTitle.ZIndex = v113._frame.ZIndex;
    v113._bodyTitle.BackgroundTransparency = 1;
    v113._bodyTitle.Visible = false;
    v113._bodyTitle.TextWrap = true;
    v113._bodyTitle.Text = "Response Body:";
    v113._bodyTitle.Parent = v113._frame;
    v113._bodyLabel = Instance.new("TextLabel");
    v113._bodyLabel.Name = "self._bodyLabel";
    v113._bodyLabel.Position = UDim2.new(0, 10, 0, 29);
    v113._bodyLabel.Size = UDim2.new(1, -20, 1, 0);
    v113._bodyLabel.TextWrap = true;
    v113._bodyLabel.TextXAlignment = Enum.TextXAlignment.Left;
    v113._bodyLabel.TextYAlignment = Enum.TextYAlignment.Top;
    v113._bodyLabel.TextColor3 = v3;
    v113._bodyLabel.ZIndex = v113._frame.ZIndex;
    v113._bodyLabel.BackgroundTransparency = 1;
    v113._bodyLabel.Visible = false;
    v113._bodyLabel.Parent = v113._frame;
    return v113;
end;
v110.show = function(v115, v116) --[[ Line: 492 ]] --[[ Name: show ]]
    local v117, v118 = utf8.len(v116);
    if v117 == nil then
        if v118 ~= nil then
            v116 = v116:sub(1, v118 - 1);
        end;
        v115._bodyTitle.Text = "Response Body:" .. "\n  Some content can't be rendered as text.";
    else
        v115._bodyTitle.Text = "Response Body:";
    end;
    v115._bodyLabel.Text = v116;
    v115._bodyTitle.Position = UDim2.new(0, 4, 0, 4);
    v115._bodyLabel.Position = UDim2.new(0, 10, 0, v115._bodyTitle.Position.Y.Offset + v115._bodyTitle.TextBounds.Y);
    v115._bodyTitle.Visible = true;
    v115._bodyLabel.Visible = true;
    v115._frame.Visible = true;
end;
v110.getHeightInPix = function(v119) --[[ Line: 514 ]] --[[ Name: getHeightInPix ]]
    return 4 + v119._bodyTitle.TextBounds.Y + v119._bodyLabel.TextBounds.Y;
end;
v110.isVisible = function(v120) --[[ Line: 519 ]] --[[ Name: isVisible ]]
    return v120._frame.Visible;
end;
local v121 = {};
v121.__index = v121;
v121.new = function(v122, v123) --[[ Line: 534 ]] --[[ Name: new ]]
    -- upvalues: v121 (copy), v110 (copy), v93 (copy), v58 (copy)
    local v124 = {};
    setmetatable(v124, v121);
    v124._responseView = v110.new(v122, function(v125, _) --[[ Line: 538 ]]
        -- upvalues: v124 (copy)
        if not v125 then
            v124._httpAnalyticsFrame.Visible = true;
            v124._httpResultListFrame.Visible = true;
        end;
        v124:heightChange();
    end);
    local function v128(_) --[[ Line: 546 ]]
        -- upvalues: v124 (copy)
        v124:updatePosition();
    end;
    local function v130(_) --[[ Line: 550 ]]
        -- upvalues: v124 (copy)
        v124:heightChange();
    end;
    local function v135(v131, v132, v133) --[[ Line: 554 ]]
        -- upvalues: v124 (copy)
        if v124._responseView:isVisible() then
            return;
        elseif v131 == 1 then
            v124._httpResultList:sort(v132, v133);
            return;
        else
            local v134 = v124._httpResultList:getValues(v131 - 1);
            v124:showResponse(v134);
            return;
        end;
    end;
    v124._httpAnalyticsTable = v93.new(v122, v128);
    v124._httpResultList = v58.new(v122, v130, v135);
    v124._httpAnalyticsFrame = v124._httpAnalyticsTable:getFrame();
    v124._httpResultListFrame = v124._httpResultList:getFrame();
    v124._heightChangedCallback = v123;
    return v124;
end;
v121.updatePosition = function(v136) --[[ Line: 575 ]] --[[ Name: updatePosition ]]
    local v137 = v136._httpAnalyticsTable:getHeightInPix();
    v136._httpResultListFrame.Position = UDim2.new(0, 1, 0, v137 + 3);
    v136:heightChange();
end;
v121.heightChange = function(v138) --[[ Line: 581 ]] --[[ Name: heightChange ]]
    if v138._heightChangedCallback ~= nil then
        v138._heightChangedCallback(v138:getHeightInPix());
    end;
end;
v121.addHttpResult = function(v139, v140) --[[ Line: 589 ]] --[[ Name: addHttpResult ]]
    v139._httpAnalyticsTable:addHttpResult(v140);
    v139._httpResultList:addHttpResult(v140);
end;
v121.getHeightInPix = function(v141) --[[ Line: 594 ]] --[[ Name: getHeightInPix ]]
    if v141._responseView:isVisible() then
        return v141._responseView:getHeightInPix();
    else
        return v141._httpAnalyticsTable:getHeightInPix() + v141._httpResultList:getHeightInPix() + 3;
    end;
end;
v121.showResponse = function(v142, v143) --[[ Line: 603 ]] --[[ Name: showResponse ]]
    v142._httpAnalyticsFrame.Visible = false;
    v142._httpResultListFrame.Visible = false;
    v142._responseView:show(v143[#v143]);
    v142:heightChange();
end;
return v121;