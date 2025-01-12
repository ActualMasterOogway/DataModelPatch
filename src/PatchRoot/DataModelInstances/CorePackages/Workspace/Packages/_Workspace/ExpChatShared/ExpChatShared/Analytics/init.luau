local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChatShared");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local v4 = require(l_script_FirstAncestor_0.Logger):new("ExpChat/" .. script.Name);
local v5 = {};
local l_l_RbxAnalyticsService_0_0 = l_RbxAnalyticsService_0;
local function v8(v7) --[[ Line: 15 ]] --[[ Name: withDefaultArgs ]]
    -- upvalues: l_Dictionary_0 (copy)
    return l_Dictionary_0.join(v7, {
        gameId = tostring(game.GameId), 
        placeId = tostring(game.PlaceId)
    });
end;
local function v13(v9, v10, v11, v12) --[[ Line: 22 ]] --[[ Name: setRbxEventStream ]]
    -- upvalues: l_l_RbxAnalyticsService_0_0 (ref), v4 (copy), v8 (copy)
    if l_l_RbxAnalyticsService_0_0 then
        v4:debug("Event: {}", v11);
        l_l_RbxAnalyticsService_0_0:SetRBXEventStream(v9, v10, v11, v8(v12 or {}));
    end;
end;
v5.with = function(v14) --[[ Line: 29 ]] --[[ Name: with ]]
    -- upvalues: l_l_RbxAnalyticsService_0_0 (ref), l_RbxAnalyticsService_0 (copy)
    l_l_RbxAnalyticsService_0_0 = v14 or l_RbxAnalyticsService_0;
end;
v5.FireRccAnalyticsWithEventName = function(v15, v16) --[[ Line: 33 ]] --[[ Name: FireRccAnalyticsWithEventName ]]
    -- upvalues: v13 (copy)
    v13("rcc", "experienceChat", v15, v16);
end;
v5.FireClientAnalyticsWithEventName = function(v17, v18) --[[ Line: 37 ]] --[[ Name: FireClientAnalyticsWithEventName ]]
    -- upvalues: v13 (copy)
    v13("client", "experienceChat", v17, v18);
end;
v5.reportCounter = function(v19, v20) --[[ Line: 41 ]] --[[ Name: reportCounter ]]
    -- upvalues: l_l_RbxAnalyticsService_0_0 (ref), v4 (copy)
    if l_l_RbxAnalyticsService_0_0 then
        v4:debug("Counter: {}", v19);
        l_l_RbxAnalyticsService_0_0:ReportCounter(v19, v20 or 1);
    end;
end;
v5.FireLikelySpeakingBubbleAnalytics = function(v21, v22, v23, v24) --[[ Line: 48 ]] --[[ Name: FireLikelySpeakingBubbleAnalytics ]]
    -- upvalues: v13 (copy)
    v13("client", "voiceChat", "likelySpeakingBubbleEvent", {
        eventType = v21, 
        universe_id = v22, 
        place_id = v23, 
        play_session_id = v24
    });
end;
return v5;