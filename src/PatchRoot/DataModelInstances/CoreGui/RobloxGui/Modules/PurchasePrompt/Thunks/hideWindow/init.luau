local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Actions.SetWindowState);
local v2 = require(l_Parent_0.Enums.WindowState);
local v3 = require(l_Parent_0.Thunk);
return function() --[[ Line: 7 ]] --[[ Name: hideWindow ]]
    -- upvalues: v3 (copy), v1 (copy), v2 (copy)
    return v3.new(script.Name, {}, function(v4, _) --[[ Line: 8 ]]
        -- upvalues: v1 (ref), v2 (ref)
        return v4:dispatch(v1(v2.Hidden));
    end);
end;