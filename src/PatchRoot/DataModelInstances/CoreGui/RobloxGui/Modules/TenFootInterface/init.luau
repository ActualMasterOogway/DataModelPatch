local v0 = Color3.new(0.10588235294117647, 0.9882352941176471, 0.4196078431372549);
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local _ = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local v7 = false;
local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
local v9 = true;
if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.XBoxOne then
    v9 = true;
    if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.WiiU then
        v9 = true;
        if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.PS4 then
            v9 = true;
            if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.AndroidTV then
                v9 = true;
                if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.XBox360 then
                    v9 = true;
                    if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.PS3 then
                        v9 = true;
                        if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.Ouya then
                            v9 = l_l_UserInputService_0_Platform_0 == Enum.Platform.SteamOS;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
v7 = v9;
l_l_UserInputService_0_Platform_0 = function() --[[ Line: 40 ]] --[[ Name: CreateModule ]]
    -- upvalues: l_Create_0 (copy), l_RobloxGui_0 (copy), v0 (copy), l_Players_0 (copy)
    local v10 = {
        Container = nil
    };
    local v11 = {};
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    local l_BindableEvent_1 = Instance.new("BindableEvent");
    local function v14() --[[ Line: 49 ]] --[[ Name: createContainer ]]
        -- upvalues: v10 (copy), l_Create_0 (ref), l_RobloxGui_0 (ref)
        if not v10.Container then
            v10.Container = l_Create_0("ImageButton")({
                Name = "TopRightContainer", 
                Size = UDim2.new(0, 350, 0, 100), 
                Position = UDim2.new(1, -415, 0, 10), 
                AutoButtonColor = false, 
                Image = "", 
                Active = false, 
                BackgroundTransparency = 1, 
                Parent = l_RobloxGui_0
            });
        end;
    end;
    removeFromDisplayStack = function(v15) --[[ Line: 65 ]] --[[ Name: removeFromDisplayStack ]]
        -- upvalues: v11 (copy), l_BindableEvent_0 (copy)
        local v16 = nil;
        for v17 = 1, #v11 do
            if v11[v17] == v15 then
                v16 = v17 + 1;
                break;
            end;
        end;
        local l_v15_0 = v15;
        for v19 = v16, #v11 do
            local v20 = v11[v19];
            v20.Position = UDim2.new(v20.Position.X.Scale, v20.Position.X.Offset, v20.Position.Y.Scale, l_v15_0.AbsolutePosition.Y);
            l_v15_0 = v20;
        end;
        l_BindableEvent_0:Fire();
    end;
    addBackToDisplayStack = function(v21) --[[ Line: 85 ]] --[[ Name: addBackToDisplayStack ]]
        -- upvalues: v11 (copy), l_BindableEvent_0 (copy)
        local v22 = 0;
        for v23 = 1, #v11 do
            if v11[v23] == v21 then
                v22 = v23 + 1;
                break;
            end;
        end;
        local l_v21_0 = v21;
        for v25 = v22, #v11 do
            local v26 = v11[v25];
            local v27 = l_v21_0.AbsolutePosition.Y + l_v21_0.AbsoluteSize.Y + 4;
            v26.Position = UDim2.new(v26.Position.X.Scale, v26.Position.X.Offset, v26.Position.Y.Scale, v27);
            l_v21_0 = v26;
        end;
        l_BindableEvent_0:Fire();
    end;
    addToDisplayStack = function(v28) --[[ Line: 106 ]] --[[ Name: addToDisplayStack ]]
        -- upvalues: v11 (copy), v14 (copy), v10 (copy), l_BindableEvent_0 (copy)
        local v29 = nil;
        if #v11 > 0 then
            v29 = v11[#v11];
        end;
        v11[#v11 + 1] = v28;
        local v30 = 0;
        if v29 then
            v30 = v29.AbsolutePosition.Y + v29.AbsoluteSize.Y + 4;
        end;
        v28.Position = UDim2.new(v28.Position.X.Scale, v28.Position.X.Offset, v28.Position.Y.Scale, v30);
        v14();
        v28.Parent = v10.Container;
        v28.Changed:connect(function(v31) --[[ Line: 124 ]]
            -- upvalues: v28 (copy)
            if v31 == "Visible" then
                if not v28.Visible then
                    removeFromDisplayStack(v28);
                    return;
                else
                    addBackToDisplayStack(v28);
                end;
            end;
        end);
        l_BindableEvent_0:Fire();
    end;
    v10.CreateHealthBar = function(_) --[[ Line: 136 ]] --[[ Name: CreateHealthBar ]]
        -- upvalues: v10 (copy), l_Create_0 (ref), v0 (ref), v14 (copy), l_BindableEvent_1 (copy)
        v10.HealthContainer = l_Create_0("Frame")({
            Name = "HealthContainer", 
            Size = UDim2.new(1, -86, 0, 50), 
            Position = UDim2.new(0, 92, 0, 0), 
            BorderSizePixel = 0, 
            BackgroundColor3 = Color3.new(0, 0, 0), 
            BackgroundTransparency = 0.5
        });
        local v33 = l_Create_0("Frame")({
            Name = "HealthFillHolder", 
            Size = UDim2.new(1, -10, 1, -10), 
            Position = UDim2.new(0, 5, 0, 5), 
            BorderSizePixel = 0, 
            BackgroundColor3 = Color3.new(1, 1, 1), 
            BackgroundTransparency = 1, 
            Parent = v10.HealthContainer
        });
        local v34 = l_Create_0("Frame")({
            Name = "HealthFill", 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 0, 
            BackgroundColor3 = v0, 
            Parent = v33
        });
        local _ = l_Create_0("TextLabel")({
            Name = "HealthText", 
            Size = UDim2.new(0, 98, 0, 50), 
            Position = UDim2.new(0, -100, 0, 0), 
            BackgroundTransparency = 0.5, 
            BackgroundColor3 = Color3.new(0, 0, 0), 
            Font = Enum.Font.SourceSans, 
            FontSize = Enum.FontSize.Size36, 
            Text = "Health", 
            TextColor3 = Color3.new(1, 1, 1), 
            BorderSizePixel = 0, 
            Parent = v10.HealthContainer
        });
        local v36 = l_Create_0("TextLabel")({
            Visible = false
        });
        local v37 = l_Create_0("TextLabel")({
            Visible = false
        });
        addToDisplayStack(v10.HealthContainer);
        v14();
        v10.HealthContainer.Changed:connect(function() --[[ Line: 191 ]]
            -- upvalues: l_BindableEvent_1 (ref)
            l_BindableEvent_1:Fire();
        end);
        return v10.Container, v36, v10.HealthContainer, v34, v37;
    end;
    v10.CreateAccountType = function(_, v39) --[[ Line: 198 ]] --[[ Name: CreateAccountType ]]
        -- upvalues: v10 (copy), l_Create_0 (ref), l_RobloxGui_0 (ref)
        v10.AccountTypeContainer = l_Create_0("Frame")({
            Name = "AccountTypeContainer", 
            Size = UDim2.new(0, 50, 0, 50), 
            Position = UDim2.new(1, -55, 0, 10), 
            BorderSizePixel = 0, 
            BackgroundColor3 = Color3.new(0, 0, 0), 
            BackgroundTransparency = 0.5, 
            Parent = l_RobloxGui_0
        });
        local _ = l_Create_0("TextLabel")({
            Name = "AccountTypeText", 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            BackgroundTransparency = 1, 
            BackgroundColor3 = Color3.new(0, 0, 0), 
            Font = Enum.Font.SourceSans, 
            FontSize = Enum.FontSize.Size36, 
            Text = v39, 
            TextColor3 = Color3.new(1, 1, 1), 
            BorderSizePixel = 0, 
            Parent = v10.AccountTypeContainer, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center
        });
    end;
    v10.SetupTopStat = function(_) --[[ Line: 226 ]] --[[ Name: SetupTopStat ]]
        -- upvalues: l_Create_0 (ref), l_Players_0 (ref)
        local v42 = true;
        local v43 = nil;
        local v44 = nil;
        local v45 = nil;
        local v46 = nil;
        local v47 = nil;
        local function v49() --[[ Line: 234 ]] --[[ Name: makeTenFootInterfaceStat ]]
            -- upvalues: v47 (ref), l_Create_0 (ref)
            if v47 then
                return;
            else
                v47 = l_Create_0("Frame")({
                    Name = "OneStatFrame", 
                    Size = UDim2.new(1, 0, 0, 36), 
                    Position = UDim2.new(0, 0, 0, 0), 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1
                });
                local v48 = l_Create_0("TextLabel")({
                    Name = "StatName", 
                    Size = UDim2.new(0.5, 0, 0, 36), 
                    BackgroundTransparency = 1, 
                    Font = Enum.Font.SourceSans, 
                    FontSize = Enum.FontSize.Size36, 
                    TextStrokeColor3 = Color3.new(0.40784313725490196, 0.40784313725490196, 0.40784313725490196), 
                    TextStrokeTransparency = 0, 
                    Text = " StatName:", 
                    TextColor3 = Color3.new(1, 1, 1), 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    BorderSizePixel = 0, 
                    ClipsDescendants = true, 
                    Parent = v47
                }):clone();
                v48.Position = UDim2.new(0.5, 0, 0, 0);
                v48.Name = "StatValue";
                v48.Text = "123,643,231";
                v48.TextXAlignment = Enum.TextXAlignment.Right;
                v48.Parent = v47;
                addToDisplayStack(v47);
                return;
            end;
        end;
        local v50 = nil;
        local function v53(v51) --[[ Line: 271 ]] --[[ Name: setDisplayedStat ]]
            -- upvalues: v44 (ref), v45 (ref), v43 (ref), v49 (copy), v50 (ref)
            if v44 then
                v44:disconnect();
                v44 = nil;
            end;
            if v45 then
                v45:disconnect();
                v45 = nil;
            end;
            v43 = v51;
            if v43 then
                v49();
                v50(v43);
                v45 = v43.AncestryChanged:connect(function() --[[ Line: 280 ]]
                    -- upvalues: v50 (ref), v43 (ref)
                    v50(v43, "Parent");
                end);
                v44 = v43.Changed:connect(function(v52) --[[ Line: 281 ]]
                    -- upvalues: v50 (ref), v43 (ref)
                    v50(v43, v52);
                end);
            end;
        end;
        v50 = function(v54, v55) --[[ Line: 285 ]] --[[ Name: updateTenFootStat ]]
            -- upvalues: v47 (ref), v53 (copy), v42 (ref)
            if v55 and v55 == "Parent" then
                v47.StatName.Text = "";
                v47.StatValue.Text = "";
                v53(nil);
                tenFootInterfaceChanged();
                return;
            elseif v42 then
                v47.StatName.Text = " " .. tostring(v54.Name) .. ":";
                v47.StatValue.Text = tostring(v54.Value);
                return;
            else
                v47.StatName.Text = "";
                v47.StatValue.Text = "";
                return;
            end;
        end;
        local function v57(v56) --[[ Line: 303 ]] --[[ Name: isValidStat ]]
            return v56:IsA("StringValue") or v56:IsA("IntValue") or v56:IsA("BoolValue") or v56:IsA("NumberValue") or v56:IsA("DoubleConstrainedValue") or v56:IsA("IntConstrainedValue");
        end;
        local function _(v58) --[[ Line: 308 ]] --[[ Name: tenFootInterfaceNewStat ]]
            -- upvalues: v43 (ref), v57 (copy), v53 (copy)
            if not v43 and v57(v58) then
                v53(v58);
            end;
        end;
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        while not l_LocalPlayer_0 do
            l_Players_0.PlayerAdded:wait();
            l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        end;
        tenFootInterfaceChanged = function() --[[ Line: 320 ]] --[[ Name: tenFootInterfaceChanged ]]
            -- upvalues: l_LocalPlayer_0 (ref), v43 (ref), v57 (copy), v53 (copy), v46 (ref)
            local l_leaderstats_0 = l_LocalPlayer_0:FindFirstChild("leaderstats");
            if l_leaderstats_0 then
                local l_l_leaderstats_0_Children_0 = l_leaderstats_0:GetChildren();
                for v63 = 1, #l_l_leaderstats_0_Children_0 do
                    local v64 = l_l_leaderstats_0_Children_0[v63];
                    if not v43 and v57(v64) then
                        v53(v64);
                    end;
                end;
                if v46 then
                    v46:disconnect();
                end;
                v46 = l_leaderstats_0.ChildAdded:connect(function(v65) --[[ Line: 328 ]]
                    -- upvalues: v43 (ref), v57 (ref), v53 (ref)
                    if not v43 and v57(v65) then
                        v53(v65);
                    end;
                end);
            end;
        end;
        if l_LocalPlayer_0:FindFirstChild("leaderstats") then
            tenFootInterfaceChanged();
        else
            l_LocalPlayer_0.ChildAdded:connect(tenFootInterfaceChanged);
        end;
        return {
            SetTopStatEnabled = function(_, v67) --[[ Line: 345 ]] --[[ Name: SetTopStatEnabled ]]
                -- upvalues: v42 (ref), v43 (ref), v50 (ref)
                v42 = v67;
                if v43 then
                    v50(v43, "");
                end;
            end
        };
    end;
    return v10;
end;
v9 = {};
local v68 = l_l_UserInputService_0_Platform_0();
v9.IsEnabled = function(_) --[[ Line: 365 ]] --[[ Name: IsEnabled ]]
    -- upvalues: v7 (ref)
    return v7;
end;
v9.CreateHealthBar = function(_) --[[ Line: 369 ]] --[[ Name: CreateHealthBar ]]
    -- upvalues: v68 (copy)
    return v68:CreateHealthBar();
end;
v9.CreateAccountType = function(_, v72) --[[ Line: 373 ]] --[[ Name: CreateAccountType ]]
    -- upvalues: v68 (copy)
    return v68:CreateAccountType(v72);
end;
v9.SetupTopStat = function(_) --[[ Line: 377 ]] --[[ Name: SetupTopStat ]]
    -- upvalues: v68 (copy)
    return v68:SetupTopStat();
end;
return v9;