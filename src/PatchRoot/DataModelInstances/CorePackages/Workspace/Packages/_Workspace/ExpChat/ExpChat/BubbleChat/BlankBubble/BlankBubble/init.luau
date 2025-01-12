local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local v3 = require(l_Parent_0.Roact);
local v4 = require(l_Parent_0.Otter);
local l_Flags_0 = l_script_FirstAncestor_0.Flags;
local v6 = require(l_Flags_0.getEnableChatInputBarConfigurationStyleCustomizations);
local v7 = require(l_script_FirstAncestor_0.Config);
local l_script_FirstAncestor_1 = script:FindFirstAncestor("BubbleChat");
local v9 = require(l_script_FirstAncestor_1.Helpers.getSpringFromSettings);
local v10 = require(l_script_FirstAncestor_0.ClientSettings.ClientSettingsUtility);
local v11 = v3.PureComponent:extend("BlankBubble");
v11.init = function(v12, v13) --[[ Line: 27 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), v4 (copy), v6 (copy)
    v12.state = {};
    local v14, v15 = v3.createBinding(0);
    v12.width = v14;
    v12.updateWidth = v15;
    v12.widthMotor = v4.createSingleMotor(0);
    v12.widthMotor:onStep(function(v16) --[[ Line: 31 ]]
        -- upvalues: v12 (copy)
        v12.updateWidth((math.round(v16)));
    end);
    v12.frameSize = v12.width:map(function(v17) --[[ Line: 35 ]]
        -- upvalues: v12 (copy)
        if v12.props.insertSize then
            return UDim2.fromOffset(v17, v12.props.insertSize.Y + v12.props.chatSettings.Padding * 2);
        else
            return UDim2.fromOffset(v17, 0);
        end;
    end);
    v14, v15 = v3.createBinding(1);
    v12.transparency = v14;
    v12.updateTransparency = v15;
    v12.transparencyMotor = v4.createSingleMotor(1);
    v12.transparencyMotor:onStep(v12.updateTransparency);
    if v6() then
        v14, v15 = v3.createBinding(1);
        v12.backgroundTransparency = v14;
        v12.updateBackgroundTransparency = v15;
        v12.backgroundTransparencyMotor = v4.createSingleMotor(1);
        v12.backgroundTransparencyMotor:onStep(v12.updateBackgroundTransparency);
    end;
    if v13.fadingOut then
        v12:fadeOut();
    end;
end;
v11.getDerivedStateFromProps = function(v18, v19) --[[ Line: 60 ]] --[[ Name: getDerivedStateFromProps ]]
    local v20 = 0;
    if v18.insertSize then
        v20 = v18.insertSize.X + v18.chatSettings.Padding * 2;
    end;
    if v20 ~= v19.fullWidth then
        return {
            fullWidth = v20
        };
    else
        return nil;
    end;
end;
v11.render = function(v21) --[[ Line: 75 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy), v3 (copy), v6 (copy), l_Dictionary_0 (copy)
    local l_chatSettings_0 = v21.props.chatSettings;
    local l_ImageLabel_0 = l_chatSettings_0.ImageLabel;
    local l_UIGradient_0 = l_chatSettings_0.UIGradient;
    local l_UICorner_0 = l_chatSettings_0.UICorner;
    local l_CornerRadius_0 = v7.DefaultBubbleChatChildrenCustomizationProperties.UICorner.CornerRadius;
    local v27 = 0;
    if v21.props.insertSize then
        v27 = v21.props.insertSize.Y + v21.props.chatSettings.Padding * 2;
    end;
    local l_createElement_0 = v3.createElement;
    local v29 = "Frame";
    local v30 = {
        AnchorPoint = Vector2.new(0.5, 1), 
        Size = UDim2.fromOffset(v21.state.fullWidth, v27), 
        Position = UDim2.new(0.5, 0, 1, -8), 
        Transparency = 1
    };
    local v31 = {
        Scale = v3.createElement("UIScale", {
            Scale = v21.props.isDistant and 0.75 or 1
        })
    };
    local l_TailVisible_0 = v21.props.chatSettings.TailVisible;
    if l_TailVisible_0 then
        l_TailVisible_0 = v3.createElement;
        local v33 = "ImageLabel";
        local v34 = {
            AnchorPoint = Vector2.new(0.5, 0), 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0.5, 0, 1, -1), 
            Size = UDim2.fromOffset(12, 8), 
            Image = "rbxasset://textures/ui/InGameChat/Caret.png", 
            ImageColor3 = l_chatSettings_0.BackgroundColor3, 
            ImageTransparency = v6() and v21.backgroundTransparency or v21.transparency
        };
        local v35 = {};
        local v36 = false;
        if l_UIGradient_0 ~= nil then
            v36 = v3.createElement("UIGradient", l_UIGradient_0);
        end;
        v35.Gradient = v36;
        l_TailVisible_0 = l_TailVisible_0(v33, v34, v35);
    end;
    v31.Caret = l_TailVisible_0;
    l_TailVisible_0 = v3.createElement;
    local v37 = "ImageLabel";
    local v38 = l_Dictionary_0.join(l_ImageLabel_0, {
        Size = v21.frameSize, 
        BackgroundColor3 = l_chatSettings_0.BackgroundColor3, 
        BackgroundTransparency = l_ImageLabel_0 and l_ImageLabel_0.Image ~= "" and 1 or v21.backgroundTransparency or v21.transparency, 
        BorderSizePixel = 0, 
        AnchorPoint = Vector2.new(0.5, 0), 
        Position = UDim2.new(0.5, 0, 0, 0), 
        ClipsDescendants = true, 
        ImageTransparency = v21.backgroundTransparency or v21.transparency, 
        Image = l_ImageLabel_0 and l_ImageLabel_0.Image or ""
    });
    local v39 = {
        UICorner = l_UICorner_0 and v3.createElement("UICorner", {
            CornerRadius = l_UICorner_0.CornerRadius
        }) or v3.createElement("UICorner", {
            CornerRadius = l_CornerRadius_0
        }), 
        Contents = v3.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1
        }, {
            Padding = v3.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v21.props.chatSettings.Padding), 
                PaddingRight = UDim.new(0, v21.props.chatSettings.Padding), 
                PaddingBottom = UDim.new(0, v21.props.chatSettings.Padding), 
                PaddingLeft = UDim.new(0, v21.props.chatSettings.Padding)
            }), 
            Insert = v21.props.renderInsert and v21.props.renderInsert()
        })
    };
    local v40 = false;
    if l_UIGradient_0 ~= nil then
        v40 = v3.createElement("UIGradient", l_UIGradient_0);
    end;
    v39.Gradient = v40;
    v31.RoundedFrame = l_TailVisible_0(v37, v38, v39);
    return l_createElement_0(v29, v30, v31);
end;
v11.fadeIn = function(v41) --[[ Line: 150 ]] --[[ Name: fadeIn ]]
    -- upvalues: v9 (copy), v6 (copy), v10 (copy)
    local v42 = v9(v41.props.chatSettings, "transparency");
    v41.transparencyMotor:setGoal(v42(v41.props.chatSettings.Transparency));
    if v6() then
        local v43 = v10.getBackgroundTransparency(v41.props.chatSettings, v41.props.clientSettings);
        v41.backgroundTransparencyMotor:setGoal(v42(v43));
    end;
    local v44 = v9(v41.props.chatSettings, "size");
    v41.widthMotor:setGoal(v44(v41.state.fullWidth));
end;
v11.fadeOut = function(v45) --[[ Line: 165 ]] --[[ Name: fadeOut ]]
    -- upvalues: v9 (copy), v6 (copy)
    v45.transparencyMotor:onComplete(function() --[[ Line: 166 ]]
        -- upvalues: v45 (copy)
        if v45.props.onFadeOut then
            v45.props.onFadeOut();
        end;
    end);
    local v46 = v9(v45.props.chatSettings, "transparency");
    v45.transparencyMotor:setGoal(v46(1));
    if v6() then
        v45.backgroundTransparencyMotor:setGoal(v46(1));
    end;
end;
v11.didUpdate = function(v47, v48, v49) --[[ Line: 179 ]] --[[ Name: didUpdate ]]
    -- upvalues: v9 (copy)
    if v48.fadingOut ~= v47.props.fadingOut then
        if v47.props.fadingOut then
            v47:fadeOut();
        else
            v47:fadeIn();
        end;
    end;
    if v47.state.fullWidth ~= v49.fullWidth then
        local v50 = v9(v47.props.chatSettings, "size");
        v47.widthMotor:setGoal(v50(v47.state.fullWidth));
    end;
end;
v11.didMount = function(v51) --[[ Line: 193 ]] --[[ Name: didMount ]]
    -- upvalues: v9 (copy), v6 (copy), v10 (copy)
    if not v51.props.fadingOut then
        local v52 = v9(v51.props.chatSettings, "size");
        local v53 = v9(v51.props.chatSettings, "transparency");
        v51.transparencyMotor:setGoal(v53(v51.props.chatSettings.Transparency));
        if v6() then
            local v54 = v10.getBackgroundTransparency(v51.props.chatSettings, v51.props.clientSettings);
            v51.backgroundTransparencyMotor:setGoal(v53(v54));
        end;
        v51.widthMotor:setGoal(v52(v51.state.fullWidth));
    end;
end;
v11.willUnmount = function(v55) --[[ Line: 210 ]] --[[ Name: willUnmount ]]
    -- upvalues: v6 (copy)
    v55.transparencyMotor:destroy();
    if v6() then
        v55.backgroundTransparencyMotor:destroy();
    end;
    v55.widthMotor:destroy();
end;
return v11;