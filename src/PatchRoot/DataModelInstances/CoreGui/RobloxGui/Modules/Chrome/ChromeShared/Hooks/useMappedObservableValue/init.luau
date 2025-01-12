local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChromeShared");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Service.ChromeUtils);
local v4 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagChromeObservableStateCheck();
return function(v5, v6) --[[ Line: 13 ]]
    -- upvalues: v2 (copy), v4 (copy)
    if not v5 then
        warn("observableValue undefined");
        return nil;
    else
        local v7, v8 = v2.useState(v6(v5:get()));
        v2.useEffect(function() --[[ Line: 20 ]]
            -- upvalues: v5 (copy), v8 (copy), v6 (copy), v4 (ref), v7 (copy)
            local v9 = v5:connect(function() --[[ Line: 21 ]]
                -- upvalues: v8 (ref), v6 (ref), v5 (ref)
                v8(v6(v5:get()));
            end);
            if v4 then
                local v10 = v6(v5:get());
                if v7 ~= v10 then
                    v8(v10);
                end;
            end;
            return function() --[[ Line: 32 ]]
                -- upvalues: v9 (copy)
                v9:disconnect();
            end;
        end, {
            v5
        });
        return v7;
    end;
end;