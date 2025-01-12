local l_Parent_0 = script:FindFirstAncestor("RobloxAppLocales").Parent;
local v1 = require(l_Parent_0.Localization);
local l_LocalizationContext_0 = v1.LocalizationContext;
local l_Signal_0 = require(l_Parent_0.AppCommonLib).Signal;
local l_Locales_0 = script.Parent.Locales;
local v5 = require(script.Parent.CandidateUnusedKeys);
local l_logKeyUsed_0 = v1.logKeyUsed;
local v7 = game:DefineFastFlag("AppLocalesLogCandidateKeyUsed2", false);
local function v14(v8) --[[ Line: 31 ]] --[[ Name: loadTables ]]
    -- upvalues: l_LocalizationContext_0 (copy), l_Locales_0 (copy)
    local v9 = l_LocalizationContext_0.getRelevantLanguages(v8);
    local v10 = {};
    for _, v12 in ipairs(v9) do
        local l_l_Locales_0_FirstChild_0 = l_Locales_0:FindFirstChild(v12);
        if l_l_Locales_0_FirstChild_0 then
            v10[v12] = require(l_l_Locales_0_FirstChild_0);
        end;
    end;
    return v10;
end;
local v15 = {};
v15.__index = v15;
v15.new = function(v16) --[[ Line: 46 ]] --[[ Name: new ]]
    -- upvalues: l_Signal_0 (copy), l_LocalizationContext_0 (copy), v14 (copy), v15 (copy)
    local v17 = {
        locale = v16, 
        changed = l_Signal_0.new(), 
        localizationContext = l_LocalizationContext_0.new((v14(v16)))
    };
    setmetatable(v17, v15);
    return v17;
end;
v15.SetLocale = function(v18, v19) --[[ Line: 56 ]] --[[ Name: SetLocale ]]
    -- upvalues: v14 (copy)
    v18.locale = v19;
    local v20 = v14(v19);
    v18.localizationContext:addTranslations(v20);
    v18.changed:fire();
end;
v15.GetLocale = function(v21) --[[ Line: 63 ]] --[[ Name: GetLocale ]]
    return v21.locale;
end;
v15.Format = function(v22, v23, v24) --[[ Line: 67 ]] --[[ Name: Format ]]
    -- upvalues: v7 (copy), v5 (copy), l_logKeyUsed_0 (copy)
    if not v23 then
        error("ERROR: NO STRING FOR KEY");
    end;
    if v7 and v5[v23] then
        l_logKeyUsed_0("AppLocales_11.4.24", v23);
    end;
    return (v22.localizationContext:getString(v22.locale, v23, v24));
end;
return v15;