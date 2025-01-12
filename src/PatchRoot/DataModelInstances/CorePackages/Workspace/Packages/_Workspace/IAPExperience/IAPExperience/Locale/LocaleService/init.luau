local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Symbols.Symbol);
local v2 = game:DefineFastFlag("AppLocalesLogCandidateKeyUsedIAP2", false);
local v3 = require(script.Parent.CandidateUnusedKeys);
local v4 = v1.named("FormattedParam");
local function _(v5) --[[ Line: 16 ]] --[[ Name: isFormattedParam ]]
    -- upvalues: v4 (copy)
    local v6 = false;
    if typeof(v5) == "table" then
        v6 = v5[v4] == true;
    end;
    return v6;
end;
local function _(v8) --[[ Line: 20 ]] --[[ Name: createFormattedParam ]]
    -- upvalues: v4 (copy)
    return {
        [v4] = true, 
        format = v8
    };
end;
local function _(v10, v11) --[[ Line: 30 ]] --[[ Name: getLocalizedString ]]
    local l_translations_0 = v10.translations;
    local l_fallbackTranslations_0 = v10.fallbackTranslations;
    if l_fallbackTranslations_0 ~= nil and l_translations_0[v11] == nil then
        return l_fallbackTranslations_0[v11];
    else
        return l_translations_0[v11];
    end;
end;
return {
    nestedKeyParam = function(v15) --[[ Line: 51 ]] --[[ Name: nestedKeyParam ]]
        -- upvalues: v4 (copy)
        return {
            [v4] = true, 
            format = function(v16) --[[ Line: 52 ]]
                -- upvalues: v15 (copy)
                local l_v15_0 = v15;
                local l_translations_1 = v16.translations;
                local l_fallbackTranslations_1 = v16.fallbackTranslations;
                if l_fallbackTranslations_1 ~= nil and l_translations_1[l_v15_0] == nil then
                    return l_fallbackTranslations_1[l_v15_0];
                else
                    return l_translations_1[l_v15_0];
                end;
            end
        };
    end, 
    getString = function(v20, v21, v22) --[[ Line: 63 ]] --[[ Name: getString ]]
        -- upvalues: v2 (copy), v3 (copy), l_Parent_0 (copy), v4 (copy)
        if v2 and v3[v21] then
            require(l_Parent_0.Parent.Localization).logKeyUsed("IAPExperience_11.4.24", v21);
        end;
        assert(v20 ~= nil, "Must provide valid localization context");
        local l_translations_2 = v20.translations;
        local l_fallbackTranslations_2 = v20.fallbackTranslations;
        local v25 = if l_fallbackTranslations_2 ~= nil and l_translations_2[v21] == nil then l_fallbackTranslations_2[v21] else l_translations_2[v21];
        assert(v25 ~= nil, "Unable to find localization with key: " .. v21);
        if v25 and v22 ~= nil then
            for v26, v27 in pairs(v22) do
                local l_v27_0 = v27;
                local v29 = ("{%s}"):format(v26);
                local v30 = false;
                if typeof(v27) == "table" then
                    v30 = v27[v4] == true;
                end;
                if v30 then
                    l_v27_0 = v27.format(v20);
                end;
                do
                    local l_l_v27_0_0 = l_v27_0;
                    v25 = string.gsub(v25, v29, function() --[[ Line: 81 ]]
                        -- upvalues: l_l_v27_0_0 (ref)
                        return l_l_v27_0_0;
                    end);
                end;
            end;
        end;
        return v25;
    end
};