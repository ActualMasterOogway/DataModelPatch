local l_Parent_0 = script:FindFirstAncestor("Navigation").Parent;
local l_Actions_0 = require(l_Parent_0.RoactNavigation).Actions;
local _ = require(script.Parent.NavigationTypes);
local v3 = require(script.Parent.getRootNavigation);
local l_FFlagFixCanGoBackForPop_0 = require(l_Parent_0.SharedFlags).FFlagFixCanGoBackForPop;
return function(v5) --[[ Line: 13 ]] --[[ Name: canGoBack ]]
    -- upvalues: v3 (copy), l_FFlagFixCanGoBackForPop_0 (copy), l_Actions_0 (copy)
    local v6 = v3(v5);
    local l_state_0 = v6.state;
    if l_FFlagFixCanGoBackForPop_0 then
        return l_state_0 ~= v6.router.getStateForAction(l_Actions_0.back({
            key = false
        }), l_state_0);
    else
        return v6.router.getStateForAction(l_Actions_0.back(), l_state_0) ~= l_state_0;
    end;
end;