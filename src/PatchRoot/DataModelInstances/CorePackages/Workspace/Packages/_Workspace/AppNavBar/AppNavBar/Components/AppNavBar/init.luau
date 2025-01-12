local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.Cryo);
local v4 = require(l_Parent_1.UIBlox);
local l_useAppPolicy_0 = require(l_Parent_1.UniversalAppPolicy).useAppPolicy;
local l_useRoactService_0 = require(l_Parent_1.RobloxAppHooks).useRoactService;
local v7 = require(l_Parent_1.RoactServiceTags);
local v8 = require(l_Parent_1.SharedFlags);
local l_NavigationBar_0 = v4.App.Navigation.NavigationBar;
local l_NavigationBarV2_0 = v4.App.Navigation.NavigationBarV2;
local l_NavigationRail_0 = v4.App.Navigation.NavigationRail;
local l_NavigationBarAlignment_0 = v4.App.Navigation.Enum.NavigationBarAlignment;
local l_NavigationRailAlignment_0 = v4.App.Navigation.Enum.NavigationRailAlignment;
local v14 = require(l_Parent_0.Enum.Placement);
local v15 = require(l_Parent_0.Components.AppNavItem);
local v16 = require(l_Parent_0.Components.StudioCTAIcon);
local v17 = require(l_Parent_0.Constants);
local l_FFlagAppNavSimplification_0 = v8.FFlagAppNavSimplification;
local v19 = {
    selectedIndex = 1, 
    isVisible = true, 
    clipsDescendants = true
};
return v2.memo(function(v20) --[[ Line: 52 ]] --[[ Name: AppNavBar ]]
    -- upvalues: v3 (copy), v19 (copy), l_useAppPolicy_0 (copy), l_useRoactService_0 (copy), v7 (copy), v2 (copy), v16 (copy), v17 (copy), l_FFlagAppNavSimplification_0 (copy), v15 (copy), v14 (copy), l_NavigationBarV2_0 (copy), l_NavigationBar_0 (copy), l_NavigationBarAlignment_0 (copy), l_NavigationRail_0 (copy), l_NavigationRailAlignment_0 (copy)
    local v21 = v3.Dictionary.join(v19, v20);
    local l_items_0 = v21.items;
    local v24 = l_useAppPolicy_0(function(v23) --[[ Line: 57 ]]
        return v23.getShowStudioCTA();
    end);
    local v25 = l_useRoactService_0(v7.AppEventIngestService);
    local v26 = l_useRoactService_0(v7.AppLinking);
    local v29 = v2.useCallback(function(_, v28) --[[ Line: 62 ]]
        -- upvalues: v2 (ref), v16 (ref)
        return v2.createElement(v16, {
            controlState = v28
        });
    end, {});
    local v31 = v2.useCallback(function() --[[ Line: 67 ]]
        -- upvalues: v25 (copy), v17 (ref), v21 (copy), v26 (copy)
        v25:setRBXEventStream(v17.STUDIO_CTA_EVENT_CONTEXT, v17.STUDIO_CTA_EVENT_NAME_OPEN);
        local v30 = v21.buildCreatorWebNavUrl({
            utm_content = "side_bar_blue_icon"
        });
        v26:openURL(v30);
    end, {
        v25, 
        v26, 
        v21.buildCreatorWebNavUrl
    });
    if v24 then
        l_items_0 = v3.List.join(l_items_0);
        table.insert(l_items_0, {
            isSecondary = true, 
            renderIcon = v29, 
            onActivated = v31
        });
    end;
    local v32 = nil;
    local v39 = if l_FFlagAppNavSimplification_0 then v2.useCallback(function(v33, v34) --[[ Line: 86 ]]
        -- upvalues: v2 (ref), v15 (ref), v21 (copy)
        return v2.createElement(v15, {
            item = v33, 
            isChecked = v34, 
            isCenterPositioned = true, 
            hasLabel = v21.hasLabel, 
            systemBarLabelTextSizeBinding = v21.systemBarLabelTextSizeBinding
        });
    end, {
        v21.hasLabel, 
        v21.systemBarLabelTextSizeBinding
    }) else v2.useCallback(function(v35, _, v37, v38) --[[ Line: 95 ]]
        -- upvalues: v2 (ref), v15 (ref), v21 (copy)
        return v2.createElement(v15, {
            item = v35, 
            isChecked = v37, 
            isCenterPositioned = true, 
            hasLabel = v21.hasLabel, 
            systemBarLabelTextSizeBinding = v21.systemBarLabelTextSizeBinding
        }), {
            LayoutOrder = v38, 
            Active = false, 
            Selectable = false
        };
    end, {
        v21.hasLabel, 
        v21.systemBarLabelTextSizeBinding
    });
    local v44 = v2.useCallback(function(v40, _, v42, v43) --[[ Line: 110 ]]
        -- upvalues: v2 (ref), v15 (ref), v21 (copy)
        return v2.createElement(v15, {
            item = v40, 
            isChecked = v42, 
            isCenterPositioned = false, 
            hasLabel = v21.hasLabel, 
            systemBarLabelTextSizeBinding = v21.systemBarLabelTextSizeBinding
        }), {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = v43, 
            Active = false, 
            Selectable = false
        };
    end, {
        v21.hasLabel, 
        v21.systemBarLabelTextSizeBinding
    });
    if v21.placement == v14.Bottom then
        return (v2.createElement(if l_FFlagAppNavSimplification_0 then l_NavigationBarV2_0 else l_NavigationBar_0, {
            alignment = l_NavigationBarAlignment_0.EvenlyDistributed, 
            items = l_items_0, 
            isVisible = v21.isVisible, 
            size = v21.size, 
            renderItem = v39, 
            position = v21.position, 
            selection = v21.selectedIndex, 
            clipsDescendants = v21.clipsDescendants, 
            showAnimation = not l_FFlagAppNavSimplification_0 or nil, 
            animated = l_FFlagAppNavSimplification_0 and true or nil
        }));
    else
        if v21.placement == v14.Left then
            v32 = v2.createElement(l_NavigationRail_0, {
                alignment = l_NavigationRailAlignment_0.Justified, 
                items = l_items_0, 
                size = v21.size, 
                itemSize = UDim2.fromScale(0, 0), 
                isVisible = v21.isVisible, 
                renderItem = v44, 
                position = v21.position, 
                selection = v21.selectedIndex, 
                clipsDescendants = v21.clipsDescendants
            });
        end;
        return v32;
    end;
end);