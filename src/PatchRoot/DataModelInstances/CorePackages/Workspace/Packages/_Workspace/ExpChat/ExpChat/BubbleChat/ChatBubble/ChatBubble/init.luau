local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Flags_0 = l_script_FirstAncestor_0.Flags;
local v2 = require(l_Flags_0.getEnableChatInputBarConfigurationStyleCustomizations);
local v3 = require(l_Flags_0.getEnablePerBubbleCustomization);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v5 = require(l_Parent_0.Roact);
local v6 = require(l_Parent_0.Otter);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local v8 = require(l_script_FirstAncestor_0.Config);
local v9 = require(l_script_FirstAncestor_0.memoize);
local l_Helpers_0 = l_script_FirstAncestor_0.BubbleChat.Helpers;
local v11 = require(l_Helpers_0.getSpringFromSettings);
local v12 = require(l_Helpers_0.getTextBounds);
local v13 = require(l_Helpers_0.getDictFromBubbleChatMessageProperties);
local v14 = require(l_script_FirstAncestor_0.GlobalFlags);
local v15 = require(l_script_FirstAncestor_0.ClientSettings.ClientSettingsUtility);
local v16 = v5.Component:extend("ChatBubble");
v16.defaultProps = {
    isMostRecent = true, 
    text = "", 
    timestamp = 0
};
local v19 = v9(function(v17, v18) --[[ Line: 32 ]]
    -- upvalues: l_Dictionary_0 (copy), v13 (copy)
    if v18 then
        return l_Dictionary_0.join(v17, v13(v18));
    else
        return v17;
    end;
end);
v16.init = function(v20) --[[ Line: 43 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), v6 (copy), v2 (copy)
    local v21, v22 = v5.createBinding(0);
    v20.width = v21;
    v20.updateWidth = v22;
    v20.widthMotor = v6.createSingleMotor(0);
    v20.widthMotor:onStep(function(v23) --[[ Line: 46 ]]
        -- upvalues: v20 (copy)
        v20.updateWidth((math.round(v23)));
    end);
    v21, v22 = v5.createBinding(0);
    v20.height = v21;
    v20.updateHeight = v22;
    v20.heightMotor = v6.createSingleMotor(0);
    v20.heightMotor:onStep(function(v24) --[[ Line: 52 ]]
        -- upvalues: v20 (copy)
        v20.updateHeight((math.round(v24)));
    end);
    v21, v22 = v5.createBinding(1);
    v20.transparency = v21;
    v20.updateTransparency = v22;
    v20.transparencyMotor = v6.createSingleMotor(1);
    v20.transparencyMotor:onStep(v20.updateTransparency);
    if v2() then
        v21, v22 = v5.createBinding(1);
        v20.backgroundTransparency = v21;
        v20.updateBackgroundTransparency = v22;
        v20.backgroundTransparencyMotor = v6.createSingleMotor(1);
        v20.backgroundTransparencyMotor:onStep(v20.updateBackgroundTransparency);
    end;
    v20.size = v5.joinBindings({
        v20.width, 
        v20.height
    }):map(function(v25) --[[ Line: 66 ]]
        return UDim2.fromOffset(v25[1], v25[2]);
    end);
end;
v16.render = function(v26) --[[ Line: 71 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v19 (copy), v14 (copy), v8 (copy), v5 (copy), l_Dictionary_0 (copy), v2 (copy)
    local l_chatSettings_0 = v26.props.chatSettings;
    if v3() then
        l_chatSettings_0 = v19(v26.props.chatSettings, v26.props.bubbleChatMessageProperties);
    end;
    local v28 = nil;
    local v29 = nil;
    local v30 = nil;
    local v31 = nil;
    local v32 = nil;
    if v26.props.isTextChatServiceOn then
        v28 = l_chatSettings_0.ImageLabel;
        v29 = l_chatSettings_0.UIGradient;
        v30 = l_chatSettings_0.UICorner;
        v31 = l_chatSettings_0.UIPadding;
        v32 = l_chatSettings_0.FontFace;
    elseif v14.ConsolidateBubbleChat then
        v28 = l_chatSettings_0.BackgroundImage;
        v29 = l_chatSettings_0.BackgroundGradient;
        if l_chatSettings_0.CornerEnabled then
            v30 = {
                CornerRadius = l_chatSettings_0.CornerRadius
            };
        elseif l_chatSettings_0.CornerEnabled == false then
            v30 = {
                CornerRadius = UDim.new(0, 0)
            };
        end;
        v31 = l_chatSettings_0.Padding and {
            PaddingTop = UDim.new(0, l_chatSettings_0.Padding), 
            PaddingRight = UDim.new(0, l_chatSettings_0.Padding), 
            PaddingBottom = UDim.new(0, l_chatSettings_0.Padding), 
            PaddingLeft = UDim.new(0, l_chatSettings_0.Padding)
        } or nil;
    end;
    local l_CornerRadius_0 = v8.DefaultBubbleChatChildrenCustomizationProperties.UICorner.CornerRadius;
    local l_UIPadding_0 = v8.DefaultBubbleChatChildrenCustomizationProperties.UIPadding;
    local v35 = v26.props.renderInsert and v26.props.insertSize.X + l_chatSettings_0.Padding or 0;
    local v36 = v26.props.isMostRecent and l_chatSettings_0.TailVisible and v26.props.showCaret;
    local l_createElement_0 = v5.createElement;
    local v38 = "Frame";
    local v39 = {
        LayoutOrder = v26.props.timestamp, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Size = v26.size, 
        Position = UDim2.fromScale(1, 0.5), 
        Transparency = 1
    };
    local v40 = {
        Layout = v5.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, -1)
        })
    };
    local l_createElement_1 = v5.createElement;
    local v42 = "ImageLabel";
    local v43 = l_Dictionary_0.join(v28, {
        LayoutOrder = 1, 
        BackgroundColor3 = l_chatSettings_0.BackgroundColor3, 
        AnchorPoint = Vector2.new(0.5, 0), 
        Size = UDim2.fromScale(1, 1), 
        BorderSizePixel = 0, 
        Position = UDim2.new(0.5, 0, 0, 0), 
        BackgroundTransparency = v28 and v28.Image ~= "" and 1 or v26.backgroundTransparency or v26.transparency, 
        ClipsDescendants = true, 
        ImageTransparency = v26.backgroundTransparency or v26.transparency
    });
    local v44 = {
        UICorner = v30 and v5.createElement("UICorner", {
            CornerRadius = v30.CornerRadius
        }) or v5.createElement("UICorner", {
            CornerRadius = l_CornerRadius_0
        }), 
        UIListLayout = v5.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Bottom, 
            Padding = UDim.new(0, l_chatSettings_0.Padding)
        }), 
        Padding = v31 and v5.createElement("UIPadding", v31) or v5.createElement("UIPadding", l_UIPadding_0), 
        Insert = v26.props.renderInsert and v26.props.renderInsert(), 
        Text = v5.createElement("TextLabel", {
            Text = if v26.props.useTranslation and v26.props.translation and v26.props.translation ~= "" then v26.props.translation else v26.props.text, 
            Size = UDim2.new(1, -v35, 1, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            BackgroundTransparency = 1, 
            FontFace = v32 or nil, 
            Font = if not v32 then l_chatSettings_0.Font else nil, 
            TextColor3 = l_chatSettings_0.TextColor3, 
            TextSize = l_chatSettings_0.TextSize, 
            TextTransparency = v26.transparency, 
            TextWrapped = true, 
            AutoLocalize = false, 
            LayoutOrder = 2, 
            RichText = not v14.ConsolidateBubbleChat or v26.props.isTextChatServiceOn
        })
    };
    local v45 = false;
    if v29 ~= nil then
        v45 = v5.createElement("UIGradient", v29);
    end;
    v44.Gradient = v45;
    v40.ChatBubbleFrame = l_createElement_1(v42, v43, v44);
    if v36 then
        l_createElement_1 = v5.createElement;
        v42 = "ImageLabel";
        v43 = {
            LayoutOrder = 2, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromOffset(9, 6), 
            Image = "rbxasset://textures/ui/InGameChat/Caret.png", 
            ImageColor3 = l_chatSettings_0.BackgroundColor3, 
            ImageTransparency = v2() and v26.backgroundTransparency or v26.transparency
        };
        v44 = {};
        v45 = false;
        if v29 ~= nil then
            v45 = v5.createElement("UIGradient", v29);
        end;
        v44.Gradient = v45;
        l_createElement_1 = l_createElement_1(v42, v43, v44);
    else
        l_createElement_1 = nil;
    end;
    v40.Caret = l_createElement_1;
    return l_createElement_0(v38, v39, v40);
end;
v16.fadeOut = function(v46) --[[ Line: 209 ]] --[[ Name: fadeOut ]]
    -- upvalues: v3 (copy), v19 (copy), v11 (copy), v2 (copy)
    local l_chatSettings_1 = v46.props.chatSettings;
    if v3() then
        l_chatSettings_1 = v19(v46.props.chatSettings, v46.props.bubbleChatMessageProperties);
    end;
    if not v46.isFadingOut then
        v46.isFadingOut = true;
        v46.transparencyMotor:onComplete(function() --[[ Line: 217 ]]
            -- upvalues: v46 (copy)
            if v46.props.onFadeOut then
                v46.props.onFadeOut(v46.props.messageId);
            end;
        end);
        local v48 = v11(l_chatSettings_1, "transparency");
        v46.transparencyMotor:setGoal(v48(1));
        if v2() then
            v46.backgroundTransparencyMotor:setGoal(v48(1));
        end;
    end;
end;
v16.didUpdate = function(v49, v50) --[[ Line: 231 ]] --[[ Name: didUpdate ]]
    -- upvalues: v3 (copy), v19 (copy), v12 (copy), v11 (copy)
    if v49.props.fadingOut then
        v49:fadeOut();
    end;
    local l_chatSettings_2 = v49.props.chatSettings;
    if v3() then
        l_chatSettings_2 = v19(v49.props.chatSettings, v49.props.bubbleChatMessageProperties);
    end;
    if v50.text ~= v49.props.text or v50.useTranslation ~= v49.props.useTranslation or v50.translation ~= v49.props.translation or v50.chatSettings ~= v49.props.chatSettings or v50.renderInsert ~= v49.props.renderInsert or v50.insertSize ~= v49.props.insertSize then
        local v52 = if v49.props.useTranslation and v49.props.translation and v49.props.translation ~= "" then v12(v49.props.translation, l_chatSettings_2) else v12(v49.props.text, l_chatSettings_2);
        local v53 = v11(l_chatSettings_2, "size");
        local l_Padding_0 = l_chatSettings_2.Padding;
        local l_X_0 = v52.X;
        local l_Y_0 = v52.Y;
        if v49.props.renderInsert then
            l_X_0 = l_X_0 + (v49.props.insertSize.X + l_Padding_0);
            l_Y_0 = math.max(l_Y_0, v49.props.insertSize.Y + l_Padding_0 * 2);
        end;
        v49.heightMotor:setGoal(v53(l_Y_0));
        v49.widthMotor:setGoal(v53(l_X_0));
    end;
end;
v16.didMount = function(v57) --[[ Line: 268 ]] --[[ Name: didMount ]]
    -- upvalues: v3 (copy), v19 (copy), v12 (copy), v11 (copy), v6 (copy), v2 (copy), v15 (copy)
    v57.isMounted = true;
    local l_chatSettings_3 = v57.props.chatSettings;
    if v3() then
        l_chatSettings_3 = v19(v57.props.chatSettings, v57.props.bubbleChatMessageProperties);
    end;
    local v59 = if v57.props.useTranslation and v57.props.translation and v57.props.translation ~= "" then v12(v57.props.translation, l_chatSettings_3) else v12(v57.props.text, l_chatSettings_3);
    local v60 = v11(l_chatSettings_3, "size");
    local v61 = v11(l_chatSettings_3, "transparency");
    local l_X_1 = v59.X;
    local l_Y_1 = v59.Y;
    if v57.props.renderInsert then
        l_X_1 = l_X_1 + (v57.props.insertSize.X + l_chatSettings_3.Padding);
        l_Y_1 = math.max(l_Y_1, v57.props.insertSize.Y + l_chatSettings_3.Padding * 2);
    end;
    if v57.props.isMostRecent then
        v57.heightMotor:setGoal(v60(l_Y_1));
        v57.widthMotor:setGoal(v6.instant(l_X_1));
    else
        v57.heightMotor:setGoal(v60(l_Y_1));
        v57.widthMotor:setGoal(v60(l_X_1));
    end;
    local l_Transparency_0 = l_chatSettings_3.Transparency;
    v57.transparencyMotor:setGoal(v61(l_Transparency_0));
    if v2() then
        local v65 = v15.getBackgroundTransparency(l_chatSettings_3, v57.props.clientSettings);
        if v3() then
            local l_bubbleChatMessageProperties_0 = v57.props.bubbleChatMessageProperties;
            if l_bubbleChatMessageProperties_0 and l_bubbleChatMessageProperties_0.BackgroundTransparency then
                v65 = v15.getBackgroundTransparency({
                    BackgroundTransparency = l_bubbleChatMessageProperties_0.BackgroundTransparency
                }, v57.props.clientSettings);
            end;
        end;
        v57.backgroundTransparencyMotor:setGoal(v61(v65));
    end;
end;
v16.willUnmount = function(v67) --[[ Line: 321 ]] --[[ Name: willUnmount ]]
    -- upvalues: v2 (copy)
    v67.isMounted = false;
    v67.transparencyMotor:destroy();
    if v2() then
        v67.backgroundTransparencyMotor:destroy();
    end;
    v67.heightMotor:destroy();
    v67.widthMotor:destroy();
end;
return v16;