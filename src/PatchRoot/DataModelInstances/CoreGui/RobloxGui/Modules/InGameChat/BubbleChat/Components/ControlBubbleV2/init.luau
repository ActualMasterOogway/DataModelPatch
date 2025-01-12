local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_Images_0 = v5.App.ImageSet.Images;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 16 ]]
    -- upvalues: v5 (copy)
    return v5.Core.ImageSet.ImageSetLabel;
end);
local v9 = l_status_0 and l_result_0 or v5.Core.ImageSet.ImageSetLabel;
local v10 = require(script.Parent.Parent.Helpers.getVoiceIndicatorAssetName);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v12 = require(l_Modules_0.Flags.getFFlagEnableShimmeringIconLegacyChatService);
local v13 = require(l_Modules_0.Flags.getFFlagLegacyConnectingMicStateFix);
local v14 = 0.6;
local v15 = Vector2.new(-1, 0);
if game:DefineFastFlag("EnableDarkerShimmerTransparencyLegacyChatService", false) then
    v14 = 0.4;
end;
local function v19(v16) --[[ Line: 50 ]] --[[ Name: createTweenShimmeringEffect ]]
    -- upvalues: l_TweenService_0 (copy)
    local v17 = TweenInfo.new(1, Enum.EasingStyle.Circular, Enum.EasingDirection.Out, -1);
    local v18 = {
        Offset = Vector2.new(1, 0)
    };
    return (l_TweenService_0:Create(v16:getValue(), v17, v18));
end;
return function(v20) --[[ Line: 58 ]]
    -- upvalues: v4 (copy), v12 (copy), l_RunService_0 (copy), v19 (copy), v13 (copy), v15 (copy), v10 (copy), v9 (copy), l_Images_0 (copy), v14 (ref)
    local v21, v22 = v4.useState(0);
    local v23 = v4.useRef(nil);
    local v24 = v4.useRef(nil);
    if v12() then
        v23 = v4.useRef(nil);
        v24 = v4.useRef(nil);
        v4.useEffect(function() --[[ Line: 66 ]]
            -- upvalues: v23 (ref), v24 (ref)
            if v23.current then
                local l_FirstChildWhichIsA_0 = v23.current:FindFirstChildWhichIsA("UIGradient", true);
                if l_FirstChildWhichIsA_0 then
                    v24.current = l_FirstChildWhichIsA_0;
                end;
            end;
        end, {
            v23
        });
    end;
    v4.useEffect(function() --[[ Line: 76 ]]
        -- upvalues: v20 (copy), l_RunService_0 (ref), v22 (copy), v12 (ref), v24 (ref), v19 (ref), v13 (ref), v15 (ref)
        if v20.voiceState and v20.voiceState == "Talking" and v20.renderStepName then
            l_RunService_0:BindToRenderStep(v20.renderStepName, 1, function() --[[ Line: 78 ]]
                -- upvalues: v22 (ref)
                v22(math.random());
            end);
            return function() --[[ Line: 82 ]]
                -- upvalues: l_RunService_0 (ref), v20 (ref)
                l_RunService_0:UnbindFromRenderStep(v20.renderStepName);
            end;
        elseif v12() and v20.voiceState and v20.voiceState == "Connecting" and v24 then
            local v26 = v19(v24);
            v26:Play();
            return function() --[[ Line: 94 ]]
                -- upvalues: v26 (copy), v13 (ref), v24 (ref), v15 (ref)
                v26:Cancel();
                if v13() and v24 and v24.current then
                    v24.current.Offset = v15;
                end;
            end;
        else
            return function() --[[ Line: 105 ]]
                -- upvalues: v20 (ref), l_RunService_0 (ref)
                if v20.renderStepName then
                    l_RunService_0:UnbindFromRenderStep(v20.renderStepName);
                end;
            end;
        end;
    end, {
        v20.voiceState
    });
    local v27 = v20.iconAssetName or v10(v20.voiceState, v21, v20.iconStyle);
    return v4.createElement("ImageButton", {
        AnchorPoint = Vector2.new(0.5, 1), 
        Size = v20.controlBubbleSize, 
        LayoutOrder = v20.LayoutOrder, 
        BorderSizePixel = 0, 
        Transparency = 1, 
        ZIndex = 2, 
        [v4.Event.Activated] = v20.onActivated, 
        BackgroundTransparency = 1, 
        ref = v12() and v23
    }, {
        UICorner = v4.createElement("UICorner", {
            CornerRadius = UDim.new(0, v20.cornerRadiusOffset)
        }), 
        Contents = v4.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1
        }, {
            UICorner = v4.createElement("UICorner", {
                CornerRadius = UDim.new(0, v20.cornerRadiusOffset)
            }), 
            Icon = v4.createElement(v9, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = v20.iconSize, 
                BackgroundTransparency = 1, 
                ImageTransparency = v20.iconTransparency, 
                BorderSizePixel = 0, 
                Image = l_Images_0[v27]
            }, {
                ShimmerGradient = v12() and v4.createElement("UIGradient", {
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.new(v14, v14, v14)), 
                        ColorSequenceKeypoint.new(0.5, Color3.new(0.8, 0.8, 0.8)), 
                        ColorSequenceKeypoint.new(1, Color3.new(v14, v14, v14))
                    }), 
                    Enabled = v20.voiceState == "Connecting", 
                    Rotation = -45, 
                    Offset = v15
                })
            })
        })
    });
end;