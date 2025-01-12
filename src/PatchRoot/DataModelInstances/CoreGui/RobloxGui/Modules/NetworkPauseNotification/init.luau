local v0 = UDim2.new(1.1, 0, 1.1, 0);
local v1 = UDim2.new(0.9, 0, 0.9, 0);
local l_TweenService_0 = game:GetService("TweenService");
local l_Modules_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui"):WaitForChild("Modules");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local v6 = require(l_Modules_0.RobloxTranslator);
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local v8 = TweenInfo.new(0.15, Enum.EasingStyle.Sine);
local v9 = TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true);
local v10 = game:DefineFastFlag("LocalizeGameplayPaused", false);
local v11 = game:DefineFastFlag("NetworkPauseNotifTweenCancel", false);
local v12 = game:DefineFastFlag("NetworkPauseNoAnimation", false);
local function v14() --[[ Line: 28 ]] --[[ Name: build ]]
    -- upvalues: v12 (copy), l_Create_0 (copy), v1 (copy), l_AppFonts_0 (copy), v10 (copy), v6 (copy)
    local v13 = v12 and 0 or 1;
    return l_Create_0("ImageLabel")({
        Name = "NetworkPause", 
        Image = "rbxasset://textures/ui/PurchasePrompt/LoadingBG.png", 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(8, 8, 12, 12), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        ImageColor3 = Color3.fromRGB(122, 122, 122), 
        ImageTransparency = v13, 
        BackgroundTransparency = 1; 
        l_Create_0("UISizeConstraint")({
            MaxSize = Vector2.new(312, 251)
        }), 
        l_Create_0("UIPadding")({
            PaddingTop = UDim.new(0, 24), 
            PaddingLeft = UDim.new(0, 24), 
            PaddingRight = UDim.new(0, 24), 
            PaddingBottom = UDim.new(0, 24)
        }), 
        l_Create_0("Frame")({
            Name = "Accent", 
            BorderSizePixel = 0, 
            BackgroundColor3 = Color3.fromRGB(66, 66, 66), 
            Size = UDim2.new(1, 0, 0, 1), 
            Position = UDim2.new(0, 0, 0, 88), 
            BackgroundTransparency = v13
        }), 
        l_Create_0("Frame")({
            Name = "Upper", 
            Size = UDim2.new(1, 0, 0, 88), 
            BackgroundTransparency = 1; 
            l_Create_0("Frame")({
                Name = "IconContainer", 
                Size = UDim2.new(0, 40, 0, 37), 
                AnchorPoint = Vector2.new(0.5, 0), 
                Position = UDim2.new(0.5, 0, 0, 0), 
                BackgroundTransparency = 1; 
                l_Create_0("ImageLabel")({
                    Name = "Icon", 
                    BackgroundTransparency = 1, 
                    Image = "rbxasset://textures/ui/NetworkPause/no connection.png", 
                    Size = v1, 
                    Position = UDim2.new(0.5, 0, 0.88, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.88), 
                    ImageTransparency = v13
                })
            }), 
            l_Create_0("TextLabel")({
                Name = "Label", 
                Font = l_AppFonts_0.default:getBold(), 
                Text = v10 and v6:FormatByKey("InGame.GameplayPaused.Title") or "Gameplay Paused", 
                TextSize = 22, 
                TextWrapped = true, 
                Size = UDim2.new(1, 0, 0, 22), 
                Position = UDim2.new(0, 0, 0, 54), 
                BackgroundTransparency = 1, 
                TextColor3 = Color3.fromRGB(255, 255, 255), 
                TextTransparency = v13
            })
        }), 
        l_Create_0("TextLabel")({
            Name = "Lower", 
            Font = l_AppFonts_0.default:getDefault(), 
            Text = v10 and v6:FormatByKey("InGame.GameplayPaused.Body") or "Gameplay has been paused: please wait while the game content loads.", 
            TextColor3 = Color3.fromRGB(190, 190, 190), 
            TextSize = 18, 
            TextWrapped = true, 
            Position = UDim2.new(0, 0, 0, 89), 
            Size = UDim2.new(1, 0, 1, -89), 
            BackgroundTransparency = 1, 
            TextTransparency = v13
        })
    });
end;
local v15 = {};
v15.__index = v15;
v15.new = function() --[[ Line: 128 ]] --[[ Name: new ]]
    -- upvalues: v15 (copy), v14 (copy), v12 (copy), l_TweenService_0 (copy), v8 (copy), v9 (copy), v0 (copy)
    local v16 = setmetatable({}, v15);
    local v17 = v14();
    if not v12 then
        v17:GetPropertyChangedSignal("ImageTransparency"):Connect(function() --[[ Line: 133 ]]
            -- upvalues: v17 (copy)
            local l_ImageTransparency_0 = v17.ImageTransparency;
            v17.Lower.TextTransparency = l_ImageTransparency_0;
            v17.Accent.BackgroundTransparency = l_ImageTransparency_0;
            v17.Upper.Label.TextTransparency = l_ImageTransparency_0;
            v17.Upper.IconContainer.Icon.ImageTransparency = l_ImageTransparency_0;
        end);
    end;
    local v19 = l_TweenService_0:Create(v17, v8, {
        ImageTransparency = 0
    });
    local v20 = l_TweenService_0:Create(v17, v8, {
        ImageTransparency = 1
    });
    local v21 = l_TweenService_0:Create(v17.Upper.IconContainer.Icon, v9, {
        Size = v0, 
        ImageTransparency = 0.75
    });
    if not v12 then
        v19.Completed:Connect(function(v22) --[[ Line: 151 ]]
            -- upvalues: v17 (copy), v21 (copy)
            if v22 == Enum.PlaybackState.Completed then
                v17.Upper.IconContainer.Icon.ImageTransparency = 0;
                v21:Play();
            end;
        end);
    end;
    v16.__gui = v17;
    v16.__guiParent = nil;
    v16.__show = false;
    v16.__animations = {
        show = v19, 
        hide = v20, 
        pulse = v21
    };
    return v16;
end;
v15.Show = function(v23) --[[ Line: 171 ]] --[[ Name: Show ]]
    -- upvalues: v1 (copy), v12 (copy), v11 (copy)
    v23.__gui.Upper.IconContainer.Icon.Size = v1;
    if v12 then
        v23.__gui.Upper.IconContainer.Icon.ImageTransparency = 0;
        v23.__show = true;
        v23.__gui.Parent = v23.__guiParent;
        v23.__animations.pulse:Play();
        return;
    else
        if v11 then
            v23.__animations.hide:Cancel();
        end;
        v23.__animations.show:Play();
        return;
    end;
end;
v15.Hide = function(v24) --[[ Line: 187 ]] --[[ Name: Hide ]]
    -- upvalues: v12 (copy), v11 (copy)
    if v12 then
        v24.__show = false;
        v24.__gui.Parent = nil;
        v24.__animations.pulse:Cancel();
        return;
    else
        v24.__animations.pulse:Cancel();
        if v11 then
            v24.__animations.show:Cancel();
        end;
        v24.__animations.hide:Play();
        return;
    end;
end;
v15.SetParent = function(v25, v26) --[[ Line: 201 ]] --[[ Name: SetParent ]]
    -- upvalues: v12 (copy)
    if v12 then
        v25.__guiParent = v26;
        if v25.__show then
            v25.__gui.Parent = v26;
            return;
        end;
    else
        v25.__gui.Parent = v26;
    end;
end;
return v15;