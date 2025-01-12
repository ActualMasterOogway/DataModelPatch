local l_Parent_0 = script:FindFirstAncestor("InExperienceLocales").Parent;
local v1 = require(l_Parent_0.Localization);
local l_LocalizationContext_0 = v1.LocalizationContext;
local l_Signal_0 = require(l_Parent_0.AppCommonLib).Signal;
local l_Locales_0 = script.Parent.Locales;
local v5 = require(script.Parent.CandidateUnusedKeys);
local v6 = require(script.Parent.UnknownCandidateUnusedKeys);
local l_logKeyUsed_0 = v1.logKeyUsed;
local v8 = game:DefineFastFlag("InExpLocalesLogCandidateKeyUsed2", false);
local v9 = game:DefineFastFlag("InExpLocalesLogUnknownCandidateKeyUsed", false);
local function v16(v10) --[[ Line: 34 ]] --[[ Name: loadTables ]]
    -- upvalues: l_LocalizationContext_0 (copy), l_Locales_0 (copy)
    local v11 = l_LocalizationContext_0.getRelevantLanguages(v10);
    local v12 = {};
    for _, v14 in ipairs(v11) do
        local l_l_Locales_0_FirstChild_0 = l_Locales_0:FindFirstChild(v14);
        if l_l_Locales_0_FirstChild_0 then
            v12[v14] = require(l_l_Locales_0_FirstChild_0);
        end;
    end;
    return v12;
end;
local v17 = {};
v17.__index = v17;
v17.new = function(v18) --[[ Line: 49 ]] --[[ Name: new ]]
    -- upvalues: l_Signal_0 (copy), l_LocalizationContext_0 (copy), v16 (copy), v17 (copy)
    local v19 = {
        locale = v18, 
        changed = l_Signal_0.new(), 
        localizationContext = l_LocalizationContext_0.new((v16(v18)))
    };
    setmetatable(v19, v17);
    return v19;
end;
v17.SetLocale = function(v20, v21) --[[ Line: 59 ]] --[[ Name: SetLocale ]]
    -- upvalues: v16 (copy)
    v20.locale = v21;
    local v22 = v16(v21);
    v20.localizationContext:addTranslations(v22);
    v20.changed:fire();
end;
v17.GetLocale = function(v23) --[[ Line: 66 ]] --[[ Name: GetLocale ]]
    return v23.locale;
end;
v17.Format = function(v24, v25, v26) --[[ Line: 70 ]] --[[ Name: Format ]]
    -- upvalues: v8 (copy), v5 (copy), l_logKeyUsed_0 (copy), v9 (copy), v6 (copy)
    if not v25 then
        error("ERROR: NO STRING FOR KEY");
    end;
    if v8 and v5[v25] then
        l_logKeyUsed_0("InExpLocales_11.4.24", v25);
    end;
    if v9 and v6[v25] then
        l_logKeyUsed_0("InExpUnknownLocales_10.24.24", v25);
    end;
    return (v24.localizationContext:getString(v24.locale, v25, v26));
end;
return v17;