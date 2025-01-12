local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local v1 = require(l_Parent_0.React);
local l_useFocusNavigableSurfaceRegistryConnection_0 = require(l_Parent_0.FocusNavigationUtils).useFocusNavigableSurfaceRegistryConnection;
local l_FocusNavigableSurfaceIdentifierEnum_0 = require(l_Parent_0.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum;
return function(v4) --[[ Line: 8 ]] --[[ Name: Overlay ]]
    -- upvalues: v1 (copy), l_useFocusNavigableSurfaceRegistryConnection_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy)
    local v5 = v1.useRef(nil);
    l_useFocusNavigableSurfaceRegistryConnection_0(v5.current, l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay);
    local v6 = table.clone(v4);
    v6.ref = v5;
    v6.SelectionGroup = true;
    v6.SelectionBehaviorDown = Enum.SelectionBehavior.Stop;
    v6.SelectionBehaviorUp = Enum.SelectionBehavior.Stop;
    v6.SelectionBehaviorRight = Enum.SelectionBehavior.Stop;
    v6.SelectionBehaviorLeft = Enum.SelectionBehavior.Stop;
    return v1.createElement("Frame", v6);
end;