local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(script.Parent.mockProviders);
return function(v4, v5) --[[ Line: 20 ]]
    -- upvalues: l_HttpService_0 (copy), v3 (copy), v2 (copy)
    v5 = v5 or {};
    local l_parent_0 = v5.parent;
    if l_parent_0 == nil then
        l_parent_0 = Instance.new("Frame");
        l_parent_0.Name = l_HttpService_0:GenerateGUID(false);
    end;
    local v7 = v3(v4, v5);
    local v8 = v2.mount(v7, l_parent_0);
    return l_parent_0, function() --[[ Line: 31 ]]
        -- upvalues: v2 (ref), v8 (copy), l_parent_0 (ref)
        v2.unmount(v8);
        l_parent_0:Destroy();
    end;
end;