local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_TweenService_0 = game:GetService("TweenService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v6 = require(l_CorePackages_0.Packages.Roact);
local v7 = require(l_CorePackages_0.Packages.React);
local v8 = require(l_CorePackages_0.Packages.ReactIs);
local v9 = require(l_CorePackages_0.Packages.UIBlox);
local l_useSelectionCursor_0 = v9.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = v9.App.SelectionImage.CursorKind;
local v12 = require(l_RobloxGui_0.Modules.VoiceChat.Hooks.useVoiceState);
local v13 = require(l_RobloxGui_0.Modules.InGameChat.BubbleChat.Constants);
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
if require(l_RobloxGui_0.Modules.Flags.GetFFlagRemoveInGameChatBubbleChatReferences)() then
    v13 = require(l_RobloxGui_0.Modules.VoiceChat.Constants);
end;
local v15 = UDim2.fromOffset(28, 28);
local function _(v16) --[[ Line: 36 ]] --[[ Name: useJoinBinding ]]
    -- upvalues: v7 (copy), v6 (copy)
    return v7.useMemo(function() --[[ Line: 37 ]]
        -- upvalues: v6 (ref), v16 (copy)
        return v6.joinBindings(v16);
    end, {});
end;
local function _(v18, v19) --[[ Line: 42 ]] --[[ Name: mapLevelToIcon ]]
    -- upvalues: v13 (ref), l_default_0 (copy)
    return function(v20) --[[ Line: 44 ]]
        -- upvalues: v13 (ref), l_default_0 (ref), v18 (copy), v19 (copy)
        local v21 = v20[1];
        local v22 = v20[2];
        if v21 == v13.VOICE_STATE.MUTED or v21 == v13.VOICE_STATE.LOCAL_MUTED then
            return l_default_0:GetIcon("Muted", v18);
        elseif v21 == v13.VOICE_STATE.CONNECTING then
            if v19 and v18 == "MicLight" then
                return l_default_0:GetIcon("Connecting", "MicDark");
            else
                return l_default_0:GetIcon("Connecting", v18);
            end;
        elseif v21 == v13.VOICE_STATE.INACTIVE then
            return l_default_0:GetIcon("Unmuted0", v18);
        elseif v21 == v13.VOICE_STATE.TALKING then
            local v23 = 20 * math.floor(0.5 + 5 * v22);
            return l_default_0:GetIcon("Unmuted" .. tostring(v23), v18);
        else
            return l_default_0:GetIcon("Error", v18);
        end;
    end;
end;
local v25 = {
    [v13.VOICE_STATE.ERROR] = true, 
    [v13.VOICE_STATE.HIDDEN] = true
};
local function v26() --[[ Line: 71 ]] --[[ Name: GenerateGUID ]]
    -- upvalues: l_HttpService_0 (copy)
    return l_HttpService_0:GenerateGUID();
end;
local function v30(v27) --[[ Line: 87 ]] --[[ Name: createTweenShimmeringEffect ]]
    -- upvalues: l_TweenService_0 (copy)
    local v28 = TweenInfo.new(1, Enum.EasingStyle.Circular, Enum.EasingDirection.Out, -1);
    local v29 = {
        Offset = Vector2.new(1, 0)
    };
    return (l_TweenService_0:Create(v27:getValue(), v28, v29));
end;
return function(v31) --[[ Line: 95 ]] --[[ Name: VoiceIndicator ]]
    -- upvalues: v12 (copy), v7 (copy), v6 (copy), v26 (copy), v13 (ref), v30 (copy), l_RunService_0 (copy), v25 (copy), v8 (copy), l_default_0 (copy), v15 (copy), l_useSelectionCursor_0 (copy), l_CursorKind_0 (copy)
    local v32 = v12(v31.userId, v31.disable or false);
    local v33, v34 = v7.useBinding(0);
    local v35 = v31.selectable == nil or v31.selectable;
    local v36, v37 = v7.useBinding(v32);
    local v38 = {
        v36, 
        v33
    };
    local l_v38_0 = v38 --[[ copy: 8 -> 16 ]];
    local v40 = v7.useMemo(function() --[[ Line: 37 ]]
        -- upvalues: v6 (ref), l_v38_0 (copy)
        return v6.joinBindings(l_v38_0);
    end, {});
    v38 = v7.useRef(v26()).current or "";
    v37(v32);
    local v41 = v32 == v13.VOICE_STATE.TALKING;
    local v42 = v32 == v13.VOICE_STATE.CONNECTING;
    local v43 = v31.showConnectingShimmer == true;
    local v44 = v7.useRef(nil);
    v7.useEffect(function() --[[ Line: 109 ]]
        -- upvalues: v43 (copy), v42 (copy), v44 (copy), v30 (ref)
        if v43 and v42 and v44.current then
            local v45 = v30(v44);
            v45:Play();
            return function() --[[ Line: 114 ]]
                -- upvalues: v45 (copy)
                v45:Cancel();
            end;
        else
            return function() --[[ Line: 118 ]]

            end;
        end;
    end, {
        v42, 
        v43
    });
    v7.useEffect(function() --[[ Line: 121 ]]
        -- upvalues: v41 (copy), l_RunService_0 (ref), v38 (copy), v34 (copy)
        if v41 then
            l_RunService_0:BindToRenderStep(v38, 1, function() --[[ Line: 123 ]]
                -- upvalues: v34 (ref)
                v34(math.random());
            end);
        end;
        return function() --[[ Line: 127 ]]
            -- upvalues: v41 (ref), l_RunService_0 (ref), v38 (ref)
            if v41 then
                l_RunService_0:UnbindFromRenderStep(v38);
            end;
        end;
    end, {
        v41
    });
    local v46 = not (v31.hideOnError and (not v32 or v25[v32]));
    local v47 = v32 == v13.VOICE_STATE.LOCAL_MUTED and 0.5 or 0;
    if v31.iconTransparency then
        local l_v47_0 = v47;
        local l_l_v47_0_0 = l_v47_0 --[[ copy: 15 -> 17 ]];
        v47 = if v8.isBinding(v31.iconTransparency) then v31.iconTransparency:map(function(v50) --[[ Line: 140 ]]
            -- upvalues: l_l_v47_0_0 (copy)
            return 1 - (1 - v50) * (1 - l_l_v47_0_0);
        end) else 1 - (1 - v31.iconTransparency) * (1 - l_v47_0);
    end;
    local v58 = v7.useMemo(function() --[[ Line: 148 ]]
        -- upvalues: v40 (copy), v31 (copy), v43 (copy), v13 (ref), l_default_0 (ref)
        local l_v40_0 = v40;
        local l_iconStyle_0 = v31.iconStyle;
        local l_v43_0 = v43;
        return l_v40_0:map(function(v54) --[[ Line: 44 ]]
            -- upvalues: v13 (ref), l_default_0 (ref), l_iconStyle_0 (copy), l_v43_0 (copy)
            local v55 = v54[1];
            local v56 = v54[2];
            if v55 == v13.VOICE_STATE.MUTED or v55 == v13.VOICE_STATE.LOCAL_MUTED then
                return l_default_0:GetIcon("Muted", l_iconStyle_0);
            elseif v55 == v13.VOICE_STATE.CONNECTING then
                if l_v43_0 and l_iconStyle_0 == "MicLight" then
                    return l_default_0:GetIcon("Connecting", "MicDark");
                else
                    return l_default_0:GetIcon("Connecting", l_iconStyle_0);
                end;
            elseif v55 == v13.VOICE_STATE.INACTIVE then
                return l_default_0:GetIcon("Unmuted0", l_iconStyle_0);
            elseif v55 == v13.VOICE_STATE.TALKING then
                local v57 = 20 * math.floor(0.5 + 5 * v56);
                return l_default_0:GetIcon("Unmuted" .. tostring(v57), l_iconStyle_0);
            else
                return l_default_0:GetIcon("Error", l_iconStyle_0);
            end;
        end);
    end, {
        v31.iconStyle
    });
    return v6.createElement("ImageButton", {
        Size = v31.size or v15, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Image = v58, 
        ImageTransparency = v47, 
        Selectable = v35, 
        SelectionImageObject = l_useSelectionCursor_0(l_CursorKind_0.RoundedRectNoInset), 
        Visible = v46, 
        [v6.Event.Activated] = v31.onClicked
    }, {
        ShimmerGradient = if v43 then v6.createElement("UIGradient", {
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.new(0.6, 0.6, 0.6)), 
                ColorSequenceKeypoint.new(0.5, Color3.new(0.8, 0.8, 0.8)), 
                ColorSequenceKeypoint.new(1, Color3.new(0.6, 0.6, 0.6))
            }), 
            Enabled = v42, 
            Rotation = -45, 
            Offset = Vector2.new(-1, 0), 
            [v6.Ref] = v44
        }) else nil
    });
end;