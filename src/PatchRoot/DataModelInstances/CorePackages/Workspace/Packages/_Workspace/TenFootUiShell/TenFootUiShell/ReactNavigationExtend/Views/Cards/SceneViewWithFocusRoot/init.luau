local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiShell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.TenFootUiCommon);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.RoactNavigation);
local v5 = require(l_Parent_0.ReactFocusNavigation);
local v6 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusNavigableSurfaceRegistry_0 = v6.FocusNavigableSurfaceRegistry;
local l_useRegisterFocusNavigableSurface_0 = l_FocusNavigableSurfaceRegistry_0.useRegisterFocusNavigableSurface;
local l_useDeRegisterFocusNavigableSurface_0 = l_FocusNavigableSurfaceRegistry_0.useDeRegisterFocusNavigableSurface;
local l_useFocusNavigableSurfaceRegistryConnection_0 = v6.useFocusNavigableSurfaceRegistryConnection;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v6.FocusNavigableSurfaceIdentifierEnum;
local v12 = require(l_script_FirstAncestor_0.Hooks.useRootFocusNavigationBindings);
local l_SceneView_0 = v4.SceneView;
local _ = require(l_Parent_0.Navigation);
local l_FFlagFocusRegistryConnectionRefactor_0 = require(l_Parent_0.SharedFlags).FFlagFocusRegistryConnectionRefactor;
local l_FFlagFix10ftGlobalNavSelection_0 = require(l_Parent_0.SharedFlags).FFlagFix10ftGlobalNavSelection;
return function(v17) --[[ Line: 30 ]] --[[ Name: SceneViewWithFocusRoot ]]
    -- upvalues: v3 (copy), v12 (copy), v5 (copy), l_FFlagFocusRegistryConnectionRefactor_0 (copy), l_useFocusNavigableSurfaceRegistryConnection_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_useRegisterFocusNavigableSurface_0 (copy), l_useDeRegisterFocusNavigableSurface_0 (copy), l_FFlagFix10ftGlobalNavSelection_0 (copy), l_SceneView_0 (copy)
    local v18, v19 = v3.useState(nil);
    local v20 = v12(v19);
    local v21 = v17.shouldRestoreFocus == nil or v17.shouldRestoreFocus;
    local v22 = v5.useMostRecentFocusBehavior(v20);
    local v23 = if v21 then v22 else v20;
    local l_isFocusable_0 = v17.isFocusable;
    if l_FFlagFocusRegistryConnectionRefactor_0 then
        l_useFocusNavigableSurfaceRegistryConnection_0(v18, l_FocusNavigableSurfaceIdentifierEnum_0.RouterView, l_isFocusable_0);
    else
        local v25 = l_useRegisterFocusNavigableSurface_0();
        local v26 = l_useDeRegisterFocusNavigableSurface_0();
        v3.useEffect(function() --[[ Line: 50 ]]
            -- upvalues: v18 (copy), l_isFocusable_0 (copy), v25 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (ref), v26 (copy)
            if v18 and l_isFocusable_0 then
                v25(l_FocusNavigableSurfaceIdentifierEnum_0.RouterView, v18);
            else
                v26(l_FocusNavigableSurfaceIdentifierEnum_0.RouterView, v18);
            end;
            return function() --[[ Line: 56 ]]
                -- upvalues: v26 (ref), l_FocusNavigableSurfaceIdentifierEnum_0 (ref), v18 (ref)
                v26(l_FocusNavigableSurfaceIdentifierEnum_0.RouterView, v18);
            end;
        end, {
            v18, 
            l_isFocusable_0
        });
    end;
    return v3.createElement("Frame", {
        Position = UDim2.fromOffset(0, 0), 
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        SelectionGroup = l_FFlagFix10ftGlobalNavSelection_0 and true or nil, 
        SelectionBehaviorLeft = if l_FFlagFix10ftGlobalNavSelection_0 then Enum.SelectionBehavior.Stop else nil, 
        SelectionBehaviorRight = if l_FFlagFix10ftGlobalNavSelection_0 then Enum.SelectionBehavior.Stop else nil, 
        ref = v23
    }, v3.createElement(l_SceneView_0, {
        navigation = v17.navigation, 
        component = v17.component, 
        screenProps = v17.screenProps
    }));
end;