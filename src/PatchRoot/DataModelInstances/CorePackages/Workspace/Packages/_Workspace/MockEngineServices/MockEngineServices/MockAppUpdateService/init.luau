local v0 = {};
v0.__index = v0;
v0.new = function(v1, v2) --[[ Line: 4 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v3 = {
        status = v1 or "", 
        updateError = v2 or false
    };
    setmetatable(v3, {
        __index = v0
    });
    return v3;
end;
v0.CheckForUpdate = function(v4, v5) --[[ Line: 16 ]] --[[ Name: CheckForUpdate ]]
    if v4.updateError then
        error("Error: CheckForUpdate");
    end;
    v5(v4.status);
end;
v0.PerformManagedUpdate = function(_) --[[ Line: 24 ]] --[[ Name: PerformManagedUpdate ]]

end;
v0.CanPerformBinaryUpdate = function(_) --[[ Line: 26 ]] --[[ Name: CanPerformBinaryUpdate ]]
    return false;
end;
return v0;