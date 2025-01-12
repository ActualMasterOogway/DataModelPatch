local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local v2 = require(l_Parent_0.Common.Constants);
local l_React_0 = v1.React;
local l_useMemo_0 = l_React_0.useMemo;
local v5 = require(l_Parent_0.Flags.SelfViewProfileDiscoverabilityUpsellIXP);
local v6 = require(l_Parent_0.Analytics.DiscoverabilityModalAnalyticsContext);
local v7 = require(l_Parent_0.Analytics.setupFireAnalyticsEvents);
local v8 = require(l_Parent_0.Analytics.AnalyticsService);
local v9 = require(l_Parent_0.Analytics.Enums.EntryPoints);
local l_useSelector_0 = v1.Hooks.useSelector;
local l_useNavigation_0 = v1.Hooks.useNavigation;
return function(v12) --[[ Line: 16 ]] --[[ Name: Container ]]
    -- upvalues: v5 (copy), l_useNavigation_0 (copy), v2 (copy), l_useSelector_0 (copy), l_React_0 (copy), v6 (copy), v7 (copy), v8 (copy), l_useMemo_0 (copy), v9 (copy)
    return function(v13) --[[ Line: 17 ]]
        -- upvalues: v5 (ref), l_useNavigation_0 (ref), v2 (ref), l_useSelector_0 (ref), l_React_0 (ref), v6 (ref), v7 (ref), v8 (ref), v12 (copy), l_useMemo_0 (ref), v9 (ref)
        local v14 = if not v5.SetupEnabled() then l_useNavigation_0() else nil;
        local v15 = if not v5.SetupEnabled() then v14.getParam(v2.EVENT_INGEST_SERVICE) else nil;
        local v16 = if not v5.SetupEnabled() then v14.getParam(v2.DIAG_SERVICE) else nil;
        if v13.context and not v5.SetupEnabled() then
            v15 = v13.context.eventIngestService;
            v16 = v13.context.diagService;
        end;
        local v18 = l_useSelector_0(function(v17) --[[ Line: 31 ]]
            return v17.LocalUserId;
        end);
        if v5.SetupEnabled() then
            return l_React_0.createElement(v6.Provider, {
                value = {
                    fireAnalyticsEvent = v7({
                        analytics = v8, 
                        defaultAnalyticsInfo = {
                            uid = v18, 
                            entry = if v13.navigation then v13.navigation.getParam(v2.ENTRY_POINT) else v13.entryPoint
                        }
                    })
                }
            }, {
                l_React_0.createElement(v12, v13)
            });
        else
            local v19 = l_useMemo_0(function() --[[ Line: 52 ]]
                -- upvalues: v7 (ref), v16 (ref), v15 (ref), v18 (copy), v13 (copy), v9 (ref)
                return {
                    fireAnalyticsEvent = v7({
                        diag = v16, 
                        eventStreamImpl = v15, 
                        defaultAnalyticsInfo = {
                            uid = v18, 
                            entry = if v13.context then v9.AddFriends else v9.HomePage
                        }
                    })
                };
            end, {
                v16, 
                v15, 
                v18
            });
            return l_React_0.createElement(v6.Provider, {
                value = v19
            }, {
                l_React_0.createElement(v12, v13)
            });
        end;
    end;
end;