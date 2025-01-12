local l_script_FirstAncestor_0 = script:FindFirstAncestor("AmpUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_UrlBase_0 = require(l_Parent_0.UrlBuilder).UrlBase;
local v4 = require(l_Parent_0.Fetch);
local v5 = require(l_Parent_0.Promise);
local l_fetch_0 = v4.fetch;
local l_Response_0 = v4.Response;
local l_AccessResponseEnum_0 = require(l_script_FirstAncestor_0.Common.Enums).AccessResponseEnum;
local l_gql_0 = require(l_Parent_0.ApolloClient).gql;
local v10 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "access-management/v1/upsell-feature-access", 
    query = {
        featureName = "{featureName}", 
        successfulActions = "{successfulActions}"
    }
});
local v11 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "access-management/v1/feature-access", 
    query = {
        featureNames = "{featureNames}"
    }
});
local function _(v12, v13) --[[ Line: 47 ]] --[[ Name: getUpsellFeatureAccessFromFeatureName ]]
    -- upvalues: l_fetch_0 (copy), v5 (copy), v10 (copy), l_Response_0 (copy)
    local l_l_fetch_0_0 = l_fetch_0;
    return v5.new(function(v15, v16) --[[ Line: 49 ]]
        -- upvalues: v13 (copy), v10 (ref), v12 (copy), l_l_fetch_0_0 (copy), l_Response_0 (ref)
        local v17 = table.concat(v13, ",");
        local v18 = v10({
            featureName = v12, 
            successfulActions = v17
        });
        local v19 = l_l_fetch_0_0(v18, {
            method = "GET"
        }):catch(function() --[[ Line: 54 ]]
            -- upvalues: l_Response_0 (ref)
            return l_Response_0.error();
        end):expect();
        if v19.status == 304 then
            v16("Got Response: 304");
            return;
        elseif not v19.ok then
            v16("Failed to find upsell feature access values");
            return;
        else
            local v20 = v19:json():catch(function() --[[ Line: 72 ]]
                return nil;
            end):expect();
            if not v20 then
                v16("Failed to decode HTTP response as JSON for AMP Upsell Feature Access API");
                return;
            else
                v15({
                    access = v20.access, 
                    recourse = v20.recourse, 
                    recourses = v20.recourses, 
                    shouldPrompt = v20.shouldPrompt
                });
                return;
            end;
        end;
    end);
end;
return {
    upsellFeatureAccess = function(v22, v23) --[[ Line: 91 ]] --[[ Name: upsellFeatureAccess ]]
        -- upvalues: l_fetch_0 (copy), v5 (copy), v10 (copy), l_Response_0 (copy), l_AccessResponseEnum_0 (copy)
        local l_l_fetch_0_1 = l_fetch_0;
        return (v5.new(function(v25, v26) --[[ Line: 49 ]]
            -- upvalues: v23 (copy), v10 (ref), v22 (copy), l_l_fetch_0_1 (copy), l_Response_0 (ref)
            local v27 = table.concat(v23, ",");
            local v28 = v10({
                featureName = v22, 
                successfulActions = v27
            });
            local v29 = l_l_fetch_0_1(v28, {
                method = "GET"
            }):catch(function() --[[ Line: 54 ]]
                -- upvalues: l_Response_0 (ref)
                return l_Response_0.error();
            end):expect();
            if v29.status == 304 then
                v26("Got Response: 304");
                return;
            elseif not v29.ok then
                v26("Failed to find upsell feature access values");
                return;
            else
                local v30 = v29:json():catch(function() --[[ Line: 72 ]]
                    return nil;
                end):expect();
                if not v30 then
                    v26("Failed to decode HTTP response as JSON for AMP Upsell Feature Access API");
                    return;
                else
                    v25({
                        access = v30.access, 
                        recourse = v30.recourse, 
                        recourses = v30.recourses, 
                        shouldPrompt = v30.shouldPrompt
                    });
                    return;
                end;
            end;
        end):catch(function(_) --[[ Line: 93 ]]
            -- upvalues: l_AccessResponseEnum_0 (ref)
            return {
                access = l_AccessResponseEnum_0.Error
            };
        end):expect());
    end, 
    upsellFeatureAccessGql = function(v32, v33, _) --[[ Line: 157 ]] --[[ Name: upsellFeatureAccessGql ]]
        -- upvalues: l_gql_0 (copy), l_AccessResponseEnum_0 (copy)
        local v36 = v32:query({
            query = l_gql_0(require(script.Parent.GetUpsellFeatureAccess)), 
            variables = {
                featureName = v33, 
                successfulActions = {}
            }, 
            fetchPolicy = "network-only"
        }):catch(function(_) --[[ Line: 173 ]]
            -- upvalues: l_AccessResponseEnum_0 (ref)
            return {
                access = l_AccessResponseEnum_0.Error
            };
        end):expect();
        if v36.data and v36.data.getUpsellFeatureAccess.featureAccess then
            return v36.data.getUpsellFeatureAccess.featureAccess;
        else
            return {
                access = l_AccessResponseEnum_0.Error
            };
        end;
    end, 
    getFeatureAccess = function(v37) --[[ Line: 102 ]] --[[ Name: getFeatureAccess ]]
        -- upvalues: l_fetch_0 (copy), v5 (copy), v11 (copy), l_Response_0 (copy), l_AccessResponseEnum_0 (copy)
        local l_l_fetch_0_2 = l_fetch_0;
        return (v5.new(function(v39, v40) --[[ Line: 104 ]]
            -- upvalues: v37 (copy), v11 (ref), l_l_fetch_0_2 (copy), l_Response_0 (ref)
            local v41 = table.concat(v37, ",");
            local v42 = v11({
                featureNames = v41
            });
            local v43 = l_l_fetch_0_2(v42, {
                method = "GET"
            }):catch(function() --[[ Line: 108 ]]
                -- upvalues: l_Response_0 (ref)
                return l_Response_0.error();
            end):expect();
            if v43.status == 304 then
                v40("Got Response: 304");
                return;
            elseif not v43.ok then
                v40("Failed to find get feature access values");
                return;
            else
                local v44 = v43:json():catch(function() --[[ Line: 126 ]]
                    return nil;
                end):expect();
                if not v44 then
                    v40("Failed to decode HTTP response as JSON for AMP Upsell Feature Access API");
                    return;
                else
                    local v45 = {};
                    for _, v47 in v44.features do
                        table.insert(v45, {
                            feature = v47.featureName, 
                            access = v47.access
                        });
                    end;
                    v39({
                        featureAccessList = v45
                    });
                    return;
                end;
            end;
        end):catch(function(_) --[[ Line: 149 ]]
            -- upvalues: l_AccessResponseEnum_0 (ref)
            return {
                access = l_AccessResponseEnum_0.Error
            };
        end):expect());
    end
};