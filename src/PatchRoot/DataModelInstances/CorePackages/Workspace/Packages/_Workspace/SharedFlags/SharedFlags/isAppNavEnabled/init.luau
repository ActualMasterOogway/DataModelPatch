local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script:FindFirstAncestor("SharedFlags").Parent;
local l_AppStorageJsonCacheUtils_0 = require(l_Parent_0.AppCommonLib).Utils.AppStorageJsonCacheUtils;
local v4 = game:DefineFastFlag("DevEnableAppNavIXP", false);
local v5 = game:DefineFastFlag("EnableAppNavABTest2", false);
local v6 = game:DefineFastString("LuaAppUniversalityAppNavLayerName", "Universality.AppNav");
local v7 = require(script.Parent.GetFFlagLuaAppUseAppHeaderBar);
local v8 = require(script.Parent.GetFFlagEnableAppStorageJsonCacheInABTest);
local v9 = nil;
local function v17() --[[ Line: 24 ]] --[[ Name: enabledByIXP ]]
    -- upvalues: v4 (copy), v5 (copy), v8 (copy), l_AppStorageJsonCacheUtils_0 (copy), v6 (copy), l_AppStorageService_0 (copy), l_HttpService_0 (copy)
    if v4 then
        return true;
    elseif v5 then
        local v10 = nil;
        if v8() then
            local v11 = l_AppStorageJsonCacheUtils_0.default:getCachedJsonForKey("ExperimentCache");
            if v11 then
                v10 = v11[v6] or v11["Universality.AppNav"] or nil;
            end;
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 38 ]]
                -- upvalues: l_AppStorageService_0 (ref)
                return l_AppStorageService_0:GetItem("ExperimentCache");
            end);
            if l_status_0 then
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 42 ]]
                    -- upvalues: l_HttpService_0 (ref), l_result_0 (copy)
                    return l_HttpService_0:JSONDecode(l_result_0);
                end);
                if l_status_1 then
                    v10 = l_result_1[v6] or l_result_1["Universality.AppNav"] or nil;
                end;
            end;
        end;
        if v10 then
            local v16 = v10.AppNavVariant or nil;
            if v16 == nil then
                return false;
            else
                return tonumber(v16) == 1;
            end;
        else
            return false;
        end;
    else
        return false;
    end;
end;
return function() --[[ Line: 69 ]]
    -- upvalues: v9 (ref), v17 (copy), v7 (copy)
    if v9 == nil then
        v9 = v17();
    end;
    return v9 and v7();
end;