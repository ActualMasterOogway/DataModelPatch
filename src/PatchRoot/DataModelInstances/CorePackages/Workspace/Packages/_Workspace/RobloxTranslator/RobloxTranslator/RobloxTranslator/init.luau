local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local v4 = nil;
local function _() --[[ Line: 8 ]] --[[ Name: getFallbackTranslator ]]
    -- upvalues: v4 (ref), l_CoreGui_0 (copy)
    if not v4 then
        v4 = l_CoreGui_0.CoreScriptLocalization:GetTranslator("en-us");
    end;
    return v4;
end;
game:DefineFastFlag("BypassTranslatorYieldInStudioEditMode", false);
if game:GetFastFlag("BypassTranslatorYieldInStudioEditMode") then
    if l_RunService_0:IsClient() and not l_RunService_0:IsEdit() and l_Players_0.LocalPlayer == nil then
        l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
    end;
elseif l_RunService_0:IsClient() and l_Players_0.LocalPlayer == nil then
    l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
end;
local v6 = nil;
local function _() --[[ Line: 33 ]] --[[ Name: getTranslator ]]
    -- upvalues: l_LocalizationService_0 (copy), v4 (ref), l_CoreGui_0 (copy), v6 (ref)
    if not l_LocalizationService_0.RobloxLocaleId then
        if not v4 then
            v4 = l_CoreGui_0.CoreScriptLocalization:GetTranslator("en-us");
        end;
        return v4;
    else
        if v6 == nil then
            v6 = l_CoreGui_0.CoreScriptLocalization:GetTranslator(l_LocalizationService_0.RobloxLocaleId);
        end;
        return v6;
    end;
end;
local v8 = {};
local function _(v9) --[[ Line: 46 ]] --[[ Name: getTranslatorForLocale ]]
    -- upvalues: v8 (copy), l_CoreGui_0 (copy)
    local v10 = v8[v9];
    if v10 then
        return v10;
    else
        v10 = l_CoreGui_0.CoreScriptLocalization:GetTranslator(v9);
        v8[v9] = v10;
        return v10;
    end;
end;
local function v17(v12, v13, v14) --[[ Line: 58 ]] --[[ Name: formatByKeyWithFallback ]]
    -- upvalues: v4 (ref), l_CoreGui_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 59 ]]
        -- upvalues: v14 (copy), v12 (copy), v13 (copy)
        return v14:FormatByKey(v12, v13);
    end);
    if l_status_0 then
        return l_result_0;
    elseif v14.LocaleId == "zh-cjv" then
        return "";
    else
        if not v4 then
            v4 = l_CoreGui_0.CoreScriptLocalization:GetTranslator("en-us");
        end;
        return v4:FormatByKey(v12, v13);
    end;
end;
return {
    FormatByKey = function(_, v19, v20) --[[ Line: 76 ]] --[[ Name: FormatByKey ]]
        -- upvalues: v17 (copy), l_LocalizationService_0 (copy), v4 (ref), l_CoreGui_0 (copy), v6 (ref)
        local l_v17_0 = v17;
        local l_v19_0 = v19;
        local l_v20_0 = v20;
        local v24;
        if not l_LocalizationService_0.RobloxLocaleId then
            if not v4 then
                v4 = l_CoreGui_0.CoreScriptLocalization:GetTranslator("en-us");
            end;
            v24 = v4;
        else
            if v6 == nil then
                v6 = l_CoreGui_0.CoreScriptLocalization:GetTranslator(l_LocalizationService_0.RobloxLocaleId);
            end;
            v24 = v6;
        end;
        return l_v17_0(l_v19_0, l_v20_0, v24);
    end, 
    FormatByKeyForLocale = function(_, v26, v27, v28) --[[ Line: 80 ]] --[[ Name: FormatByKeyForLocale ]]
        -- upvalues: v17 (copy), v8 (copy), l_CoreGui_0 (copy)
        local l_v17_1 = v17;
        local l_v26_0 = v26;
        local l_v28_0 = v28;
        local v32 = v8[v27];
        local v33;
        if v32 then
            v33 = v32;
        else
            v32 = l_CoreGui_0.CoreScriptLocalization:GetTranslator(v27);
            v8[v27] = v32;
            v33 = v32;
        end;
        return l_v17_1(l_v26_0, l_v28_0, v33);
    end
};