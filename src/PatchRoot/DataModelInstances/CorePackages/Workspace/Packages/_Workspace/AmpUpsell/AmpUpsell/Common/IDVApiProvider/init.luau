local l_Parent_0 = script:FindFirstAncestor("AmpUpsell").Parent;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_UrlBase_0 = require(l_Parent_0.UrlBuilder).UrlBase;
local v3 = require(l_Parent_0.Fetch);
local v4 = require(l_Parent_0.Promise);
local l_fetch_0 = v3.fetch;
local l_Response_0 = v3.Response;
local l_HttpService_0 = game:GetService("HttpService");
local v8 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "age-verification-service/v1/persona-id-verification/verified-status", 
    query = {
        token = "{token}"
    }
});
local v9 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "age-verification-service/v1/persona-id-verification/start-verification"
});
return {
    startVerification = function() --[[ Line: 64 ]] --[[ Name: startVerification ]]
        -- upvalues: l_fetch_0 (copy), v4 (copy), v9 (copy), l_HttpService_0 (copy), l_Response_0 (copy)
        local l_l_fetch_0_0 = l_fetch_0;
        return v4.new(function(v11, v12) --[[ Line: 66 ]]
            -- upvalues: v9 (ref), l_l_fetch_0_0 (copy), l_HttpService_0 (ref), l_Response_0 (ref)
            local v13 = v9();
            local v14 = l_l_fetch_0_0(v13, {
                method = "POST", 
                body = l_HttpService_0:JSONEncode({
                    generatedLink = true
                }), 
                headers = {
                    ["Content-Type"] = "application/json", 
                    Accept = "application/json"
                }
            }):catch(function() --[[ Line: 76 ]]
                -- upvalues: l_Response_0 (ref)
                return l_Response_0.error();
            end):expect();
            if not v14.ok then
                v12(string.format("Got start-verification HTTP Response: %d", v14.status));
                return;
            else
                local v15 = v14:json():catch(function() --[[ Line: 88 ]]
                    return nil;
                end):expect();
                if not v15 then
                    v12("Failed to decode HTTP response as JSON for IDV Verification");
                    return;
                else
                    v11({
                        emailSent = v15.emailSent, 
                        sessionIdentifier = v15.sessionIdentifier, 
                        daysUntilNextVerification = v15.daysUntilNextVerification, 
                        verificationLink = v15.verificationLink
                    });
                    return;
                end;
            end;
        end);
    end, 
    getVerifiedStatus = function(v16) --[[ Line: 25 ]] --[[ Name: getVerifiedStatus ]]
        -- upvalues: l_fetch_0 (copy), v4 (copy), v8 (copy), l_Response_0 (copy)
        local l_l_fetch_0_1 = l_fetch_0;
        return v4.new(function(v18, v19) --[[ Line: 27 ]]
            -- upvalues: v8 (ref), v16 (copy), l_l_fetch_0_1 (copy), l_Response_0 (ref)
            local v20 = v8({
                token = v16
            });
            local v21 = l_l_fetch_0_1(v20, {
                method = "GET"
            }):catch(function() --[[ Line: 30 ]]
                -- upvalues: l_Response_0 (ref)
                return l_Response_0.error();
            end):expect();
            if not v21.ok then
                v19(string.format("Got verified-status verification HTTP Response: %d", v21.status));
                return;
            else
                local v22 = v21:json():catch(function() --[[ Line: 44 ]]
                    return nil;
                end):expect();
                if not v22 then
                    v19("Failed to decode HTTP response as JSON for get IDV Verification status");
                    return;
                else
                    v18({
                        isPending = v22.isPending, 
                        sessionStatus = v22.sessionStatus, 
                        sessionErrorCode = v22.sessionErrorCode, 
                        isVerified = v22.isVerified
                    });
                    return;
                end;
            end;
        end);
    end
};