local l_SessionService_0 = game:GetService("SessionService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_useEffect_0 = require(l_Parent_0.React).useEffect;
local l_String_0 = require(l_Parent_0.LuauPolyfill).String;
local l_SessionType_0 = require(l_Parent_0.RobloxAppSessionization).SessionType;
local v6 = require(l_script_FirstAncestor_0.Hooks.useIsChatEnabled);
local v7 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local v8 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v9 = game:DefineFastString("AppChatSessionName", "ChatPage");
local v10 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatClosedEvent);
return function(v11, v12) --[[ Line: 24 ]]
    -- upvalues: l_SessionService_0 (copy), v7 (copy), v6 (copy), l_useEffect_0 (copy), l_SessionType_0 (copy), v9 (copy), l_String_0 (copy), v10 (copy), v8 (copy)
    local v13 = v12 or l_SessionService_0;
    local v14 = v7();
    local v15 = v6();
    l_useEffect_0(function() --[[ Line: 29 ]]
        -- upvalues: v11 (copy), l_SessionType_0 (ref), v13 (copy), v9 (ref), l_String_0 (ref), v10 (ref), v14 (copy), v8 (ref), v15 (copy)
        if v11 then
            local l_Level2a_0 = l_SessionType_0.StructuralIdentifier.Level2a;
            if v13:SessionExists(l_Level2a_0) then
                v13:SetSession(l_Level2a_0, v9, v9);
                local l_v13_SessionTag_0 = v13:GetSessionTag(l_Level2a_0);
                if game:GetEngineFeature("SessionGetSessionID") and l_String_0.startsWith(l_v13_SessionTag_0, "ingame") then
                    local l_v13_SessionID_0 = v13:GetSessionID(l_Level2a_0);
                    v13:SetMetadata(v9, "InGameSessionId", l_v13_SessionID_0);
                end;
            end;
        else
            if v13:SessionExists(v9) then
                v13:RemoveSession(v9);
            end;
            if v10() and v14 then
                v14.fireAnalyticsEvent(v8.AppChatClosed, {
                    isChatEnabled = v15
                });
            end;
        end;
        return function() --[[ Line: 55 ]]

        end;
    end, {
        v11, 
        v13
    });
end;