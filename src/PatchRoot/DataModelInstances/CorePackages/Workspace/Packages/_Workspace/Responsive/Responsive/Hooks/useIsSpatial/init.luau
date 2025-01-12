local l_VRService_0 = game:GetService("VRService");
local l_Parent_0 = script:FindFirstAncestor("Responsive").Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.AppCommonLib);
if require(l_Parent_0.SharedFlags).FFlagAppNavUpdateUseIsSpatial then
    return function() --[[ Line: 10 ]] --[[ Name: useIsSpatial ]]
        -- upvalues: v2 (copy), v3 (copy)
        local v4, v5 = v2.useState(v3.isSpatial);
        v2.useEffect(function() --[[ Line: 12 ]]
            -- upvalues: v5 (copy), v3 (ref)
            v5(v3.isSpatial());
            local v7 = v3.connectToIsSpatialChanged(function(v6) --[[ Line: 14 ]]
                -- upvalues: v5 (ref)
                v5(v6);
            end);
            return function() --[[ Line: 17 ]]
                -- upvalues: v7 (copy)
                v7:Disconnect();
            end;
        end, {});
        return v4;
    end;
else
    return function() --[[ Line: 26 ]] --[[ Name: useIsSpatial ]]
        -- upvalues: v2 (copy), l_VRService_0 (copy)
        local v8, v9 = v2.useState(l_VRService_0.VREnabled);
        v2.useEffect(function() --[[ Line: 28 ]]
            -- upvalues: v9 (copy), l_VRService_0 (ref)
            v9(l_VRService_0.VREnabled);
            local v10 = l_VRService_0:GetPropertyChangedSignal("VREnabled"):Connect(function() --[[ Line: 30 ]]
                -- upvalues: v9 (ref), l_VRService_0 (ref)
                v9(l_VRService_0.VREnabled);
            end);
            return function() --[[ Line: 33 ]]
                -- upvalues: v10 (copy)
                v10:Disconnect();
            end;
        end, {});
        return v8;
    end;
end;