local l_Parent_0 = script:FindFirstAncestor("GraphQLServer").Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_UrlBase_0 = require(l_Parent_0.UrlBuilder).UrlBase;
local v4 = require(l_Parent_0.Promise);
local l_GraphQLError_0 = require(l_Parent_0.GraphQL).GraphQLError;
local l_Response_0 = require(l_Parent_0.Fetch).Response;
local l_fetch_0 = require(l_Parent_0.Fetch).fetch;
local _ = require(l_Parent_0.LuauPolyfill);
local _ = require(script.Parent.Parent.generatedTypes);
local v10 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "profile-insights-api/v1/multiProfileInsights"
});
return {
    findProfileInsightsByUserIds = function(v11, v12, v13) --[[ Line: 60 ]]
        -- upvalues: l_fetch_0 (copy), v4 (copy), v10 (copy), l_HttpService_0 (copy), l_Response_0 (copy), l_GraphQLError_0 (copy)
        local v14 = v13 or l_fetch_0;
        return v4.new(function(v15, v16) --[[ Line: 67 ]]
            -- upvalues: v14 (copy), v10 (ref), l_HttpService_0 (ref), v11 (copy), v12 (copy), l_Response_0 (ref), l_GraphQLError_0 (ref)
            local v17 = v14(v10(), {
                body = l_HttpService_0:JSONEncode({
                    userIds = v11, 
                    count = v12 or 2
                }), 
                method = "POST", 
                headers = {
                    ["Content-Type"] = "application/json", 
                    Accept = "application/json"
                }
            }):catch(function() --[[ Line: 79 ]]
                -- upvalues: l_Response_0 (ref)
                return l_Response_0.error();
            end):expect();
            if not v17.ok then
                v16(l_GraphQLError_0.new(string.format("Failed to fetch profile insights. Error code: %d", v17.status)));
                return;
            else
                local v18 = v17:json():catch(function() --[[ Line: 95 ]]
                    return nil;
                end):expect();
                if not v18 then
                    v16(l_GraphQLError_0.new(string.format("Failed to decode HTTP response as JSON for profile insights: %s.", l_HttpService_0:JSONEncode(v11))));
                    return;
                else
                    v15(v18.userInsights);
                    return;
                end;
            end;
        end);
    end, 
    findProfileInsightsByUserIdsFeed = function(v19, v20, v21, v22) --[[ Line: 117 ]] --[[ Name: findProfileInsightsByUserIdsFeed ]]
        -- upvalues: l_fetch_0 (copy), v4 (copy), v10 (copy), l_HttpService_0 (copy), l_Response_0 (copy), l_GraphQLError_0 (copy)
        local v23 = v22 or l_fetch_0;
        return (v4.new(function(v24, v25) --[[ Line: 67 ]]
            -- upvalues: v23 (copy), v10 (ref), l_HttpService_0 (ref), v19 (copy), v20 (copy), l_Response_0 (ref), l_GraphQLError_0 (ref)
            local v26 = v23(v10(), {
                body = l_HttpService_0:JSONEncode({
                    userIds = v19, 
                    count = v20 or 2
                }), 
                method = "POST", 
                headers = {
                    ["Content-Type"] = "application/json", 
                    Accept = "application/json"
                }
            }):catch(function() --[[ Line: 79 ]]
                -- upvalues: l_Response_0 (ref)
                return l_Response_0.error();
            end):expect();
            if not v26.ok then
                v25(l_GraphQLError_0.new(string.format("Failed to fetch profile insights. Error code: %d", v26.status)));
                return;
            else
                local v27 = v26:json():catch(function() --[[ Line: 95 ]]
                    return nil;
                end):expect();
                if not v27 then
                    v25(l_GraphQLError_0.new(string.format("Failed to decode HTTP response as JSON for profile insights: %s.", l_HttpService_0:JSONEncode(v19))));
                    return;
                else
                    v24(v27.userInsights);
                    return;
                end;
            end;
        end):andThen(function(v28) --[[ Line: 124 ]]
            -- upvalues: v21 (copy)
            return {
                pageId = v21, 
                profileInsights = v28
            };
        end));
    end
};