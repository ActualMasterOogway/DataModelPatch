local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.StringUtilities);
local l_StringTrim_0 = v2.StringTrim;
local l_StringSplit_0 = v2.StringSplit;
local v5 = require(script.Parent.encodeURIComponent);
local v6 = require(script.Parent.UrlBase);
local v7 = require(script.Parent.UrlPatterns.GameUrlPatterns);
local v8 = require(script.Parent.UrlPatterns.UserUrlPatterns);
local v9 = require(script.Parent.UrlPatterns.StaticUrlPatterns);
local v10 = require(script.Parent.UrlPatterns.CatalogUrlPatterns);
local v11 = require(script.Parent.UrlPatterns.EconomyUrlPatterns);
local v12 = require(script.Parent.UrlPatterns.ShareLinksUrlPatterns);
local v13 = require(script.Parent.UrlPatterns.UserModerationPatterns);
local v14 = require(script.Parent.UrlPatterns.AccountInformationPatterns);
local v15 = require(script.Parent.UrlPatterns.VirtualEventsUrlPatterns);
local v16 = require(script.Parent.UrlPatterns.PlatformAuthPatterns);
local v17 = {};
local function v24(v18, v19, v20) --[[ Line: 28 ]] --[[ Name: splitAndTrim ]]
    -- upvalues: l_StringSplit_0 (copy), v1 (copy), l_StringTrim_0 (copy)
    local v21 = l_StringSplit_0(v18, v19, v20);
    v21 = v1.List.map(v21, function(v22) --[[ Line: 30 ]]
        -- upvalues: l_StringTrim_0 (ref)
        return l_StringTrim_0(v22);
    end);
    return (v1.List.filter(v21, function(v23) --[[ Line: 33 ]]
        return #v23 > 0;
    end));
end;
local function v30(v25) --[[ Line: 44 ]] --[[ Name: validateValueType ]]
    local v26 = type(v25);
    if v26 == "string" then
        return true;
    elseif v26 == "number" then
        return true;
    elseif v26 == "table" then
        for _, v28 in ipairs(v25) do
            local v29 = type(v28);
            if v29 ~= "string" and v29 ~= "number" then
                return false;
            end;
        end;
        return true;
    else
        return false;
    end;
end;
local function _(v31) --[[ Line: 64 ]] --[[ Name: assertPlaceholder ]]
    if string.sub(v31, 1, 1) == "{" then
        assert(string.sub(v31, -1, -1) == "}", "invalid pattern: placeholder items should end with `}`");
    end;
end;
local function v37(v33, v34) --[[ Line: 71 ]] --[[ Name: assertElementIsValid ]]
    -- upvalues: v30 (copy)
    assert(type(v33) == "table", "invalid pattern: elements should all be tables");
    if v34 then
        assert(type(v33.name) == "string", "invalid pattern: element name should be a string");
        assert(#v33.name > 0, "invalid pattern: element name should not be empty");
    end;
    local v35 = true;
    if type(v33.value) ~= "string" then
        v35 = type(v33.value) == "number";
    end;
    assert(v35, "invalid pattern: element value should be a string or number");
    if type(v33.value) == "string" then
        local l_value_0 = v33.value;
        if string.sub(l_value_0, 1, 1) == "{" then
            assert(string.sub(l_value_0, -1, -1) == "}", "invalid pattern: placeholder items should end with `}`");
        end;
    end;
    if v33.optional ~= nil then
        assert(type(v33.optional) == "boolean", "invalid pattern: element optional should be a boolean");
    end;
    if v33.default ~= nil then
        assert(v30(v33.default), "invalid pattern: element default should be a string, number, or a table of strings and numbers only");
    end;
    if v33.collect ~= nil then
        v35 = true;
        if v33.collect ~= "multi" then
            v35 = v33.collect == "csv";
        end;
        assert(v35, "invalid pattern: element optional should be one of `multi`, `csv`");
    end;
end;
local function v43(v38) --[[ Line: 102 ]] --[[ Name: assertPatternIsValid ]]
    -- upvalues: v37 (copy)
    assert(type(v38.base) == "string", "invalid pattern: base should be a string");
    assert(#v38.base > 0, "invalid pattern: base should not be empty");
    assert(type(v38.path) == "table", "invalid pattern: path should be a table");
    for _, v40 in ipairs(v38.path) do
        v37(v40, false);
    end;
    if v38.query ~= nil then
        assert(type(v38.query) == "table", "invalid pattern: query should be a table");
    end;
    if type(v38.query) == "table" then
        for _, v42 in ipairs(v38.query) do
            v37(v42, true);
        end;
    end;
    if v38.hash ~= nil then
        assert(type(v38.hash) == "string", "invalid pattern: hash should be a string");
    end;
end;
local function _(v44, v45) --[[ Line: 127 ]] --[[ Name: buildElementsFromString ]]
    -- upvalues: v24 (copy), v1 (copy), l_StringTrim_0 (copy), l_StringSplit_0 (copy)
    local v46 = v45 and "&" or "/";
    v44 = v24(v44, v46);
    return (v1.List.map(v44, function(v47) --[[ Line: 130 ]]
        -- upvalues: l_StringTrim_0 (ref), v45 (copy), l_StringSplit_0 (ref)
        local v48 = nil;
        local v49 = l_StringTrim_0(v47);
        local v50 = nil;
        local v51 = nil;
        local v52 = nil;
        if v45 then
            local v53 = l_StringSplit_0(v49, "=", 2);
            v48 = l_StringTrim_0(v53[1]);
            v49 = v53[2];
            if string.sub(v48, 1, 1) == "{" then
                v48 = l_StringTrim_0(v48, "{}");
                v48 = l_StringSplit_0(v48, "|", 2)[1];
                if v49 == nil then
                    v49 = v53[1];
                end;
                v48 = l_StringTrim_0(v48);
            end;
            v52 = "multi";
        end;
        if v49 ~= nil and string.find(v49, "^{.*}$") then
            v49 = l_StringTrim_0(v49, "{}");
            local v54 = l_StringSplit_0(v49, "|", 2);
            v49 = l_StringTrim_0(v54[1]);
            if #v54 > 1 then
                v50 = true;
                if #v54[2] > 1 then
                    v51 = v54[2];
                end;
            end;
            v49 = "{" .. v49 .. "}";
        end;
        return {
            name = v48, 
            value = v49, 
            optional = v50, 
            default = v51, 
            collect = v52
        };
    end));
end;
local function v60(v56) --[[ Line: 173 ]] --[[ Name: buildQueryStringFromTable ]]
    local v57 = {};
    for v58, v59 in pairs(v56) do
        table.insert(v57, v58 .. "=" .. v59);
    end;
    return table.concat(v57, "&");
end;
local function v91(v61) --[[ Line: 182 ]] --[[ Name: simplifyPattern ]]
    -- upvalues: v6 (copy), v24 (copy), v1 (copy), l_StringTrim_0 (copy), l_StringSplit_0 (copy), v60 (copy)
    local l_base_0 = v61.base;
    local l_path_0 = v61.path;
    local l_query_0 = v61.query;
    local l_hash_0 = v61.hash;
    if l_base_0 ~= nil and v6[string.upper(l_base_0)] ~= nil then
        l_base_0 = v6[string.upper(l_base_0)];
    end;
    if type(l_path_0) == "string" then
        local v66 = v24(l_path_0, "/");
        local l_map_0 = v1.List.map;
        local l_v66_0 = v66;
        local v69 = false;
        local l_v69_0 = v69 --[[ copy: 9 -> 10 ]];
        l_path_0 = l_map_0(l_v66_0, function(v71) --[[ Line: 130 ]]
            -- upvalues: l_StringTrim_0 (ref), l_v69_0 (copy), l_StringSplit_0 (ref)
            local v72 = nil;
            local v73 = l_StringTrim_0(v71);
            local v74 = nil;
            local v75 = nil;
            local v76 = nil;
            if l_v69_0 then
                local v77 = l_StringSplit_0(v73, "=", 2);
                v72 = l_StringTrim_0(v77[1]);
                v73 = v77[2];
                if string.sub(v72, 1, 1) == "{" then
                    v72 = l_StringTrim_0(v72, "{}");
                    v72 = l_StringSplit_0(v72, "|", 2)[1];
                    if v73 == nil then
                        v73 = v77[1];
                    end;
                    v72 = l_StringTrim_0(v72);
                end;
                v76 = "multi";
            end;
            if v73 ~= nil and string.find(v73, "^{.*}$") then
                v73 = l_StringTrim_0(v73, "{}");
                local v78 = l_StringSplit_0(v73, "|", 2);
                v73 = l_StringTrim_0(v78[1]);
                if #v78 > 1 then
                    v74 = true;
                    if #v78[2] > 1 then
                        v75 = v78[2];
                    end;
                end;
                v73 = "{" .. v73 .. "}";
            end;
            return {
                name = v72, 
                value = v73, 
                optional = v74, 
                default = v75, 
                collect = v76
            };
        end);
    end;
    if type(l_query_0) == "table" and l_query_0[1] == nil then
        l_query_0 = v60(l_query_0);
    end;
    if type(l_query_0) == "string" then
        local v79 = v24(l_query_0, "&");
        local l_map_1 = v1.List.map;
        local l_v79_0 = v79;
        local v82 = true;
        l_query_0 = l_map_1(l_v79_0, function(v83) --[[ Line: 130 ]]
            -- upvalues: l_StringTrim_0 (ref), v82 (copy), l_StringSplit_0 (ref)
            local v84 = nil;
            local v85 = l_StringTrim_0(v83);
            local v86 = nil;
            local v87 = nil;
            local v88 = nil;
            if v82 then
                local v89 = l_StringSplit_0(v85, "=", 2);
                v84 = l_StringTrim_0(v89[1]);
                v85 = v89[2];
                if string.sub(v84, 1, 1) == "{" then
                    v84 = l_StringTrim_0(v84, "{}");
                    v84 = l_StringSplit_0(v84, "|", 2)[1];
                    if v85 == nil then
                        v85 = v89[1];
                    end;
                    v84 = l_StringTrim_0(v84);
                end;
                v88 = "multi";
            end;
            if v85 ~= nil and string.find(v85, "^{.*}$") then
                v85 = l_StringTrim_0(v85, "{}");
                local v90 = l_StringSplit_0(v85, "|", 2);
                v85 = l_StringTrim_0(v90[1]);
                if #v90 > 1 then
                    v86 = true;
                    if #v90[2] > 1 then
                        v87 = v90[2];
                    end;
                end;
                v85 = "{" .. v85 .. "}";
            end;
            return {
                name = v84, 
                value = v85, 
                optional = v86, 
                default = v87, 
                collect = v88
            };
        end);
    end;
    return {
        base = l_base_0, 
        path = l_path_0, 
        query = l_query_0, 
        hash = l_hash_0
    };
end;
local function v96(v92, v93) --[[ Line: 211 ]] --[[ Name: concatValues ]]
    -- upvalues: v1 (copy), v24 (copy)
    v92 = v1.List.filter(v92, function(v94) --[[ Line: 213 ]]
        -- upvalues: v93 (copy), v24 (ref)
        if v93 then
            return #v24(v94, "=") > 1;
        else
            return #v94 > 0;
        end;
    end);
    local v95 = v93 and "&" or "/";
    return table.concat(v92, v95);
end;
local function v103(v97, v98, v99) --[[ Line: 224 ]] --[[ Name: resolveElement ]]
    -- upvalues: v30 (copy), v1 (copy), v5 (copy), v96 (copy)
    if v98 == nil then
        v98 = {};
    end;
    local v100 = nil;
    if type(v97.value) == "string" and string.sub(v97.value, 1, 1) == "{" then
        v100 = v98[string.sub(v97.value, 2, -2)];
        if v100 == nil then
            v100 = v97.default;
        end;
        if not v97.optional then
            assert(v100 ~= nil, "UrlBuilder: missing parameter: `" .. v97.value .. "`");
        end;
        if v100 == nil then
            v100 = {};
        end;
        assert(v30(v100), "UrlBuilder: invalid parameter: `" .. v97.value .. "`, " .. "should be a string, number, or a table of strings and numbers only");
    else
        v100 = v97.value;
    end;
    if type(v100) ~= "table" then
        v100 = {
            v100
        };
    end;
    v100 = v1.List.map(v100, function(v101) --[[ Line: 254 ]]
        -- upvalues: v5 (ref)
        return v5((tostring(v101)));
    end);
    if v99 then
        if v97.collect == "csv" then
            v100 = {
                table.concat(v100, "%2C")
            };
        end;
        v100 = v1.List.map(v100, function(v102) --[[ Line: 262 ]]
            -- upvalues: v5 (ref), v97 (copy)
            return v5(v97.name) .. "=" .. v102;
        end);
    end;
    return v96(v100, v99);
end;
local function v109(v104, v105, v106) --[[ Line: 269 ]] --[[ Name: resolveElementList ]]
    -- upvalues: v1 (copy), v103 (copy), v96 (copy)
    local v108 = v1.List.map(v104 or {}, function(v107) --[[ Line: 270 ]]
        -- upvalues: v103 (ref), v105 (copy), v106 (copy)
        return v103(v107, v105, v106);
    end);
    return v96(v108, v106);
end;
v17.new = function(v110) --[[ Line: 305 ]] --[[ Name: new ]]
    -- upvalues: v91 (copy), v43 (copy), l_StringTrim_0 (copy), v109 (copy)
    v110 = v91(v110);
    v43(v110);
    return function(v111, v112) --[[ Line: 308 ]]
        -- upvalues: l_StringTrim_0 (ref), v110 (ref), v109 (ref)
        local v113 = l_StringTrim_0(v110.base, "/", {
            right = true
        });
        local v114 = v109(v110.path, v111, false);
        if #v114 > 0 then
            v113 = v113 .. "/" .. v114;
        end;
        if string.match(v113, "[^/]/[^/]") == nil then
            v113 = v113 .. "/";
        end;
        local v115 = v109(v110.query, v111, true);
        if #v115 > 0 then
            v113 = v113 .. "?" .. v115;
        end;
        if v110.hash and #v110.hash > 0 then
            v113 = v113 .. "#" .. v110.hash;
        end;
        if v112 then
            if v113 ~= v112 then
                warn("UrlBuilder: unexpected output for pattern:");
                warn("UrlBuilder: expected `" .. v112 .. "`");
                warn("UrlBuilder: actual `" .. v113 .. "`");
            end;
            return v112;
        else
            return v113;
        end;
    end;
end;
v17.fromString = function(v116) --[[ Line: 343 ]] --[[ Name: fromString ]]
    -- upvalues: l_StringSplit_0 (copy), v17 (copy), l_StringTrim_0 (copy)
    local v117 = l_StringSplit_0(v116, ":", 2);
    if #v117 < 2 then
        v117 = {
            "", 
            v117[1]
        };
    end;
    local v118 = v117[1];
    v117 = l_StringSplit_0(v117[2], "%#", 2);
    local v119 = v117[2] or "";
    v117 = l_StringSplit_0(v117[1], "%?", 2);
    local v120 = v117[1] or "";
    local v121 = v117[2] or "";
    if string.sub(v120, 1, 2) == "//" then
        v117 = l_StringSplit_0(string.sub(v120, 3), "/", 2);
        v118 = v118 .. "://" .. v117[1];
        v120 = v117[2] or "/";
    end;
    return v17.new({
        base = l_StringTrim_0(v118), 
        path = l_StringTrim_0(v120), 
        query = l_StringTrim_0(v121), 
        hash = v119
    });
end;
v17.addQueryString = function(v122, v123) --[[ Line: 372 ]] --[[ Name: addQueryString ]]
    -- upvalues: l_StringTrim_0 (copy), v1 (copy), v17 (copy)
    local v124 = l_StringTrim_0(v122);
    local v125 = string.find(v124, "%?");
    if v125 == nil then
        v124 = v124 .. "?";
    elseif v125 < #v124 then
        v124 = v124 .. "&";
    end;
    local v126 = v1.Dictionary.keys(v123);
    v126 = v1.List.map(v126, function(v127) --[[ Line: 381 ]]
        return "{" .. v127 .. "}";
    end);
    v124 = v124 .. table.concat(v126, "&");
    return v17.fromString(v124)(v123);
end;
v17.game = v7(v17);
v17.user = v8(v17);
v17.catalog = v10(v17);
v17.static = v9(v17);
v17.usermoderation = v13(v17);
v17.accountinformation = v14(v17);
v17.sharelinks = v12(v17);
v17.economy = v11(v17);
v17.virtualevents = v15(v17);
v17.PlatformAuth = v16(v17);
return v17;