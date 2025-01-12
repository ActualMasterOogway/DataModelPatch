local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local v1 = require(l_Parent_0.ExpChatShared).Logger:new("ExpChat/" .. script.Name);
local l_HttpService_0 = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local v4 = require(l_Parent_0.UIBlox);
local l_withSelectionCursorProvider_0 = v4.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v4.App.SelectionImage.CursorKind;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("BubbleChat");
local v8 = require(l_script_FirstAncestor_0.Helpers.getVoiceIndicatorIcon);
local v9 = require(l_Parent_0.Roact);
local v10 = require(l_Parent_0.RoactRodux);
local v11 = v9.PureComponent:extend("VoiceIndicator");
v11.defaultProps = {};
v11.init = function(v12) --[[ Line: 45 ]] --[[ Name: init ]]
    -- upvalues: v9 (copy), l_HttpService_0 (copy), l_RunService_0 (copy), v8 (copy)
    local v13, v14 = v9.createBinding(0);
    v12.level = v13;
    v12.updateLevel = v14;
    v13, v14 = v9.createBinding(v12.props.voiceState);
    v12.voiceState = v13;
    v12.updateVoiceState = v14;
    v12.renderStepName = l_HttpService_0:GenerateGUID();
    l_RunService_0:BindToRenderStep(v12.renderStepName, 1, function() --[[ Line: 52 ]]
        -- upvalues: v12 (copy)
        v12.updateLevel(math.random());
    end);
    v12.levelIcon = v9.joinBindings({
        v12.voiceState, 
        v12.level
    }):map(function(v15) --[[ Line: 56 ]]
        -- upvalues: v8 (ref), v12 (copy)
        local v16 = v15[1];
        local v17 = v15[2];
        return v8(v12.props.getIcon, v16, v17, v12.props.iconStyle);
    end);
    v12.onClicked = function() --[[ Line: 63 ]]
        -- upvalues: v12 (copy)
        if v12.props.onClicked and v12.props.userId then
            v12.props.onClicked(v12.props.userId);
        end;
    end;
end;
v11.renderWithSelectionCursor = function(v18, v19) --[[ Line: 70 ]] --[[ Name: renderWithSelectionCursor ]]
    -- upvalues: v9 (copy), l_CursorKind_0 (copy)
    local v20 = true;
    if v18.props.voiceState ~= "Error" then
        v20 = v18.props.voiceState == "Hidden";
    end;
    if v18.props.hideOnError and (not v18.props.voiceState or v20) then
        return nil;
    else
        local v21 = v18.props.voiceState == "LOCAL_MUTED" and 0.5 or 0;
        if v18.props.iconTransparency then
            local l_v21_0 = v21;
            v21 = if type(v18.props.iconTransparency) ~= "number" then v18.props.iconTransparency:map(function(v23) --[[ Line: 81 ]]
                -- upvalues: l_v21_0 (copy)
                return 1 - (1 - v23) * (1 - l_v21_0);
            end) else 1 - (1 - v18.props.iconTransparency) * (1 - l_v21_0);
        end;
        return v9.createElement("ImageButton", {
            Size = v18.props.size or UDim2.fromOffset(28, 28), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Image = v18.levelIcon, 
            ImageTransparency = v21, 
            SelectionImageObject = v19(l_CursorKind_0.RoundedRectNoInset), 
            [v9.Event.Activated] = v18.onClicked
        });
    end;
end;
v11.render = function(v24) --[[ Line: 100 ]] --[[ Name: render ]]
    -- upvalues: l_withSelectionCursorProvider_0 (copy)
    return l_withSelectionCursorProvider_0(function(v25) --[[ Line: 101 ]]
        -- upvalues: v24 (copy)
        return v24:renderWithSelectionCursor(v25);
    end);
end;
v11.didUpdate = function(v26, v27, _) --[[ Line: 106 ]] --[[ Name: didUpdate ]]
    -- upvalues: v1 (copy)
    v1:trace("Voice state updated to {} for ...{}", v26.props.voiceState, (string.sub(tostring(v26.props.userId), -4)));
    if v27.voiceState ~= v26.props.voiceState then
        v26.updateVoiceState(v26.props.voiceState);
    end;
end;
v11.willUnmount = function(v29) --[[ Line: 118 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_RunService_0 (copy)
    pcall(function() --[[ Line: 119 ]]
        -- upvalues: l_RunService_0 (ref), v29 (copy)
        l_RunService_0:UnbindFromRenderStep(v29.renderStepName);
    end);
end;
return v10.connect(function(v30, v31) --[[ Line: 124 ]] --[[ Name: mapStateToProps ]]
    return {
        voiceState = v30.Voice.participants[v31.userId]
    };
end)(v11);