local l_script_FirstAncestor_0 = script:FindFirstAncestor("AmpUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_UrlBase_0 = require(l_Parent_0.UrlBuilder).UrlBase;
local v4 = require(l_Parent_0.Fetch);
local v5 = require(l_Parent_0.Promise);
local l_fetch_0 = v4.fetch;
local l_Response_0 = v4.Response;
local l_HttpService_0 = game:GetService("HttpService");
local l_VPCRequestTypeEnum_0 = require(l_script_FirstAncestor_0.Common.Enums).VPCRequestTypeEnum;
local v10 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "child-requests-api/v1/send-request-to-new-parent"
});
local v11 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "child-requests-api/v1/send-request-to-all-parents"
});
local v12 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "user-settings-api/v1/account-insights/parent-emails"
});
return {
    sendRequestToNewParent = function(v13, v14, v15) --[[ Line: 32 ]] --[[ Name: sendRequestToNewParent ]]
        -- upvalues: l_fetch_0 (copy), v5 (copy), v10 (copy), l_VPCRequestTypeEnum_0 (copy), l_HttpService_0 (copy), l_Response_0 (copy)
        local l_l_fetch_0_0 = l_fetch_0;
        return v5.new(function(v17, v18) --[[ Line: 38 ]]
            -- upvalues: v10 (ref), v14 (copy), l_VPCRequestTypeEnum_0 (ref), l_HttpService_0 (ref), v13 (copy), v15 (copy), l_l_fetch_0_0 (copy), l_Response_0 (ref)
            local v19 = v10();
            local v20 = v14 == nil and l_VPCRequestTypeEnum_0.LinkToChild or v14[1];
            local v21 = l_HttpService_0:JSONEncode({
                email = v13, 
                requestType = v20, 
                requestDetails = v15
            });
            local v22 = l_l_fetch_0_0(v19, {
                method = "POST", 
                body = v21, 
                headers = {
                    ["Content-Type"] = "application/json", 
                    Accept = "application/json"
                }
            }):catch(function() --[[ Line: 54 ]]
                -- upvalues: l_Response_0 (ref)
                return l_Response_0.error();
            end):expect();
            local v23 = v22:json():catch(function() --[[ Line: 61 ]]
                return nil;
            end):expect();
            if not v23 then
                v18({
                    message = string.format("Got send-request-to-new-parent HTTP response: %d", v22.status)
                });
                return;
            elseif not v22.ok then
                v18({
                    code = v23.code, 
                    message = v23.message
                });
                return;
            else
                v17({
                    sessionId = v23.sessionId, 
                    lockedUntil = v23.lockedUntil
                });
                return;
            end;
        end);
    end, 
    sendRequestToAllParents = function(v24, v25) --[[ Line: 95 ]] --[[ Name: sendRequestToAllParents ]]
        -- upvalues: l_fetch_0 (copy), v5 (copy), v11 (copy), l_HttpService_0 (copy), l_Response_0 (copy)
        local l_l_fetch_0_1 = l_fetch_0;
        return v5.new(function(v27, v28) --[[ Line: 97 ]]
            -- upvalues: v11 (ref), v24 (copy), l_HttpService_0 (ref), v25 (copy), l_l_fetch_0_1 (copy), l_Response_0 (ref)
            local v29 = v11();
            local v30 = v24[1];
            local v31 = l_HttpService_0:JSONEncode({
                requestType = v30, 
                requestDetails = v25
            });
            local v32 = l_l_fetch_0_1(v29, {
                method = "POST", 
                body = v31, 
                headers = {
                    ["Content-Type"] = "application/json", 
                    Accept = "application/json"
                }
            }):catch(function() --[[ Line: 114 ]]
                -- upvalues: l_Response_0 (ref)
                return l_Response_0.error();
            end):expect();
            local v33 = v32:json():catch(function() --[[ Line: 121 ]]
                return nil;
            end):expect();
            if not v33 then
                v28({
                    message = string.format("Got send-request-to-all-parents HTTP response: %d", v32.status)
                });
                return;
            elseif not v32.ok then
                v28({
                    code = v33.code, 
                    message = v33.message
                });
                return;
            else
                v27({
                    sessionId = v33.sessionId, 
                    lockedUntil = v33.lockedUntil
                });
                return;
            end;
        end);
    end, 
    getLinkedParentEmails = function() --[[ Line: 151 ]] --[[ Name: getLinkedParentEmails ]]
        -- upvalues: l_fetch_0 (copy), v5 (copy), v12 (copy), l_Response_0 (copy)
        local l_l_fetch_0_2 = l_fetch_0;
        return v5.new(function(v35, v36) --[[ Line: 153 ]]
            -- upvalues: v12 (ref), l_l_fetch_0_2 (copy), l_Response_0 (ref)
            local v37 = v12();
            local v38 = l_l_fetch_0_2(v37, {
                method = "GET"
            }):catch(function() --[[ Line: 156 ]]
                -- upvalues: l_Response_0 (ref)
                return l_Response_0.error();
            end):expect();
            if not v38.ok then
                v36(string.format("Got parent-emails HTTP Response: %d", v38.status));
                return;
            else
                local v39 = v38:json():catch(function() --[[ Line: 168 ]]
                    return nil;
                end):expect();
                if not v39 then
                    v36("Failed to decode HTTP response as JSON for get linked parent emails");
                    return;
                else
                    v35({
                        parentEmails = v39.parentEmails
                    });
                    return;
                end;
            end;
        end);
    end
};