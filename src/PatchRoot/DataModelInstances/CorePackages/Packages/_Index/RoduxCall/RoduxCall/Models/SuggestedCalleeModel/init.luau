local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoduxCall");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.t);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_script_FirstAncestor_0.Enums);
local v5 = {};
v5.new = function(v6) --[[ Line: 9 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy)
    assert(v5.isValid(v6));
    v5.__index = v5;
    setmetatable(v6, v5);
    return v6;
end;
v5.mock = function(v7) --[[ Line: 21 ]] --[[ Name: mock ]]
    -- upvalues: v5 (copy)
    v7 = v7 or {};
    return (v5.new({
        userId = v7.userId or 12345, 
        userPresenceType = v7.userPresenceType or "Offline", 
        lastLocation = ""
    }));
end;
v5.format = function(v8) --[[ Line: 33 ]] --[[ Name: format ]]
    -- upvalues: v3 (copy), v4 (copy)
    return v3.Dictionary.join(v8, {
        userPresenceType = v4.PresenceType[v8.userPresenceType]
    });
end;
v5.isValid = v2.strictInterface({
    userId = v2.number, 
    userPresenceType = function(v9) --[[ Line: 41 ]] --[[ Name: userPresenceType ]]
        -- upvalues: v4 (copy)
        return v4.PresenceType[v9] ~= nil;
    end, 
    lastLocation = v2.string
});
return v5;