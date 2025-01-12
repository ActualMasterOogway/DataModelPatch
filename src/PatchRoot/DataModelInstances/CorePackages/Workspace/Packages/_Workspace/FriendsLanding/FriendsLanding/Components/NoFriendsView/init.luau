local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_React_0 = v2.React;
local l_Dash_0 = v2.Dash;
local l_UIBlox_0 = v2.UIBlox;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_Button_0 = l_UIBlox_0.App.Button.Button;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_StandardButtonSize_0 = l_UIBlox_0.App.Button.Enum.StandardButtonSize;
local l_Colors_0 = l_UIBlox_0.App.Style.Colors;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_StyledTextLabel_0 = l_UIBlox_0.App.Text.StyledTextLabel;
local l_useLocalization_0 = v2.Hooks.useLocalization;
local v15 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v16 = require(l_script_FirstAncestor_0.Common.Constants);
local l_AppFonts_0 = require(l_Parent_0.Style).AppFonts;
local v18 = {
    layoutOrder = 0, 
    pageLoadingTimeReport = nil, 
    pageRenderReport = nil, 
    openAddFriendsPage = l_Dash_0.noop, 
    addFriendsBtnLabelKey = v15.ADD_FRIENDS_BTN, 
    noFriendsTextLabelKey = v15.NO_FRIENDS_TEXT, 
    addFriendsBtnEnabled = true
};
return function(v19) --[[ Line: 54 ]] --[[ Name: NoFriendsView ]]
    -- upvalues: l_Dash_0 (copy), v18 (copy), l_React_0 (copy), l_useLocalization_0 (copy), l_useStyle_0 (copy), v16 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), l_Colors_0 (copy), l_StyledTextLabel_0 (copy), l_AppFonts_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_StandardButtonSize_0 (copy)
    local v20 = l_Dash_0.join(v18, v19 or {});
    l_React_0.useEffect(function() --[[ Line: 57 ]]
        -- upvalues: v20 (copy)
        if v20.pageLoadingTimeReport then
            v20.pageLoadingTimeReport();
        end;
        if v20.pageRenderReport then
            v20.pageRenderReport();
        end;
    end, {});
    local v21 = l_useLocalization_0({
        addFriendsBtn = v20.addFriendsBtnLabelKey, 
        noFriendsText = v20.noFriendsTextLabelKey, 
        noFriendsHeader = v20.noFriendsHeaderKey
    });
    local v22 = l_useStyle_0();
    return l_React_0.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, -(v16.TOP_BAR_HEIGHT + 45)), 
        LayoutOrder = v20.layoutOrder, 
        BackgroundTransparency = 1
    }, {
        IndicatorInner = l_React_0.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0), 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5)
        }, {
            SidePadding = l_React_0.createElement("UIPadding", {
                PaddingRight = UDim.new(0, 30), 
                PaddingLeft = UDim.new(0, 30)
            }), 
            UIList = l_React_0.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Padding = UDim.new(0, 15)
            }), 
            Imagelabel = l_React_0.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Image = l_Images_0["icons/graphic/findfriends_xlarge"], 
                ImageColor3 = l_Colors_0.White, 
                LayoutOrder = 1, 
                Size = UDim2.fromOffset(96, 96)
            }), 
            Headerlabel = if v20.noFriendsHeaderKey and v21.noFriendsHeader then l_React_0.createElement(l_StyledTextLabel_0, {
                text = v21.noFriendsHeader, 
                fontStyle = v22.Font.Header1, 
                colorStyle = v22.Theme.TextEmphasis, 
                automaticSize = Enum.AutomaticSize.Y, 
                size = UDim2.new(0, 315, 0, 0), 
                textXAlignment = Enum.TextXAlignment.Center, 
                textYAlignment = Enum.TextYAlignment.Center, 
                layoutOrder = 2
            }) else nil, 
            Textlabel = l_React_0.createElement("TextLabel", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                TextWrapped = true, 
                BackgroundTransparency = 1, 
                Font = l_AppFonts_0.default:getDefault(), 
                LayoutOrder = 2, 
                Size = UDim2.new(0, 315, 0, 0), 
                Text = v21.noFriendsText, 
                TextColor3 = v22.Theme.TextMuted.Color, 
                TextSize = v22.Font.Header2.RelativeSize * v22.Font.BaseSize, 
                TextTransparency = v22.Theme.TextMuted.Transparency
            }), 
            Padding = l_React_0.createElement("Frame", {
                LayoutOrder = 3, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 0, 0, 10)
            }), 
            AddFriendsButton = v20.addFriendsBtnEnabled and l_React_0.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.PrimarySystem, 
                layoutOrder = 4, 
                text = v21.addFriendsBtn, 
                standardSize = l_StandardButtonSize_0.Regular, 
                onActivated = v20.openAddFriendsPage
            })
        })
    });
end;