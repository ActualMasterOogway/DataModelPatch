local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v3 = require(l_Parent_1.SocialLuaAnalytics);
local l_AnalyticsFactory_0 = v3.Analytics.AnalyticsFactory;
local l_DefaultAnalyticsService_0 = v3.Analytics.DefaultAnalyticsService;
local v6 = require(script.Parent.EventStreamActionList);
local v7 = require(script.Parent.DiagActionList);
local v8 = require(l_Parent_1.Cryo);
local v9 = require(l_Parent_1.React);
local l_GetFFlagLuaAppEnableSquadPage_0 = require(l_Parent_1.SharedFlags).GetFFlagLuaAppEnableSquadPage;
local v11 = require(script.Parent.RoactChatAnalyticsContext);
local v12 = require(script.Parent.Logger);
local l_ChatEntryPointNames_0 = require(l_Parent_1.SocialCommon).Enums.ChatEntryPointNames;
local _ = require(l_Parent_0.Analytics.Enums.UnfilteredThreadsEligibilityForAnalytics);
local l_useSelector_0 = require(l_Parent_1.RoactUtils).Hooks.RoactRodux.useSelector;
local v16 = game:DefineFastFlag("AppChatAnalyticsPlaySessionId", false);
return function(v17) --[[ Line: 33 ]]
    -- upvalues: l_ChatEntryPointNames_0 (copy), v12 (copy), l_GetFFlagLuaAppEnableSquadPage_0 (copy), l_useSelector_0 (copy), v8 (copy), v16 (copy), l_RbxAnalyticsService_0 (copy), l_AnalyticsFactory_0 (copy), v6 (copy), v7 (copy), l_DefaultAnalyticsService_0 (copy), v9 (copy), v11 (copy)
    local v18 = {};
    local l_entryPoint_0 = v17.entryPoint;
    if not l_entryPoint_0 or not l_ChatEntryPointNames_0[l_entryPoint_0] then
        v12:warning("entryPoint=" .. tostring(l_entryPoint_0) .. " is not a reigstered value.");
        l_entryPoint_0 = l_ChatEntryPointNames_0.Unknown;
    end;
    local v22 = if l_GetFFlagLuaAppEnableSquadPage_0() then l_useSelector_0(function(v20) --[[ Line: 44 ]]
        local v21 = v20.Squad and v20.Squad.Squad and v20.Squad.Squad.currentSquad;
        if v21 and v21.squadId then
            return v21.squadId;
        else
            return nil;
        end;
    end) else nil;
    if l_GetFFlagLuaAppEnableSquadPage_0() then
        v18 = v8.Dictionary.join(v18, {
            squadId = v22
        });
    end;
    v18 = v8.Dictionary.join(v18, {
        entryPoint = l_entryPoint_0
    });
    v18 = v8.Dictionary.join(v18, {
        channelsApiEnabled = true, 
        unfilteredThreadsEligibility = v17.unfilteredThreadsEligibility
    });
    if v16 then
        local l_l_RbxAnalyticsService_0_PlaySessionId_0 = l_RbxAnalyticsService_0:GetPlaySessionId();
        v18 = v8.Dictionary.join(v18, {
            playSessionId = l_l_RbxAnalyticsService_0_PlaySessionId_0
        });
    end;
    local v24 = l_AnalyticsFactory_0.setUpAnalyticsFactory({
        eventLists = {
            EventStream = v6, 
            Diag = v7
        }, 
        analyticsImpl = {
            EventStream = l_DefaultAnalyticsService_0.EventStream, 
            Diag = l_DefaultAnalyticsService_0.Diag
        }, 
        staticInfoForAllEvents = v18
    });
    return v9.createElement(v11.Provider, {
        value = v24()
    }, v17.children);
end;