local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiGlobalNav");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.TenFootUiCommon);
local l_TenFootUiContext_0 = v4.TenFootUiContext;
local l_AppNotificationService_0 = require(l_Parent_0.RoactServiceTags).AppNotificationService;
local v7 = require(l_script_FirstAncestor_0.Analytics.makeGlobalNavAnalytics);
local l_GlobalNavDisplayOption_0 = v4.TenFootUiRNTypes.GlobalNavDisplayOption;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v10 = require(l_script_FirstAncestor_0.Components.GlobalNavContainer.useGlobalNavAnimation);
local l_getCurrentTabName_0 = require(l_Parent_0.NavigationRodux).Utils.getCurrentTabName;
local _ = require(l_script_FirstAncestor_0.Components.GlobalNav);
local l_FFlagGlobalNavImageIcon_0 = require(l_Parent_0.SharedFlags).FFlagGlobalNavImageIcon;
local l_FFlagFix10ftGlobalNavSelection_0 = require(l_Parent_0.SharedFlags).FFlagFix10ftGlobalNavSelection;
return function(v15, v16) --[[ Line: 19 ]] --[[ Name: useGlobalNavProps ]]
    -- upvalues: v2 (copy), l_TenFootUiContext_0 (copy), l_AppNotificationService_0 (copy), v7 (copy), l_getCurrentTabName_0 (copy), v3 (copy), l_useLocalization_0 (copy), v10 (copy), l_GlobalNavDisplayOption_0 (copy), l_FFlagGlobalNavImageIcon_0 (copy), l_FFlagFix10ftGlobalNavSelection_0 (copy)
    local v17 = v2.useContext(l_TenFootUiContext_0);
    assert(v17, "TenFootUiContext must be configured before using GlobalNav");
    local v18 = v17.useRoactService(l_AppNotificationService_0);
    local v19 = v17.useRoactService(v17.RoactAnalytics);
    local v20 = v7(v19, v17.buttonClick);
    local l_globalNavConfig_0 = v17.globalNavConfig;
    local v22 = l_getCurrentTabName_0(v15.state);
    local function v25(v23) --[[ Line: 31 ]]
        -- upvalues: v22 (copy), v17 (copy), v15 (copy), v18 (copy), v20 (copy)
        local l_page_0 = v23.page;
        if v22 == l_page_0 then
            v17.LuaAppEvents.ReloadPage:fire(l_page_0);
            return;
        else
            v15.navigate(l_page_0);
            if v23.actionType then
                v18:ActionTaken(v23.actionType);
            end;
            v20.ButtonActivated(l_page_0, v22);
            return;
        end;
    end;
    local v27 = v3.List.map(l_globalNavConfig_0.tabs, function(v26) --[[ Line: 48 ]]
        return v26.titleLocalizationKey;
    end);
    local v28 = l_useLocalization_0(v27);
    local v30 = v3.List.map(l_globalNavConfig_0.options, function(v29) --[[ Line: 53 ]]
        return v29.titleLocalizationKey;
    end);
    local v31 = l_useLocalization_0(v30);
    local v32 = nil;
    local v33 = nil;
    local l_v10_0 = v10;
    local v35 = true;
    if v16 ~= l_GlobalNavDisplayOption_0.ShowAll then
        v35 = v16 == l_GlobalNavDisplayOption_0.TabGroupOnly;
    end;
    l_v10_0 = l_v10_0(v35);
    v35 = v10;
    local v36 = true;
    if v16 ~= l_GlobalNavDisplayOption_0.ShowAll then
        v36 = v16 == l_GlobalNavDisplayOption_0.OptionGroupOnly;
    end;
    v35 = v35(v36);
    if l_v10_0.isVisible then
        v36 = v3.List.findWhere(l_globalNavConfig_0.tabs, function(v37, _) --[[ Line: 68 ]]
            -- upvalues: v22 (copy)
            return v37.page == v22;
        end);
        local v41 = v3.List.map(l_globalNavConfig_0.tabs, function(v39, v40) --[[ Line: 71 ]]
            -- upvalues: v28 (copy), l_FFlagGlobalNavImageIcon_0 (ref), v25 (copy), v22 (copy)
            return {
                title = v28[v40], 
                icon = if l_FFlagGlobalNavImageIcon_0 then v39.iconImage else v39.icon, 
                iconComponent = v39.iconComponent, 
                onActivated = function() --[[ Line: 76 ]] --[[ Name: onActivated ]]
                    -- upvalues: v25 (ref), v39 (copy)
                    v25(v39);
                end, 
                showRoundedBackground = v22 == v39.page
            };
        end);
        v32 = {
            selection = {
                v36
            }, 
            items = v41, 
            padding = {
                left = 0, 
                right = 0, 
                top = 0, 
                bottom = 0
            }
        };
    end;
    if v35.isVisible then
        v33 = {
            items = v3.List.map(l_globalNavConfig_0.options, function(v42, v43) --[[ Line: 90 ]]
                -- upvalues: v31 (copy), v25 (copy)
                return {
                    label = v31[v43], 
                    icon = v42.iconComponent or v42.icon, 
                    onActivated = function() --[[ Line: 94 ]] --[[ Name: onActivated ]]
                        -- upvalues: v25 (ref), v42 (copy)
                        v25(v42);
                    end
                };
            end)
        };
    end;
    return {
        tabGroupProps = v32, 
        optionGroupProps = v33, 
        animationProps = {
            tabGroupTransparency = l_v10_0.transparency, 
            tabGroupRef = l_v10_0.ref, 
            optionGroupTransparency = v35.transparency, 
            optionGroupRef = v35.ref
        }, 
        SelectionGroup = l_FFlagFix10ftGlobalNavSelection_0 and true or nil, 
        SelectionBehaviorLeft = if l_FFlagFix10ftGlobalNavSelection_0 then Enum.SelectionBehavior.Stop else nil, 
        SelectionBehaviorRight = if l_FFlagFix10ftGlobalNavSelection_0 then Enum.SelectionBehavior.Stop else nil, 
        SelectionBehaviorUp = if l_FFlagFix10ftGlobalNavSelection_0 then Enum.SelectionBehavior.Stop else nil
    };
end;