local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceWidgets").Parent;
local v1 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v3 = require(l_Parent_0.UIBlox);
local l_Button_0 = v3.App.Button.Button;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_StandardButtonSize_0 = v3.App.Button.Enum.StandardButtonSize;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
return function(v8) --[[ Line: 20 ]] --[[ Name: WidgetHeader ]]
    -- upvalues: v1 (copy), l_useDesignTokens_0 (copy), l_useLocalization_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_StandardButtonSize_0 (copy)
    local v9, v10 = v1.useBinding(Vector2.new());
    local v11 = l_useDesignTokens_0();
    local v12 = l_useLocalization_0({
        title = v8.titleKey, 
        description = v8.descriptionKey, 
        seeAllButtonText = "Feature.Catalog.ActionSeeAll"
    });
    local v13 = if v8.titleText then v8.titleText else v12.title;
    local v14 = if v8.descriptionText then v8.descriptionText else v12.description;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = v8.LayoutOrder
    }, {
        TitleDescriptionFrame = if not not v13 or v14 then v1.createElement("Frame", {
            Size = if v8.seeAllCallback then v9:map(function(v15) --[[ Line: 41 ]]
                -- upvalues: v11 (copy)
                return UDim2.new(1, 0 - (v15.X + v11.Global.Space_150), 0, 0);
            end) else UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            UIListLayout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, v11.Global.Space_50)
            }), 
            Title = if v13 then v1.createElement("TextLabel", {
                LayoutOrder = 1, 
                Text = v13, 
                Font = v11.Semantic.Typography.Header.Font, 
                TextSize = v11.Semantic.Typography.Header.FontSize, 
                LineHeight = v11.Semantic.Typography.Header.LineHeight, 
                TextColor3 = v11.Semantic.Color.Text.Emphasis.Color3, 
                TextTransparency = v11.Semantic.Color.Text.Emphasis.Transparency, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1
            }, {
                UISizeConstraint = if v8.seeAllCallback then v1.createElement("UISizeConstraint", {
                    MinSize = v9:map(function(v16) --[[ Line: 71 ]]
                        return Vector2.new(0, v16.Y);
                    end)
                }) else nil
            }) else nil, 
            Description = if v14 then v1.createElement("TextLabel", {
                LayoutOrder = 2, 
                Text = v14, 
                Font = v11.Semantic.Typography.Body.Font, 
                TextSize = v11.Semantic.Typography.Body.FontSize, 
                TextColor3 = v11.Semantic.Color.Text.Default.Color3, 
                TextTransparency = v11.Semantic.Color.Text.Default.Transparency, 
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1
            }) else nil
        }) else nil, 
        SeeAll = if v8.seeAllCallback then v1.createElement(l_Button_0, {
            buttonType = l_ButtonType_0.Secondary, 
            anchorPoint = Vector2.new(1, 0), 
            position = UDim2.fromScale(1, 0), 
            text = v12.seeAllButtonText, 
            fitContent = true, 
            standardSize = l_StandardButtonSize_0.XSmall, 
            onActivated = v8.seeAllCallback, 
            [v1.Change.AbsoluteSize] = function(v17) --[[ Line: 103 ]]
                -- upvalues: v10 (copy)
                v10(v17.AbsoluteSize);
            end
        }) else nil
    });
end;