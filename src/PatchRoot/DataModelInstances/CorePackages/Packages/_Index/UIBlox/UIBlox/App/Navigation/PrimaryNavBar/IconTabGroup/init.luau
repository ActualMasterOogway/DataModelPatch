local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Cryo);
local v4 = require(l_Parent_2.React);
local l_Object_0 = require(l_Parent_2.LuauPolyfill).Object;
local v6 = require(l_Parent_1.Core.Control.InteractableList);
local v7 = require(l_Parent_1.Core.Control.Enum.SelectionMode);
local v8 = require(l_Parent_0.SelectionImage.useSelectionCursor);
local v9 = require(l_Parent_1.App.SelectionImage.CursorKind);
local v10 = require(l_Parent_1.App.SelectionCursor.useCursor);
local v11 = require(l_Parent_1.UIBloxConfig);
local v12 = require(script.Parent.IconTab);
local v13 = require(script.Parent.HorizontalContainer);
local _ = require(script.Parent.Types);
local v15 = require(script.Parent.Constants);
local v16 = {
    selection = {
        1
    }, 
    items = {}, 
    padding = {
        left = v15.ICON_TAB_PADDING, 
        right = v15.ICON_TAB_PADDING
    }, 
    itemSpacing = UDim.new(0, v15.ICON_TAB_ITEM_SPACING), 
    itemPadding = {
        left = v15.ICON_TAB_ITEM_PADDING_LEFT, 
        right = v15.ICON_TAB_ITEM_PADDING_RIGHT
    }
};
return function(v17) --[[ Line: 46 ]] --[[ Name: IconTabGroup ]]
    -- upvalues: l_Object_0 (copy), v16 (copy), v11 (copy), v10 (copy), v8 (copy), v9 (copy), v13 (copy), v15 (copy), v4 (copy), v6 (copy), v3 (copy), v12 (copy), v7 (copy)
    local v18 = l_Object_0.assign({}, v16, v17);
    local v19 = if v11.useNewSelectionCursor then v10(UDim.new(0.5, 0), 0) else v8(v9.XLargePill);
    return v13({
        size = UDim2.new(0, 0, 0, v15.ICON_TAB_GROUP_HEIGHT), 
        showRoundedBackground = false, 
        automaticSize = Enum.AutomaticSize.X, 
        padding = v18.padding
    }, {
        MainTabList = v4.createElement(v6, {
            size = UDim2.new(0, 0, 1, 0), 
            automaticSize = Enum.AutomaticSize.X, 
            fillDirection = Enum.FillDirection.Horizontal, 
            horizontalAlignment = Enum.HorizontalAlignment.Left, 
            sortOrder = Enum.SortOrder.LayoutOrder, 
            itemList = v18.items, 
            itemSize = UDim2.fromScale(0, 0), 
            renderItem = function(v20, v21, v22) --[[ Line: 65 ]] --[[ Name: renderItem ]]
                -- upvalues: v3 (ref), v18 (copy), v19 (copy), v4 (ref), v12 (ref)
                local v23 = {
                    LayoutOrder = v3.List.find(v18.items, v20), 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    SelectionImageObject = v19
                };
                return v4.createElement(v12, {
                    item = v20, 
                    selected = v22, 
                    controlState = v21, 
                    padding = v18.itemPadding
                }), v23;
            end, 
            onSelectionChanged = function(v24) --[[ Line: 80 ]] --[[ Name: onSelectionChanged ]]
                -- upvalues: v18 (copy)
                local v25 = v18.items[v24[1]];
                if v25 ~= nil and v25.onActivated ~= nil then
                    v25.onActivated();
                end;
            end, 
            selection = v18.selection, 
            selectionMode = v7.Single, 
            padding = v18.itemSpacing
        })
    });
end;