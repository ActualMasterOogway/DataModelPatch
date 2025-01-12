local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoduxSquads");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Mock_0 = require(l_Parent_0.Dev.LuaSocialLibrariesDeps).Mock;
local v3 = require(l_Parent_0.Rodux);
local v4 = require(l_script_FirstAncestor_0.Enums.ExperienceInviteState);
local v5 = require(l_script_FirstAncestor_0.Enums.ExperienceInviteVoteType);
local _ = require(l_script_FirstAncestor_0.RoduxSquadsTypes);
local function v9() --[[ Line: 20 ]]
    return {
        memStorageKey = "key", 
        getItem = function() --[[ Line: 23 ]] --[[ Name: getItem ]]
            return nil;
        end, 
        setItem = function(_) --[[ Line: 26 ]] --[[ Name: setItem ]]
            return true;
        end, 
        bindAndFire = function(_) --[[ Line: 29 ]] --[[ Name: bindAndFire ]]
            return {
                Disconnect = function() --[[ Line: 31 ]] --[[ Name: Disconnect ]]

                end
            };
        end
    };
end;
local function v16(v10, v11, v12, v13, v14, v15) --[[ Line: 38 ]]
    return {
        squadId = v11 or "12345", 
        initiatorId = v14 or 123, 
        createdAtTime = v12 or "2024-07-19T21:02:47.777+00:00", 
        updatedAtTime = v10 or "2024-07-19T21:02:47.777+00:00", 
        parentChannelId = v13 or "23456", 
        members = v15 or {
            {
                userId = 123
            }, 
            {
                userId = 456
            }
        }
    };
end;
local function v19(v17, v18) --[[ Line: 56 ]]
    return {
        groupUpId = v18 or "12345", 
        initiatorId = 123, 
        createdAtTime = "2024-07-19T21:02:47.777+00:00", 
        updatedAtTime = v17 or "2024-07-19T21:02:47.777+00:00", 
        parentChannelId = "23456", 
        members = {
            {
                userId = 123
            }, 
            {
                userId = 456
            }
        }
    };
end;
local function v24(v20, v21, v22, v23) --[[ Line: 67 ]]
    -- upvalues: v4 (copy)
    return {
        createdAtTime = v20 or "2024-07-19T21:02:47.777+00:00", 
        experienceDetail = {
            placeId = 15308759682, 
            gameInstanceId = "instanceId"
        }, 
        experienceInviteId = v21 or "23456", 
        inviterId = 65432, 
        membershipEntityId = "54321", 
        state = v4.Active, 
        totalSpots = 5, 
        versionId = v23 or 1, 
        votes = v22 or {}
    };
end;
local v25 = v3.makeActionCreator("CREATE_OR_JOIN_SQUAD", function() --[[ Line: 89 ]]
    -- upvalues: v19 (copy)
    return {
        responseBody = {
            groupUp = v19()
        }
    };
end);
local v27 = v3.makeActionCreator("GET_SQUAD_ACTIVE", function(v26) --[[ Line: 97 ]]
    -- upvalues: v19 (copy)
    return {
        responseBody = {
            groupUp = if v26 then v19() else nil
        }
    };
end);
local v29 = v3.makeActionCreator("GET_SQUAD_FROM_SQUAD_ID", function(v28) --[[ Line: 105 ]]
    -- upvalues: v19 (copy)
    return {
        responseBody = {
            groupUp = v19("2024-07-19T21:02:47.777+00:00", v28)
        }
    };
end);
local v31 = v3.makeActionCreator("JOIN_SQUAD", function(v30) --[[ Line: 113 ]]
    -- upvalues: v19 (copy)
    return {
        responseBody = {
            groupUp = v19("2024-07-19T21:02:47.777+00:00", v30)
        }
    };
end);
local v33 = v3.makeActionCreator("LEAVE_SQUAD", function(v32) --[[ Line: 121 ]]
    return {
        responseBody = {}, 
        postBody = {
            groupUpId = v32
        }
    };
end);
local v34 = v3.makeActionCreator("CREATE_EXPERIENCE_INVITE", function() --[[ Line: 130 ]]
    -- upvalues: v24 (copy)
    return {
        responseBody = v24()
    };
end);
local v36 = v3.makeActionCreator("GET_EXPERIENCE_INVITE", function(v35) --[[ Line: 138 ]]
    -- upvalues: v24 (copy)
    return {
        responseBody = v24("2024-07-19T21:02:47.777+00:00", v35)
    };
end);
local v38 = v3.makeActionCreator("VOTE_FOR_EXPERIENCE_INVITE", function(v37) --[[ Line: 147 ]]
    -- upvalues: v24 (copy), v5 (copy)
    return {
        responseBody = v24("2024-07-19T21:02:47.777+00:00", v37, {
            [1] = {
                userId = 123, 
                voteIdentifier = "voteIdentifier", 
                voteType = v5.Accept
            }
        })
    };
end);
return {
    createStorage = v9, 
    createExperienceInvite = v24, 
    createSquad = v16, 
    createServerSquad = v19, 
    mock = l_Mock_0, 
    mockCreateExperienceInvite = "CREATE_EXPERIENCE_INVITE", 
    mockCreateExperienceInviteAction = v34, 
    mockCreateOrJoinSquad = "CREATE_OR_JOIN_SQUAD", 
    mockCreateOrJoinSquadAction = v25, 
    mockGetExperienceInvite = "GET_EXPERIENCE_INVITE", 
    mockGetExperienceInviteAction = v36, 
    mockGetSquadActive = "GET_SQUAD_ACTIVE", 
    mockGetSquadActiveAction = v27, 
    mockGetSquadFromSquadId = "GET_SQUAD_FROM_SQUAD_ID", 
    mockGetSquadFromSquadIdAction = v29, 
    mockJoinSquad = "JOIN_SQUAD", 
    mockJoinSquadAction = v31, 
    mockLeaveSquad = "LEAVE_SQUAD", 
    mockLeaveSquadAction = v33, 
    mockVoteForExperienceInvite = "VOTE_FOR_EXPERIENCE_INVITE", 
    mockVoteForExperienceInviteAction = v38
};