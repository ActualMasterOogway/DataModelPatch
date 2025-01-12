local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent.Parent;
local v3 = require(l_Parent_2.React);
local v4 = require(l_Parent_0.FeedbackManagerInjectionContext);
local v5 = require(l_Parent_1.Control.Enum.ControlState);
local function v9(v6, v7) --[[ Line: 11 ]] --[[ Name: resolveInteractionType ]]
    -- upvalues: v5 (copy)
    local _ = nil;
    if v7 == v5.Pressed or v7 == v5.SelectedPressed then
        return "Press";
    elseif (v7 == v5.Hover or v7 == v5.Selected) and v6 == v5.Default then
        return "Hover";
    elseif (v6 == v5.Pressed or v6 == v5.SelectedPressed) and v7 ~= v5.Disabled then
        return "Release";
    else
        return nil;
    end;
end;
return function() --[[ Line: 34 ]] --[[ Name: useInteractionFeedback ]]
    -- upvalues: v3 (copy), v4 (copy), v9 (copy)
    local v10 = v3.useContext(v4);
    return v3.useCallback(function(v11, v12, v13) --[[ Line: 37 ]]
        -- upvalues: v9 (ref), v10 (copy)
        local v14 = v9(v12, v13);
        if v14 then
            v10(v11 or "Default", v14);
        end;
    end, {
        v10
    });
end;