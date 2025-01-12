local l_Parent_0 = script:FindFirstAncestor("RoduxSquads").Parent;
local v1 = require(script.Parent.SquadMemberModel);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.t);
local v4 = {};
v4.new = function(v5) --[[ Line: 11 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy)
    assert(v4.isValid(v5));
    v4.__index = v4;
    setmetatable(v5, v4);
    return v5;
end;
tryGetSquadId = function(v6) --[[ Line: 24 ]] --[[ Name: tryGetSquadId ]]
    return v6.groupUpId or v6.squadId;
end;
v4.mock = function(v7) --[[ Line: 28 ]] --[[ Name: mock ]]
    -- upvalues: v2 (copy), v1 (copy), v4 (copy)
    v7 = v7 or {};
    local v9 = v2.List.map(v7.members or {
        {
            userId = 1234
        }
    }, function(v8) --[[ Line: 31 ]]
        -- upvalues: v1 (ref)
        return v1.mock(v8);
    end);
    return (v4.new({
        squadId = tryGetSquadId(v7) or "12345", 
        initiatorId = v7.initiatorId or 54321, 
        createdAtTime = v7.createdAtTime or "2024-07-19T21:02:47.777+00:00", 
        updatedAtTime = v7.updatedAtTime or "2024-07-19T21:02:47.777+00:00", 
        deletedAtTime = v7.deletedAtTime, 
        parentChannelId = v7.parentChannelId or "23456", 
        members = v9
    }));
end;
v4.format = function(v10) --[[ Line: 48 ]] --[[ Name: format ]]
    -- upvalues: v2 (copy), v1 (copy), v4 (copy)
    local v12 = v2.List.map(v10.members, function(v11) --[[ Line: 49 ]]
        -- upvalues: v1 (ref)
        return v1.format(v11);
    end);
    return (v4.new({
        squadId = tryGetSquadId(v10), 
        initiatorId = v10.initiatorId, 
        createdAtTime = v10.createdAtTime, 
        updatedAtTime = v10.updatedAtTime, 
        deletedAtTime = v10.deletedAtTime, 
        parentChannelId = v10.parentChannelId, 
        members = v12
    }));
end;
v4.isValid = v3.strictInterface({
    squadId = v3.string, 
    initiatorId = v3.number, 
    createdAtTime = v3.string, 
    updatedAtTime = v3.string, 
    deletedAtTime = v3.optional(v3.string), 
    parentChannelId = v3.string, 
    members = v3.array(v1.isValid)
});
return v4;