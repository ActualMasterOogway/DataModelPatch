local v0 = {};
v0.__index = v0;
setmetatable(v0, {
    __call = function(_, ...) --[[ Line: 10 ]] --[[ Name: __call ]]
        -- upvalues: v0 (copy)
        return v0.new(...);
    end
});
v0.new = function() --[[ Line: 15 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({}, v0));
end;
v0.CharacterAdded = function(_, _, _) --[[ Line: 21 ]] --[[ Name: CharacterAdded ]]

end;
v0.CharacterRemoving = function(_, _, _) --[[ Line: 25 ]] --[[ Name: CharacterRemoving ]]

end;
v0.OnCameraSubjectChanged = function(_, _) --[[ Line: 28 ]] --[[ Name: OnCameraSubjectChanged ]]

end;
v0.GetOcclusionMode = function(_) --[[ Line: 32 ]] --[[ Name: GetOcclusionMode ]]
    warn("BaseOcclusion GetOcclusionMode must be overridden by derived classes");
    return nil;
end;
v0.Enable = function(_, _) --[[ Line: 38 ]] --[[ Name: Enable ]]
    warn("BaseOcclusion Enable must be overridden by derived classes");
end;
v0.Update = function(_, _, v15, v16) --[[ Line: 42 ]] --[[ Name: Update ]]
    warn("BaseOcclusion Update must be overridden by derived classes");
    return v15, v16;
end;
return v0;