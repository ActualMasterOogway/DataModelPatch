local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = {};
v2.__index = v2;
v2.new = function(v3, v4) --[[ Line: 7 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    assert(v3, "BlockingAnalytics must be passed the ID of the local user");
    local v5 = {
        _eventStreamImpl = v4.EventStream, 
        localUserId = v3
    };
    setmetatable(v5, v2);
    return v5;
end;
v2.action = function(v6, v7, v8, v9) --[[ Line: 19 ]] --[[ Name: action ]]
    -- upvalues: v1 (copy)
    v9 = v1.Dictionary.join(v9 or {}, {
        blockerUserId = v6.localUserId
    });
    v6._eventStreamImpl:SendEventDeferred("AccountSettingsApi", v7, v8, v9);
end;
return v2;