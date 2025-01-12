local v0 = require(script.Parent.Parent.NotificationsUpsellConstants);
return {
    getPushUpsellPromptedCount = function(v1) --[[ Line: 5 ]] --[[ Name: getPushUpsellPromptedCount ]]
        -- upvalues: v0 (copy)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 6 ]]
            -- upvalues: v1 (copy), v0 (ref)
            return v1:GetItem(v0.LocalStorageKeys.PromptShownCount);
        end);
        if l_status_0 then
            local v4 = tonumber(l_result_0);
            if v4 ~= nil then
                return v4;
            else
                return 0;
            end;
        else
            return -1;
        end;
    end, 
    getPushSysUpsellPromptTimestamp = function(v5) --[[ Line: 23 ]] --[[ Name: getPushSysUpsellPromptTimestamp ]]
        -- upvalues: v0 (copy)
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 24 ]]
            -- upvalues: v5 (copy), v0 (ref)
            return v5:GetItem(v0.LocalStorageKeys.SysPromptShownTimestamp);
        end);
        if l_status_1 then
            local v8 = tonumber(l_result_1);
            if v8 ~= nil then
                return v8;
            else
                return 0;
            end;
        else
            return -1;
        end;
    end, 
    getPushEduUpsellResponseTimestamp = function(v9) --[[ Line: 41 ]] --[[ Name: getPushEduUpsellResponseTimestamp ]]
        -- upvalues: v0 (copy)
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 42 ]]
            -- upvalues: v9 (copy), v0 (ref)
            return v9:GetItem(v0.LocalStorageKeys.EduPromptResponseTimestamp);
        end);
        if l_status_2 then
            local v12 = tonumber(l_result_2);
            if v12 ~= nil then
                return v12;
            else
                return 0;
            end;
        else
            return -1;
        end;
    end, 
    incrementPushUpsellPromptedCount = function(v13) --[[ Line: 59 ]] --[[ Name: incrementPushUpsellPromptedCount ]]
        -- upvalues: v0 (copy)
        local l_status_3, l_result_3 = pcall(function() --[[ Line: 60 ]]
            -- upvalues: v13 (copy), v0 (ref)
            return v13:GetItem(v0.LocalStorageKeys.PromptShownCount);
        end);
        if l_status_3 then
            local v16 = tonumber(l_result_3) or 0;
            pcall(function() --[[ Line: 66 ]]
                -- upvalues: v13 (copy), v0 (ref), v16 (copy)
                v13:SetItem(v0.LocalStorageKeys.PromptShownCount, (tostring(v16 + 1)));
                v13:Flush();
            end);
        end;
    end, 
    setPushSysUpsellPromptTimestamp = function(v17, v18) --[[ Line: 76 ]] --[[ Name: setPushSysUpsellPromptTimestamp ]]
        -- upvalues: v0 (copy)
        pcall(function() --[[ Line: 77 ]]
            -- upvalues: v17 (copy), v0 (ref), v18 (copy)
            v17:SetItem(v0.LocalStorageKeys.SysPromptShownTimestamp, (tostring(v18)));
            v17:Flush();
        end);
    end, 
    setPushEduUpsellResponseTimestamp = function(v19, v20) --[[ Line: 86 ]] --[[ Name: setPushEduUpsellResponseTimestamp ]]
        -- upvalues: v0 (copy)
        pcall(function() --[[ Line: 87 ]]
            -- upvalues: v19 (copy), v0 (ref), v20 (copy)
            v19:SetItem(v0.LocalStorageKeys.EduPromptResponseTimestamp, (tostring(v20)));
            v19:Flush();
        end);
    end, 
    setPushEduUpsellResponse = function(v21, v22) --[[ Line: 96 ]] --[[ Name: setPushEduUpsellResponse ]]
        -- upvalues: v0 (copy)
        pcall(function() --[[ Line: 97 ]]
            -- upvalues: v21 (copy), v0 (ref), v22 (copy)
            v21:SetItem(v0.LocalStorageKeys.EduPromptResponse, v22);
            v21:Flush();
        end);
    end
};