local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local l_withSelectionCursorProvider_0 = v4.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v4.App.SelectionImage.CursorKind;
local v7 = require(l_RobloxGui_0.Modules.InGameChat.BubbleChat.Logger)(script.Name);
local v8 = require(l_CorePackages_0.Packages.Roact);
local v9 = require(l_CorePackages_0.Packages.ReactIs);
local v10 = require(l_CorePackages_0.Packages.RoactRodux);
local v11 = require(l_CorePackages_0.Packages.t);
local v12 = require(l_RobloxGui_0.Modules.Flags.GetFFlagRemoveInGameChatBubbleChatReferences);
local v13 = require(l_RobloxGui_0.Modules.InGameChat.BubbleChat.Constants);
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
if v12() then
    v7 = require(l_RobloxGui_0.Modules.VoiceChat.Logger)(script.Name);
    v13 = require(l_RobloxGui_0.Modules.VoiceChat.Constants);
end;
local v15 = v8.PureComponent:extend("VoiceIndicator");
v15.validateProps = v11.strictInterface({
    onClicked = v11.optional(v11.callback), 
    userId = v11.string, 
    hideOnError = v11.optional(v11.boolean), 
    size = v11.optional(v11.UDim2), 
    iconStyle = v11.optional(v11.union(v11.literal("MicDark"), v11.literal("MicLight"), v11.literal("SpeakerDark"), v11.literal("SpeakerLight"))), 
    iconTransparency = v11.optional(v11.union(v11.number, v11.table)), 
    voiceState = v11.string
});
v15.defaultProps = {};
v15.getIcon = function(_, v17) --[[ Line: 55 ]] --[[ Name: getIcon ]]
    return "rbxasset://textures/ui/VoiceChat/" .. v17 .. ".png";
end;
v15.init = function(v18) --[[ Line: 59 ]] --[[ Name: init ]]
    -- upvalues: v8 (copy), l_HttpService_0 (copy), l_RunService_0 (copy), v13 (ref), l_default_0 (copy)
    local v19, v20 = v8.createBinding(0);
    v18.level = v19;
    v18.updateLevel = v20;
    v19, v20 = v8.createBinding(v18.props.voiceState);
    v18.voiceState = v19;
    v18.updateVoiceState = v20;
    v18.renderStepName = l_HttpService_0:GenerateGUID();
    l_RunService_0:BindToRenderStep(v18.renderStepName, 1, function() --[[ Line: 66 ]]
        -- upvalues: v18 (copy)
        v18.updateLevel(math.random());
    end);
    v18.levelIcon = v8.joinBindings({
        v18.voiceState, 
        v18.level
    }):map(function(v21) --[[ Line: 70 ]]
        -- upvalues: v13 (ref), l_default_0 (ref), v18 (copy)
        local v22 = v21[1];
        local v23 = v21[2];
        if v22 == v13.VOICE_STATE.MUTED or v22 == v13.VOICE_STATE.LOCAL_MUTED then
            return l_default_0:GetIcon("Muted", v18.props.iconStyle);
        elseif v22 == v13.VOICE_STATE.CONNECTING then
            return l_default_0:GetIcon("Connecting", v18.props.iconStyle);
        elseif v22 == v13.VOICE_STATE.INACTIVE then
            return l_default_0:GetIcon("Unmuted0", v18.props.iconStyle);
        elseif v22 == v13.VOICE_STATE.TALKING then
            local v24 = 20 * math.floor(0.5 + 5 * v23);
            return l_default_0:GetIcon("Unmuted" .. tostring(v24), v18.props.iconStyle);
        else
            return l_default_0:GetIcon("Error", v18.props.iconStyle);
        end;
    end);
end;
v15.renderWithSelectionCursor = function(v25, v26) --[[ Line: 90 ]] --[[ Name: renderWithSelectionCursor ]]
    -- upvalues: v13 (ref), v9 (copy), v8 (copy), l_CursorKind_0 (copy)
    local v27 = true;
    if v25.props.voiceState ~= v13.VOICE_STATE.ERROR then
        v27 = v25.props.voiceState == v13.VOICE_STATE.HIDDEN;
    end;
    if v25.props.hideOnError and (not v25.props.voiceState or v27) then
        return nil;
    else
        local v28 = v25.props.voiceState == v13.VOICE_STATE.LOCAL_MUTED and 0.5 or 0;
        if v25.props.iconTransparency then
            local l_v28_0 = v28;
            v28 = if v9.isBinding(v25.props.iconTransparency) then v25.props.iconTransparency:map(function(v30) --[[ Line: 102 ]]
                -- upvalues: l_v28_0 (copy)
                return 1 - (1 - v30) * (1 - l_v28_0);
            end) else 1 - (1 - v25.props.iconTransparency) * (1 - l_v28_0);
        end;
        return v8.createElement("ImageButton", {
            Size = v25.props.size or UDim2.fromOffset(28, 28), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Image = v25.levelIcon, 
            ImageTransparency = v28, 
            SelectionImageObject = v26(l_CursorKind_0.RoundedRectNoInset), 
            [v8.Event.Activated] = v25.props.onClicked
        });
    end;
end;
v15.render = function(v31) --[[ Line: 121 ]] --[[ Name: render ]]
    -- upvalues: l_withSelectionCursorProvider_0 (copy)
    return l_withSelectionCursorProvider_0(function(v32) --[[ Line: 122 ]]
        -- upvalues: v31 (copy)
        return v31:renderWithSelectionCursor(v32);
    end);
end;
v15.didUpdate = function(v33, v34, _) --[[ Line: 127 ]] --[[ Name: didUpdate ]]
    -- upvalues: v7 (ref)
    v7:trace("Voice state updated to {} for ...{}", v33.props.voiceState, (string.sub(tostring(v33.props.userId), -4)));
    if v34.voiceState ~= v33.props.voiceState then
        v33.updateVoiceState(v33.props.voiceState);
    end;
end;
v15.willUnmount = function(v36) --[[ Line: 134 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_RunService_0 (copy)
    pcall(function() --[[ Line: 135 ]]
        -- upvalues: l_RunService_0 (ref), v36 (copy)
        l_RunService_0:UnbindFromRenderStep(v36.renderStepName);
    end);
end;
return v10.connect(function(v37, v38) --[[ Line: 140 ]] --[[ Name: mapStateToProps ]]
    return {
        voiceState = v37.voiceState[v38.userId]
    };
end)(v15);