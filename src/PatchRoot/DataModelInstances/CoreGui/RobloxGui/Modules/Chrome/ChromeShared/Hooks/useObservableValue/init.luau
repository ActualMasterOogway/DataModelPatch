local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChromeShared");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Service.ChromeUtils);
local v4 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagChromeObservableStateCheck();
return function(v5) --[[ Line: 9 ]]
    -- upvalues: v2 (copy), v4 (copy)
    if not v5 then
        warn("observableValue undefined");
        return nil;
    else
        local v6, v7 = v2.useState(v5:get());
        v2.useEffect(function() --[[ Line: 16 ]]
            -- upvalues: v5 (copy), v7 (copy), v4 (ref), v6 (copy)
            local v8 = v5:connect(function() --[[ Line: 17 ]]
                -- upvalues: v7 (ref), v5 (ref)
                v7(v5:get());
            end);
            if v4 and v6 ~= v5:get() then
                v7(v5:get());
            end;
            return function() --[[ Line: 27 ]]
                -- upvalues: v8 (copy)
                v8:disconnect();
            end;
        end, {
            v5
        });
        return v6;
    end;
end;