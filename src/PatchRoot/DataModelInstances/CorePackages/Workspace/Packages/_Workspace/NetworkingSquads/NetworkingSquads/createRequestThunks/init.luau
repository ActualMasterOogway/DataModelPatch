local _ = require(script.Parent.networkingSquadTypes);
local l_networkRequests_0 = script.Parent.networkRequests;
local v2 = require(l_networkRequests_0.createCreateOrJoinSquad);
local v3 = require(l_networkRequests_0.createGetSquadActive);
local v4 = require(l_networkRequests_0.createGetSquadFromSquadId);
local v5 = require(l_networkRequests_0.createJoinSquad);
local v6 = require(l_networkRequests_0.createLeaveSquad);
local v7 = require(l_networkRequests_0.createSquadInvite);
local v8 = require(l_networkRequests_0.createCreateExperienceInvite);
local v9 = require(l_networkRequests_0.createGetExperienceInvite);
local v10 = require(l_networkRequests_0.createVoteForExperienceInvite);
local v11 = require(l_networkRequests_0.createSendSquadVoiceAbuseReport);
return function(v12) --[[ Line: 21 ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy), v10 (copy), v11 (copy)
    return {
        CreateOrJoinSquad = v2(v12), 
        GetSquadActive = v3(v12), 
        GetSquadFromSquadId = v4(v12), 
        JoinSquad = v5(v12), 
        LeaveSquad = v6(v12), 
        SquadInvite = v7(v12), 
        CreateExperienceInvite = v8(v12), 
        GetExperienceInvite = v9(v12), 
        VoteForExperienceInvite = v10(v12), 
        SendSquadVoiceAbuseReport = v11(v12)
    };
end;