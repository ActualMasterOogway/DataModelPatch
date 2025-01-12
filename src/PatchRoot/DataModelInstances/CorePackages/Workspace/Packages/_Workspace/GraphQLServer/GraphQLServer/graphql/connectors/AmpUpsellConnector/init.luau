local l_script_FirstAncestor_0 = script:FindFirstAncestor("GraphQLServer");
local l_UrlBuilder_0 = require(l_script_FirstAncestor_0.Parent.UrlBuilder).UrlBuilder;
local l_UrlBase_0 = require(l_script_FirstAncestor_0.Parent.UrlBuilder).UrlBase;
local _ = require(l_script_FirstAncestor_0.Parent.LuauPolyfill);
local v4 = require(l_script_FirstAncestor_0.Parent.Promise);
local l_GraphQLError_0 = require(l_script_FirstAncestor_0.Parent.GraphQL).GraphQLError;
local _ = require(l_script_FirstAncestor_0.graphql.generatedTypes);
local v7 = require(l_script_FirstAncestor_0.Parent.Fetch);
local l_fetch_0 = v7.fetch;
local l_Response_0 = v7.Response;
local v10 = {};
local v11 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "access-management/v1/feature-access", 
    query = {
        featureNames = "{featureNames}"
    }
});
v10.getFeatureAccessFromFeatureNamesList = function(v12, v13) --[[ Line: 26 ]] --[[ Name: getFeatureAccessFromFeatureNamesList ]]
    -- upvalues: l_fetch_0 (copy), v4 (copy), v11 (copy), l_Response_0 (copy), l_GraphQLError_0 (copy)
    local v14 = v13 or l_fetch_0;
    return v4.new(function(v15, v16) --[[ Line: 32 ]]
        -- upvalues: v12 (copy), v11 (ref), v14 (copy), l_Response_0 (ref), l_GraphQLError_0 (ref)
        local v17 = table.concat(v12, ",");
        local v18 = v11({
            featureNames = v17
        });
        local v19 = v14(v18, {
            method = "GET"
        }):catch(function() --[[ Line: 36 ]]
            -- upvalues: l_Response_0 (ref)
            return l_Response_0.error();
        end):expect();
        if v19.status == 304 then
            v16(l_GraphQLError_0.new("Got Response: 304, using cached data instead"));
            return;
        elseif not v19.ok then
            v16(l_GraphQLError_0.new("Failed to find feature access values"));
            return;
        else
            local v20 = v19:json():catch(function() --[[ Line: 54 ]]
                return nil;
            end):expect();
            if not v20 then
                v16(l_GraphQLError_0.new("Failed to decode HTTP response as JSON for AMP Feature Access API"));
                return;
            else
                local v21 = {};
                for _, v23 in v20.features do
                    table.insert(v21, {
                        featureName = v23.featureName, 
                        access = v23.access
                    });
                end;
                v15({
                    features = v21
                });
                return;
            end;
        end;
    end);
end;
local v24 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "access-management/v1/upsell-feature-access", 
    query = {
        featureName = "{featureName}", 
        successfulActions = "{successfulActions}"
    }
});
v10.getUpsellFeatureAccessFromFeatureName = function(v25, v26, v27) --[[ Line: 90 ]] --[[ Name: getUpsellFeatureAccessFromFeatureName ]]
    -- upvalues: l_fetch_0 (copy), v4 (copy), v24 (copy), l_Response_0 (copy), l_GraphQLError_0 (copy)
    local v28 = v27 or l_fetch_0;
    return v4.new(function(v29, v30) --[[ Line: 97 ]]
        -- upvalues: v26 (copy), v24 (ref), v25 (copy), v28 (copy), l_Response_0 (ref), l_GraphQLError_0 (ref)
        local v31 = table.concat(v26, ",");
        local v32 = v24({
            featureName = v25, 
            successfulActions = v31
        });
        local v33 = v28(v32, {
            method = "GET"
        }):catch(function() --[[ Line: 104 ]]
            -- upvalues: l_Response_0 (ref)
            return l_Response_0.error();
        end):expect();
        if v33.status == 304 then
            v30(l_GraphQLError_0.new("Got Response: 304, using cached data instead"));
            return;
        elseif not v33.ok then
            v30(l_GraphQLError_0.new("Failed to find upsell feature access values"));
            return;
        else
            local v34 = v33:json():catch(function() --[[ Line: 122 ]]
                return nil;
            end):expect();
            if not v34 then
                v30(l_GraphQLError_0.new("Failed to decode HTTP response as JSON for AMP Upsell Feature Access API"));
                return;
            else
                v29({
                    featureName = v34.featureName, 
                    access = v34.access, 
                    recourse = v34.recourse, 
                    recourses = v34.recourses, 
                    shouldPrompt = v34.shouldPrompt
                });
                return;
            end;
        end;
    end);
end;
return v10;