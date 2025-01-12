local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script:FindFirstAncestor("SharedFlags").Parent;
local l_AppStorageJsonCacheUtils_0 = require(l_Parent_0.AppCommonLib).Utils.AppStorageJsonCacheUtils;
local v4 = game:DefineFastFlag("LuaAppEnableFoundationColors7", false);
local v5 = require(script.Parent.GetFFlagEnableAppStorageJsonCacheInABTest);
local v6 = game:DefineFastFlag("LuaAppByPassFoundationColors", false);
local v7 = game:DefineFastFlag("LuaAppFoundationColorsABTest7", false);
local v8 = game:DefineFastString("LuaAppFoundationColorsABTest_LayerName", "Universality.FoundationColors");
local v9 = game:DefineFastString("LuaAppFoundationColorsABTest_VariantKey", "FoundationColorsVariant");
local v10 = nil;
local function v18() --[[ Line: 22 ]] --[[ Name: enabledByIXP ]]
    -- upvalues: v4 (copy), v6 (copy), v7 (copy), v5 (copy), l_AppStorageJsonCacheUtils_0 (copy), v8 (copy), l_AppStorageService_0 (copy), l_HttpService_0 (copy), v9 (copy)
    if v4 and not v6 then
        return true;
    elseif v7 then
        local v11 = nil;
        if v5() then
            local v12 = l_AppStorageJsonCacheUtils_0.default:getCachedJsonForKey("ExperimentCache");
            if v12 then
                v11 = v12[v8] or nil;
            end;
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 36 ]]
                -- upvalues: l_AppStorageService_0 (ref)
                return l_AppStorageService_0:GetItem("ExperimentCache");
            end);
            if l_status_0 then
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 40 ]]
                    -- upvalues: l_HttpService_0 (ref), l_result_0 (copy)
                    return l_HttpService_0:JSONDecode(l_result_0);
                end);
                if l_status_1 then
                    v11 = l_result_1[v8] or nil;
                end;
            end;
        end;
        if v11 then
            local v17 = v11[v9] or nil;
            if v17 == nil then
                return false;
            else
                return tonumber(v17) == 1;
            end;
        else
            return false;
        end;
    else
        return false;
    end;
end;
return function() --[[ Line: 66 ]]
    -- upvalues: v10 (ref), v18 (copy)
    if v10 == nil then
        v10 = v18();
    end;
    return v10;
end;