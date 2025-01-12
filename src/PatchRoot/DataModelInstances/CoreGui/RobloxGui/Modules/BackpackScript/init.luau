local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_InExperienceAppChatModal_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).App.InExperienceAppChatModal;
local l_getFFlagAppChatCoreUIConflictFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).getFFlagAppChatCoreUIConflictFix;
local v5 = {
    OpenClose = nil, 
    IsHotbarVisible = false, 
    IsOpen = false, 
    StateChanged = Instance.new("BindableEvent"), 
    ModuleName = "Backpack", 
    KeepVRTopbarOpen = true, 
    VRIsExclusive = true, 
    VRClosesNonExclusive = true
};
local v6 = 60;
local l_Size14_0 = Enum.FontSize.Size14;
local v8 = 0.5 * l_UserGameSettings_0.PreferredTransparency;
local v9 = Color3.new(0.12156862745098039, 0.12156862745098039, 0.12156862745098039);
local v10 = Color3.new(0.19215686274509805, 0.19215686274509805, 0.19215686274509805);
local v11 = Color3.new(0.35294117647058826, 0.5568627450980392, 0.9137254901960784);
local v12 = 0.5 * l_UserGameSettings_0.PreferredTransparency;
local v13 = Color3.new(1, 1, 1);
local _ = UDim2.new(0, 14, 0, 9);
local l_Value_0 = Enum.KeyCode.Backquote.Value;
local v16 = Color3.new(0, 0.6352941176470588, 1);
local v17 = "   Search";
local v18 = Color3.new(0.37, 0.37, 0.37);
local v19 = 0.15 * l_UserGameSettings_0.PreferredTransparency;
local l_Value_1 = Enum.KeyCode.Zero.Value;
local l_Value_2 = Enum.KeyCode.Backspace.Value;
local v22 = {
    [Enum.UserInputType.Gamepad1] = true, 
    [Enum.UserInputType.Gamepad2] = true, 
    [Enum.UserInputType.Gamepad3] = true, 
    [Enum.UserInputType.Gamepad4] = true, 
    [Enum.UserInputType.Gamepad5] = true, 
    [Enum.UserInputType.Gamepad6] = true, 
    [Enum.UserInputType.Gamepad7] = true, 
    [Enum.UserInputType.Gamepad8] = true
};
local l_Players_0 = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_VRService_0 = game:GetService("VRService");
local l_GamepadService_0 = game:GetService("GamepadService");
local l_CorePackages_1 = game:GetService("CorePackages");
local l_RobloxGui_1 = l_CoreGui_0:WaitForChild("RobloxGui");
l_RobloxGui_1:WaitForChild("Modules"):WaitForChild("TenFootInterface");
local v33 = require(l_RobloxGui_1.Modules.TenFootInterface):IsEnabled();
local l_Create_0 = require(l_CorePackages_1.Workspace.Packages.AppCommonLib).Create;
local v35 = require(l_RobloxGui_1.Modules.GameTranslator);
pcall(function() --[[ Line: 106 ]]
    -- upvalues: v17 (ref)
    local l_LocalizationService_0 = game:GetService("LocalizationService");
    v17 = l_LocalizationService_0:GetCorescriptLocalizations()[1]:GetString(l_LocalizationService_0.RobloxLocaleId, "BACKPACK_SEARCH");
end);
local v37 = true;
if v33 then
    v6 = 100;
    l_Size14_0 = Enum.FontSize.Size24;
end;
local v38 = false;
local v39 = l_UserInputService_0.TouchEnabled and l_GuiService_0:GetScreenResolution().X < 1024;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v41 = nil;
local v42 = nil;
local v43 = nil;
local v44 = nil;
local v45 = nil;
local v46 = nil;
local v47 = nil;
local v48 = nil;
local v49 = nil;
local v50 = nil;
local v51 = nil;
local v52 = nil;
local v53 = nil;
local v54 = nil;
local v55 = {};
local v56 = nil;
local v57 = {};
local v58 = {};
local v59 = {};
local v60 = 0;
local v61 = nil;
local v62 = false;
local v63 = false;
local v64 = false;
local v65 = false;
local v66 = {};
local v67 = {};
local v68 = false;
local v69 = 0;
local v70 = v39 and 3 or 10;
local v71 = v39 and 2 or 4;
local v72 = nil;
v5.BackpackEmpty = l_Create_0("BindableEvent")({
    Name = "BackpackEmpty"
});
v5.BackpackItemAdded = l_Create_0("BindableEvent")({
    Name = "BackpackAdded"
});
v5.BackpackItemRemoved = l_Create_0("BindableEvent")({
    Name = "BackpackRemoved"
});
local function v76(v73, v74) --[[ Line: 178 ]] --[[ Name: NewGui ]]
    -- upvalues: l_Size14_0 (ref)
    local v75 = Instance.new(v73);
    v75.Name = v74;
    v75.BackgroundColor3 = Color3.new(0, 0, 0);
    v75.BackgroundTransparency = 1;
    v75.BorderColor3 = Color3.new(0, 0, 0);
    v75.BorderSizePixel = 0;
    v75.Size = UDim2.new(1, 0, 1, 0);
    if v73:match("Text") then
        v75.TextColor3 = Color3.new(1, 1, 1);
        v75.Text = "";
        v75.Font = Enum.Font.SourceSans;
        v75.FontSize = l_Size14_0;
        v75.TextWrapped = true;
        if v73 == "TextButton" then
            v75.Font = Enum.Font.SourceSansBold;
            v75.BorderSizePixel = 1;
        end;
    end;
    return v75;
end;
local function _() --[[ Line: 200 ]] --[[ Name: FindLowestEmpty ]]
    -- upvalues: v70 (ref), v55 (copy)
    for v77 = 1, v70 do
        local v78 = v55[v77];
        if not v78.Tool then
            return v78;
        end;
    end;
    return nil;
end;
v5.IsInventoryEmpty = function() --[[ Line: 210 ]] --[[ Name: isInventoryEmpty ]]
    -- upvalues: v70 (ref), v55 (copy)
    for v80 = v70 + 1, #v55 do
        local v81 = v55[v80];
        if v81 and v81.Tool then
            return false;
        end;
    end;
    return true;
end;
local function _() --[[ Line: 222 ]] --[[ Name: UseGazeSelection ]]
    return false;
end;
local function v95() --[[ Line: 226 ]] --[[ Name: AdjustHotbarFrames ]]
    -- upvalues: v45 (ref), v70 (ref), v60 (ref), v55 (copy), v43 (ref), v5 (copy)
    local v83 = false;
    local l_Visible_0 = v45.Visible;
    local v85 = l_Visible_0 and v70 or v60;
    local v86 = 0;
    local v87 = v85 >= 1;
    for v88 = 1, v70 do
        local v89 = v55[v88];
        if v89.Tool or l_Visible_0 then
            v86 = v86 + 1;
            v89:Readjust(v86, v85);
            v89.Frame.Visible = true;
        else
            v89.Frame.Visible = false;
        end;
    end;
    local l_v43_0 = v43;
    local v91 = not l_Visible_0;
    if v91 then
        v91 = v87;
        if not v91 then
            local v92;
            for v93 = v70 + 1, #v55 do
                local v94 = v55[v93];
                if v94 and v94.Tool then
                    v92 = false;
                    v83 = true;
                end;
                if v83 then
                    break;
                end;
            end;
            if not v83 then
                v92 = true;
            end;
            v83 = false;
            v91 = not v92;
        end;
    end;
    l_v43_0.Visible = v91;
    v43.Position = UDim2.new(0.5, -15, 1, v87 and -110 or -50);
    v5.IsHotbarVisible = v87;
end;
local function v98() --[[ Line: 248 ]] --[[ Name: UpdateScrollingFrameCanvasSize ]]
    -- upvalues: v47 (ref), v6 (ref), v48 (ref)
    local v96 = math.floor(v47.AbsoluteSize.X / (v6 + 5));
    local v97 = math.ceil((#v48:GetChildren() - 1) / v96) * (v6 + 5) + 5;
    v47.CanvasSize = UDim2.new(0, 0, 0, v97);
end;
local function v101() --[[ Line: 255 ]] --[[ Name: AdjustInventoryFrames ]]
    -- upvalues: v70 (ref), v55 (copy), v98 (copy)
    for v99 = v70 + 1, #v55 do
        local v100 = v55[v99];
        v100.Frame.LayoutOrder = v100.Index;
        v100.Frame.Visible = v100.Tool ~= nil;
    end;
    v98();
end;
local function v102() --[[ Line: 264 ]] --[[ Name: UpdateBackpackLayout ]]
    -- upvalues: v42 (ref), v70 (ref), v6 (ref), v45 (ref), v71 (copy), v47 (ref), v95 (copy), v101 (copy)
    v42.Size = UDim2.new(0, 5 + v70 * (v6 + 5), 0, 5 + v6 + 5);
    v42.Position = UDim2.new(0.5, -v42.Size.X.Offset / 2, 1, -v42.Size.Y.Offset);
    v45.Size = UDim2.new(0, v42.Size.X.Offset, 0, v42.Size.Y.Offset * v71 + 40);
    v45.Position = UDim2.new(0.5, -v45.Size.X.Offset / 2, 1, v42.Position.Y.Offset - v45.Size.Y.Offset);
    v47.Size = UDim2.new(1, v47.ScrollBarThickness + 1, 1, -40);
    v47.Position = UDim2.new(0, 0, 0, 40);
    v95();
    v101();
end;
local function _(v103, v104, v105) --[[ Line: 276 ]] --[[ Name: Clamp ]]
    return (math.min(v104, (math.max(v103, v105))));
end;
local function _(v107, v108, v109) --[[ Line: 280 ]] --[[ Name: CheckBounds ]]
    local l_AbsolutePosition_0 = v107.AbsolutePosition;
    local l_AbsoluteSize_0 = v107.AbsoluteSize;
    local v112 = false;
    if l_AbsolutePosition_0.X < v108 then
        v112 = false;
        if v108 <= l_AbsolutePosition_0.X + l_AbsoluteSize_0.X then
            v112 = false;
            if l_AbsolutePosition_0.Y < v109 then
                v112 = v109 <= l_AbsolutePosition_0.Y + l_AbsoluteSize_0.Y;
            end;
        end;
    end;
    return v112;
end;
local function _(v114, v115) --[[ Line: 286 ]] --[[ Name: GetOffset ]]
    return (v114.AbsolutePosition + v114.AbsoluteSize / 2 - v115).magnitude;
end;
local function _() --[[ Line: 291 ]] --[[ Name: DisableActiveHopper ]]
    -- upvalues: v61 (ref), v57 (copy)
    v61:ToggleSelect();
    v57[v61]:UpdateEquipView();
    v61 = nil;
end;
local function _() --[[ Line: 297 ]] --[[ Name: UnequipAllTools ]]
    -- upvalues: v53 (ref), v61 (ref), v57 (copy)
    if v53 then
        v53:UnequipTools();
        if v61 then
            v61:ToggleSelect();
            v57[v61]:UpdateEquipView();
            v61 = nil;
        end;
    end;
end;
local function _(v119) --[[ Line: 306 ]] --[[ Name: EquipNewTool ]]
    -- upvalues: v53 (ref), v61 (ref), v57 (copy), v52 (ref)
    if v53 then
        v53:UnequipTools();
        if v61 then
            v61:ToggleSelect();
            v57[v61]:UpdateEquipView();
            v61 = nil;
        end;
    end;
    if v119:IsA("HopperBin") then
        v119:ToggleSelect();
        v57[v119]:UpdateEquipView();
        v61 = v119;
        return;
    else
        v119.Parent = v52;
        return;
    end;
end;
local function _(v121) --[[ Line: 318 ]] --[[ Name: IsEquipped ]]
    -- upvalues: v52 (ref)
    return v121 and (v121:IsA("HopperBin") and v121.Active or v121.Parent == v52);
end;
local function v123(v124, v125) --[[ Line: 322 ]] --[[ Name: MakeSlot ]]
    -- upvalues: v55 (copy), v12 (ref), v10 (copy), v9 (copy), v42 (ref), v6 (ref), v35 (copy), v70 (ref), v45 (ref), v60 (ref), v63 (ref), v38 (ref), l_ContextActionService_0 (copy), v57 (copy), v56 (ref), v52 (ref), v72 (ref), v76 (copy), v11 (copy), v59 (copy), v98 (copy), v53 (ref), v61 (ref), v54 (ref), v13 (copy), v123 (copy), v48 (ref), v65 (ref), v58 (copy), l_Value_1 (copy), v47 (ref)
    v125 = v125 or #v55 + 1;
    local v126 = {
        Tool = nil, 
        Index = v125, 
        Frame = nil
    };
    local v127 = nil;
    local v128 = nil;
    local v129 = nil;
    local v130 = nil;
    local v131 = nil;
    local v132 = nil;
    local v133 = nil;
    local v134 = nil;
    local v135 = nil;
    local function _() --[[ Line: 347 ]] --[[ Name: UpdateSlotFading ]]
        -- upvalues: v127 (ref), v12 (ref), v10 (ref), v9 (ref)
        v127.SelectionImageObject = nil;
        v127.BackgroundTransparency = v127.Draggable and 0 or v12;
        v127.BackgroundColor3 = v127.Draggable and v10 or v9;
    end;
    v126.Readjust = function(_, v138, v139) --[[ Line: 353 ]] --[[ Name: Readjust ]]
        -- upvalues: v42 (ref), v6 (ref), v127 (ref)
        local v140 = v42.Size.X.Offset / 2;
        local v141 = 5 + v6;
        local v142 = v138 - (v139 / 2 + 0.5);
        v127.Position = UDim2.new(0, v140 - v6 / 2 + v141 * v142, 0, 5);
    end;
    v126.Fill = function(v143, v144) --[[ Line: 361 ]] --[[ Name: Fill ]]
        -- upvalues: v129 (ref), v130 (ref), v35 (ref), v134 (ref), v131 (ref), v70 (ref), v45 (ref), v127 (ref), v60 (ref), v63 (ref), v38 (ref), l_ContextActionService_0 (ref), v57 (ref), v56 (ref), v55 (ref)
        local v145 = false;
        if not v144 then
            return v143:Clear();
        else
            v143.Tool = v144;
            local function v148() --[[ Line: 368 ]] --[[ Name: assignToolData ]]
                -- upvalues: v144 (copy), v129 (ref), v130 (ref), v35 (ref), v134 (ref)
                local l_TextureId_0 = v144.TextureId;
                v129.Image = l_TextureId_0;
                if l_TextureId_0 ~= "" then
                    v130.Visible = false;
                else
                    v130.Visible = true;
                end;
                v35:TranslateAndRegister(v130, v144, v144.Name);
                if v134 and v144:IsA("Tool") then
                    v35:TranslateAndRegister(v134, v144, v144.ToolTip);
                    local v147 = v134.TextBounds.X + 6;
                    v134.Size = UDim2.new(0, v147, 0, 16);
                    v134.Position = UDim2.new(0.5, -v147 / 2, 0, -25);
                end;
            end;
            v148();
            if v131 then
                v131:disconnect();
                v131 = nil;
            end;
            v131 = v144.Changed:connect(function(v149) --[[ Line: 394 ]]
                -- upvalues: v148 (copy)
                if v149 == "TextureId" or v149 == "Name" or v149 == "ToolTip" then
                    v148();
                end;
            end);
            local v150 = v143.Index <= v70;
            local l_Visible_1 = v45.Visible;
            if not v150 or l_Visible_1 then
                v127.Draggable = true;
            end;
            v143:UpdateEquipView();
            if v150 then
                v60 = v60 + 1;
                if v63 and v60 >= 1 and not v38 then
                    v38 = true;
                    l_ContextActionService_0:BindAction("RBXHotbarEquip", changeToolFunc, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1);
                end;
            end;
            v57[v144] = v143;
            local v152;
            for v153 = 1, v70 do
                local v154 = v55[v153];
                if not v154.Tool then
                    v152 = v154;
                    v145 = true;
                end;
                if v145 then
                    break;
                end;
            end;
            if not v145 then
                v152 = nil;
            end;
            v145 = false;
            v56 = v152;
            return;
        end;
    end;
    v126.Clear = function(v155) --[[ Line: 425 ]] --[[ Name: Clear ]]
        -- upvalues: v131 (ref), v129 (ref), v130 (ref), v134 (ref), v127 (ref), v70 (ref), v60 (ref), v38 (ref), l_ContextActionService_0 (ref), v57 (ref), v56 (ref), v55 (ref)
        local v156 = false;
        if not v155.Tool then
            return;
        else
            if v131 then
                v131:disconnect();
                v131 = nil;
            end;
            v129.Image = "";
            v130.Text = "";
            if v134 then
                v134.Text = "";
                v134.Visible = false;
            end;
            v127.Draggable = false;
            v155:UpdateEquipView(true);
            if v155.Index <= v70 then
                v60 = v60 - 1;
                if v60 < 1 then
                    v38 = false;
                    l_ContextActionService_0:UnbindAction("RBXHotbarEquip");
                end;
            end;
            v57[v155.Tool] = nil;
            v155.Tool = nil;
            local v157;
            for v158 = 1, v70 do
                local v159 = v55[v158];
                if not v159.Tool then
                    v157 = v159;
                    v156 = true;
                end;
                if v156 then
                    break;
                end;
            end;
            if not v156 then
                v157 = nil;
            end;
            v156 = false;
            v56 = v157;
            return;
        end;
    end;
    v126.UpdateEquipView = function(v160, v161) --[[ Line: 456 ]] --[[ Name: UpdateEquipView ]]
        -- upvalues: v52 (ref), v72 (ref), v126 (copy), v132 (ref), v76 (ref), v127 (ref), v11 (ref), v12 (ref), v10 (ref), v9 (ref)
        local v162 = false;
        if not v161 then
            local l_Tool_0 = v160.Tool;
            if l_Tool_0 and (l_Tool_0:IsA("HopperBin") and l_Tool_0.Active or l_Tool_0.Parent == v52) then
                v72 = v126;
                if not v132 then
                    v132 = v76("Frame", "Equipped");
                    v132.ZIndex = v127.ZIndex;
                    for _, v165 in pairs({
                        {
                            0.1, 
                            1, 
                            0, 
                            0
                        }, 
                        {
                            0.8, 
                            0.1, 
                            0.1, 
                            0
                        }, 
                        {
                            0.1, 
                            1, 
                            0.9, 
                            0
                        }, 
                        {
                            0.8, 
                            0.1, 
                            0.1, 
                            0.9
                        }
                    }) do
                        local v166 = v76("Frame", "Edge");
                        v166.BackgroundTransparency = 0;
                        v166.BackgroundColor3 = v11;
                        v166.Size = UDim2.new(v165[1], 0, v165[2], 0);
                        v166.Position = UDim2.new(v165[3], 0, v165[4], 0);
                        v166.ZIndex = v132.ZIndex;
                        v166.Parent = v132;
                    end;
                end;
                v132.Parent = v127;
                v162 = true;
            end;
        end;
        if not v162 then
            if v132 then
                v132.Parent = nil;
            end;
        end;
        v162 = false;
        v127.SelectionImageObject = nil;
        v127.BackgroundTransparency = v127.Draggable and 0 or v12;
        v127.BackgroundColor3 = v127.Draggable and v10 or v9;
    end;
    v126.IsEquipped = function(v167) --[[ Line: 488 ]] --[[ Name: IsEquipped ]]
        -- upvalues: v52 (ref)
        local l_Tool_1 = v167.Tool;
        return l_Tool_1 and (l_Tool_1:IsA("HopperBin") and l_Tool_1.Active or l_Tool_1.Parent == v52);
    end;
    v126.Delete = function(v169) --[[ Line: 492 ]] --[[ Name: Delete ]]
        -- upvalues: v59 (ref), v127 (ref), v55 (ref), v98 (ref)
        v59[v127] = nil;
        v127:Destroy();
        table.remove(v55, v169.Index);
        local v170 = #v55;
        for v171 = v169.Index, v170 do
            v55[v171]:SlideBack();
        end;
        v98();
    end;
    v126.Swap = function(v172, v173) --[[ Line: 506 ]] --[[ Name: Swap ]]
        local l_Tool_2 = v172.Tool;
        local l_Tool_3 = v173.Tool;
        v172:Clear();
        if l_Tool_3 then
            v173:Clear();
            v172:Fill(l_Tool_3);
        end;
        if l_Tool_2 then
            v173:Fill(l_Tool_2);
            return;
        else
            v173:Clear();
            return;
        end;
    end;
    v126.SlideBack = function(v176) --[[ Line: 520 ]] --[[ Name: SlideBack ]]
        -- upvalues: v127 (ref)
        v176.Index = v176.Index - 1;
        v127.Name = v176.Index;
        v127.LayoutOrder = v176.Index;
    end;
    v126.TurnNumber = function(_, v178) --[[ Line: 526 ]] --[[ Name: TurnNumber ]]
        -- upvalues: v135 (ref)
        if v135 then
            v135.Visible = v178;
        end;
    end;
    v126.SetClickability = function(v179, v180) --[[ Line: 532 ]] --[[ Name: SetClickability ]]
        -- upvalues: v127 (ref), v12 (ref), v10 (ref), v9 (ref)
        if v179.Tool then
            v127.Draggable = not v180;
            v127.SelectionImageObject = nil;
            v127.BackgroundTransparency = v127.Draggable and 0 or v12;
            v127.BackgroundColor3 = v127.Draggable and v10 or v9;
        end;
    end;
    v126.CheckTerms = function(v181, v182) --[[ Line: 539 ]] --[[ Name: CheckTerms ]]
        -- upvalues: v130 (ref), v134 (ref)
        local v183 = 0;
        local _ = function(v184, v185) --[[ Line: 541 ]] --[[ Name: checkEm ]]
            -- upvalues: v183 (ref)
            local _, v187 = v184:lower():gsub(v185, "");
            v183 = v183 + v187;
        end;
        local l_Tool_4 = v181.Tool;
        if l_Tool_4 then
            for v190 in pairs(v182) do
                local v191, v192 = v130.Text:lower():gsub(v190, "");
                v183 = v183 + v192;
                if l_Tool_4:IsA("Tool") then
                    v191, v192 = (v134 and v134.Text or ""):lower():gsub(v190, "");
                    v183 = v183 + v192;
                end;
            end;
        end;
        return v183;
    end;
    v126.Select = function(_, v194) --[[ Line: 559 ]] --[[ Name: Select ]]
        -- upvalues: v126 (copy), v52 (ref), v53 (ref), v61 (ref), v57 (ref), v54 (ref)
        if v194 then
            return;
        else
            local l_Tool_5 = v126.Tool;
            if l_Tool_5 then
                if l_Tool_5 and (l_Tool_5:IsA("HopperBin") and l_Tool_5.Active or l_Tool_5.Parent == v52) then
                    if v53 then
                        v53:UnequipTools();
                        if v61 then
                            v61:ToggleSelect();
                            v57[v61]:UpdateEquipView();
                            v61 = nil;
                            return;
                        end;
                    end;
                elseif l_Tool_5.Parent == v54 then
                    if v53 then
                        v53:UnequipTools();
                        if v61 then
                            v61:ToggleSelect();
                            v57[v61]:UpdateEquipView();
                            v61 = nil;
                        end;
                    end;
                    if l_Tool_5:IsA("HopperBin") then
                        l_Tool_5:ToggleSelect();
                        v57[l_Tool_5]:UpdateEquipView();
                        v61 = l_Tool_5;
                        return;
                    else
                        l_Tool_5.Parent = v52;
                    end;
                end;
            end;
            return;
        end;
    end;
    v127 = v76("TextButton", v125);
    v127.BackgroundColor3 = v9;
    v127.BorderColor3 = v13;
    v127.Text = "";
    v127.AutoButtonColor = false;
    v127.BorderSizePixel = 0;
    v127.Size = UDim2.new(0, v6, 0, v6);
    v127.Active = true;
    v127.Draggable = false;
    v127.BackgroundTransparency = v12;
    v127.MouseButton1Click:connect(function() --[[ Line: 586 ]]
        -- upvalues: v126 (copy)
        changeSlot(v126);
    end);
    v126.Frame = v127;
    local v196 = v76("Frame", "SelectionObjectClipper");
    v196.Visible = false;
    v196.Parent = v127;
    v133 = v76("ImageLabel", "Selector");
    v133.Size = UDim2.new(1, 0, 1, 0);
    v133.Image = "rbxasset://textures/ui/Keyboard/key_selection_9slice.png";
    v133.ScaleType = Enum.ScaleType.Slice;
    v133.SliceCenter = Rect.new(12, 12, 52, 52);
    v133.Parent = v196;
    v129 = v76("ImageLabel", "Icon");
    v129.Size = UDim2.new(0.8, 0, 0.8, 0);
    v129.Position = UDim2.new(0.1, 0, 0.1, 0);
    v129.Parent = v127;
    v130 = v76("TextLabel", "ToolName");
    v130.Size = UDim2.new(1, -2, 1, -2);
    v130.Position = UDim2.new(0, 1, 0, 1);
    v130.Parent = v127;
    v126.Frame.LayoutOrder = v126.Index;
    if v125 <= v70 then
        v134 = v76("TextLabel", "ToolTip");
        v134.TextWrapped = false;
        v134.TextYAlignment = Enum.TextYAlignment.Top;
        v134.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4);
        v134.BackgroundTransparency = 0;
        v134.Visible = false;
        v134.Parent = v127;
        v127.MouseEnter:connect(function() --[[ Line: 624 ]]
            -- upvalues: v134 (ref)
            if v134.Text ~= "" then
                v134.Visible = true;
            end;
        end);
        v127.MouseLeave:connect(function() --[[ Line: 629 ]]
            -- upvalues: v134 (ref)
            v134.Visible = false;
        end);
        v126.MoveToInventory = function(v197) --[[ Line: 631 ]] --[[ Name: MoveToInventory ]]
            -- upvalues: v126 (copy), v70 (ref), v123 (ref), v48 (ref), v52 (ref), v53 (ref), v61 (ref), v57 (ref), v65 (ref), v45 (ref)
            if v126.Index <= v70 then
                local l_Tool_6 = v126.Tool;
                v197:Clear();
                local v199 = v123(v48);
                v199:Fill(l_Tool_6);
                if l_Tool_6 and (l_Tool_6:IsA("HopperBin") and l_Tool_6.Active or l_Tool_6.Parent == v52) and v53 then
                    v53:UnequipTools();
                    if v61 then
                        v61:ToggleSelect();
                        v57[v61]:UpdateEquipView();
                        v61 = nil;
                    end;
                end;
                if v65 then
                    v199.Frame.Visible = false;
                    v199.Parent = v45;
                end;
            end;
        end;
        if v125 < 10 or v125 == v70 then
            v196 = v125 < 10 and v125 or 0;
            v135 = v76("TextLabel", "Number");
            v135.Text = v196;
            v135.Size = UDim2.new(0.15, 0, 0.15, 0);
            v135.Visible = false;
            v135.Parent = v127;
            v58[l_Value_1 + v196] = function(v200) --[[ Line: 657 ]]
                -- upvalues: v126 (copy)
                v126:Select(v200);
            end;
        end;
    end;
    v196 = v127.Position;
    local v201 = 0;
    local v202 = nil;
    do
        local l_v196_0, l_v201_0, l_v202_0 = v196, v201, v202;
        v127.DragBegin:connect(function(v206) --[[ Line: 668 ]]
            -- upvalues: v59 (ref), v127 (ref), l_v196_0 (ref), v129 (ref), v130 (ref), v135 (ref), v132 (ref), l_v202_0 (ref), v48 (ref), v45 (ref), v128 (ref), v76 (ref)
            v59[v127] = true;
            l_v196_0 = v206;
            v127.BorderSizePixel = 2;
            v127.ZIndex = 2;
            v129.ZIndex = 2;
            v130.ZIndex = 2;
            v127.Parent.ZIndex = 2;
            if v135 then
                v135.ZIndex = 2;
            end;
            if v132 then
                v132.ZIndex = 2;
                for _, v208 in pairs(v132:GetChildren()) do
                    v208.ZIndex = 2;
                end;
            end;
            l_v202_0 = v127.Parent;
            if l_v202_0 == v48 then
                local _ = v127.AbsolutePosition;
                local v210 = UDim2.new(0, v127.AbsolutePosition.X - v45.AbsolutePosition.X, 0, v127.AbsolutePosition.Y - v45.AbsolutePosition.Y);
                v127.Parent = v45;
                v127.Position = v210;
                v128 = v76("Frame", "FakeSlot");
                v128.LayoutOrder = v127.LayoutOrder;
                v128.Size = v127.Size;
                v128.BackgroundTransparency = 1;
                v128.Parent = v48;
            end;
        end);
        v127.DragStopped:connect(function(v211, v212) --[[ Line: 706 ]]
            -- upvalues: v128 (ref), v127 (ref), l_v196_0 (ref), l_v202_0 (ref), v129 (ref), v130 (ref), v135 (ref), v132 (ref), v59 (ref), v126 (copy), v45 (ref), v70 (ref), l_v201_0 (ref), v56 (ref), v42 (ref), v55 (ref), v52 (ref), v53 (ref), v61 (ref), v57 (ref), v65 (ref)
            if v128 then
                v128:Destroy();
            end;
            local v213 = tick();
            v127.Position = l_v196_0;
            v127.Parent = l_v202_0;
            v127.BorderSizePixel = 0;
            v127.ZIndex = 1;
            v129.ZIndex = 1;
            v130.ZIndex = 1;
            l_v202_0.ZIndex = 1;
            if v135 then
                v135.ZIndex = 1;
            end;
            if v132 then
                v132.ZIndex = 1;
                for _, v215 in pairs(v132:GetChildren()) do
                    v215.ZIndex = 1;
                end;
            end;
            v59[v127] = nil;
            if not v126.Tool then
                return;
            else
                local l_v45_0 = v45;
                local l_AbsolutePosition_2 = l_v45_0.AbsolutePosition;
                local l_AbsoluteSize_1 = l_v45_0.AbsoluteSize;
                local v219 = false;
                if l_AbsolutePosition_2.X < v211 then
                    v219 = false;
                    if v211 <= l_AbsolutePosition_2.X + l_AbsoluteSize_1.X then
                        v219 = false;
                        if l_AbsolutePosition_2.Y < v212 then
                            v219 = v212 <= l_AbsolutePosition_2.Y + l_AbsoluteSize_1.Y;
                        end;
                    end;
                end;
                if v219 then
                    if v126.Index <= v70 then
                        v126:MoveToInventory();
                    end;
                    if v126.Index > v70 and v213 - l_v201_0 < 0.5 then
                        if v56 then
                            v219 = v126.Tool;
                            v126:Clear();
                            v56:Fill(v219);
                            v126:Delete();
                        end;
                        v213 = 0;
                    end;
                else
                    l_v45_0 = v42;
                    l_AbsolutePosition_2 = l_v45_0.AbsolutePosition;
                    l_AbsoluteSize_1 = l_v45_0.AbsoluteSize;
                    v219 = false;
                    if l_AbsolutePosition_2.X < v211 then
                        v219 = false;
                        if v211 <= l_AbsolutePosition_2.X + l_AbsoluteSize_1.X then
                            v219 = false;
                            if l_AbsolutePosition_2.Y < v212 then
                                v219 = v212 <= l_AbsolutePosition_2.Y + l_AbsoluteSize_1.Y;
                            end;
                        end;
                    end;
                    if v219 then
                        v219 = {
                            1e999, 
                            nil
                        };
                        for v220 = 1, v70 do
                            local v221 = v55[v220];
                            local l_Frame_0 = v221.Frame;
                            local v223 = Vector2.new(v211, v212);
                            local l_magnitude_0 = (l_Frame_0.AbsolutePosition + l_Frame_0.AbsoluteSize / 2 - v223).magnitude;
                            if l_magnitude_0 < v219[1] then
                                v219 = {
                                    l_magnitude_0, 
                                    v221
                                };
                            end;
                        end;
                        l_v45_0 = v219[2];
                        if l_v45_0 ~= v126 then
                            v126:Swap(l_v45_0);
                            if v126.Index > v70 then
                                l_AbsolutePosition_2 = v126.Tool;
                                if not l_AbsolutePosition_2 then
                                    v126:Delete();
                                else
                                    if l_AbsolutePosition_2 and (l_AbsolutePosition_2:IsA("HopperBin") and l_AbsolutePosition_2.Active or l_AbsolutePosition_2.Parent == v52) and v53 then
                                        v53:UnequipTools();
                                        if v61 then
                                            v61:ToggleSelect();
                                            v57[v61]:UpdateEquipView();
                                            v61 = nil;
                                        end;
                                    end;
                                    if v65 then
                                        v126.Frame.Visible = false;
                                        v126.Frame.Parent = v45;
                                    end;
                                end;
                            end;
                        end;
                    elseif v126.Index <= v70 then
                        v126:MoveToInventory();
                    end;
                end;
                l_v201_0 = v213;
                return;
            end;
        end);
    end;
    v127.Parent = v124;
    v55[v125] = v126;
    if v70 < v125 then
        v98();
        if v45.Visible and not v65 then
            v196 = v47.CanvasSize.Y.Offset - v47.AbsoluteSize.Y;
            v47.CanvasPosition = Vector2.new(0, (math.max(0, v196)));
        end;
    end;
    return v126;
end;
local _ = function(v225) --[[ Line: 815 ]] --[[ Name: SetNumberOfHotbarSlots ]]
    -- upvalues: v70 (ref), v55 (copy), v123 (copy), v42 (ref), v56 (ref), v60 (ref), v102 (copy)
    if v70 ~= v225 then
        local l_v70_0 = v70;
        if v225 < l_v70_0 then
            for v227 = l_v70_0, v225 + 1, -1 do
                local v228 = v55[v227];
                if v228 then
                    v228:MoveToInventory();
                    v228:Delete();
                end;
            end;
            for v229 = l_v70_0, v225 + 1, -1 do
                local v230 = v55[v229];
                if not v230.Tool then
                    v230:Delete();
                end;
            end;
        else
            for v231 = l_v70_0, v225 do
                v70 = v231;
                if v55[v231] then
                    local _ = v55[v231];
                    local l_Tool_7 = v55[v231].Tool;
                    local v234 = v123(v42, v231);
                    if l_Tool_7 then
                        v234:Fill(l_Tool_7);
                    elseif not v56 then
                        v56 = v234;
                    end;
                else
                    local v235 = v123(v42, v231);
                    v235.Frame.Visible = false;
                    if not v56 then
                        v56 = v235;
                    end;
                end;
            end;
        end;
        v70 = v225;
        v60 = 0;
        for v236 = 1, v70 do
            if v55[v236] and v55[v236].Tool then
                v60 = v60 + 1;
            end;
        end;
        v102();
    end;
end;
local function v247(v238) --[[ Line: 877 ]] --[[ Name: OnChildAdded ]]
    -- upvalues: v52 (ref), v53 (ref), v69 (ref), v61 (ref), v57 (copy), v62 (ref), l_LocalPlayer_0 (ref), v56 (ref), v123 (copy), v48 (ref), v55 (copy), v54 (ref), v95 (copy), v70 (ref), v45 (ref), v5 (copy)
    if not v238:IsA("Tool") and not v238:IsA("HopperBin") then
        if v238:IsA("Humanoid") and v238.Parent == v52 then
            v53 = v238;
        end;
        return;
    else
        if v238.Parent == v52 then
            v69 = tick();
        end;
        if v61 and v238.Parent == v52 then
            v61:ToggleSelect();
            v57[v61]:UpdateEquipView();
            v61 = nil;
        end;
        if not v62 and v238.Parent == v52 and not v57[v238] then
            local l_StarterGear_0 = l_LocalPlayer_0:FindFirstChild("StarterGear");
            if l_StarterGear_0 and l_StarterGear_0:FindFirstChild(v238.Name) then
                v62 = true;
                local v240 = v56 or v123(v48);
                for v241 = v240.Index, 1, -1 do
                    local v242 = v55[v241];
                    local v243 = v241 - 1;
                    if v243 > 0 then
                        v55[v243]:Swap(v242);
                    else
                        v242:Fill(v238);
                    end;
                end;
                for _, v245 in pairs(v52:GetChildren()) do
                    if v245:IsA("Tool") and v245 ~= v238 then
                        v245.Parent = v54;
                    end;
                end;
                v95();
                return;
            end;
        end;
        local v246 = v57[v238];
        if v246 then
            v246:UpdateEquipView();
        else
            v246 = v56 or v123(v48);
            v246:Fill(v238);
            if v246.Index <= v70 and not v45.Visible then
                v95();
            end;
            if v238:IsA("HopperBin") and v238.Active then
                if v53 then
                    v53:UnequipTools();
                    if v61 then
                        v61:ToggleSelect();
                        v57[v61]:UpdateEquipView();
                        v61 = nil;
                    end;
                end;
                v61 = v238;
            end;
        end;
        v5.BackpackItemAdded:Fire();
        return;
    end;
end;
local function v255(v248) --[[ Line: 944 ]] --[[ Name: OnChildRemoved ]]
    -- upvalues: v69 (ref), v52 (ref), v54 (ref), v57 (copy), v70 (ref), v45 (ref), v95 (copy), v61 (ref), v5 (copy), v55 (copy)
    local v249 = false;
    if not v248:IsA("Tool") and not v248:IsA("HopperBin") then
        return;
    else
        v69 = tick();
        local l_Parent_0 = v248.Parent;
        if l_Parent_0 == v52 or l_Parent_0 == v54 then
            return;
        else
            local v251 = v57[v248];
            if v251 then
                v251:Clear();
                if v251.Index > v70 then
                    v251:Delete();
                elseif not v45.Visible then
                    v95();
                end;
            end;
            if v248 == v61 then
                v61 = nil;
            end;
            v5.BackpackItemRemoved:Fire();
            local v252;
            for v253 = v70 + 1, #v55 do
                local v254 = v55[v253];
                if v254 and v254.Tool then
                    v252 = false;
                    v249 = true;
                end;
                if v249 then
                    break;
                end;
            end;
            if not v249 then
                v252 = true;
            end;
            v249 = false;
            if v252 then
                v5.BackpackEmpty:Fire();
            end;
            return;
        end;
    end;
end;
local function v265(v256) --[[ Line: 978 ]] --[[ Name: OnCharacterAdded ]]
    -- upvalues: v55 (copy), v70 (ref), v61 (ref), v67 (ref), v52 (ref), v255 (copy), v247 (copy), v54 (ref), l_LocalPlayer_0 (ref), v95 (copy)
    for v257 = #v55, 1, -1 do
        local v258 = v55[v257];
        if v258.Tool then
            v258:Clear();
        end;
        if v70 < v257 then
            v258:Delete();
        end;
    end;
    v61 = nil;
    for _, v260 in pairs(v67) do
        v260:disconnect();
    end;
    v67 = {};
    v52 = v256;
    table.insert(v67, v256.ChildRemoved:connect(v255));
    table.insert(v67, v256.ChildAdded:connect(v247));
    for _, v262 in pairs(v256:GetChildren()) do
        v247(v262);
    end;
    v54 = l_LocalPlayer_0:WaitForChild("Backpack");
    table.insert(v67, v54.ChildRemoved:connect(v255));
    table.insert(v67, v54.ChildAdded:connect(v247));
    for _, v264 in pairs(v54:GetChildren()) do
        v247(v264);
    end;
    v95();
end;
local function v270(v266, v267) --[[ Line: 1017 ]] --[[ Name: OnInputBegan ]]
    -- upvalues: v64 (ref), v63 (ref), l_Value_2 (copy), v58 (copy), v45 (ref), v5 (copy)
    if v266.UserInputType == Enum.UserInputType.Keyboard and not v64 and (v63 or v266.KeyCode.Value == l_Value_2) then
        local v268 = v58[v266.KeyCode.Value];
        if v268 then
            v268(v267);
        end;
    end;
    local l_UserInputType_0 = v266.UserInputType;
    if not v267 and (l_UserInputType_0 == Enum.UserInputType.MouseButton1 or l_UserInputType_0 == Enum.UserInputType.Touch) and v45.Visible then
        v5.OpenClose();
    end;
end;
local function v274(v271) --[[ Line: 1036 ]] --[[ Name: OnUISChanged ]]
    -- upvalues: l_UserInputService_0 (copy), l_VRService_0 (copy), v70 (ref), v55 (copy)
    if v271 == "KeyboardEnabled" or v271 == "VREnabled" then
        local v272 = l_UserInputService_0.KeyboardEnabled and not l_VRService_0.VREnabled;
        for v273 = 1, v70 do
            v55[v273]:TurnNumber(v272);
        end;
    end;
end;
local v275 = nil;
local v276 = nil;
local function v277() --[[ Line: 1048 ]]

end;
local v278 = Vector2.new(0, 0);
unbindAllGamepadEquipActions = function() --[[ Line: 1052 ]] --[[ Name: unbindAllGamepadEquipActions ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:UnbindAction("RBXBackpackHasGamepadFocus");
    l_ContextActionService_0:UnbindAction("RBXCloseInventory");
end;
local function _(v279, v280) --[[ Line: 1057 ]] --[[ Name: setHotbarVisibility ]]
    -- upvalues: v70 (ref), v55 (copy)
    for v281 = 1, v70 do
        local v282 = v55[v281];
        if v282 and v282.Frame and (v280 or v282.Tool) then
            v282.Frame.Visible = v279;
        end;
    end;
end;
local function v287(v284) --[[ Line: 1066 ]] --[[ Name: getInputDirection ]]
    -- upvalues: v278 (ref)
    local v285 = 1;
    if v284.UserInputState == Enum.UserInputState.End then
        v285 = -1;
    end;
    if v284.KeyCode == Enum.KeyCode.Thumbstick1 then
        local l_magnitude_1 = v284.Position.magnitude;
        if l_magnitude_1 > 0.98 then
            v278 = Vector2.new(v284.Position.x / l_magnitude_1, -v284.Position.y / l_magnitude_1);
        else
            v278 = Vector2.new(0, 0);
        end;
    elseif v284.KeyCode == Enum.KeyCode.DPadLeft then
        v278 = Vector2.new(v278.x - 1 * v285, v278.y);
    elseif v284.KeyCode == Enum.KeyCode.DPadRight then
        v278 = Vector2.new(v278.x + 1 * v285, v278.y);
    elseif v284.KeyCode == Enum.KeyCode.DPadUp then
        v278 = Vector2.new(v278.x, v278.y - 1 * v285);
    elseif v284.KeyCode == Enum.KeyCode.DPadDown then
        v278 = Vector2.new(v278.x, v278.y + 1 * v285);
    else
        v278 = Vector2.new(0, 0);
    end;
    return v278;
end;
local _ = function(_, _, v290) --[[ Line: 1097 ]]
    -- upvalues: v287 (copy), v70 (ref), v55 (copy), v53 (ref), v61 (ref), v57 (copy)
    local v291 = v287(v290);
    if v291 == Vector2.new(0, 0) then
        return;
    else
        local v292 = math.atan2(v291.y, v291.x) - -1.5707963267948966;
        if v292 < 0 then
            v292 = v292 + 6.283185307179586;
        end;
        local v293 = math.floor(v292 / 0.7853981633974483 + 1 + 0.5);
        if v70 < v293 then
            v293 = 1;
        end;
        if v293 > 0 then
            local v294 = v55[v293];
            if v294 and v294.Tool and not v294:IsEquipped() then
                v294:Select();
                return;
            end;
        elseif v53 then
            v53:UnequipTools();
            if v61 then
                v61:ToggleSelect();
                v57[v61]:UpdateEquipView();
                v61 = nil;
            end;
        end;
        return;
    end;
end;
changeToolFunc = function(_, v297, v298) --[[ Line: 1127 ]]
    -- upvalues: v275 (ref), v276 (ref), v53 (ref), v61 (ref), v57 (copy), v70 (ref), v55 (copy), v72 (ref)
    if v297 ~= Enum.UserInputState.Begin then
        return;
    elseif v275 and (v275.KeyCode == Enum.KeyCode.ButtonR1 and v298.KeyCode == Enum.KeyCode.ButtonL1 or v275.KeyCode == Enum.KeyCode.ButtonL1 and v298.KeyCode == Enum.KeyCode.ButtonR1) and tick() - v276 <= 0.06 then
        if v53 then
            v53:UnequipTools();
            if v61 then
                v61:ToggleSelect();
                v57[v61]:UpdateEquipView();
                v61 = nil;
            end;
        end;
        v275 = v298;
        v276 = tick();
        return;
    else
        v275 = v298;
        v276 = tick();
        delay(0.06, function() --[[ Line: 1147 ]]
            -- upvalues: v275 (ref), v298 (copy), v70 (ref), v55 (ref), v53 (ref), v61 (ref), v57 (ref), v72 (ref)
            if v275 ~= v298 then
                return;
            else
                local v299 = 0;
                v299 = v298.KeyCode == Enum.KeyCode.ButtonL1 and -1 or 1;
                for v300 = 1, v70 do
                    if v55[v300]:IsEquipped() then
                        local v301 = v299 + v300;
                        local v302 = false;
                        if v70 < v301 then
                            v301 = 1;
                            v302 = true;
                        elseif v301 < 1 then
                            v301 = v70;
                            v302 = true;
                        end;
                        local l_v301_0 = v301;
                        while true do
                            if not v55[v301].Tool then
                                v301 = v301 + v299;
                                if v301 == l_v301_0 then
                                    return;
                                elseif v70 < v301 then
                                    v301 = 1;
                                    v302 = true;
                                elseif v301 < 1 then
                                    v301 = v70;
                                    v302 = true;
                                end;
                            elseif v302 then
                                if v53 then
                                    v53:UnequipTools();
                                    if v61 then
                                        v61:ToggleSelect();
                                        v57[v61]:UpdateEquipView();
                                        v61 = nil;
                                    end;
                                end;
                                v72 = nil;
                                return;
                            else
                                v55[v301]:Select();
                                return;
                            end;
                        end;
                    end;
                end;
                if v72 and v72.Tool then
                    v72:Select();
                    return;
                else
                    local v304 = v299 == -1 and v70 or 1;
                    local v305 = v299 == -1 and 1 or v70;
                    for v306 = v304, v305, v299 do
                        if v55[v306].Tool then
                            v55[v306]:Select();
                            return;
                        end;
                    end;
                    return;
                end;
            end;
        end);
        return;
    end;
end;
getGamepadSwapSlot = function() --[[ Line: 1211 ]] --[[ Name: getGamepadSwapSlot ]]
    -- upvalues: v55 (copy)
    for v307 = 1, #v55 do
        if v55[v307].Frame.BorderSizePixel > 0 then
            return v55[v307];
        end;
    end;
end;
changeSlot = function(v308) --[[ Line: 1219 ]] --[[ Name: changeSlot ]]
    -- upvalues: l_GamepadService_0 (copy), l_GuiService_0 (copy), v46 (ref), v70 (ref)
    local l_GamepadCursorEnabled_0 = l_GamepadService_0.GamepadCursorEnabled;
    if v308.Frame == l_GuiService_0.SelectedCoreObject and not l_GamepadCursorEnabled_0 then
        local v310 = getGamepadSwapSlot();
        if v310 then
            v310.Frame.BorderSizePixel = 0;
            if v310 ~= v308 then
                v308:Swap(v310);
                v46.SelectionImageObject.Visible = false;
                if v308.Index > v70 and not v308.Tool then
                    if l_GuiService_0.SelectedCoreObject == v308.Frame then
                        l_GuiService_0.SelectedCoreObject = v310.Frame;
                    end;
                    v308:Delete();
                end;
                if v310.Index > v70 and not v310.Tool then
                    if l_GuiService_0.SelectedCoreObject == v310.Frame then
                        l_GuiService_0.SelectedCoreObject = v308.Frame;
                    end;
                    v310:Delete();
                    return;
                end;
            end;
        else
            local l_Size_0 = v308.Frame.Size;
            local l_Position_0 = v308.Frame.Position;
            v308.Frame:TweenSizeAndPosition(l_Size_0 + UDim2.new(0, 10, 0, 10), l_Position_0 - UDim2.new(0, 5, 0, 5), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true, function() --[[ Line: 1248 ]]
                -- upvalues: v308 (copy), l_Size_0 (copy), l_Position_0 (copy)
                v308.Frame:TweenSizeAndPosition(l_Size_0, l_Position_0, Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.1, true);
            end);
            v308.Frame.BorderSizePixel = 3;
            v46.SelectionImageObject.Visible = true;
            return;
        end;
    else
        v308:Select();
        v46.SelectionImageObject.Visible = false;
    end;
end;
enableGamepadInventoryControl = function() --[[ Line: 1258 ]] --[[ Name: enableGamepadInventoryControl ]]
    -- upvalues: v45 (ref), v5 (copy), l_ContextActionService_0 (copy), v277 (copy), l_GuiService_0 (copy), v42 (ref)
    local function v317(_, v314, _) --[[ Line: 1259 ]]
        -- upvalues: v45 (ref), v5 (ref)
        if v314 ~= Enum.UserInputState.Begin then
            return;
        else
            if getGamepadSwapSlot() then
                local v316 = getGamepadSwapSlot();
                if v316 then
                    v316.Frame.BorderSizePixel = 0;
                    return;
                end;
            elseif v45.Visible then
                v5.OpenClose();
            end;
            return;
        end;
    end;
    l_ContextActionService_0:BindAction("RBXBackpackHasGamepadFocus", v277, false, Enum.UserInputType.Gamepad1);
    l_ContextActionService_0:BindAction("RBXCloseInventory", v317, false, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonStart);
    if not false then
        l_GuiService_0.SelectedCoreObject = v42:FindFirstChild("1");
    end;
end;
disableGamepadInventoryControl = function() --[[ Line: 1284 ]] --[[ Name: disableGamepadInventoryControl ]]
    -- upvalues: v70 (ref), v55 (copy), l_GuiService_0 (copy), v41 (ref)
    unbindAllGamepadEquipActions();
    for v318 = 1, v70 do
        local v319 = v55[v318];
        if v319 and v319.Frame then
            v319.Frame.BorderSizePixel = 0;
        end;
    end;
    if l_GuiService_0.SelectedCoreObject and l_GuiService_0.SelectedCoreObject:IsDescendantOf(v41) then
        l_GuiService_0.SelectedCoreObject = nil;
    end;
end;
local function _() --[[ Line: 1300 ]] --[[ Name: bindBackpackHotbarAction ]]
    -- upvalues: v63 (ref), v38 (ref), l_ContextActionService_0 (copy)
    if v63 and not v38 then
        v38 = true;
        l_ContextActionService_0:BindAction("RBXHotbarEquip", changeToolFunc, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1);
    end;
end;
local function _() --[[ Line: 1307 ]] --[[ Name: unbindBackpackHotbarAction ]]
    -- upvalues: v38 (ref), l_ContextActionService_0 (copy)
    disableGamepadInventoryControl();
    v38 = false;
    l_ContextActionService_0:UnbindAction("RBXHotbarEquip");
end;
gamepadDisconnected = function() --[[ Line: 1313 ]] --[[ Name: gamepadDisconnected ]]
    -- upvalues: l_VRService_0 (copy), v68 (ref)
    if not l_VRService_0.VREnabled then
        v68 = false;
        disableGamepadInventoryControl();
    end;
end;
gamepadConnected = function() --[[ Line: 1320 ]] --[[ Name: gamepadConnected ]]
    -- upvalues: l_VRService_0 (copy), v68 (ref), l_GuiService_0 (copy), v41 (ref), v60 (ref), v63 (ref), v38 (ref), l_ContextActionService_0 (copy), v45 (ref)
    if not l_VRService_0.VREnabled then
        v68 = true;
        l_GuiService_0:AddSelectionParent("RBXBackpackSelection", v41);
        if v60 >= 1 and v63 and not v38 then
            v38 = true;
            l_ContextActionService_0:BindAction("RBXHotbarEquip", changeToolFunc, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1);
        end;
        if v45.Visible then
            enableGamepadInventoryControl();
        end;
    end;
end;
local function v326(v322, v323) --[[ Line: 1335 ]] --[[ Name: OnCoreGuiChanged ]]
    -- upvalues: v37 (ref), v63 (ref), v41 (ref), v66 (copy), l_GuiService_0 (copy), v60 (ref), v38 (ref), l_ContextActionService_0 (copy)
    if v322 == Enum.CoreGuiType.Backpack or v322 == Enum.CoreGuiType.All then
        v323 = v323 and v37;
        v63 = v323;
        v41.Visible = v323;
        for _, v325 in pairs(v66) do
            if v323 then
                l_GuiService_0:AddKey(v325);
            else
                l_GuiService_0:RemoveKey(v325);
            end;
        end;
        if v323 then
            if v60 >= 1 and v63 and not v38 then
                v38 = true;
                l_ContextActionService_0:BindAction("RBXHotbarEquip", changeToolFunc, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1);
                return;
            end;
        else
            disableGamepadInventoryControl();
            v38 = false;
            l_ContextActionService_0:UnbindAction("RBXHotbarEquip");
        end;
    end;
end;
local function v332(v327, v328) --[[ Line: 1362 ]] --[[ Name: MakeVRRoundButton ]]
    -- upvalues: v76 (copy)
    local v329 = v76("ImageButton", v327);
    v329.Size = UDim2.new(0, 40, 0, 40);
    v329.Image = "rbxasset://textures/ui/Keyboard/close_button_background.png";
    local v330 = v76("ImageLabel", "Icon");
    v330.Size = UDim2.new(0.5, 0, 0.5, 0);
    v330.Position = UDim2.new(0.25, 0, 0.25, 0);
    v330.Image = v328;
    v330.Parent = v329;
    local v331 = v76("ImageLabel", "Selection");
    v331.Size = UDim2.new(0.9, 0, 0.9, 0);
    v331.Position = UDim2.new(0.05, 0, 0.05, 0);
    v331.Image = "rbxasset://textures/ui/Keyboard/close_button_selection.png";
    v329.SelectionImageObject = v331;
    return v329, v330, v331;
end;
v41 = v76("Frame", "Backpack");
v41.Visible = false;
v41.Parent = l_RobloxGui_1;
v42 = v76("Frame", "Hotbar");
v42.Parent = v41;
for v333 = 1, v70 do
    local v334 = v123(v42, v333);
    v334.Frame.Visible = false;
    if not v56 then
        v56 = v334;
    end;
end;
v43 = v76("ImageButton", "OpenInventory");
v43.Size = UDim2.new(0, 30, 0, 30);
v43.Image = "rbxasset://textures/ui/Backpack/ScrollUpArrow.png";
v43.MouseButton1Click:connect(function() --[[ Line: 1407 ]]
    -- upvalues: v5 (copy)
    v5.OpenClose();
end);
v43.SelectionGained:connect(function() --[[ Line: 1410 ]]
    -- upvalues: v43 (ref), v16 (copy)
    v43.ImageColor3 = v16;
end);
v43.SelectionLost:connect(function() --[[ Line: 1413 ]]
    -- upvalues: v43 (ref)
    v43.ImageColor3 = Color3.new(1, 1, 1);
end);
local v335 = v76("Frame", "Selection");
v335.Visible = false;
v43.SelectionImageObject = v335;
v44 = v332("CloseInventory", "rbxasset://textures/ui/Keyboard/close_button_icon.png");
v44.Position = UDim2.new(0, 0, 0, -50);
v44.MouseButton1Click:connect(function() --[[ Line: 1423 ]]
    -- upvalues: v45 (ref), v5 (copy)
    if v45.Visible then
        v5.OpenClose();
    end;
end);
LeftBumperButton = v76("ImageLabel", "LeftBumper");
LeftBumperButton.Size = UDim2.new(0, 40, 0, 40);
LeftBumperButton.Position = UDim2.new(0, -LeftBumperButton.Size.X.Offset, 0.5, -LeftBumperButton.Size.Y.Offset / 2);
RightBumperButton = v76("ImageLabel", "RightBumper");
RightBumperButton.Size = UDim2.new(0, 40, 0, 40);
RightBumperButton.Position = UDim2.new(1, 0, 0.5, -RightBumperButton.Size.Y.Offset / 2);
v45 = v76("Frame", "Inventory");
v45.BackgroundTransparency = v8;
v45.BackgroundColor3 = v9;
v45.Active = true;
v45.Visible = false;
v45.Parent = v41;
v46 = v76("TextButton", "VRInventorySelector");
v46.Position = UDim2.new(0, 0, 0, 0);
v46.Size = UDim2.new(1, 0, 1, 0);
v46.BackgroundTransparency = 1;
v46.Text = "";
v46.Parent = v45;
v335 = v76("ImageLabel", "Selector");
v335.Size = UDim2.new(1, 0, 1, 0);
v335.Image = "rbxasset://textures/ui/Keyboard/key_selection_9slice.png";
v335.ScaleType = Enum.ScaleType.Slice;
v335.SliceCenter = Rect.new(12, 12, 52, 52);
v335.Visible = false;
v46.SelectionImageObject = v335;
v47 = v76("ScrollingFrame", "ScrollingFrame");
v47.Selectable = false;
v47.CanvasSize = UDim2.new(0, 0, 0, 0);
v47.Parent = v45;
v48 = v76("Frame", "UIGridFrame");
v48.Selectable = false;
v48.Size = UDim2.new(1, -10, 1, 0);
v48.Position = UDim2.new(0, 5, 0, 0);
v48.Parent = v47;
v49 = Instance.new("UIGridLayout");
v49.SortOrder = Enum.SortOrder.LayoutOrder;
v49.CellSize = UDim2.new(0, v6, 0, v6);
v49.CellPadding = UDim2.new(0, 5, 0, 5);
v49.Parent = v48;
v50 = v332("ScrollUpButton", "rbxasset://textures/ui/Backpack/ScrollUpArrow.png");
v50.Size = UDim2.new(0, 34, 0, 34);
v50.Position = UDim2.new(0.5, -v50.Size.X.Offset / 2, 0, 43);
v50.Icon.Position = v50.Icon.Position - UDim2.new(0, 0, 0, 2);
v50.MouseButton1Click:connect(function() --[[ Line: 1482 ]]
    -- upvalues: v47 (ref), v6 (ref)
    v47.CanvasPosition = Vector2.new(v47.CanvasPosition.X, (math.min(v47.CanvasSize.Y.Offset - v47.AbsoluteWindowSize.Y, (math.max(0, v47.CanvasPosition.Y - (5 + v6))))));
end);
v51 = v332("ScrollDownButton", "rbxasset://textures/ui/Backpack/ScrollUpArrow.png");
v51.Rotation = 180;
v51.Icon.Position = v51.Icon.Position - UDim2.new(0, 0, 0, 2);
v51.Size = UDim2.new(0, 34, 0, 34);
v51.Position = UDim2.new(0.5, -v51.Size.X.Offset / 2, 1, -v51.Size.Y.Offset - 3);
v51.MouseButton1Click:connect(function() --[[ Line: 1493 ]]
    -- upvalues: v47 (ref), v6 (ref)
    v47.CanvasPosition = Vector2.new(v47.CanvasPosition.X, (math.min(v47.CanvasSize.Y.Offset - v47.AbsoluteWindowSize.Y, (math.max(0, v47.CanvasPosition.Y + (5 + v6))))));
end);
v47.Changed:connect(function(v336) --[[ Line: 1499 ]]
    -- upvalues: v47 (ref), v50 (ref), v51 (ref)
    if v336 == "AbsoluteWindowSize" or v336 == "CanvasPosition" or v336 == "CanvasSize" then
        local v337 = v47.CanvasPosition.Y ~= 0;
        local v338 = v47.CanvasPosition.Y < v47.CanvasSize.Y.Offset - v47.AbsoluteWindowSize.Y;
        v50.Visible = v337;
        v51.Visible = v338;
    end;
end);
v102();
local v339 = l_Create_0("Frame")({
    Name = "GamepadHintsFrame", 
    Size = UDim2.new(0, v42.Size.X.Offset, 0, v33 and 95 or 60), 
    BackgroundTransparency = 1, 
    Visible = false, 
    Parent = v41
});
local function v346(v340, v341, v342) --[[ Line: 1522 ]] --[[ Name: addGamepadHint ]]
    -- upvalues: l_Create_0 (copy), v339 (copy), v33 (copy)
    local v343 = l_Create_0("Frame")({
        Name = "HintFrame", 
        Size = UDim2.new(1, 0, 1, -5), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 1, 
        Parent = v339
    });
    local _ = l_Create_0("ImageLabel")({
        Name = "HintImage", 
        Size = v33 and UDim2.new(0, 90, 0, 90) or UDim2.new(0, 60, 0, 60), 
        BackgroundTransparency = 1, 
        Image = v33 and v341 or v340, 
        Parent = v343
    });
    local v345 = l_Create_0("TextLabel")({
        Name = "HintText", 
        Position = UDim2.new(0, v33 and 100 or 70, 0, 0), 
        Size = UDim2.new(1, -(v33 and 100 or 70), 1, 0), 
        Font = Enum.Font.SourceSansBold, 
        FontSize = v33 and Enum.FontSize.Size36 or Enum.FontSize.Size24, 
        BackgroundTransparency = 1, 
        Text = v342, 
        TextColor3 = Color3.new(1, 1, 1), 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextWrapped = true, 
        Parent = v343
    });
    Instance.new("UITextSizeConstraint", v345).MaxTextSize = v345.TextSize;
end;
local function v352() --[[ Line: 1559 ]] --[[ Name: resizeGamepadHintsFrame ]]
    -- upvalues: v339 (copy), v42 (ref), v33 (copy), v45 (ref)
    v339.Size = UDim2.new(v42.Size.X.Scale, v42.Size.X.Offset, 0, v33 and 95 or 60);
    v339.Position = UDim2.new(v42.Position.X.Scale, v42.Position.X.Offset, v45.Position.Y.Scale, v45.Position.Y.Offset - v339.Size.Y.Offset);
    local v347 = 0;
    local l_v339_Children_0 = v339:GetChildren();
    for v349 = 1, #l_v339_Children_0 do
        l_v339_Children_0[v349].Size = UDim2.new(1, 0, 1, -5);
        l_v339_Children_0[v349].Position = UDim2.new(0, 0, 0, 0);
        v347 = v347 + (l_v339_Children_0[v349].HintText.Position.X.Offset + l_v339_Children_0[v349].HintText.TextBounds.X);
    end;
    local v350 = (v339.AbsoluteSize.X - v347) / (#l_v339_Children_0 - 1);
    for v351 = 1, #l_v339_Children_0 do
        l_v339_Children_0[v351].Position = v351 == 1 and UDim2.new(0, 0, 0, 0) or UDim2.new(0, l_v339_Children_0[v351 - 1].Position.X.Offset + l_v339_Children_0[v351 - 1].Size.X.Offset + v350, 0, 0);
        l_v339_Children_0[v351].Size = UDim2.new(0, l_v339_Children_0[v351].HintText.Position.X.Offset + l_v339_Children_0[v351].HintText.TextBounds.X, 1, -5);
    end;
end;
v346("rbxasset://textures/ui/Controls/DesignSystem/ButtonX.png", "rbxasset://textures/ui/Controls/DesignSystem/ButtonX@2x.png", "Remove From Hotbar");
v346("rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png", "rbxasset://textures/ui/Controls/DesignSystem/ButtonA@2x.png", "Select/Swap");
v346("rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png", "rbxasset://textures/ui/Controls/DesignSystem/ButtonB@2x.png", "Close Backpack");
local v353 = v76("Frame", "Search");
v353.BackgroundColor3 = v18;
v353.BackgroundTransparency = v19;
v353.Size = UDim2.new(0, 190, 0, 30);
v353.Position = UDim2.new(1, -v353.Size.X.Offset - 5, 0, 5);
v353.Parent = v45;
local v354 = v76("TextBox", "TextBox");
v354.Text = v17;
v354.ClearTextOnFocus = false;
v354.FontSize = Enum.FontSize.Size24;
v354.TextXAlignment = Enum.TextXAlignment.Left;
v354.Size = v353.Size - UDim2.new(0, 0, 0, 0);
v354.Position = UDim2.new(0, 0, 0, 0);
v354.Parent = v353;
local v355 = v76("TextButton", "X");
v355.Text = "x";
v355.TextColor3 = v11;
v355.FontSize = Enum.FontSize.Size24;
v355.TextYAlignment = Enum.TextYAlignment.Bottom;
v355.BackgroundColor3 = v18;
v355.BackgroundTransparency = 0;
v355.Size = UDim2.new(0, v353.Size.Y.Offset - 10, 0, v353.Size.Y.Offset - 10);
v355.Position = UDim2.new(1, -v355.Size.X.Offset - 10, 0.5, -v355.Size.Y.Offset / 2);
v355.ZIndex = 0;
v355.Visible = false;
v355.BorderSizePixel = 0;
v355.Parent = v353;
local l_v354_0 = v354 --[[ copy: 111 -> 119 ]];
local l_v355_0 = v355 --[[ copy: 112 -> 120 ]];
local function v369() --[[ Line: 1616 ]] --[[ Name: search ]]
    -- upvalues: l_v354_0 (copy), v70 (ref), v55 (copy), v45 (ref), v65 (ref), v48 (ref), v47 (ref), v98 (copy), l_v355_0 (copy)
    local v358 = {};
    for v359 in l_v354_0.Text:gmatch("%S+") do
        v358[v359:lower()] = true;
    end;
    local v360 = {};
    for v361 = v70 + 1, #v55 do
        local v362 = v55[v361];
        table.insert(v360, {
            v362, 
            (v362:CheckTerms(v358))
        });
        v362.Frame.Visible = false;
        v362.Frame.Parent = v45;
    end;
    table.sort(v360, function(v363, v364) --[[ Line: 1631 ]]
        return v363[2] > v364[2];
    end);
    v65 = true;
    local v365 = 0;
    for _, v367 in ipairs(v360) do
        local v368 = v367[1];
        if v367[2] > 0 then
            v368.Frame.Visible = true;
            v368.Frame.Parent = v48;
            v368.Frame.LayoutOrder = v70 + v365;
            v365 = v365 + 1;
        end;
    end;
    v47.CanvasPosition = Vector2.new(0, 0);
    v98();
    l_v355_0.ZIndex = 3;
end;
local function v372() --[[ Line: 1653 ]] --[[ Name: clearResults ]]
    -- upvalues: l_v355_0 (copy), v65 (ref), v70 (ref), v55 (copy), v48 (ref), v98 (copy)
    if l_v355_0.ZIndex > 0 then
        v65 = false;
        for v370 = v70 + 1, #v55 do
            local v371 = v55[v370];
            v371.Frame.LayoutOrder = v371.Index;
            v371.Frame.Parent = v48;
            v371.Frame.Visible = true;
        end;
        l_v355_0.ZIndex = 0;
    end;
    v98();
end;
local l_v372_0 = v372 --[[ copy: 114 -> 121 ]];
local function v374() --[[ Line: 1667 ]] --[[ Name: reset ]]
    -- upvalues: l_v372_0 (copy), l_v354_0 (copy), v17 (ref)
    l_v372_0();
    l_v354_0.Text = v17;
end;
local l_v369_0 = v369 --[[ copy: 113 -> 122 ]];
local function v380(v376) --[[ Line: 1672 ]] --[[ Name: onChanged ]]
    -- upvalues: l_v354_0 (copy), l_v372_0 (copy), v17 (ref), l_v369_0 (copy), l_v355_0 (copy)
    if v376 == "Text" then
        local l_Text_0 = l_v354_0.Text;
        if l_Text_0 == "" then
            l_v372_0();
        elseif l_Text_0 ~= v17 then
            l_v369_0();
        end;
        local l_l_v355_0_0 = l_v355_0;
        local v379 = false;
        if l_Text_0 ~= "" then
            v379 = l_Text_0 ~= v17;
        end;
        l_l_v355_0_0.Visible = v379;
    end;
end;
local function v381() --[[ Line: 1684 ]] --[[ Name: onFocused ]]
    -- upvalues: l_v354_0 (copy), v17 (ref)
    if l_v354_0.Text == v17 then
        l_v354_0.Text = "";
    end;
end;
local function v383(v382) --[[ Line: 1690 ]] --[[ Name: focusLost ]]
    -- upvalues: l_v369_0 (copy), l_v354_0 (copy), v17 (ref)
    if v382 then
        l_v369_0();
        return;
    else
        if l_v354_0.Text == "" then
            l_v354_0.Text = v17;
        end;
        return;
    end;
end;
v354.Focused:connect(v381);
v355.MouseButton1Click:connect(v374);
v354.Changed:connect(v380);
v354.FocusLost:connect(v383);
v5.StateChanged.Event:connect(function(v384) --[[ Line: 1704 ]]
    -- upvalues: l_v355_0 (copy), l_v372_0 (copy), l_v354_0 (copy), v17 (ref)
    l_v355_0.Modal = v384;
    if not v384 then
        l_v372_0();
        l_v354_0.Text = v17;
    end;
end);
v58[Enum.KeyCode.Escape.Value] = function(v385) --[[ Line: 1711 ]]
    -- upvalues: l_v372_0 (copy), l_v354_0 (copy), v17 (ref), v45 (ref), v5 (copy)
    if v385 then
        l_v372_0();
        l_v354_0.Text = v17;
        return;
    else
        if v45.Visible then
            v5.OpenClose();
        end;
        return;
    end;
end;
l_UserInputService_0.LastInputTypeChanged:connect(function(v386) --[[ Line: 1719 ]] --[[ Name: detectGamepad ]]
    -- upvalues: l_VRService_0 (copy), v353 (copy)
    if v386 == Enum.UserInputType.Gamepad1 and not l_VRService_0.VREnabled then
        v353.Visible = false;
        return;
    else
        v353.Visible = true;
        return;
    end;
end);
v354 = function(_, v388, _) --[[ Line: 1730 ]]
    -- upvalues: l_GuiService_0 (copy), v70 (ref), v55 (copy)
    if v388 ~= Enum.UserInputState.Begin then
        return;
    elseif not l_GuiService_0.SelectedCoreObject then
        return;
    else
        for v390 = 1, v70 do
            if v55[v390].Frame == l_GuiService_0.SelectedCoreObject and v55[v390].Tool then
                v55[v390]:MoveToInventory();
                return;
            end;
        end;
        return;
    end;
end;
local l_v354_1 = v354 --[[ copy: 111 -> 123 ]];
v355 = function() --[[ Line: 1742 ]] --[[ Name: openClose ]]
    -- upvalues: v59 (copy), v45 (ref), v95 (copy), v42 (ref), v70 (ref), v55 (copy), v68 (ref), v22 (copy), l_UserInputService_0 (copy), v352 (copy), v339 (copy), l_ContextActionService_0 (copy), l_v354_1 (copy), v5 (copy)
    if not next(v59) then
        v45.Visible = not v45.Visible;
        local l_Visible_2 = v45.Visible;
        v95();
        v42.Active = not v42.Active;
        for v393 = 1, v70 do
            v55[v393]:SetClickability(not l_Visible_2);
        end;
    end;
    if v45.Visible then
        if v68 then
            if v22[l_UserInputService_0:GetLastInputType()] then
                v352();
                v339.Visible = true;
            end;
            enableGamepadInventoryControl();
        end;
    else
        if v68 then
            v339.Visible = false;
        end;
        disableGamepadInventoryControl();
    end;
    if v45.Visible then
        l_ContextActionService_0:BindAction("RBXRemoveSlot", l_v354_1, false, Enum.KeyCode.ButtonX);
    else
        l_ContextActionService_0:UnbindAction("RBXRemoveSlot");
    end;
    v5.IsOpen = v45.Visible;
    v5.StateChanged:Fire(v45.Visible);
end;
local l_v355_1 = v355 --[[ copy: 112 -> 124 ]];
v58[l_Value_0] = function() --[[ Line: 1778 ]]
    -- upvalues: l_GuiService_0 (copy), l_v355_1 (copy)
    if l_GuiService_0.MenuIsOpen then
        return;
    else
        l_v355_1();
        return;
    end;
end;
v5.OpenClose = v355;
while not l_LocalPlayer_0 do
    wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
l_LocalPlayer_0.CharacterAdded:connect(v265);
if l_LocalPlayer_0.Character then
    v265(l_LocalPlayer_0.Character);
end;
for v395 = 0, 9 do
    table.insert(v66, (tostring(v395)));
end;
table.insert(v66, "`");
l_UserInputService_0.InputBegan:connect(v270);
l_UserInputService_0.TextBoxFocused:connect(function() --[[ Line: 1813 ]]
    -- upvalues: v64 (ref)
    v64 = true;
end);
l_UserInputService_0.TextBoxFocusReleased:connect(function() --[[ Line: 1814 ]]
    -- upvalues: v64 (ref)
    v64 = false;
end);
v58[l_Value_2] = function() --[[ Line: 1817 ]]
    -- upvalues: v61 (ref), v53 (ref), v57 (copy)
    if v61 and v53 then
        v53:UnequipTools();
        if v61 then
            v61:ToggleSelect();
            v57[v61]:UpdateEquipView();
            v61 = nil;
        end;
    end;
end;
l_UserInputService_0.Changed:connect(v274);
v354 = l_UserInputService_0.KeyboardEnabled and not l_VRService_0.VREnabled;
for v396 = 1, v70 do
    v55[v396]:TurnNumber(v354);
end;
if l_UserInputService_0:GetGamepadConnected(Enum.UserInputType.Gamepad1) then
    gamepadConnected();
end;
l_UserInputService_0.GamepadConnected:connect(function(v397) --[[ Line: 1831 ]]
    if v397 == Enum.UserInputType.Gamepad1 then
        gamepadConnected();
    end;
end);
l_UserInputService_0.GamepadDisconnected:connect(function(v398) --[[ Line: 1836 ]]
    if v398 == Enum.UserInputType.Gamepad1 then
        gamepadDisconnected();
    end;
end);
v5.TopbarEnabledChanged = function(_, v400) --[[ Line: 1843 ]] --[[ Name: TopbarEnabledChanged ]]
    -- upvalues: v37 (ref), v326 (copy), l_StarterGui_0 (copy)
    v37 = v400;
    v326(Enum.CoreGuiType.Backpack, l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack));
end;
l_StarterGui_0.CoreGuiChangedSignal:connect(v326);
v354 = Enum.CoreGuiType.Backpack;
v355 = Enum.CoreGuiType.Health;
v326(v354, l_StarterGui_0:GetCoreGuiEnabled(v354));
v326(v355, l_StarterGui_0:GetCoreGuiEnabled(v355));
l_GuiService_0.MenuOpened:Connect(function() --[[ Line: 1855 ]]
    -- upvalues: v5 (copy)
    if v5.IsOpen then
        v5.OpenClose();
    end;
end);
if l_getFFlagAppChatCoreUIConflictFix_0() then
    l_InExperienceAppChatModal_0.default.visibilitySignal.Event:Connect(function(v401) --[[ Line: 1862 ]]
        -- upvalues: v5 (copy)
        if v401 and v5.IsOpen then
            v5.OpenClose();
        end;
    end);
end;
v369 = function() --[[ Line: 1869 ]] --[[ Name: OnPreferredTransparencyChanged ]]
    -- upvalues: l_UserGameSettings_0 (copy), v8 (ref), v45 (ref), v12 (ref), v55 (copy), v19 (ref), v353 (copy)
    local l_PreferredTransparency_0 = l_UserGameSettings_0.PreferredTransparency;
    v8 = 0.5 * l_UserGameSettings_0.PreferredTransparency;
    v45.BackgroundTransparency = v8;
    v12 = 0.5 * l_PreferredTransparency_0;
    for _, v404 in ipairs(v55) do
        v404.Frame.BackgroundTransparency = v12;
    end;
    v19 = 0.15 * l_UserGameSettings_0.PreferredTransparency;
    v353.BackgroundTransparency = v19;
end;
l_UserGameSettings_0:GetPropertyChangedSignal("PreferredTransparency"):connect(v369);
return v5;