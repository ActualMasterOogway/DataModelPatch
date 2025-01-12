local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_script_FirstAncestor_0.IXPServiceWrapper);
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.UIBlox);
local l_Images_0 = v6.App.ImageSet.Images;
local l_ImageSetLabel_0 = v6.Core.ImageSet.ImageSetLabel;
local v9 = 0.6;
local v10 = Vector2.new(-1, 0);
local v11 = game:DefineFastFlag("EnableDarkerShimmerTransparency", false);
local v12 = game:DefineFastInt("ExpChatMicActivityHeartbeatIncrement", 3);
if v11 then
    v9 = 0.4;
end;
local v13 = game:DefineFastFlag("EnableOptimizedExpChatMicUI2", false);
local v14 = game:DefineFastString("MicActivityFixIXPLayerValue", "MicActivityFixEnabled");
local v15 = require(l_script_FirstAncestor_0.Flags.GetFStringVoiceUIImprovementsIXPLayerName);
local v16 = require(l_script_FirstAncestor_0.Flags.GetFFlagExpChatEnableVoiceReverseNudge);
local l_Helpers_0 = l_script_FirstAncestor_0.BubbleChat.Helpers;
local v18 = require(l_Helpers_0.getVoiceIndicatorAssetName);
local v19 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableShimmeringIcon);
local function v23(v20) --[[ Line: 50 ]] --[[ Name: createTweenShimmeringEffect ]]
    -- upvalues: l_TweenService_0 (copy)
    local v21 = TweenInfo.new(1, Enum.EasingStyle.Circular, Enum.EasingDirection.Out, -1);
    local v22 = {
        Offset = Vector2.new(1, 0)
    };
    return (l_TweenService_0:Create(v20:getValue(), v21, v22));
end;
local function v38(v24) --[[ Line: 58 ]] --[[ Name: ControlBubble ]]
    -- upvalues: v5 (copy), v19 (copy), v13 (copy), v4 (copy), v15 (copy), v14 (copy), l_RunService_0 (copy), v12 (copy), v23 (copy), v10 (copy), v18 (copy), v16 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), v9 (ref)
    local v25, v26 = v5.useState(0);
    local v27, v28 = v5.useState(false);
    local v29 = v5.useRef(0);
    local v30 = v5.useRef(nil);
    local v31 = v5.useRef(nil);
    if v19() then
        v30 = v5.useRef(nil);
        v31 = v5.useRef(nil);
        v5.useEffect(function() --[[ Line: 68 ]]
            -- upvalues: v30 (ref), v31 (ref)
            if v30.current then
                local l_FirstChildWhichIsA_0 = v30.current:FindFirstChildWhichIsA("UIGradient", true);
                if l_FirstChildWhichIsA_0 then
                    v31.current = l_FirstChildWhichIsA_0;
                end;
            end;
        end, {
            v30
        });
    end;
    if v13 then
        v5.useEffect(function() --[[ Line: 79 ]]
            -- upvalues: v4 (ref), v15 (ref), v14 (ref), v28 (copy)
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 80 ]]
                -- upvalues: v4 (ref), v15 (ref)
                return v4:GetLayerData(v15());
            end);
            if l_status_0 and l_result_0 and l_result_0[v14] then
                v28(true);
            end;
        end, {});
    end;
    v5.useEffect(function() --[[ Line: 90 ]]
        -- upvalues: v13 (ref), v24 (copy), v4 (ref), v15 (ref), v27 (copy), l_RunService_0 (ref), v29 (copy), v12 (ref), v26 (copy), v19 (ref), v31 (ref), v23 (ref), v10 (ref)
        if v13 and v24.voiceState and v24.voiceState == "Talking" then
            v4:LogUserLayerExposure(v15());
        end;
        local v35 = nil;
        if v13 and v27 and v24.voiceState and v24.voiceState == "Talking" then
            v35 = l_RunService_0.PostSimulation:Connect(function() --[[ Line: 103 ]]
                -- upvalues: v29 (ref), v12 (ref), v26 (ref)
                v29.current = ((v29.current or 0) + 1) % v12;
                if v29.current == 0 then
                    v26(math.random());
                end;
            end);
            return function() --[[ Line: 112 ]]
                -- upvalues: v35 (ref)
                if v35 then
                    v35:Disconnect();
                    v35 = nil;
                end;
            end;
        elseif v24.voiceState and v24.voiceState == "Talking" and v24.renderStepName then
            l_RunService_0:BindToRenderStep(v24.renderStepName, 1, function() --[[ Line: 119 ]]
                -- upvalues: v26 (ref)
                v26(math.random());
            end);
            return function() --[[ Line: 123 ]]
                -- upvalues: l_RunService_0 (ref), v24 (ref)
                l_RunService_0:UnbindFromRenderStep(v24.renderStepName);
            end;
        elseif v19() and v24.voiceState and v24.voiceState == "Connecting" and v31 then
            local v36 = v23(v31);
            v36:Play();
            return function() --[[ Line: 135 ]]
                -- upvalues: v36 (copy), v31 (ref), v10 (ref)
                v36:Cancel();
                if v31 and v31.current then
                    v31.current.Offset = v10;
                end;
            end;
        else
            return function() --[[ Line: 144 ]]
                -- upvalues: v24 (ref), l_RunService_0 (ref), v13 (ref), v35 (ref)
                if v24.renderStepName then
                    l_RunService_0:UnbindFromRenderStep(v24.renderStepName);
                end;
                if v13 and v35 then
                    v35:Disconnect();
                    v35 = nil;
                end;
            end;
        end;
    end, {
        v24.voiceState, 
        v27
    });
    local v37 = v24.iconAssetName or v18(v24.voiceState, v25, v24.iconStyle, false);
    if v16() then
        v37 = v24.iconAssetName or v18(v24.voiceState, v25, v24.iconStyle, v24.isUserToxic);
    end;
    return v5.createElement("ImageButton", {
        AnchorPoint = Vector2.new(0.5, 1), 
        Size = v24.controlBubbleSize, 
        LayoutOrder = v24.LayoutOrder, 
        BorderSizePixel = 0, 
        Transparency = 1, 
        ZIndex = 2, 
        [v5.Event.Activated] = v24.onActivated, 
        BackgroundTransparency = 1, 
        ref = if v19() then v30 else nil
    }, {
        UICorner = v5.createElement("UICorner", {
            CornerRadius = UDim.new(0, v24.cornerRadiusOffset)
        }), 
        Contents = v5.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1
        }, {
            UICorner = v5.createElement("UICorner", {
                CornerRadius = UDim.new(0, v24.cornerRadiusOffset)
            }), 
            Icon = v5.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = v24.iconSize, 
                BackgroundTransparency = 1, 
                ImageTransparency = v24.iconTransparency, 
                BorderSizePixel = 0, 
                Image = l_Images_0[v37]
            }, {
                ShimmerGradient = v19() and v5.createElement("UIGradient", {
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.new(v9, v9, v9)), 
                        ColorSequenceKeypoint.new(0.5, Color3.new(0.8, 0.8, 0.8)), 
                        ColorSequenceKeypoint.new(1, Color3.new(v9, v9, v9))
                    }), 
                    Enabled = v24.voiceState == "Connecting", 
                    Rotation = -45, 
                    Offset = v10
                })
            })
        })
    });
end;
if v13 then
    return v5.memo(v38);
else
    return v38;
end;