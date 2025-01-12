local l_Parent_0 = script:FindFirstAncestor("RobloxAppNavigationCore").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.TenFootUiShell);
local l_RouteViewState_0 = v2.Views.RouteViewState;
local l_useStackScreens_0 = v2.Hooks.useStackScreens;
local _ = require(l_Parent_0.Navigation);
local v6 = require(script.Parent.AppStackCard);
local l_FFlagEnableRNFocusRestoration_0 = require(l_Parent_0.SharedFlags).FFlagEnableRNFocusRestoration;
return function(v8) --[[ Line: 30 ]] --[[ Name: AppStackView ]]
    -- upvalues: l_useStackScreens_0 (copy), v1 (copy), v6 (copy), l_FFlagEnableRNFocusRestoration_0 (copy), l_RouteViewState_0 (copy)
    local v9 = l_useStackScreens_0({
        navigation = v8.navigation, 
        descriptors = v8.descriptors
    });
    local v12 = v1.useMemo(function() --[[ Line: 36 ]]
        -- upvalues: v9 (copy)
        for v10 = #v9, 1, -1 do
            local l_descriptor_0 = v9[v10].descriptor;
            if not l_descriptor_0.options.transparent and not l_descriptor_0.options.overlayEnabled then
                return v10;
            end;
        end;
        return 0;
    end, {
        v9
    });
    local v13 = {};
    for v14, v15 in v9 do
        v13[v15.descriptor.key] = v1.createElement(v6, {
            isActive = if l_FFlagEnableRNFocusRestoration_0 then v14 == #v9 else nil, 
            descriptor = v15.descriptor, 
            screenProps = v8.screenProps, 
            isVisible = v12 <= v14, 
            ZIndex = v14, 
            onAnimationComplete = function() --[[ Line: 54 ]] --[[ Name: onAnimationComplete ]]
                -- upvalues: v15 (copy), l_RouteViewState_0 (ref)
                if v15.viewState == l_RouteViewState_0.ViewState.Opening or v15.viewState == l_RouteViewState_0.ViewState.Opened then
                    v15.setOpened();
                    return;
                else
                    if v15.viewState == l_RouteViewState_0.ViewState.Closing then
                        v15.setClosed();
                    end;
                    return;
                end;
            end
        });
    end;
    return v13;
end;