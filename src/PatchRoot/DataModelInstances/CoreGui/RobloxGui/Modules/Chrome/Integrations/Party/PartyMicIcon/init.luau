local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_HttpService_0 = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local v6 = require(l_CorePackages_0.Workspace.Packages.CrossExperienceVoice);
local v7 = require(l_CorePackages_0.Workspace.Packages.VoiceChat);
local l_useParticipant_0 = v6.Hooks.useParticipant;
local l_useIsVoiceConnected_0 = v6.Hooks.useIsVoiceConnected;
local l_useIsActiveParticipant_0 = v6.Hooks.useIsActiveParticipant;
local l_useIsParticipantMuted_0 = v6.Hooks.useIsParticipantMuted;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local v13 = game:DefineFastInt("PartyMicVoiceIndicatorFrameBuffer", 3);
local function v19(v14, v15, v16, v17, v18) --[[ Line: 24 ]] --[[ Name: getLoadingIndicatorIcon ]]
    -- upvalues: v7 (copy)
    if not v16 or not v14 or v15 then
        return v7.Utils.GetIcon("Muted", "MicLight");
    elseif v17 then
        return v7.Utils.GetIcon("Unmuted", "MicLight", v18);
    else
        return v7.Utils.GetIcon("Unmuted0", "MicLight");
    end;
end;
PartyMicIcon = function(v20) --[[ Line: 40 ]] --[[ Name: PartyMicIcon ]]
    -- upvalues: l_Players_0 (copy), l_useIsVoiceConnected_0 (copy), l_useParticipant_0 (copy), l_useIsActiveParticipant_0 (copy), v4 (copy), l_useIsParticipantMuted_0 (copy), l_HttpService_0 (copy), v13 (copy), l_RunService_0 (copy), v19 (copy), l_ImageSetLabel_0 (copy)
    local v21 = l_Players_0 and l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or -1;
    local v22 = l_useIsVoiceConnected_0();
    local v23 = l_useParticipant_0(v21);
    local v24 = l_useIsActiveParticipant_0(v21);
    local v25 = v4.useRef(v24);
    local v26 = l_useIsParticipantMuted_0(v21) == true;
    local v27 = v4.useRef(0);
    local v28, v29 = v4.useState(0);
    local v30 = v4.useMemo(function() --[[ Line: 49 ]]
        -- upvalues: l_HttpService_0 (ref)
        return l_HttpService_0:GenerateGUID();
    end, {});
    v4.useEffect(function() --[[ Line: 53 ]]
        -- upvalues: v23 (copy), v20 (copy)
        if v23 then
            v20.isLocalPlayerMutedSignal:fire(v23.isMuted);
        end;
    end, {
        v23
    });
    v4.useEffect(function() --[[ Line: 59 ]]
        -- upvalues: v20 (copy), v22 (copy)
        v20.isVoiceConnectedSignal:fire(v22);
    end, {
        v22
    });
    local v31 = v4.useCallback(function() --[[ Line: 63 ]]
        -- upvalues: v25 (copy), v27 (copy), v13 (ref), v29 (copy)
        if v25.current then
            if v27.current > v13 then
                v29(math.random());
                v27.current = 0;
                return;
            else
                v27.current = v27.current + 1;
            end;
        end;
    end, {});
    v4.useEffect(function() --[[ Line: 74 ]]
        -- upvalues: v25 (copy), v24 (copy)
        v25.current = v24;
    end, {
        v24
    });
    v4.useEffect(function() --[[ Line: 78 ]]
        -- upvalues: l_RunService_0 (ref), v30 (copy), v31 (copy)
        l_RunService_0:BindToRenderStep(v30, 1, v31);
        return function() --[[ Line: 81 ]]
            -- upvalues: l_RunService_0 (ref), v30 (ref)
            l_RunService_0:UnbindFromRenderStep(v30);
        end;
    end, {});
    local v32 = v4.useMemo(function() --[[ Line: 86 ]]
        -- upvalues: v19 (ref), v23 (copy), v26 (copy), v22 (copy), v24 (copy), v28 (copy)
        return v19(v23, v26, v22, v24, v28);
    end, {
        v23, 
        v26, 
        v22, 
        v24, 
        v28
    });
    return v4.createElement("Frame", {
        Size = UDim2.new(0, 36, 0, 36), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1
    }, {
        UICorner = v4.createElement("UICorner", {
            CornerRadius = UDim.new(1, 0)
        }), 
        Icon = v4.createElement(l_ImageSetLabel_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.fromOffset(36, 36), 
            BackgroundTransparency = 1, 
            Image = v32
        }, {
            v4.createElement("UICorner", {
                Name = "Corner", 
                CornerRadius = UDim.new(1, 0)
            })
        })
    });
end;
return PartyMicIcon;