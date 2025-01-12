local _ = script.Parent;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RoactRodux_0 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptDeps).RoactRodux;
return function(v3, v4) --[[ Line: 12 ]] --[[ Name: connectToStore ]]
    -- upvalues: l_RoactRodux_0 (copy)
    return function(v5) --[[ Line: 13 ]]
        -- upvalues: l_RoactRodux_0 (ref), v3 (copy), v4 (copy)
        local v6 = l_RoactRodux_0.UNSTABLE_connect2(v3, v4)(v5);
        v6.getUnconnected = function() --[[ Line: 16 ]] --[[ Name: getUnconnected ]]
            -- upvalues: v5 (copy)
            return v5;
        end;
        return v6;
    end;
end;