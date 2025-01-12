local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsMenu");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Context_0 = l_script_FirstAncestor_0.Context;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.UIBlox);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v7 = require(l_Parent_0.Responsive);
local l_useStyle_0 = v5.Core.Style.useStyle;
local v9 = require(l_script_FirstAncestor_0.Constants);
local v10 = require(script.Parent.FriendsMenuUserCard);
local v11 = require(l_Context_0.SelectedUsersContext);
return function(v12) --[[ Line: 22 ]]
    -- upvalues: v4 (copy), v11 (copy), v7 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), v10 (copy), l_dependencyArray_0 (copy), v9 (copy)
    local v13 = v4.useContext(v11);
    local v14 = v7.useBreakpointYOrLarger(v7.Keys.Medium);
    local v15 = l_useStyle_0();
    local l_Theme_0 = v15.Theme;
    local l_Font_0 = v15.Font;
    local v18 = l_useLocalization_0({
        selectedFriendsCountText = {
            "Feature.FriendsMenu.Label.SelectedFriendsCount"; 
            numerator = v13.selectedFriendsSize, 
            denominator = v12.selectionLimit
        }, 
        selectedFriendsCountNoLimitText = {
            "Feature.FriendsMenu.Label.SelectedFriendsCountNoLimit"; 
            selectedCount = v13.selectedFriendsSize
        }
    });
    local v22 = v4.useMemo(function() --[[ Line: 42 ]]
        -- upvalues: v4 (ref), v13 (copy), v10 (ref)
        local v19 = {
            UIListLayout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                Padding = UDim.new(0, 8), 
                SortOrder = Enum.SortOrder.LayoutOrder
            })
        };
        for v20, v21 in pairs(v13.selectedFriends) do
            v19["User-" .. tostring(v20)] = v4.createElement(v10, {
                displayName = v21.displayName, 
                layoutOrder = v21.layoutOrder, 
                userId = v20
            });
        end;
        return v19;
    end, l_dependencyArray_0(v13.selectedFriends));
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = v12.layoutOrder
    }, {
        VerticalLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, 8), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        SelectedFriendsText = v4.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Font = l_Font_0.Header2.Font, 
            LayoutOrder = 0, 
            Text = if v12.selectionLimit then v18.selectedFriendsCountText else v18.selectedFriendsCountNoLimitText, 
            TextColor3 = l_Theme_0.TextEmphasis.Color, 
            TextSize = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize, 
            TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
            TextXAlignment = Enum.TextXAlignment.Left
        }), 
        SelectedUsers = if v13.selectedFriendsSize ~= 0 and v14 then v4.createElement("ScrollingFrame", {
            Size = UDim2.new(1, 0, 0, v9.FRIEND_MENU_CARD_SIZE), 
            AutomaticCanvasSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            ScrollBarThickness = 0, 
            ScrollingDirection = Enum.ScrollingDirection.X
        }, v22) else nil
    });
end;