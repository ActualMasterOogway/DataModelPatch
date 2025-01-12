local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChatNetworking");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.HttpRequest);
local v4 = require(l_Parent_0.Loggers).Logger:new("AppChat.Networking");
local v5 = require(l_script_FirstAncestor_0.analytics.fireAnalytics);
local l_getFFlagDebugUnfilteredThreads_0 = require(l_Parent_0.SharedFlags).getFFlagDebugUnfilteredThreads;
local l_ChallengeRequestWrapper_0 = require(l_Parent_0.GenericChallenges).Middleware.ChallengeRequestWrapper;
local l_getFFlagEnableAppChatChallengeInterceptor_0 = require(l_Parent_0.SharedFlags).getFFlagEnableAppChatChallengeInterceptor;
local function v14(v9) --[[ Line: 17 ]] --[[ Name: chunkAndLogString ]]
    -- upvalues: v4 (copy)
    local v10 = {};
    for v11 = 1, #v9, 800 do
        table.insert(v10, v9:sub(v11, v11 + 800 - 1));
    end;
    for _, v13 in v10 do
        v4:debug(v13);
    end;
end;
local v39 = v3.config({
    requestFunction = function(v15, v16, v17) --[[ Line: 29 ]] --[[ Name: requestFunction ]]
        -- upvalues: v4 (copy), l_getFFlagDebugUnfilteredThreads_0 (copy), v14 (copy), v3 (copy)
        v4:info((("Fetching: [ requestMethod = \"%*\", url = \"%*\" ]"):format(v16, v15)));
        if l_getFFlagDebugUnfilteredThreads_0() then
            local v18 = v17 and v17.postBody or {};
            if string.find(v15, "get%-conversations") then
                local v19 = v18.ids or {};
                local v20 = "";
                for _, v22 in v19 do
                    v20 = ("%*, %*"):format(v20, v22);
                end;
                v14((("FETCHING CONVERSATIONS%*"):format(v20)));
            elseif string.find(v15, "get%-modal%-sequence") then
                v4:debug((("FETCHING MODAL SEQUENCE %* %*"):format(v18.modal_sequence, v18.conversation_id)));
            elseif string.find(v15, "record%-modal%-sequence%-response") then
                local v23 = v18.modal_id or v18.modal_variant;
                v4:debug((("RECORDING MODAL SEQUENCE RESPONSE %* %* %*"):format(v18.action_type, v18.modal_sequence, v23)));
            end;
        end;
        return v3.requestFunctions.RequestInternal(v15, v16, v17);
    end, 
    postRequestFunction = function(v24, v25) --[[ Line: 51 ]] --[[ Name: postRequestFunction ]]
        -- upvalues: v4 (copy), v5 (copy), l_getFFlagDebugUnfilteredThreads_0 (copy), l_HttpService_0 (copy), v14 (copy)
        v4:debug((("Returned: [ requestMethod = \"%*\", url = \"%*\", statusCode = %*%*]"):format(v25.requestMethod, v25.url, v24.StatusCode, v24.HttpError ~= Enum.HttpError.OK and (", HttpError = %*"):format(v24.HttpError) or "")));
        v5("NetworkResponse", {
            endpoint = v25.url, 
            statusCode = v24.StatusCode, 
            isOK = v24.HttpError == Enum.HttpError.OK
        });
        if l_getFFlagDebugUnfilteredThreads_0() then
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 63 ]]
                -- upvalues: l_HttpService_0 (ref), v24 (copy)
                return l_HttpService_0:JSONDecode(v24.Body);
            end);
            if not l_status_0 then
                return;
            else
                local v28 = v25.options and v25.options.postBody and v25.options.postBody.conversation_id;
                if string.find(v25.url, "get%-user%-conversations") or string.find(v25.url, "get%-conversations") then
                    local v29 = l_result_0 and l_result_0.conversations or {};
                    local v30 = "";
                    for _, v32 in v29 do
                        v30 = ("%*, %* %* %*"):format(v30, v32.id, v32.moderation_type, v32.user_pending_status);
                    end;
                    v14((("RETURNED CONVERSATIONS%*"):format(v30)));
                    return;
                elseif string.find(v25.url, "get%-modal%-sequence") then
                    local v33 = l_result_0 and l_result_0.modal_variant;
                    v4:debug((("RETURNED MODAL VARIANT %* %*"):format(v33, v28)));
                    return;
                elseif string.find(v25.url, "get%-unfiltered%-thread%-eligibility") then
                    local v34 = l_result_0 and l_result_0.is_fully_eligible;
                    local v35 = l_result_0 and l_result_0.failure_reasons or {};
                    local v36 = ("is_fully_eligible = %*; FAILURE REASONS"):format(v34);
                    for _, v38 in v35 do
                        v36 = ("%*, %*"):format(v36, v38);
                    end;
                    v14((("RETURNED ELIGIBILITY: %*"):format(v36)));
                end;
            end;
        end;
    end
});
return {
    default = l_getFFlagEnableAppChatChallengeInterceptor_0() and l_ChallengeRequestWrapper_0(v39) or v39, 
    logger = v4
};