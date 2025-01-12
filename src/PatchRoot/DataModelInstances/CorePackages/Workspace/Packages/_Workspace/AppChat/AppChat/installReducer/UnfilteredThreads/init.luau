local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Rodux);
local v4 = require(l_Parent_0.AppChatNetworking);
local v5 = require(l_script_FirstAncestor_0.Conversations.Actions.RemovedConversation);
local v6 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatOverhaulModals);
local v7 = {
    eligibility = {}, 
    conversationBannerVariants = if v6() then nil else {}
};
local v8 = {
    age_failure = "isAgeEligible", 
    phone_verification_failure = "isPhoneVerificationEligible", 
    ixp_failure = "isIXPEligible", 
    rollout_failure = "isRolloutEligible"
};
return v3.createReducer(v7, {
    [v4.rodux.GetUnfilteredThreadEligibility.Succeeded.name] = function(v9, v10) --[[ Line: 40 ]]
        -- upvalues: v8 (copy), v2 (copy)
        local l_responseBody_0 = v10.responseBody;
        local v12 = {
            isFullyEligible = l_responseBody_0.is_fully_eligible, 
            isAgeEligible = true, 
            isPhoneVerificationEligible = true, 
            isIXPEligible = true, 
            isRolloutEligible = true
        };
        if not l_responseBody_0.is_fully_eligible then
            for _, v14 in ipairs(l_responseBody_0.failure_reasons) do
                local v15 = v8[v14];
                if v15 then
                    v12[v15] = false;
                end;
            end;
        end;
        return v2.Dictionary.join(v9, {
            eligibility = v12
        });
    end, 
    [v4.rodux.GetUnfilteredThreadsFtuxModal.Succeeded.name] = if v6() then nil else function(v16, v17) --[[ Line: 66 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v16, {
            ftuxModalVariant = v17.responseBody.modal_variant
        });
    end, 
    [v4.rodux.GetUnfilteredThreadsConversationBanner.Succeeded.name] = if v6() then nil else function(v18, v19) --[[ Line: 73 ]]
        -- upvalues: v2 (copy)
        local v20 = v19.postBody and v19.postBody.conversation_id;
        if not v20 then
            return v18;
        else
            local v21 = v19.responseBody.modal_variant or v2.None;
            return v2.Dictionary.join(v18, {
                conversationBannerVariants = v2.Dictionary.join(v18.conversationBannerVariants, {
                    [v20] = v21
                })
            });
        end;
    end, 
    [v5.name] = if v6() then nil else function(v22, v23) --[[ Line: 88 ]]
        -- upvalues: v2 (copy)
        local l_conversationId_0 = v23.conversationId;
        if not l_conversationId_0 then
            return v22;
        else
            return v2.Dictionary.join(v22, {
                conversationBannerVariants = v2.Dictionary.join(v22.conversationBannerVariants, {
                    [l_conversationId_0] = v2.None
                })
            });
        end;
    end
});