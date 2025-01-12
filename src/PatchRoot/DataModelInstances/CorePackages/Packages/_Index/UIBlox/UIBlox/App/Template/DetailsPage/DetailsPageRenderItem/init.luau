local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local l_GuiService_0 = game:GetService("GuiService");
local v5 = require(l_Parent_2.App.SelectionImage.useSelectionCursor);
local v6 = require(l_Parent_2.App.SelectionImage.CursorKind);
local v7 = require(l_Parent_1.SelectionCursor.useCursorByType);
local v8 = require(l_Parent_1.SelectionCursor.CursorType);
local v9 = require(l_Parent_2.UIBloxConfig);
local _ = require(l_Parent_0.Types);
local v11 = require(l_Parent_3.React);
local function v13(v12) --[[ Line: 26 ]] --[[ Name: onSelectionGained ]]
    -- upvalues: l_GuiService_0 (copy)
    l_GuiService_0:Select(v12);
end;
return function(v14) --[[ Line: 30 ]] --[[ Name: DetailsPageRenderItem ]]
    -- upvalues: v11 (copy), v9 (copy), v7 (copy), v8 (copy), v5 (copy), v6 (copy), v13 (copy)
    local l_item_0 = v14.item;
    local l_safeArea_0 = v14.safeArea;
    local l_itemPadding_0 = v14.itemPadding;
    local v18 = v11.useMemo(function() --[[ Line: 35 ]]
        -- upvalues: l_item_0 (copy)
        return l_item_0.renderComponent();
    end, {
        l_item_0.renderComponent
    });
    local v19, v20 = v11.useBinding(0);
    local v21 = v11.useRef(nil);
    local v27 = v11.useCallback(function(v22) --[[ Line: 42 ]]
        -- upvalues: l_safeArea_0 (copy), l_itemPadding_0 (copy), v20 (copy)
        local l_v22_FirstAncestorOfClass_0 = v22:FindFirstAncestorOfClass("ScrollingFrame");
        if l_v22_FirstAncestorOfClass_0 == nil then
            return nil;
        else
            local v24 = v22.AbsolutePosition.Y - l_v22_FirstAncestorOfClass_0.AbsolutePosition.Y - l_safeArea_0.Y;
            local v25 = -(v22.AbsoluteSize.Y + l_itemPadding_0);
            if v24 < 1 and v25 < v24 + l_safeArea_0.Y + 1 then
                local v26 = v24 / v25;
                v20(v26);
            else
                v20(0);
            end;
            return nil;
        end;
    end, {
        l_safeArea_0, 
        l_itemPadding_0
    });
    local v28 = if v9.migrateToNewSelectionCursor then v7(v8.Invisible) else v5(v6.Invisible);
    return v11.createElement("CanvasGroup", {
        key = l_item_0.key, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        ref = v21, 
        [v11.Change.AbsolutePosition] = v27, 
        GroupTransparency = v19, 
        BackgroundTransparency = 1, 
        Selectable = l_item_0.useSelectionBumper, 
        SelectionImageObject = v28, 
        [v11.Event.SelectionGained] = v13
    }, {
        Padding = v11.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_safeArea_0.X), 
            PaddingRight = UDim.new(0, l_safeArea_0.X)
        }), 
        View = v18
    });
end;