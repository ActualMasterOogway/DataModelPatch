local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Roact_0 = require(l_script_FirstAncestor_0.dependencies).Roact;
local v2 = require(l_script_FirstAncestor_0.Enums.LocalizedKeys);
local v3 = require(l_script_FirstAncestor_0.Components.HeaderBarRightView);
local v4 = require(l_script_FirstAncestor_0.Components.HeaderBarCenterView);
return function(v5) --[[ Line: 9 ]]
    -- upvalues: v2 (copy), l_Roact_0 (copy), v3 (copy), v4 (copy)
    return {
        headerText = {
            raw = v2.FriendsHeader.rawValue(), 
            shouldLocalize = true
        }, 
        useSecondaryHeader = true, 
        shouldExitNavigation = false, 
        tabBarVisible = false, 
        renderRight = function() --[[ Line: 18 ]] --[[ Name: renderRight ]]
            -- upvalues: l_Roact_0 (ref), v3 (ref), v5 (copy)
            return l_Roact_0.createElement(v3, v5);
        end, 
        renderCenter = function() --[[ Line: 21 ]] --[[ Name: renderCenter ]]
            -- upvalues: l_Roact_0 (ref), v4 (ref), v5 (copy)
            return l_Roact_0.createElement(v4, v5);
        end, 
        transparent = true, 
        absorbInputSelectable = false
    };
end;