local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_RunService_0 = game:GetService("RunService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Flags.GetFFlagAbuseReportTabHideShowRetimingEnabled);
return function(v5, v6, v7, v8, v9, v10) --[[ Line: 10 ]]
    -- upvalues: v3 (copy), v4 (copy), l_RunService_0 (copy)
    local v11, v12 = v3.useState(false);
    v3.useEffect(function() --[[ Line: 19 ]]
        -- upvalues: v6 (copy), v11 (copy), v12 (copy), v5 (copy), v7 (copy), v4 (ref), l_RunService_0 (ref), v9 (copy), v8 (copy), v10 (copy)
        if v6 then
            if v11 then
                v12(false);
                return;
            elseif v5 then
                v12(true);
                v7();
                local v13 = nil;
                local v14 = 0;
                local v15 = 0;
                local v16 = nil;
                local v17 = nil;
                if v4() then
                    v17 = os.clock();
                end;
                v13 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 37 ]]
                    -- upvalues: v14 (ref), v9 (ref), v13 (ref)
                    if v14 == 1 then
                        v9();
                        v13:Disconnect();
                        return;
                    else
                        v14 = v14 + 1;
                        return;
                    end;
                end);
                v16 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 48 ]]
                    -- upvalues: v4 (ref), v17 (ref), v15 (ref), v16 (ref), v8 (ref)
                    if v4() then
                        if os.clock() - v17 >= 0.16666666666666666 and v15 >= 10 then
                            v16:Disconnect();
                            v8();
                            return;
                        end;
                    elseif v15 == 10 then
                        v8();
                        v16:Disconnect();
                        return;
                    end;
                    v15 = v15 + 1;
                end);
                return;
            end;
        elseif not v11 then
            v10();
        end;
    end, {
        v6
    });
end;