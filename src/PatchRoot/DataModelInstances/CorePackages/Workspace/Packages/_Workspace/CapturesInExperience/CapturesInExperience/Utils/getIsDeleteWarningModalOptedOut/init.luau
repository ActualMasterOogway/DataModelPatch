local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Constants);
local v4 = require(l_Parent_0.Utils.getLocalUserId);
local v5 = require(l_Parent_0.Utils.getUserIdsFromString);
return function() --[[ Line: 10 ]]
    -- upvalues: l_AppStorageService_0 (copy), v3 (copy), v5 (copy), v4 (copy), l_Players_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 11 ]]
        -- upvalues: l_AppStorageService_0 (ref), v3 (ref)
        return l_AppStorageService_0:GetItem(v3.DeleteWarningModalOptOutStorageKey);
    end);
    if l_status_0 and l_result_0 ~= "" and v5(l_result_0)[v4(l_Players_0) or ""] then
        return true;
    else
        return false;
    end;
end;