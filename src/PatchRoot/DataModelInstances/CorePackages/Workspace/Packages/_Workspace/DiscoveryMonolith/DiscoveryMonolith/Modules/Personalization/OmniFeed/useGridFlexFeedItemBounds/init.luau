local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactUtils);
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v7 = require(l_Modules_0.Personalization.OmniFeed.DataStore.SetGameGridFlexFeedItemInput);
local v8 = require(l_Modules_0.Personalization.OmniFeed.DataStore.ClearGameGridFlexFeedItemBounds);
return function(v9, v10, v11, v12) --[[ Line: 19 ]] --[[ Name: useGridFlexFeedItemBounds ]]
    -- upvalues: l_useDispatch_0 (copy), l_useSelector_0 (copy), v2 (copy), v7 (copy), v8 (copy)
    local v13 = l_useDispatch_0();
    local v15 = l_useSelector_0(function(v14) --[[ Line: 27 ]]
        -- upvalues: v9 (copy), v10 (copy)
        return ((v14.Personalization.GameGridFlexFeedItemBounds[v9] or {}).flexItemsBounds or {})[v10];
    end);
    v2.useEffect(function() --[[ Line: 34 ]]
        -- upvalues: v11 (copy), v13 (copy), v7 (ref), v9 (copy), v10 (copy), v12 (copy), v8 (ref)
        if v11 and v11 > 0 then
            v13(v7(v9, v10, v11 * v12));
        end;
        return function() --[[ Line: 38 ]]
            -- upvalues: v13 (ref), v8 (ref), v9 (ref), v10 (ref)
            v13(v8(v9, v10));
        end;
    end, {
        v9, 
        v10, 
        v11, 
        v12
    });
    return v15;
end;