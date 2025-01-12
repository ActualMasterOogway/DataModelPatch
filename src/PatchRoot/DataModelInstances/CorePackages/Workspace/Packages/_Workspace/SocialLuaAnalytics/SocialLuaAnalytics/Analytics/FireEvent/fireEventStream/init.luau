local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.dependencies);
local l_llama_0 = v2.llama;
local _ = require(script.Parent.Parent.Types);
local v5 = require(script.Parent.toStringAdditionalArgs);
local v6 = require(script.Parent.getEventInfo);
local v7 = require(script.Parent.optionallyLog);
local v8 = require(script.Parent.Parent.Parent.Utils.isEnum);
local v9 = require(l_Parent_0.Flags.FFlagSocialLuaAnalyticsRemoveSocialLibraries);
local v10 = nil;
if not v9 then
    v10 = v2.SocialLibraries.RoduxTools.compose;
end;
local v11 = require(l_Parent_1.Dash);
local function _(v12) --[[ Line: 23 ]]
    -- upvalues: l_llama_0 (copy), v8 (copy)
    return l_llama_0.Dictionary.map(v12 or {}, function(v13) --[[ Line: 24 ]]
        -- upvalues: v8 (ref)
        if v8(v13) then
            return v13.rawValue();
        else
            return v13;
        end;
    end);
end;
local function v20(v15, v16) --[[ Line: 35 ]]
    -- upvalues: l_llama_0 (copy)
    if not v15 or not v16 then
        return {};
    else
        return l_llama_0.Dictionary.map(v15, function(v17, v18) --[[ Line: 40 ]]
            -- upvalues: v16 (copy), l_llama_0 (ref)
            local v19 = v16[v18];
            if v19 then
                if type(v19) == "function" then
                    return (v19(v17));
                else
                    return v17;
                end;
            else
                return l_llama_0.None;
            end;
        end);
    end;
end;
local function v22(v21) --[[ Line: 50 ]]
    -- upvalues: v5 (copy)
    return string.format("context: (%s), eventName: (%s), additionalInfo: (%s)", v21.context, v21.eventType, v5(v21.additionalInfo));
end;
local function v26(v23, v24) --[[ Line: 59 ]]
    return function(v25) --[[ Line: 60 ]]
        -- upvalues: v24 (copy), v23 (copy)
        if v24 then
            v23:sendEventDeferred(v25.context, v25.eventType, v25.additionalInfo);
            return v25;
        else
            v23:setRBXEventStream(v25.context, v25.eventType, v25.additionalInfo);
            return v25;
        end;
    end;
end;
return function(v27) --[[ Line: 71 ]]
    -- upvalues: v6 (copy), v26 (copy), v9 (copy), v11 (copy), v7 (copy), v22 (copy), l_llama_0 (copy), v8 (copy), v20 (copy), v10 (ref)
    local v28 = v6(v27.eventList);
    return function(v29, v30) --[[ Line: 81 ]]
        -- upvalues: v28 (copy), v26 (ref), v27 (copy), v9 (ref), v11 (ref), v7 (ref), v22 (ref), l_llama_0 (ref), v8 (ref), v20 (ref), v10 (ref)
        local v31 = v28(v29);
        local _ = v26;
        local v33 = if v27.getInfoForAllEvents then v27.getInfoForAllEvents() else v27.infoForAllEvents;
        if v9 then
            local l_compose_0 = v11.compose;
            local l_eventStreamImpl_0 = v27.eventStreamImpl;
            local l_shouldUseSendEventDeferred_0 = v27.shouldUseSendEventDeferred;
            local l_l_shouldUseSendEventDeferred_0_0 = l_shouldUseSendEventDeferred_0 --[[ copy: 8 -> 12 ]];
            local l_l_eventStreamImpl_0_0 = l_eventStreamImpl_0 --[[ copy: 7 -> 13 ]];
            l_compose_0 = l_compose_0(function(v39) --[[ Line: 60 ]]
                -- upvalues: l_l_shouldUseSendEventDeferred_0_0 (copy), l_l_eventStreamImpl_0_0 (copy)
                if l_l_shouldUseSendEventDeferred_0_0 then
                    l_l_eventStreamImpl_0_0:sendEventDeferred(v39.context, v39.eventType, v39.additionalInfo);
                    return v39;
                else
                    l_l_eventStreamImpl_0_0:setRBXEventStream(v39.context, v39.eventType, v39.additionalInfo);
                    return v39;
                end;
            end, v7(v27.loggerImpl, v22));
            local v40 = {
                context = v31.context, 
                eventType = v31.eventType
            };
            l_eventStreamImpl_0 = l_llama_0.Dictionary.join;
            l_shouldUseSendEventDeferred_0 = v33 or {};
            local l_additionalInfo_0 = v31.additionalInfo;
            v40.additionalInfo = l_eventStreamImpl_0(l_shouldUseSendEventDeferred_0, l_llama_0.Dictionary.map(l_additionalInfo_0 or {}, function(v42) --[[ Line: 24 ]]
                -- upvalues: v8 (ref)
                if v8(v42) then
                    return v42.rawValue();
                else
                    return v42;
                end;
            end), v20(v30, v31.formatRulesForAdditionalInfo));
            l_compose_0(v40);
            return v29, v30;
        else
            local l_v10_0 = v10;
            local v44 = v7(v27.loggerImpl, v22);
            local l_eventStreamImpl_1 = v27.eventStreamImpl;
            local l_shouldUseSendEventDeferred_1 = v27.shouldUseSendEventDeferred;
            local l_l_eventStreamImpl_1_0 = l_eventStreamImpl_1 --[[ copy: 8 -> 11 ]];
            l_v10_0 = l_v10_0(v44, function(v48) --[[ Line: 60 ]]
                -- upvalues: l_shouldUseSendEventDeferred_1 (copy), l_l_eventStreamImpl_1_0 (copy)
                if l_shouldUseSendEventDeferred_1 then
                    l_l_eventStreamImpl_1_0:sendEventDeferred(v48.context, v48.eventType, v48.additionalInfo);
                    return v48;
                else
                    l_l_eventStreamImpl_1_0:setRBXEventStream(v48.context, v48.eventType, v48.additionalInfo);
                    return v48;
                end;
            end);
            v44 = {
                context = v31.context, 
                eventType = v31.eventType
            };
            local l_join_0 = l_llama_0.Dictionary.join;
            l_eventStreamImpl_1 = v33 or {};
            local l_additionalInfo_1 = v31.additionalInfo;
            v44.additionalInfo = l_join_0(l_eventStreamImpl_1, l_llama_0.Dictionary.map(l_additionalInfo_1 or {}, function(v51) --[[ Line: 24 ]]
                -- upvalues: v8 (ref)
                if v8(v51) then
                    return v51.rawValue();
                else
                    return v51;
                end;
            end), v20(v30, v31.formatRulesForAdditionalInfo));
            l_v10_0(v44);
            return v29, v30;
        end;
    end;
end;