local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Rodux_0 = v1.Rodux;
local l_RoduxNetworking_0 = v1.RoduxNetworking;
local l_ShowContactImporterParams_0 = v1.ShowContactImporterParams;
local l_SelfViewProfileDiscoverabilityUpsellIXP_0 = v1.SelfViewProfileDiscoverabilityUpsellIXP;
return function() --[[ Line: 9 ]]
    -- upvalues: l_Rodux_0 (copy), l_SelfViewProfileDiscoverabilityUpsellIXP_0 (copy), l_ShowContactImporterParams_0 (copy), l_RoduxNetworking_0 (copy)
    return l_Rodux_0.combineReducers({
        Users = require(script.Users), 
        Friends = require(script.Friends), 
        Presence = require(script.Presence), 
        PremiumByUserId = require(script.PremiumByUserId), 
        ShowContactImporterParams = if l_SelfViewProfileDiscoverabilityUpsellIXP_0.SetupEnabled() then l_ShowContactImporterParams_0 else nil, 
        NetworkStatus = l_RoduxNetworking_0.installReducer(), 
        UnreadConversationCount = require(script.UnreadConversationCount)
    });
end;