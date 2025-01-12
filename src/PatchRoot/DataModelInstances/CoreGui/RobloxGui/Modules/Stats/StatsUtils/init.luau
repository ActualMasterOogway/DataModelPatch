local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_GameSettings_0 = UserSettings().GameSettings;
local v3 = require(l_CoreGui_0.RobloxGui.Modules.StyleWidgets);
local v4 = require(l_CoreGui_0.RobloxGui.Modules.RobloxTranslator);
LocalizedGetKey = function(v5) --[[ Line: 18 ]] --[[ Name: LocalizedGetKey ]]
    -- upvalues: v4 (copy)
    local l_v5_0 = v5;
    pcall(function() --[[ Line: 20 ]]
        -- upvalues: l_v5_0 (ref), v4 (ref), v5 (copy)
        local _ = game:GetService("LocalizationService"):GetCorescriptLocalizations()[1];
        l_v5_0 = v4:FormatByKey(v5);
    end);
    return l_v5_0;
end;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 29 ]]
    return settings():GetFFlag("UseNotificationsLocalization");
end);
local _ = l_status_0 and l_result_0;
local v11 = {
    SelectedBackgroundColor = Color3.new(0.4, 0.4, 0.4), 
    FontColor = Color3.new(1, 1, 1), 
    GraphBarGreenColor = Color3.new(0.49411764705882355, 0.8274509803921568, 0.12941176470588237), 
    GraphBarYellowColor = Color3.new(0.8196078431372549, 0.8274509803921568, 0.12941176470588237), 
    GraphBarRedColor = Color3.new(0.8274509803921568, 0.34509803921568627, 0.12941176470588237), 
    GraphAverageLineColor = Color3.new(0.8156862745098039, 0.00392156862745098, 0.10588235294117647), 
    GraphAverageLineBorderColor = Color3.new(1, 1, 1), 
    NormalColor = Color3.fromRGB(31, 31, 31), 
    Transparency = 0.5, 
    MiniPanelTitleFontSize = Enum.FontSize.Size12, 
    MiniPanelValueFontSize = Enum.FontSize.Size10, 
    PanelTitleFontSize = Enum.FontSize.Size24, 
    PanelValueFontSize = Enum.FontSize.Size14, 
    PanelGraphFontSize = Enum.FontSize.Size10, 
    ButtonHeight = 36 + v3.TabSelectionHeight, 
    ViewerTopMargin = 10, 
    ViewerHeight = 144, 
    ViewerWidth = 306, 
    TextZIndex = 5, 
    GraphZIndex = 2, 
    GraphTargetLineInnerThickness = 2, 
    GraphAverageLineInnerThickness = 2, 
    GraphAverageLineBorderThickness = 1
};
v11.GraphAverageLineTotalThickness = v11.GraphAverageLineInnerThickness + 2 * v11.GraphAverageLineBorderThickness;
v11.TextPanelTitleHeightY = 52;
v11.TextPanelLegendItemHeightY = 20;
v11.TextPanelLeftMarginPix = 10;
v11.TextPanelTopMarginPix = 10;
v11.DecorationSize = 12;
v11.OvalKeySize = 8;
v11.TargetKeyWidth = 11;
v11.TargetKeyHeight = 2;
v11.DecorationMargin = 6;
v11.StatType_Memory = "st_Memory";
v11.StatType_CPU = "st_CPU";
v11.StatType_GPU = "st_GPU";
v11.StatType_NetworkSent = "st_NetworkSent";
v11.StatType_NetworkReceived = "st_NetworkReceived";
v11.StatType_Ping = "st_Ping";
v11.AllStatTypes = {
    v11.StatType_Memory, 
    v11.StatType_CPU, 
    v11.StatType_GPU, 
    v11.StatType_NetworkSent, 
    v11.StatType_NetworkReceived, 
    v11.StatType_Ping
};
v11.StatNames = {
    [v11.StatType_Memory] = "Memory", 
    [v11.StatType_CPU] = "CPU", 
    [v11.StatType_GPU] = "GPU", 
    [v11.StatType_NetworkSent] = "NetworkSent", 
    [v11.StatType_NetworkReceived] = "NetworkReceived", 
    [v11.StatType_Ping] = "Ping"
};
v11.StatMaxNames = {
    [v11.StatType_Memory] = "MaxMemory", 
    [v11.StatType_CPU] = "MaxCPU", 
    [v11.StatType_GPU] = "MaxGPU", 
    [v11.StatType_NetworkSent] = "MaxNetworkSent", 
    [v11.StatType_NetworkReceived] = "MaxNetworkReceived", 
    [v11.StatType_Ping] = "MaxPing"
};
v11.NumButtonTypes = #v11.AllStatTypes;
local v12 = LocalizedGetKey("Sent") .. "\n" .. LocalizedGetKey("Network");
local v13 = LocalizedGetKey("Received") .. "\n" .. LocalizedGetKey("Network");
v11.TypeToName = {
    [v11.StatType_Memory] = "Memory", 
    [v11.StatType_CPU] = "CPU", 
    [v11.StatType_GPU] = "GPU", 
    [v11.StatType_NetworkSent] = v12, 
    [v11.StatType_NetworkReceived] = v13, 
    [v11.StatType_Ping] = "Ping"
};
v11.TypeToShortName = {
    [v11.StatType_Memory] = "Mem", 
    [v11.StatType_CPU] = "CPU", 
    [v11.StatType_GPU] = "GPU", 
    [v11.StatType_NetworkSent] = "Sent", 
    [v11.StatType_NetworkReceived] = "Recv", 
    [v11.StatType_Ping] = "Ping"
};
v11.MemoryAnalyzerTypeToName = {
    HumanoidTexture = "Humanoid Textures", 
    HumanoidTextureOrphan = "Humanoid Textures (Unused)", 
    OtherTexture = "Other Textures", 
    OtherTextureOrphan = "Other Textures (Unused)", 
    CoreScript = "Core Scripts", 
    UserScript = "User Scripts", 
    Sounds = "Sounds", 
    CSG = "Solid Models", 
    Meshes = "Meshes"
};
v11.GetMemoryAnalyzerStatName = function(v14) --[[ Line: 157 ]] --[[ Name: GetMemoryAnalyzerStatName ]]
    -- upvalues: v11 (copy)
    if v11.MemoryAnalyzerTypeToName[v14] == nil then
        return v14;
    else
        return v11.MemoryAnalyzerTypeToName[v14];
    end;
end;
v11.StyleFrame = function(v15) --[[ Line: 165 ]] --[[ Name: StyleFrame ]]
    -- upvalues: v11 (copy)
    v15.BackgroundColor3 = v11.NormalColor;
    v15.BackgroundTransparency = v11.Transparency;
end;
v11.StyleButton = function(v16) --[[ Line: 170 ]] --[[ Name: StyleButton ]]
    -- upvalues: v11 (copy)
    v16.BackgroundColor3 = v11.NormalColor;
    v16.BackgroundTransparency = v11.Transparency;
end;
v11.StyleTextWidget = function(v17) --[[ Line: 175 ]] --[[ Name: StyleTextWidget ]]
    -- upvalues: v11 (copy)
    v17.BackgroundTransparency = 1;
    v17.TextColor3 = v11.FontColor;
    v17.Font = Enum.Font.SourceSansBold;
end;
v11.StyleButtonSelected = function(v18, v19) --[[ Line: 181 ]] --[[ Name: StyleButtonSelected ]]
    -- upvalues: v11 (copy)
    v11.StyleButton(v18);
    if v19 then
        v18.BackgroundColor3 = v11.SelectedBackgroundColor;
    end;
end;
local l_status_1, l_result_1 = pcall(function() --[[ Line: 188 ]]
    return settings():GetFFlag("UseNotificationsLocalization");
end);
local v22 = l_status_1 and l_result_1;
local function _(v23, v24) --[[ Line: 190 ]] --[[ Name: LocalizedGetString ]]
    pcall(function() --[[ Line: 191 ]]
        -- upvalues: v24 (ref), v23 (copy)
        local l_LocalizationService_0 = game:GetService("LocalizationService");
        v24 = l_LocalizationService_0:GetCorescriptLocalizations()[1]:GetString(l_LocalizationService_0.RobloxLocaleId, v23);
    end);
    return v24;
end;
v11.FormatTypedValue = function(v27, v28) --[[ Line: 200 ]] --[[ Name: FormatTypedValue ]]
    -- upvalues: v22 (copy), v11 (copy)
    if v22 then
        if v28 == v11.StatType_CPU or v28 == v11.StatType_GPU then
            local l_gsub_0 = string.gsub;
            local v30 = string.format("%.2f MB", v27);
            local l_pcall_0 = pcall;
            local v32 = "StatsUtil.ms";
            local v33;
            do
                local l_v30_0 = v30;
                l_pcall_0(function() --[[ Line: 191 ]]
                    -- upvalues: l_v30_0 (ref), v32 (copy)
                    local l_LocalizationService_1 = game:GetService("LocalizationService");
                    l_v30_0 = l_LocalizationService_1:GetCorescriptLocalizations()[1]:GetString(l_LocalizationService_1.RobloxLocaleId, v32);
                end);
                v33 = l_v30_0;
            end;
            return l_gsub_0(v33, "{RBX_NUMBER}", string.format("%.2f", v27));
        elseif v28 == v11.StatType_NetworkSent or v28 == v11.StatType_NetworkReceived then
            local l_gsub_1 = string.gsub;
            local v37 = string.format("%.2f KB/s", v27);
            local l_pcall_1 = pcall;
            local v39 = "StatsUtil.KBps";
            local v40;
            do
                local l_v37_0 = v37;
                l_pcall_1(function() --[[ Line: 191 ]]
                    -- upvalues: l_v37_0 (ref), v39 (copy)
                    local l_LocalizationService_2 = game:GetService("LocalizationService");
                    l_v37_0 = l_LocalizationService_2:GetCorescriptLocalizations()[1]:GetString(l_LocalizationService_2.RobloxLocaleId, v39);
                end);
                v40 = l_v37_0;
            end;
            return l_gsub_1(v40, "{RBX_NUMBER}", string.format("%.2f", v27));
        end;
    end;
    if v28 == v11.StatType_Memory then
        return string.format("%.2f MB", v27);
    elseif v28 == v11.StatType_CPU then
        return string.format("%.2f ms", v27);
    elseif v28 == v11.StatType_GPU then
        return string.format("%.2f ms", v27);
    elseif v28 == v11.StatType_NetworkSent then
        return string.format("%.2f KB/s", v27);
    elseif v28 == v11.StatType_NetworkReceived then
        return string.format("%.2f KB/s", v27);
    elseif v28 == v11.StatType_Ping then
        return string.format("%.2f ms", v27);
    else
        return;
    end;
end;
v11.StyleAverageLine = function(v43) --[[ Line: 224 ]] --[[ Name: StyleAverageLine ]]
    -- upvalues: v11 (copy)
    v43.BackgroundColor3 = v11.GraphAverageLineColor;
    v43.BorderSizePixel = v11.GraphAverageLineBorderThickness;
    v43.BorderColor3 = v11.GraphAverageLineBorderColor;
end;
v11.GetColorForValue = function(v44, v45) --[[ Line: 230 ]] --[[ Name: GetColorForValue ]]
    -- upvalues: v11 (copy)
    if v44 < 0.666 * v45 then
        return v11.GraphBarGreenColor;
    elseif v44 < 1.333 * v45 then
        return v11.GraphBarYellowColor;
    else
        return v11.GraphBarRedColor;
    end;
end;
v11.PerformanceStatsShouldBeVisible = function() --[[ Line: 240 ]] --[[ Name: PerformanceStatsShouldBeVisible ]]
    -- upvalues: l_Players_0 (copy), l_GameSettings_0 (copy)
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    return l_GameSettings_0.PerformanceStatsVisible and l_LocalPlayer_0 ~= nil;
end;
return v11;