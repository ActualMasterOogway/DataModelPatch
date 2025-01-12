local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(script.Parent.mockProviders);
return function(v3, v4) --[[ Line: 9 ]]
    -- upvalues: v2 (copy), v1 (copy)
    if v4 == nil then
        v4 = Instance.new("Frame");
    end;
    local v5 = v2(v3);
    local v6 = v1.mount(v5, v4);
    return v4, function() --[[ Line: 16 ]]
        -- upvalues: v1 (ref), v6 (copy), v4 (ref)
        v1.unmount(v6);
        v4:Destroy();
    end;
end;