local _ = script.Parent.Parent;
local l_Modules_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui"):WaitForChild("Modules");
local v2 = require(l_Modules_0.Common.IXPServiceWrapper);
return {
    new = function() --[[ Line: 16 ]] --[[ Name: new ]]
        -- upvalues: v2 (copy)
        local v3 = {};
        setmetatable(v3, {
            __tostring = function() --[[ Line: 20 ]] --[[ Name: __tostring ]]
                return "Service(ABTest)";
            end
        });
        v3.getLayerData = function(v4) --[[ Line: 25 ]] --[[ Name: getLayerData ]]
            -- upvalues: v2 (ref)
            return v2:GetLayerData(v4);
        end;
        v3.logUserLayerExposure = function(v5) --[[ Line: 29 ]] --[[ Name: logUserLayerExposure ]]
            -- upvalues: v2 (ref)
            v2:LogUserLayerExposure(v5);
        end;
        return v3;
    end
};