local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperience");
local l_t_0 = require(l_script_FirstAncestor_0.dependencies).t;
local v2 = {};
v2.new = function(v3) --[[ Line: 8 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    assert(v2.isValid(v3));
    v2.__index = v2;
    setmetatable(v3, v2);
    return v3;
end;
v2.format = function(v4) --[[ Line: 20 ]] --[[ Name: format ]]
    -- upvalues: v2 (copy)
    return (v2.new({
        userId = v4.userId, 
        isLocalUser = v4.isLocalUser, 
        username = v4.username, 
        displayname = v4.displayname, 
        isMuted = v4.isMuted
    }));
end;
v2.isValid = l_t_0.strictInterface({
    userId = l_t_0.number, 
    isLocalUser = l_t_0.boolean, 
    username = l_t_0.string, 
    displayname = l_t_0.string, 
    isMuted = l_t_0.boolean
});
return v2;