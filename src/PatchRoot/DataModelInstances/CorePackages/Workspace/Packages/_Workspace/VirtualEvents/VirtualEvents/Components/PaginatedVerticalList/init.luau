local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(l_script_FirstAncestor_0.Parent.UIBlox);
local l_useLocalization_0 = require(l_script_FirstAncestor_0.Parent.Localization).Hooks.useLocalization;
local l_dependencyArray_0 = require(l_script_FirstAncestor_0.Parent.RoactUtils).Hooks.dependencyArray;
local l_Button_0 = v3.App.Button.Button;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local v8 = require(script.Parent.EventsGridLayout);
local v9 = {
    initialItemsShown = 3, 
    extraItemsShownOnLoad = 5, 
    itemPadding = UDim.new(0, 12), 
    isDesktopGrid = false
};
return function(v10) --[[ Line: 32 ]] --[[ Name: PaginatedVerticalList ]]
    -- upvalues: v1 (copy), v9 (copy), v2 (copy), l_dependencyArray_0 (copy), l_useLocalization_0 (copy), v8 (copy), l_Button_0 (copy), l_ButtonType_0 (copy)
    local v11 = v1.Dictionary.join(v9, v10);
    local v12, v13 = v2.useState(0);
    local v14 = v2.useMemo(function() --[[ Line: 36 ]]
        -- upvalues: v11 (copy), v12 (copy)
        return v11.initialItemsShown + v11.extraItemsShownOnLoad * v12;
    end, l_dependencyArray_0(v11.initialItemsShown, v11.extraItemsShownOnLoad, v12));
    local v15 = l_useLocalization_0({
        seeMore = "Feature.VirtualEvents.SeeMore"
    });
    v2.useEffect(function() --[[ Line: 44 ]]
        -- upvalues: v13 (copy)
        v13(0);
    end, l_dependencyArray_0(v11.initialItemsShown, v11.extraItemsShownOnLoad));
    local v17 = v2.useCallback(function() --[[ Line: 48 ]]
        -- upvalues: v13 (copy), v11 (copy)
        v13(function(v16) --[[ Line: 49 ]]
            return v16 + 1;
        end);
        if v11.onSeeMore then
            v11.onSeeMore();
        end;
    end, l_dependencyArray_0(v11.onSeeMore));
    local v21 = v2.useMemo(function() --[[ Line: 58 ]]
        -- upvalues: v14 (copy), v11 (copy), v2 (ref)
        local v18 = {};
        for v19 = 1, v14 do
            local v20 = v11.items[v19];
            v18["Item" .. v19] = v2.createElement("Frame", {
                LayoutOrder = v19, 
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1
            }, {
                Content = v20
            });
        end;
        return v18;
    end, {
        v11.items, 
        v14
    });
    return v2.createElement("Frame", {
        LayoutOrder = v11.layoutOrder, 
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        Layout = v2.createElement("UIListLayout", {
            Padding = v11.itemPadding, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        MobileListItems = not v11.isDesktopGrid and v2.createElement(v2.Fragment, nil, v21), 
        DesktopGridItems = v11.isDesktopGrid and v2.createElement(v8, {
            items = v11.items, 
            numItemsShown = v14
        }), 
        SeeMore = if v14 < #v11.items then v2.createElement(l_Button_0, {
            buttonType = l_ButtonType_0.Secondary, 
            layoutOrder = #v11.items + 1, 
            size = UDim2.fromScale(1, 0), 
            automaticSize = Enum.AutomaticSize.Y, 
            text = v15.seeMore, 
            onActivated = v17
        }) else nil
    });
end;