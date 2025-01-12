local v0 = require(script.Parent.RoundingBehaviour);
local v1 = require(script.Parent.Logger);
game:DefineFastFlag("AllowNumberLocalizationSigFigParam", false);
local l_Parent_0 = script:FindFirstAncestor("Localization").Parent;
local l_GetFFlagFixThaiNumberFormatting_0 = require(l_Parent_0.SharedFlags).GetFFlagFixThaiNumberFormatting;
local v4 = {
    ["en-us"] = {
        decimalSeparator = ".", 
        groupDelimiter = ","; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            "K"
        }, 
        {
            1000000, 
            "M"
        }, 
        {
            1000000000, 
            "B"
        }
    }, 
    ["es-es"] = {
        decimalSeparator = ",", 
        groupDelimiter = "."; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            " mil"
        }, 
        {
            1000000, 
            " M"
        }
    }, 
    ["fr-fr"] = {
        decimalSeparator = ",", 
        groupDelimiter = " "; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            " k"
        }, 
        {
            1000000, 
            " M"
        }, 
        {
            1000000000, 
            " Md"
        }
    }, 
    ["de-de"] = {
        decimalSeparator = ",", 
        groupDelimiter = " "; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            " Tsd."
        }, 
        {
            1000000, 
            " Mio."
        }, 
        {
            1000000000, 
            " Mrd."
        }
    }, 
    ["pt-br"] = {
        decimalSeparator = ",", 
        groupDelimiter = "."; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            " mil"
        }, 
        {
            1000000, 
            " mi"
        }, 
        {
            1000000000, 
            " bi"
        }
    }, 
    ["zh-cn"] = {
        decimalSeparator = ".", 
        groupDelimiter = ","; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            "\229\141\131"
        }, 
        {
            10000, 
            "\228\184\135"
        }, 
        {
            100000000, 
            "\228\186\191"
        }
    }, 
    ["zh-cjv"] = {
        decimalSeparator = ".", 
        groupDelimiter = ","; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            "\229\141\131"
        }, 
        {
            10000, 
            "\228\184\135"
        }, 
        {
            100000000, 
            "\228\186\191"
        }
    }, 
    ["zh-tw"] = {
        decimalSeparator = ".", 
        groupDelimiter = ","; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            "\229\141\131"
        }, 
        {
            10000, 
            "\232\144\172"
        }, 
        {
            100000000, 
            "\229\132\132"
        }
    }, 
    ["ko-kr"] = {
        decimalSeparator = ".", 
        groupDelimiter = ","; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            "\236\178\156"
        }, 
        {
            10000, 
            "\235\167\140"
        }, 
        {
            100000000, 
            "\236\150\181"
        }
    }, 
    ["ja-jp"] = {
        decimalSeparator = ".", 
        groupDelimiter = ","; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            "\229\141\131"
        }, 
        {
            10000, 
            "\228\184\135"
        }, 
        {
            100000000, 
            "\229\132\132"
        }
    }, 
    ["it-it"] = {
        decimalSeparator = ",", 
        groupDelimiter = " "; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            " mila"
        }, 
        {
            1000000, 
            " Mln"
        }, 
        {
            1000000000, 
            " Mld"
        }
    }, 
    ["ru-ru"] = {
        decimalSeparator = ",", 
        groupDelimiter = "."; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            " \209\130\209\139\209\129"
        }, 
        {
            1000000, 
            " \208\188\208\187\208\189"
        }, 
        {
            1000000000, 
            " \208\188\208\187\209\128\208\180"
        }
    }, 
    ["id-id"] = {
        decimalSeparator = ",", 
        groupDelimiter = "."; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            " rb"
        }, 
        {
            1000000, 
            " jt"
        }, 
        {
            1000000000, 
            " M"
        }
    }, 
    ["vi-vn"] = {
        decimalSeparator = ".", 
        groupDelimiter = " "; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            " N"
        }, 
        {
            1000000, 
            " Tr"
        }, 
        {
            1000000000, 
            " T"
        }
    }
};
if not l_GetFFlagFixThaiNumberFormatting_0() then
    v4["th-th"] = {
        decimalSeparator = ".", 
        groupDelimiter = ","; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            " \224\184\158"
        }, 
        {
            10000, 
            " \224\184\161"
        }, 
        {
            100000, 
            " \224\184\170"
        }, 
        {
            1000000, 
            " \224\184\165"
        }
    };
end;
v4["tr-tr"] = {
    decimalSeparator = ",", 
    groupDelimiter = "."; 
    {
        1, 
        ""
    }, 
    {
        1000, 
        " B"
    }, 
    {
        1000000, 
        " Mn"
    }, 
    {
        1000000000, 
        " Mr"
    }
};
v4["en-gb"] = v4["en-us"];
v4["es-mx"] = v4["es-es"];
if l_GetFFlagFixThaiNumberFormatting_0() then
    v4["th-th"] = v4["en-us"];
end;
local function _(v5) --[[ Line: 191 ]] --[[ Name: findDecimalPointIndex ]]
    return string.find(v5, "%.") or #v5 + 1;
end;
local function _(v7) --[[ Line: 196 ]] --[[ Name: findDecimalOffset ]]
    if v7 == 0 then
        return 0;
    else
        return -(math.floor((math.log10((math.abs(v7))))) + 1);
    end;
end;
local _ = function(v9, v10, v11) --[[ Line: 205 ]] --[[ Name: roundToSignificantDigits ]]
    -- upvalues: v0 (copy)
    local v12 = 10 ^ (v10 + (v9 == 0 and 0 or -(math.floor((math.log10((math.abs(v9))))) + 1)));
    local _ = nil;
    return (if v11 == v0.Truncate then math.modf(v9 * v12) else math.floor(v9 * v12 + 0.5)) / v12;
end;
local function v21(v15, v16) --[[ Line: 217 ]] --[[ Name: addGroupDelimiters ]]
    local l_v15_0 = v15;
    local v18 = string.format("%%1%s%%2", v16);
    repeat
        local v19, v20 = string.gsub(l_v15_0, "^(-?%d+)(%d%d%d)", v18);
        l_v15_0 = v19;
    until v20 == 0;
    return l_v15_0;
end;
local function v30(v22, v23, v24) --[[ Line: 230 ]] --[[ Name: findDenominationEntry ]]
    -- upvalues: v0 (copy)
    local v25 = v22[1];
    local v26 = math.abs(v23);
    for v27 = #v22, 2, -1 do
        local v28 = v22[v27];
        local _ = nil;
        if (if v24 == v0.Truncate then v28[1] else v28[1] - v22[v27 - 1][1] / 2) <= v26 then
            return v28;
        end;
    end;
    return v25;
end;
return {
    localize = function(v31, v32) --[[ Line: 251 ]] --[[ Name: localize ]]
        -- upvalues: v4 (copy), v1 (copy), v21 (copy)
        if v31 == 0 then
            return "0";
        else
            local v33 = v4[v32];
            if not v33 then
                v33 = v4["en-us"];
                v1:warning(string.format("Warning: Locale not found: '%s', reverting to '%s' instead.", tostring(v32), "en-us"));
            end;
            if v33.groupDelimiter then
                return (v21(v31, v33.groupDelimiter));
            else
                return v31;
            end;
        end;
    end, 
    abbreviate = function(v34, v35, v36, v37) --[[ Line: 276 ]] --[[ Name: abbreviate ]]
        -- upvalues: v0 (copy), v4 (copy), v1 (copy), v30 (copy), v21 (copy)
        if v34 == 0 then
            return "0";
        else
            if v36 == nil then
                v36 = v0.RoundToClosest;
            end;
            if game:GetFastFlag("AllowNumberLocalizationSigFigParam") then
                if v37 == nil then
                    v37 = 3;
                end;
            else
                v37 = 3;
            end;
            local v38 = v4[v35];
            if not v38 then
                v38 = v4["en-us"];
                v1:warning(string.format("Warning: Locale not found: '%s', reverting to '%s' instead.", tostring(v35), "en-us"));
            end;
            local v39 = v30(v38, v34, v36);
            local v40 = v39[1];
            local v41 = v39[2];
            local v42 = v34 / v40;
            local l_v37_0 = v37;
            local l_v36_0 = v36;
            local v45 = 10 ^ (l_v37_0 + (v42 == 0 and 0 or -(math.floor((math.log10((math.abs(v42))))) + 1)));
            local _ = nil;
            local v47 = (if l_v36_0 == v0.Truncate then math.modf(v42 * v45) else math.floor(v42 * v45 + 0.5)) / v45;
            v42 = nil;
            l_v37_0 = tostring(if v36 == v0.Truncate then math.modf(v47 * 10) / 10 else math.floor(v47 * 10 + 0.5) / 10);
            l_v36_0 = string.find(l_v37_0, "%.") or #l_v37_0 + 1;
            local v48 = string.sub(l_v37_0, 1, l_v36_0 - 1);
            v45 = string.sub(l_v37_0, l_v36_0 + 1, #l_v37_0);
            if v38.groupDelimiter then
                v48 = v21(v48, v38.groupDelimiter);
            end;
            if #v45 > 0 then
                return v48 .. v38.decimalSeparator .. v45 .. v41;
            else
                return v48 .. v41;
            end;
        end;
    end, 
    logger = v1
};