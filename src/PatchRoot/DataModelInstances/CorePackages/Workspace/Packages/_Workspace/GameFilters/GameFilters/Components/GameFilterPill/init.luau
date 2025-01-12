local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameFilters");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AppEventIngestService_0 = require(l_Parent_0.RoactServiceTags).AppEventIngestService;
local _ = require(l_Parent_0.DiscoveryTypes);
local v4 = require(l_Parent_0.Foundation);
local l_IconPosition_0 = v4.Enums.IconPosition;
local l_ImpressionsTagUtility_0 = require(l_Parent_0.Impressions).ImpressionsTagUtility;
local l_CentralOverlayType_0 = require(l_Parent_0.RobloxAppEnums).CentralOverlayType;
local l_Pill_0 = v4.Pill;
local v9 = require(l_Parent_0.React);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_SetCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Actions.SetCentralOverlay;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_useTokens_0 = v4.Hooks.useTokens;
local v15 = require(l_script_FirstAncestor_0.Analytics.FilterClickButtonName);
local _ = require(l_script_FirstAncestor_0.Components.Menu.FilterMenuDropdown);
local v17 = require(l_script_FirstAncestor_0.OpenGameFilterMenuPeekView);
local v18 = require(l_script_FirstAncestor_0.Analytics.gamesFilterClickEvent);
local v19 = require(l_script_FirstAncestor_0.Components.Menu.shouldUsePeekView);
return v9.memo(function(v20) --[[ Line: 37 ]]
    -- upvalues: v9 (copy), l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), l_useDispatch_0 (copy), l_useTokens_0 (copy), l_dependencyArray_0 (copy), l_ImpressionsTagUtility_0 (copy), v18 (copy), v19 (copy), v17 (copy), v15 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy), l_Pill_0 (copy), l_IconPosition_0 (copy)
    local v21, v22 = v9.useState(false);
    local v23 = l_useRoactService_0(l_AppEventIngestService_0);
    local v24 = v9.useRef(nil);
    local v25 = l_useDispatch_0();
    local v26 = l_useTokens_0();
    v9.useEffect(function() --[[ Line: 47 ]]
        -- upvalues: v24 (copy), v20 (copy)
        local v27 = nil;
        if v24.current then
            v27 = v24.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 51 ]]
                -- upvalues: v20 (ref), v24 (ref)
                v20.onAbsoluteSizeChanged(v24.current);
            end);
        end;
        return function() --[[ Line: 56 ]]
            -- upvalues: v27 (ref)
            if v27 then
                v27:Disconnect();
            end;
        end;
    end, l_dependencyArray_0(v20.onAbsoluteSizeChanged));
    v9.useEffect(function() --[[ Line: 63 ]]
        -- upvalues: l_ImpressionsTagUtility_0 (ref), v24 (copy), v20 (copy)
        l_ImpressionsTagUtility_0.AddTag(v24, v20.impressionsTag, v20.index);
        return function() --[[ Line: 66 ]]
            -- upvalues: l_ImpressionsTagUtility_0 (ref), v24 (ref), v20 (ref)
            l_ImpressionsTagUtility_0.RemoveTag(v24, v20.impressionsTag, v20.index);
        end;
    end, l_dependencyArray_0(v20.impressionsTag, v20.index));
    local v31 = v9.useCallback(function(v28, v29, v30) --[[ Line: 72 ]]
        -- upvalues: v18 (ref), v23 (copy), v20 (copy)
        v18(v23, v20.pageContext, {
            buttonName = v28, 
            filterId = v20.filter.filterId, 
            selectedOptionId = v29, 
            previousOptionId = v30, 
            gameSetTypeId = v20.analyticsInfo.gameSetTypeId, 
            gameSetTargetId = v20.analyticsInfo.gameSetTargetId, 
            sortPos = v20.analyticsInfo.sortPos
        });
    end, l_dependencyArray_0(v23, v20.filter, v20.pageContext, v20.analyticsInfo));
    local v32 = v19();
    local v33 = v9.useCallback(function() --[[ Line: 87 ]]
        -- upvalues: v22 (copy)
        v22(false);
    end, {});
    local v35 = v9.useCallback(function() --[[ Line: 91 ]]
        -- upvalues: v32 (copy), v25 (copy), v17 (ref), v20 (copy), v33 (copy), v31 (copy), v15 (ref), v24 (copy), v26 (copy), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), v22 (copy)
        if v32 then
            v25(v17(v20.filter, v20.onFilterApplied, v33, v31));
            v31(v15.OpenPeekView, v20.filter.selectedOptionId);
        else
            local v34 = {
                openPosition = if v24.current then Vector2.new(v24.current.AbsolutePosition.X, v24.current.AbsolutePosition.Y + v24.current.AbsoluteSize.Y + v26.Gap.Small) else nil, 
                filter = v20.filter, 
                onFilterApplied = v20.onFilterApplied, 
                onFilterMenuClosed = v33, 
                sendFilterClick = v31
            };
            v25(l_SetCentralOverlay_0(l_CentralOverlayType_0.GameFilterMenuDropdown, v34));
            v31(v15.OpenDropdown, v20.filter.selectedOptionId);
        end;
        v22(true);
    end, l_dependencyArray_0(v20.filter, v20.onFilterApplied, v33, v31, v32));
    return v9.createElement(l_Pill_0, {
        icon = {
            name = "icons/actions/truncationExpand_small", 
            position = l_IconPosition_0.Right
        }, 
        text = v20.filter.selectedOptionDisplayName, 
        isChecked = v21, 
        onActivated = v35, 
        ref = v24
    });
end);