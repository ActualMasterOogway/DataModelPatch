local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.RoactUtils);
local v5 = require(l_Parent_0.Navigation);
local v6 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v7 = require(script.Parent.ProfileContextualMenu);
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local v9 = require(l_script_FirstAncestor_0.Hooks.useProfileActions);
local l_useSelector_0 = v4.Hooks.RoactRodux.useSelector;
local l_useNavigation_0 = v5.useNavigation;
local v12 = require(l_script_FirstAncestor_0.Common.Constants);
local v13 = require(l_script_FirstAncestor_0.Common.Enums);
local v14 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v15 = game:DefineFastFlag("ProfilePlatformConsolidateNavigationProps", false);
return function(v16) --[[ Line: 21 ]] --[[ Name: ProfileContextualMenuContainer ]]
    -- upvalues: l_useScreenSize_0 (copy), l_useNavigation_0 (copy), v15 (copy), v12 (copy), v6 (copy), l_useSelector_0 (copy), v14 (copy), v13 (copy), v9 (copy), v2 (copy), v3 (copy), v7 (copy)
    local v17 = l_useScreenSize_0();
    local v18 = l_useNavigation_0();
    local v19 = nil;
    local v20 = nil;
    if v15 then
        v19 = v18.getParam(v12.Navigation.ON_CLOSE);
        v20 = v18.getParam(v12.Navigation.GET_ROOT_ELEMENT_REF);
    else
        v19 = v16.navigation.getParam(v12.Navigation.ON_CLOSE);
        v20 = v16.navigation.getParam(v12.Navigation.GET_ROOT_ELEMENT_REF);
    end;
    local l_profileUserId_0 = v6().profileUserId;
    local v22 = v20();
    local v23 = if v22 then v22.AbsolutePosition else Vector2.new(0, 0);
    local v25 = l_useSelector_0(function(v24) --[[ Line: 38 ]]
        -- upvalues: v14 (ref), v12 (ref), l_profileUserId_0 (copy), v13 (ref)
        return v14(v24, (("%*.Users.%*.components.%*"):format(v12.RODUX_KEY, l_profileUserId_0, v13.Components.Actions))) or {};
    end);
    local v26 = v9(v13.ButtonSurface.ContextualMenu);
    local l_contextual_0 = v25.contextual;
    local v28 = v2.useCallback(function() --[[ Line: 46 ]]
        -- upvalues: v18 (copy), v19 (ref)
        v18.pop();
        v19();
    end, {
        v18, 
        v19
    });
    local v31 = v2.useMemo(function() --[[ Line: 51 ]]
        -- upvalues: l_contextual_0 (copy), v3 (ref), v26 (copy), v28 (copy)
        if not l_contextual_0 then
            return {};
        else
            return v3.List.map(l_contextual_0, function(v29) --[[ Line: 56 ]]
                -- upvalues: v26 (ref), v28 (ref)
                local v30 = v26[v29];
                return {
                    icon = v30.icon, 
                    text = v30.text, 
                    onActivated = function() --[[ Line: 61 ]] --[[ Name: onActivated ]]
                        -- upvalues: v28 (ref), v30 (copy)
                        v28();
                        v30.onActivated();
                    end
                };
            end);
        end;
    end, {
        l_contextual_0, 
        v28
    });
    return v2.createElement(v7, {
        buttonProps = v31, 
        screenSize = v17, 
        onDismiss = v28, 
        rootElementPosition = v23
    });
end;