local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(l_CorePackages_0.Packages.Promise);
local l_Extreme_0 = Enum.ThrottlingPriority.Extreme;
local l_ApplicationJson_0 = Enum.HttpContentType.ApplicationJson;
return function(v5) --[[ Line: 10 ]]
    -- upvalues: l_HttpService_0 (copy), l_ApplicationJson_0 (copy), l_Extreme_0 (copy), v2 (copy)
    local function v9(v6, v7) --[[ Line: 12 ]] --[[ Name: doHttpPost ]]
        -- upvalues: l_HttpService_0 (ref), l_ApplicationJson_0 (ref), l_Extreme_0 (ref), v5 (copy)
        local v8 = nil;
        assert(v7.postBody, "Expected a postBody to be specified with this request");
        if type(v7.postBody) == "table" then
            v8 = l_HttpService_0:JSONEncode(v7.postBody);
        elseif type(v7.postBody) == "string" then
            v8 = v7.postBody;
        else
            error("Expected postBody to be a string or table");
        end;
        if not v7.contentType then
            v7.contentType = l_ApplicationJson_0;
        end;
        if not v7.throttlingPriority then
            v7.throttlingPriority = l_Extreme_0;
        end;
        return function() --[[ Line: 31 ]]
            -- upvalues: v5 (ref), v6 (copy), v8 (ref), v7 (copy)
            return v5:PostAsyncFullUrl(v6, v8, v7.throttlingPriority, v7.contentType);
        end;
    end;
    local function _(v10) --[[ Line: 41 ]] --[[ Name: doHttpGet ]]
        -- upvalues: v5 (copy), l_Extreme_0 (ref)
        return function() --[[ Line: 42 ]]
            -- upvalues: v5 (ref), v10 (copy), l_Extreme_0 (ref)
            return v5:GetAsyncFullUrl(v10, l_Extreme_0);
        end;
    end;
    return function(v12, v13, v14) --[[ Line: 55 ]]
        -- upvalues: v9 (copy), v5 (copy), l_Extreme_0 (ref), v2 (ref), l_HttpService_0 (ref)
        assert(type(v12) == "string", "Expected url to be a string");
        assert(type(v13) == "string", "Expected requestMethod to be a string");
        assert(not v14 or type(v14) == "table", "Expected options to be a table");
        v13 = string.upper(v13);
        local v15 = nil;
        if v13 == "POST" then
            v15 = v9(v12, v14);
        elseif v13 == "GET" then
            v15 = function() --[[ Line: 42 ]]
                -- upvalues: v5 (ref), v12 (copy), l_Extreme_0 (ref)
                return v5:GetAsyncFullUrl(v12, l_Extreme_0);
            end;
        else
            error(string.format("Unsupported requestMethod : %s", v13 or "nil"));
        end;
        return v2.new(function(v16, v17) --[[ Line: 70 ]]
            -- upvalues: v15 (ref), l_HttpService_0 (ref)
            if v15 then
                spawn(function() --[[ Line: 72 ]]
                    -- upvalues: v15 (ref), l_HttpService_0 (ref), v16 (copy), v17 (copy)
                    local l_status_0, l_result_0 = pcall(v15);
                    if l_status_0 then
                        local l_status_1, l_result_1 = pcall(function() --[[ Line: 76 ]]
                            -- upvalues: l_HttpService_0 (ref), l_result_0 (copy)
                            return l_HttpService_0:JSONDecode(l_result_0);
                        end);
                        if l_status_1 then
                            v16({
                                responseBody = l_result_1
                            });
                            return;
                        else
                            v17(l_result_1);
                            return;
                        end;
                    else
                        v17(l_result_0);
                        return;
                    end;
                end);
                return;
            else
                v17();
                return;
            end;
        end);
    end;
end;