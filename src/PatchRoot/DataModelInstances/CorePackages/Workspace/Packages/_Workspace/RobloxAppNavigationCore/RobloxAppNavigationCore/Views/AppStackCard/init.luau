local l_Parent_0 = script:FindFirstAncestor("RobloxAppNavigationCore").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.ReactRoblox);
local _ = require(l_Parent_0.TenFootUiShell).Views.RouteViewState;
local l_FFlagEnableRNFocusRestoration_0 = require(l_Parent_0.SharedFlags).FFlagEnableRNFocusRestoration;
local _ = require(l_Parent_0.Navigation);
local v6 = require(script.Parent.AppCard);
local function _(v7) --[[ Line: 28 ]] --[[ Name: wrapWithPeekViewPortal ]]
    -- upvalues: v2 (copy), v1 (copy)
    return function(v8) --[[ Line: 29 ]]
        -- upvalues: v2 (ref), v1 (ref), v7 (copy)
        return v2.createPortal({
            v1.createElement(v7, v8)
        }, v8.peekViewParent);
    end;
end;
local function v11(v10) --[[ Line: 29 ]]
    -- upvalues: v2 (copy), v1 (copy), v6 (copy)
    return v2.createPortal({
        v1.createElement(v6, v10)
    }, v10.peekViewParent);
end;
return function(v12) --[[ Line: 38 ]] --[[ Name: AppStackCard ]]
    -- upvalues: v1 (copy), v11 (copy), v6 (copy), l_FFlagEnableRNFocusRestoration_0 (copy)
    v1.useEffect(function() --[[ Line: 39 ]]
        -- upvalues: v12 (copy)
        v12.onAnimationComplete();
    end, {
        v12.onAnimationComplete
    });
    local v13 = v1.useMemo(function() --[[ Line: 43 ]]
        -- upvalues: v12 (copy), v11 (ref), v6 (ref)
        if v12.descriptor.options.isPeekView or v12.descriptor.options.nativeWrapper then
            return v11;
        else
            return v6;
        end;
    end, {
        v12.descriptor.options.isPeekView
    });
    return v1.createElement(v13, {
        isActive = if l_FFlagEnableRNFocusRestoration_0 then v12.isActive else nil, 
        descriptor = v12.descriptor, 
        screenProps = v12.screenProps, 
        isVisible = v12.isVisible, 
        ZIndex = v12.ZIndex, 
        peekViewParent = v12.screenProps.peekViewParent
    });
end;