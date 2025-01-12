local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.Roact);
local v4 = require(l_Parent_0.mockStyle);
return function(v5) --[[ Line: 8 ]]
    -- upvalues: l_HttpService_0 (copy), v4 (copy), v3 (copy)
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Name = l_HttpService_0:GenerateGUID(false);
    local v7 = v4(v5);
    local v8 = v3.mount(v7, l_Frame_0);
    return l_Frame_0, function() --[[ Line: 14 ]]
        -- upvalues: v3 (ref), v8 (copy), l_Frame_0 (copy)
        v3.unmount(v8);
        l_Frame_0:Destroy();
    end;
end;