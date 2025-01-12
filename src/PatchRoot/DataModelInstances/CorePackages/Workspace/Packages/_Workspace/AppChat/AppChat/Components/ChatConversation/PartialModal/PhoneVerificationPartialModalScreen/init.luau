local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local l_useCallback_0 = v3.useCallback;
local l_useEffectOnMount_0 = require(l_Parent_0.RoactUtils).Hooks.useEffectOnMount;
local v6 = require(l_script_FirstAncestor_0.EnumScreens);
local v7 = require(script.Parent.PhoneVerificationPartialModalContainer);
local v8 = require(script.Parent.Logger);
local v9 = {};
return function(v10) --[[ Line: 21 ]] --[[ Name: PhoneVerificationPartialModalScreen ]]
    -- upvalues: v2 (copy), v9 (copy), l_useEffectOnMount_0 (copy), v8 (copy), l_useCallback_0 (copy), v6 (copy), v3 (copy), v7 (copy)
    local v11 = v2.Dictionary.union(v9, v10);
    local l_navigation_0 = v11.navigation;
    assert(type(l_navigation_0) ~= "nil", "PhoneVerificationPartialModalScreen should be wrapped with React Navigation");
    local v13 = l_navigation_0 and l_navigation_0.getParam and l_navigation_0.getParam("conversationId", nil);
    l_useEffectOnMount_0(function() --[[ Line: 27 ]]
        -- upvalues: v8 (ref)
        v8:info("PhoneVerificationPartialModalScreen mounted");
    end);
    local v14 = l_useCallback_0(function() --[[ Line: 31 ]]
        -- upvalues: l_navigation_0 (copy)
        l_navigation_0.goBack();
    end, {
        l_navigation_0
    });
    local v15 = l_useCallback_0(function() --[[ Line: 35 ]]
        -- upvalues: v8 (ref), v11 (copy), v6 (ref), v13 (copy)
        v8:info("Navigating to CreateUnfilteredChatPartialModal for PhoneVerificationPartialModal");
        v11.navigation.replace(v6.CreateUnfilteredChatPartialModal, {
            conversationId = v13
        });
    end, {
        l_navigation_0, 
        v13
    });
    return v3.createElement(v7, {
        conversationId = v13, 
        onDismissed = v14, 
        navigateToCreateUnfilteredChat = v15
    });
end;