local v0 = {};
v0.__index = v0;
v0.new = function(v1) --[[ Line: 4 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v2 = {
        mockPatches = v1 or {}
    };
    setmetatable(v2, v0);
    return v2;
end;
v0.RegisterPatch = function(_, _, _, _, _) --[[ Line: 12 ]] --[[ Name: RegisterPatch ]]

end;
v0.GetPatch = function(v8, v9) --[[ Line: 14 ]] --[[ Name: GetPatch ]]
    return v8.mockPatches[v9];
end;
v0.UpdatePatch = function(_, _, _, _) --[[ Line: 18 ]] --[[ Name: UpdatePatch ]]

end;
return v0;