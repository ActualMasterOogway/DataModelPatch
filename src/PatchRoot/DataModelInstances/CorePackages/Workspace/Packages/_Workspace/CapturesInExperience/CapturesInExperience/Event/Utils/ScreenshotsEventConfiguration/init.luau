local l_script_FirstAncestor_0 = script:FindFirstAncestor("CapturesInExperience");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_script_FirstAncestor_0.Event.Common.Constants);
local v5 = require(l_script_FirstAncestor_0.Event.Flags.FFlagCapturesAddShouldForceDisableKey);
local v6 = {};
local v7 = {
    hasForceDisabled = v5 and true or nil, 
    shouldShowSplash = true, 
    shouldOverrideCapturesButton = true
};
v6.decodeData = function(v8) --[[ Line: 21 ]]
    -- upvalues: l_HttpService_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 22 ]]
        -- upvalues: l_HttpService_0 (ref), v8 (copy)
        return l_HttpService_0:JSONDecode(v8);
    end);
    return l_status_0 and l_result_0 and typeof(l_result_0) == "table", l_result_0;
end;
v6.getShouldForceDisable = function(v11, v12) --[[ Line: 30 ]]
    -- upvalues: v4 (copy), v6 (copy), v3 (copy), v7 (copy), l_HttpService_0 (copy)
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 31 ]]
        -- upvalues: v11 (copy), v4 (ref)
        return v11:GetItem(v4.StorageKeyScreenshotEventTracking);
    end);
    if not l_status_1 then
        return false;
    else
        local v15, v16 = v6.decodeData(l_result_1);
        if not v15 or not v16 then
            return false;
        elseif v16[v12] and v16[v12].shouldOverrideCapturesButton and not v16[v12].hasForceDisabled then
            local v17 = v3.Dictionary.union(v16[v12] or v7, {
                hasForceDisabled = true, 
                shouldOverrideCapturesButton = false
            });
            local v18 = l_HttpService_0:JSONEncode(v3.Dictionary.union(v16, {
                [v12] = v17
            }));
            v11:SetItem(v4.StorageKeyScreenshotEventTracking, v18);
            v11:Flush();
            return true;
        else
            return false;
        end;
    end;
end;
return v6;