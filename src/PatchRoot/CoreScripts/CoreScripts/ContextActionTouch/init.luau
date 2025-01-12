local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Players_0 = game:GetService("Players");
local l_GuiService_0 = game:GetService("GuiService");
local l_TouchEnabled_0 = l_UserInputService_0.TouchEnabled;
local v5 = {};
local v6 = {};
local v7 = nil;
local v8 = nil;
local _ = {};
local v10 = {
    [1] = UDim2.new(0, 123, 0, 70), 
    [2] = UDim2.new(0, 30, 0, 60), 
    [3] = UDim2.new(0, 180, 0, 160), 
    [4] = UDim2.new(0, 85, 0, -25), 
    [5] = UDim2.new(0, 185, 0, -25), 
    [6] = UDim2.new(0, 185, 0, 260), 
    [7] = UDim2.new(0, 216, 0, 65)
};
local v11 = #v10;
game:GetService("ContentProvider"):Preload("https://www.roblox.com/asset/?id=97166756");
game:GetService("ContentProvider"):Preload("https://www.roblox.com/asset/?id=97166444");
local l_CoreGui_0 = game:GetService("CoreGui");
local _ = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local v15 = require(l_RobloxGui_0.Modules.CoreUtility);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_Players_0.ChildAdded:wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v17 = v15.waitForChildOfClass(l_LocalPlayer_0, "PlayerGui");
createContextActionGui = function() --[[ Line: 57 ]] --[[ Name: createContextActionGui ]]
    -- upvalues: v7 (ref), l_TouchEnabled_0 (copy), v8 (ref), l_GuiService_0 (copy)
    if not v7 and l_TouchEnabled_0 then
        v7 = Instance.new("ScreenGui");
        v7.Name = "ContextActionGui";
        v7.ResetOnSpawn = false;
        v8 = Instance.new("Frame");
        v8.BackgroundTransparency = 1;
        v8.Size = UDim2.new(0.3, 0, 0.5, 0);
        v8.Position = UDim2.new(0.7, 0, 0.5, 0);
        v8.Name = "ContextButtonFrame";
        v8.Parent = v7;
        v8.Visible = l_GuiService_0.TouchControlsEnabled;
        l_GuiService_0:GetPropertyChangedSignal("TouchControlsEnabled"):Connect(function() --[[ Line: 71 ]]
            -- upvalues: v8 (ref), l_GuiService_0 (ref)
            v8.Visible = l_GuiService_0.TouchControlsEnabled;
        end);
    end;
end;
setButtonSizeAndPosition = function(v18) --[[ Line: 78 ]] --[[ Name: setButtonSizeAndPosition ]]
    local v19 = 55;
    local v20 = 10;
    if not (game:GetService("CoreGui").RobloxGui.AbsoluteSize.X < 600) then
        v19 = 85;
        v20 = 40;
    end;
    v18.Size = UDim2.new(0, v19, 0, v19);
end;
contextActionButtonDown = function(v21, v22, v23) --[[ Line: 93 ]] --[[ Name: contextActionButtonDown ]]
    -- upvalues: l_ContextActionService_0 (copy)
    v21.Image = "https://www.roblox.com/asset/?id=97166756";
    l_ContextActionService_0:CallFunction(v23, Enum.UserInputState.Begin, v22);
end;
contextActionButtonMoved = function(v24, v25, v26) --[[ Line: 98 ]] --[[ Name: contextActionButtonMoved ]]
    -- upvalues: l_ContextActionService_0 (copy)
    v24.Image = "https://www.roblox.com/asset/?id=97166756";
    l_ContextActionService_0:CallFunction(v26, Enum.UserInputState.Change, v25);
end;
contextActionButtonUp = function(v27, v28, v29) --[[ Line: 103 ]] --[[ Name: contextActionButtonUp ]]
    -- upvalues: l_ContextActionService_0 (copy)
    v27.Image = "https://www.roblox.com/asset/?id=97166444";
    l_ContextActionService_0:CallFunction(v29, Enum.UserInputState.End, v28);
end;
contextActionButtonCancel = function(v30, v31, v32) --[[ Line: 108 ]] --[[ Name: contextActionButtonCancel ]]
    -- upvalues: l_ContextActionService_0 (copy)
    v30.Image = "https://www.roblox.com/asset/?id=97166444";
    l_ContextActionService_0:CallFunction(v32, Enum.UserInputState.Cancel, v31);
end;
isSmallScreenDevice = function() --[[ Line: 113 ]] --[[ Name: isSmallScreenDevice ]]
    return game:GetService("GuiService"):GetScreenResolution().Y <= 320;
end;
createNewButton = function(v33, v34) --[[ Line: 118 ]] --[[ Name: createNewButton ]]
    -- upvalues: v8 (ref), l_UserInputService_0 (copy)
    local l_ImageButton_0 = Instance.new("ImageButton");
    l_ImageButton_0.Name = "ContextActionButton";
    l_ImageButton_0.BackgroundTransparency = 1;
    l_ImageButton_0.Size = UDim2.new(0, 45, 0, 45);
    l_ImageButton_0.Active = true;
    if isSmallScreenDevice() then
        l_ImageButton_0.Size = UDim2.new(0, 35, 0, 35);
    end;
    l_ImageButton_0.Image = "https://www.roblox.com/asset/?id=97166444";
    l_ImageButton_0.Parent = v8;
    local v36 = nil;
    local v37 = false;
    l_UserInputService_0.InputEnded:connect(function(v38) --[[ Line: 145 ]]
        -- upvalues: v36 (ref), v37 (ref), l_ImageButton_0 (copy), v33 (copy)
        if v38.UserInputType ~= Enum.UserInputType.Touch then
            return;
        elseif v36 ~= v38 then
            return;
        else
            if v38.UserInputState == Enum.UserInputState.End and v37 then
                contextActionButtonCancel(l_ImageButton_0, v38, v33);
            end;
            v36 = nil;
            v37 = false;
            return;
        end;
    end);
    l_ImageButton_0.InputBegan:connect(function(v39) --[[ Line: 161 ]]
        -- upvalues: v36 (ref), v37 (ref), l_ImageButton_0 (copy), v33 (copy)
        if v39.UserInputType ~= Enum.UserInputType.Touch then
            return;
        elseif v39.UserInputState == Enum.UserInputState.Begin then
            v36 = v39;
            v37 = false;
            contextActionButtonDown(l_ImageButton_0, v39, v33);
            return;
        else
            if v39.UserInputState == Enum.UserInputState.Change then
                if v36 ~= v39 then
                    return;
                else
                    v37 = false;
                end;
            end;
            return;
        end;
    end);
    l_ImageButton_0.InputEnded:connect(function(v40) --[[ Line: 180 ]]
        -- upvalues: v36 (ref), v37 (ref), l_ImageButton_0 (copy), v33 (copy)
        if v40.UserInputType ~= Enum.UserInputType.Touch then
            return;
        elseif v36 ~= v40 then
            return;
        elseif v40.UserInputState == Enum.UserInputState.End then
            v36 = nil;
            v37 = false;
            contextActionButtonUp(l_ImageButton_0, v40, v33);
            return;
        else
            if v40.UserInputState == Enum.UserInputState.Change then
                v37 = true;
            end;
            return;
        end;
    end);
    l_ImageButton_0.InputChanged:connect(function(v41) --[[ Line: 199 ]]
        -- upvalues: v36 (ref), l_ImageButton_0 (copy), v33 (copy)
        if v41.UserInputType ~= Enum.UserInputType.Touch then
            return;
        elseif v36 ~= v41 then
            return;
        else
            contextActionButtonMoved(l_ImageButton_0, v41, v33);
            return;
        end;
    end);
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.Name = "ActionIcon";
    l_ImageLabel_0.Position = UDim2.new(0.175, 0, 0.175, 0);
    l_ImageLabel_0.Size = UDim2.new(0.65, 0, 0.65, 0);
    l_ImageLabel_0.BackgroundTransparency = 1;
    if v34.image and type(v34.image) == "string" then
        l_ImageLabel_0.Image = v34.image;
    end;
    l_ImageLabel_0.Parent = l_ImageButton_0;
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.Name = "ActionTitle";
    l_TextLabel_0.Size = UDim2.new(1, 0, 1, 0);
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.Font = Enum.Font.SourceSansBold;
    l_TextLabel_0.TextColor3 = Color3.new(1, 1, 1);
    l_TextLabel_0.TextStrokeTransparency = 0;
    l_TextLabel_0.FontSize = Enum.FontSize.Size18;
    l_TextLabel_0.TextWrapped = true;
    l_TextLabel_0.Text = "";
    if v34.title and type(v34.title) == "string" then
        l_TextLabel_0.Text = v34.title;
    end;
    l_TextLabel_0.Parent = l_ImageButton_0;
    return l_ImageButton_0;
end;
createButton = function(v44, v45) --[[ Line: 237 ]] --[[ Name: createButton ]]
    -- upvalues: v6 (copy), v11 (copy), v5 (copy), v10 (copy), v8 (ref), v7 (ref), v17 (copy)
    local v46 = createNewButton(v44, v45);
    local v47 = nil;
    for v48 = 1, #v6 do
        if v6[v48] == "empty" then
            v47 = v48;
            break;
        end;
    end;
    if not v47 then
        v47 = #v6 + 1;
    end;
    if v11 < v47 then
        return;
    else
        v6[v47] = v46;
        v5[v44].button = v46;
        v46.Position = v10[v47];
        v46.Parent = v8;
        if v7 and v7.Parent == nil then
            v7.Parent = v17;
            if not v8.Parent then
                v8.Parent = v7;
            end;
        end;
        return;
    end;
end;
removeAction = function(v49) --[[ Line: 270 ]] --[[ Name: removeAction ]]
    -- upvalues: v5 (copy), v6 (copy)
    if not v5[v49] then
        return;
    else
        local l_button_0 = v5[v49].button;
        if l_button_0 then
            l_button_0.Parent = nil;
            for v51 = 1, #v6 do
                if v6[v51] == l_button_0 then
                    v6[v51] = "empty";
                    break;
                end;
            end;
            l_button_0:Destroy();
        end;
        v5[v49] = nil;
        return;
    end;
end;
addAction = function(v52, v53, v54) --[[ Line: 291 ]] --[[ Name: addAction ]]
    -- upvalues: v5 (copy), l_TouchEnabled_0 (copy)
    if v5[v52] then
        removeAction(v52);
    end;
    v5[v52] = {
        v54
    };
    if v53 and l_TouchEnabled_0 then
        createContextActionGui();
        createButton(v52, v54);
    end;
end;
l_ContextActionService_0.BoundActionChanged:connect(function(v55, v56, v57) --[[ Line: 303 ]]
    -- upvalues: v5 (copy)
    if v5[v55] and v57 then
        local l_button_1 = v5[v55].button;
        local v59 = v57[v56] or (not (v56 ~= "image" and v56 ~= "title") or v56 == "description") and "";
        if l_button_1 then
            if v56 == "image" then
                l_button_1.ActionIcon.Image = v59;
                return;
            elseif v56 == "title" then
                l_button_1.ActionTitle.Text = v59;
                return;
            elseif v56 == "description" then
                return;
            elseif v56 == "position" then
                l_button_1.Position = v59;
            end;
        end;
    end;
end);
l_ContextActionService_0.BoundActionAdded:connect(function(v60, v61, v62) --[[ Line: 325 ]]
    addAction(v60, v61, v62);
end);
l_ContextActionService_0.BoundActionRemoved:connect(function(v63, _) --[[ Line: 329 ]]
    removeAction(v63);
end);
l_ContextActionService_0.GetActionButtonEvent:connect(function(v65) --[[ Line: 333 ]]
    -- upvalues: v5 (copy), l_ContextActionService_0 (copy)
    if v5[v65] then
        l_ContextActionService_0:FireActionButtonFoundSignal(v65, v5[v65].button);
    end;
end);
local l_l_ContextActionService_0_AllBoundActionInfo_0 = l_ContextActionService_0:GetAllBoundActionInfo();
for v67, v68 in pairs(l_l_ContextActionService_0_AllBoundActionInfo_0) do
    addAction(v67, v68.createTouchButton, v68);
end;