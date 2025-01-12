local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local v1 = require(l_script_FirstAncestor_0.GlobalFlags);
local l_Flags_0 = l_script_FirstAncestor_0.Flags;
local v3 = require(l_Flags_0.getEnableChatInputBarConfigurationStyleCustomizations);
local v4 = require(l_Flags_0.getFFlagReplicateUIPaddingChildProperties);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v6 = require(l_Parent_0.Roact);
local v7 = require(l_Parent_0.Otter);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local v9 = require(l_script_FirstAncestor_0.Config);
local l_Helpers_0 = l_script_FirstAncestor_0.BubbleChat.Helpers;
local v11 = require(l_Helpers_0.getSpringFromSettings);
local v12 = require(l_Helpers_0.getAbsolutePaddingbyDimension);
local v13 = require(l_script_FirstAncestor_0.ClientSettings.ClientSettingsUtility);
local v14 = v6.Component:extend("ChatBubbleDistant");
v14.defaultProps = {
    width = 32, 
    height = 16
};
local function v20(v15) --[[ Line: 27 ]] --[[ Name: getFullHeight ]]
    -- upvalues: v4 (copy), v12 (copy)
    local l_height_0 = v15.height;
    if v15.renderInsert then
        l_height_0 = math.max(l_height_0, v15.insertSize.Y);
    end;
    if v4() and v15.chatSettings.UIPadding then
        local l_UIPadding_0 = v15.chatSettings.UIPadding;
        local v18 = v12(l_UIPadding_0.PaddingTop, l_height_0);
        local v19 = v12(l_UIPadding_0.PaddingBottom, l_height_0);
        if v15.renderInsert then
            l_height_0 = math.max(l_height_0, v15.insertSize.Y);
        end;
        return l_height_0 + (v18 + v19);
    else
        if v15.renderInsert then
            l_height_0 = math.max(l_height_0, v15.insertSize.Y);
        end;
        return l_height_0 + v15.chatSettings.Padding * 2;
    end;
end;
v14.init = function(v21) --[[ Line: 55 ]] --[[ Name: init ]]
    -- upvalues: v6 (copy), v7 (copy), v20 (copy), v3 (copy)
    v21.state = {};
    local v22, v23 = v6.createBinding(0);
    v21.width = v22;
    v21.updateWidth = v23;
    v21.widthMotor = v7.createSingleMotor(0);
    v21.widthMotor:onStep(function(v24) --[[ Line: 60 ]]
        -- upvalues: v21 (copy)
        v21.updateWidth((math.round(v24)));
    end);
    v22, v23 = v6.createBinding((v20(v21.props)));
    v21.height = v22;
    v21.updateHeight = v23;
    v21.frameSize = v6.joinBindings({
        v21.width, 
        v21.height
    }):map(function(v25) --[[ Line: 66 ]]
        return UDim2.fromOffset(v25[1], v25[2]);
    end);
    v22, v23 = v6.createBinding(1);
    v21.transparency = v22;
    v21.updateTransparency = v23;
    v21.transparencyMotor = v7.createSingleMotor(1);
    v21.transparencyMotor:onStep(v21.updateTransparency);
    if v3() then
        v22, v23 = v6.createBinding(1);
        v21.backgroundTransparency = v22;
        v21.updateBackgroundTransparency = v23;
        v21.backgroundTransparencyMotor = v7.createSingleMotor(1);
        v21.backgroundTransparencyMotor:onStep(v21.updateBackgroundTransparency);
    end;
    if v21.props.fadingOut then
        v21:fadeOut();
    end;
end;
v14.getDerivedStateFromProps = function(v26, v27) --[[ Line: 87 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v4 (copy), v12 (copy), v20 (copy)
    local v28 = nil;
    if v4() and v26.chatSettings.UIPadding then
        v28 = v26.width;
        if v26.renderInsert then
            v28 = v28 + v26.insertSize.X;
        end;
        local l_UIPadding_1 = v26.chatSettings.UIPadding;
        v28 = v28 + (v12(l_UIPadding_1.PaddingLeft, v28) + v12(l_UIPadding_1.PaddingRight, v28));
    else
        v28 = if v26.renderInsert then v26.width + v26.insertSize.X + v26.chatSettings.Padding * 2 else v26.width + v26.chatSettings.Padding * 2;
    end;
    local v30 = v20(v26);
    if v28 ~= v27.fullWidth or v30 ~= v27.fullHeight then
        return {
            fullWidth = v28, 
            fullHeight = v30
        };
    else
        return nil;
    end;
end;
v14.render = function(v31) --[[ Line: 120 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v9 (copy), v6 (copy), v3 (copy), l_Dictionary_0 (copy), v4 (copy)
    local l_chatSettings_0 = v31.props.chatSettings;
    local v33 = nil;
    local v34 = nil;
    local v35 = nil;
    local v36 = nil;
    if v31.props.isTextChatServiceOn then
        v33 = l_chatSettings_0.ImageLabel;
        v34 = l_chatSettings_0.UIGradient;
        v35 = l_chatSettings_0.UICorner;
        v36 = l_chatSettings_0.UIPadding;
    elseif v1.ConsolidateBubbleChat then
        v33 = l_chatSettings_0.BackgroundImage;
        v34 = l_chatSettings_0.BackgroundGradient;
        if l_chatSettings_0.CornerEnabled then
            v35 = {
                CornerRadius = l_chatSettings_0.CornerRadius
            };
        elseif l_chatSettings_0.CornerEnabled == false then
            v35 = {
                CornerRadius = UDim.new(0, 0)
            };
        end;
        v36 = l_chatSettings_0.Padding and {
            PaddingTop = UDim.new(0, l_chatSettings_0.Padding), 
            PaddingRight = UDim.new(0, l_chatSettings_0.Padding), 
            PaddingBottom = UDim.new(0, l_chatSettings_0.Padding), 
            PaddingLeft = UDim.new(0, l_chatSettings_0.Padding)
        } or nil;
    end;
    local l_CornerRadius_0 = v9.DefaultBubbleChatChildrenCustomizationProperties.UICorner.CornerRadius;
    local l_UIPadding_2 = v9.DefaultBubbleChatChildrenCustomizationProperties.UIPadding;
    local v39 = v31.props.renderInsert and v31.props.insertSize.X or 0;
    local v40 = v31.props.chatSettings.TailVisible and v31.props.showCaret;
    local l_createElement_0 = v6.createElement;
    local v42 = "Frame";
    local v43 = {
        AnchorPoint = Vector2.new(0.5, 1), 
        Size = UDim2.fromOffset(v31.state.fullWidth, v31.state.fullHeight), 
        Position = UDim2.new(0.5, 0, 1, -8), 
        Transparency = 1
    };
    local v44 = {
        Scale = v6.createElement("UIScale", {
            Scale = 0.75
        })
    };
    local l_TailVisible_0 = v31.props.chatSettings.TailVisible;
    if l_TailVisible_0 then
        l_TailVisible_0 = v40;
        if l_TailVisible_0 then
            l_TailVisible_0 = v6.createElement;
            local v46 = "ImageLabel";
            local v47 = {
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(0.5, 0, 1, -1), 
                Size = UDim2.fromOffset(12, 8), 
                Image = "rbxasset://textures/ui/InGameChat/Caret.png", 
                ImageColor3 = l_chatSettings_0.BackgroundColor3, 
                ImageTransparency = v3() and v31.backgroundTransparency or v31.transparency
            };
            local v48 = {};
            local v49 = false;
            if v34 ~= nil then
                v49 = v6.createElement("UIGradient", v34);
            end;
            v48.Gradient = v49;
            l_TailVisible_0 = l_TailVisible_0(v46, v47, v48);
        end;
    end;
    v44.Carat = l_TailVisible_0;
    l_TailVisible_0 = v6.createElement;
    local v50 = "ImageLabel";
    local v51 = l_Dictionary_0.join(v33, {
        Size = v31.frameSize, 
        BackgroundColor3 = l_chatSettings_0.BackgroundColor3, 
        BackgroundTransparency = v33 and v33.Image ~= "" and 1 or v31.backgroundTransparency or v31.transparency, 
        BorderSizePixel = 0, 
        AnchorPoint = Vector2.new(0.5, 0), 
        Position = UDim2.new(0.5, 0, 0, 0), 
        ClipsDescendants = true, 
        ImageTransparency = v31.backgroundTransparency or v31.transparency, 
        Image = v33 and v33.Image or ""
    });
    local v52 = {
        UICorner = v35 and v6.createElement("UICorner", {
            CornerRadius = v35.CornerRadius
        }) or v6.createElement("UICorner", {
            CornerRadius = l_CornerRadius_0
        }), 
        Contents = v6.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1
        }, {
            Padding = v36 and v6.createElement("UIPadding", v36) or v6.createElement("UIPadding", l_UIPadding_2), 
            UIListLayout = v6.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Insert = v31.props.renderInsert and v31.props.renderInsert(), 
            Ellipsis = v6.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Text = "\226\128\166", 
                TextColor3 = l_chatSettings_0.TextColor3, 
                TextTransparency = v31.transparency, 
                Font = Enum.Font.BuilderSansExtraBold, 
                TextScaled = not v4() or false, 
                TextSize = if v4() then l_chatSettings_0.TextSize else nil, 
                Size = UDim2.new(1, -v39, 1, 0), 
                LayoutOrder = 2
            })
        })
    };
    local v53 = false;
    if v34 ~= nil then
        v53 = v6.createElement("UIGradient", v34);
    end;
    v52.Gradient = v53;
    v44.RoundedFrame = l_TailVisible_0(v50, v51, v52);
    return l_createElement_0(v42, v43, v44);
end;
v14.fadeIn = function(v54) --[[ Line: 240 ]] --[[ Name: fadeIn ]]
    -- upvalues: v11 (copy), v3 (copy), v13 (copy)
    local v55 = v11(v54.props.chatSettings, "transparency");
    v54.transparencyMotor:setGoal(v55(v54.props.chatSettings.Transparency));
    if v3() then
        local v56 = v13.getBackgroundTransparency(v54.props.chatSettings, v54.props.clientSettings);
        v54.backgroundTransparencyMotor:setGoal(v55(v56));
    end;
    local v57 = v11(v54.props.chatSettings, "size");
    v54.widthMotor:setGoal(v57(v54.state.fullWidth));
end;
v14.fadeOut = function(v58) --[[ Line: 255 ]] --[[ Name: fadeOut ]]
    -- upvalues: v11 (copy), v3 (copy)
    v58.transparencyMotor:onComplete(function() --[[ Line: 256 ]]
        -- upvalues: v58 (copy)
        if v58.props.onFadeOut then
            v58.props.onFadeOut();
        end;
    end);
    local v59 = v11(v58.props.chatSettings, "transparency");
    v58.transparencyMotor:setGoal(v59(1));
    if v3() then
        v58.backgroundTransparencyMotor:setGoal(v59(1));
    end;
end;
v14.didUpdate = function(v60, v61, v62) --[[ Line: 269 ]] --[[ Name: didUpdate ]]
    -- upvalues: v11 (copy)
    if v61.fadingOut ~= v60.props.fadingOut then
        if v60.props.fadingOut then
            v60:fadeOut();
            return;
        else
            v60:fadeIn();
            return;
        end;
    else
        if v60.state.fullHeight ~= v62.fullHeight then
            v60.updateHeight(v60.state.fullHeight);
        end;
        if v60.state.fullWidth ~= v62.fullWidth then
            local v63 = v11(v60.props.chatSettings, "size");
            v60.widthMotor:setGoal(v63(v60.state.fullWidth));
        end;
        return;
    end;
end;
v14.didMount = function(v64) --[[ Line: 287 ]] --[[ Name: didMount ]]
    -- upvalues: v11 (copy), v3 (copy), v13 (copy)
    if not v64.props.fadingOut then
        local v65 = v11(v64.props.chatSettings, "size");
        local v66 = v11(v64.props.chatSettings, "transparency");
        v64.transparencyMotor:setGoal(v66(v64.props.chatSettings.Transparency));
        if v3() then
            local v67 = v13.getBackgroundTransparency(v64.props.chatSettings, v64.props.clientSettings);
            v64.backgroundTransparencyMotor:setGoal(v66(v67));
        end;
        v64.widthMotor:setGoal(v65(v64.state.fullWidth));
    end;
end;
v14.willUnmount = function(v68) --[[ Line: 303 ]] --[[ Name: willUnmount ]]
    -- upvalues: v3 (copy)
    v68.transparencyMotor:destroy();
    if v3() then
        v68.backgroundTransparencyMotor:destroy();
    end;
    v68.widthMotor:destroy();
end;
return v14;