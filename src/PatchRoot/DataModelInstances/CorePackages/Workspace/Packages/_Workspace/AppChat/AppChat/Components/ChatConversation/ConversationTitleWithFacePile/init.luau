local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v3.Hooks.useTokens;
local v5 = require(l_Parent_0.Responsive);
local v6 = require(l_script_FirstAncestor_0.Components.Cells.ConversationFacePile);
local v7 = game:DefineFastInt("AppChatTitleWideBreakpointMinWidth", 800);
local v8 = game:DefineFastInt("AppChatTitleWideBreakpointMinHeight", 0);
return function(v9) --[[ Line: 20 ]]
    -- upvalues: v5 (copy), v7 (copy), v8 (copy), l_useTokens_0 (copy), v2 (copy), v3 (copy), v6 (copy)
    local v10 = v5.useResponsive({
        {
            Key = "wide", 
            minWidth = v7, 
            minHeight = v8
        }
    }) == "wide";
    local v11 = l_useTokens_0();
    return v2.createElement(v3.View, {
        Size = UDim2.new(1, 0, 1, 0)
    }, {
        TitleContainer = v2.createElement(v3.View, {
            onActivated = v9.navigateToChatDetails, 
            AutomaticSize = if v10 then Enum.AutomaticSize.X else nil, 
            Size = UDim2.new(not v10 and 1 or 0, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            cornerRadius = UDim.new(0, v11.Radius.Medium), 
            padding = UDim.new(0, v11.Padding.Small)
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                Padding = UDim.new(0, v11.Gap.Medium), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            ConversationFacePile = v2.createElement(v6, {
                conversationId = v9.conversationId
            }), 
            Text = v2.createElement(v3.Text, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                flexItem = {
                    FlexMode = Enum.UIFlexMode.Fill
                }, 
                fontStyle = v11.Typography.TitleLarge, 
                textStyle = v11.Color.Content.Emphasis, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextWrapped = false, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                LayoutOrder = 2, 
                Text = v9.titleText or ""
            })
        })
    });
end;